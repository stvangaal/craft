#!/usr/bin/env bash
# search-pubmed.sh — Execute a PubMed search via E-utilities and store results as JSON
#
# Usage:
#   ./hooks/search-pubmed.sh "<pubmed-query>" "<search-name>" [email]
#
# Arguments:
#   pubmed-query   A PubMed search string (with MeSH terms, Boolean operators, etc.)
#   search-name    Short identifier for this search (used as directory name)
#   email          Optional email for NCBI (recommended for heavy use)
#
# Output:
#   methods/literature-review/<search-name>/search-results.json
#
# Exit codes:
#   0  Success (results saved)
#   2  Too many results (>250) — count printed to stdout, no results saved
#   1  Error (API failure, missing dependencies, etc.)

set -euo pipefail

# ── Args ─────────────────────────────────────────────────────────────

if [ $# -lt 2 ]; then
  echo "Usage: $0 \"<pubmed-query>\" \"<search-name>\" [email]"
  exit 1
fi

QUERY="$1"
SEARCH_NAME="$2"
EMAIL="${3:-craft-user@example.com}"

# ── Dependencies ─────────────────────────────────────────────────────

for cmd in curl jq; do
  if ! command -v "$cmd" &>/dev/null; then
    echo "Error: $cmd is required but not installed."
    exit 1
  fi
done

# ── Config ───────────────────────────────────────────────────────────

BASE_URL="https://eutils.ncbi.nlm.nih.gov/entrez/eutils"
MAX_RESULTS=250
PROJECT_DIR="${CLAUDE_PROJECT_DIR:-.}"
OUTPUT_DIR="$PROJECT_DIR/methods/literature-review/$SEARCH_NAME"

# ── Step 1: ESearch — get count and PMIDs ────────────────────────────

echo "Searching PubMed..."
echo "Query: $QUERY"
echo ""

# URL-encode the query
ENCODED_QUERY=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$QUERY'))" 2>/dev/null || \
  jq -rn --arg q "$QUERY" '$q|@uri')

ESEARCH_URL="$BASE_URL/esearch.fcgi?db=pubmed&term=$ENCODED_QUERY&retmax=0&retmode=json&email=$EMAIL"

SEARCH_RESULT=$(curl -s "$ESEARCH_URL")

# Extract count
COUNT=$(echo "$SEARCH_RESULT" | jq -r '.esearchresult.count // "0"')

echo "Total results: $COUNT"

# ── Check count threshold ────────────────────────────────────────────

if [ "$COUNT" -gt "$MAX_RESULTS" ]; then
  echo ""
  echo "TOO_MANY_RESULTS:$COUNT"
  echo ""
  echo "Query returned $COUNT results (max $MAX_RESULTS)."
  echo "Refine the query to narrow results before retrieving."
  exit 2
fi

if [ "$COUNT" -eq 0 ]; then
  echo ""
  echo "No results found. Check the query for typos or overly narrow terms."
  exit 2
fi

# ── Step 2: ESearch again with full PMIDs ────────────────────────────

echo "Retrieving $COUNT PMIDs..."

ESEARCH_FULL_URL="$BASE_URL/esearch.fcgi?db=pubmed&term=$ENCODED_QUERY&retmax=$COUNT&retmode=json&email=$EMAIL"
PMID_RESULT=$(curl -s "$ESEARCH_FULL_URL")

# Extract PMIDs as comma-separated list
PMIDS=$(echo "$PMID_RESULT" | jq -r '.esearchresult.idlist | join(",")')

if [ -z "$PMIDS" ]; then
  echo "Error: No PMIDs returned despite count=$COUNT"
  exit 1
fi

# ── Step 3: EFetch — get article details ─────────────────────────────

echo "Fetching article details..."

# Fetch in XML format (more complete than JSON for article metadata)
EFETCH_URL="$BASE_URL/efetch.fcgi?db=pubmed&id=$PMIDS&rettype=xml&retmode=xml&email=$EMAIL"
XML_RESULT=$(curl -s "$EFETCH_URL")

# ── Step 4: Parse XML to JSON ────────────────────────────────────────

echo "Parsing results..."

# Use Python to parse PubMed XML into our JSON format
# Python is available on macOS and most research environments
mkdir -p "$OUTPUT_DIR"

# Save XML to temp file to avoid argument-length limits
XML_TMPFILE=$(mktemp)
echo "$XML_RESULT" > "$XML_TMPFILE"

PUBMED_XML_FILE="$XML_TMPFILE" PUBMED_QUERY="$QUERY" PUBMED_SEARCH_NAME="$SEARCH_NAME" PUBMED_COUNT="$COUNT" PUBMED_OUTPUT_DIR="$OUTPUT_DIR" python3 << 'PYEOF'
import os
import json
import xml.etree.ElementTree as ET
from datetime import date

xml_file = os.environ['PUBMED_XML_FILE']
query = os.environ['PUBMED_QUERY']
search_name = os.environ['PUBMED_SEARCH_NAME']
total_count = int(os.environ['PUBMED_COUNT'])
output_dir = os.environ['PUBMED_OUTPUT_DIR']

with open(xml_file) as f:
    xml_data = f.read()

root = ET.fromstring(xml_data)
articles = []

for article in root.findall('.//PubmedArticle'):
    pmid_elem = article.find('.//PMID')
    pmid = pmid_elem.text if pmid_elem is not None else ''

    title_elem = article.find('.//ArticleTitle')
    title = title_elem.text if title_elem is not None else ''
    # Handle titles with inline markup
    if title_elem is not None and len(title_elem) > 0:
        title = ET.tostring(title_elem, encoding='unicode', method='text').strip()

    # Authors
    authors = []
    for author in article.findall('.//Author'):
        last = author.find('LastName')
        initials = author.find('Initials')
        if last is not None and initials is not None:
            authors.append(f"{last.text} {initials.text}")
        elif last is not None:
            authors.append(last.text)

    # Journal
    journal_elem = article.find('.//Journal/Title')
    journal = journal_elem.text if journal_elem is not None else ''

    # Year
    year_elem = article.find('.//PubDate/Year')
    if year_elem is None:
        year_elem = article.find('.//PubDate/MedlineDate')
    year = year_elem.text[:4] if year_elem is not None else ''

    # Abstract
    abstract_parts = []
    for abs_text in article.findall('.//AbstractText'):
        label = abs_text.get('Label', '')
        text = ET.tostring(abs_text, encoding='unicode', method='text').strip()
        if label:
            abstract_parts.append(f"{label}: {text}")
        else:
            abstract_parts.append(text)
    abstract = ' '.join(abstract_parts)

    articles.append({
        'pmid': pmid,
        'title': title,
        'authors': authors,
        'journal': journal,
        'year': year,
        'abstract': abstract
    })

# Build the output structure
output = {
    'query': {
        'pico': {},  # Filled in by the skill after user interaction
        'pubmed_query': query,
        'filters': '',
        'date_executed': date.today().isoformat(),
        'pubmed_url': f"https://pubmed.ncbi.nlm.nih.gov/?term={query}"
    },
    'results': articles,
    'metadata': {
        'total_count': total_count,
        'retrieved': len(articles),
        'search_name': search_name
    }
}

output_path = f"{output_dir}/search-results.json"
with open(output_path, 'w') as f:
    json.dump(output, f, indent=2, ensure_ascii=False)

print(f"Saved {len(articles)} articles to {output_path}")
PYEOF

# Clean up temp file
rm -f "$XML_TMPFILE"

echo ""
echo "Done. Results saved to $OUTPUT_DIR/search-results.json"
