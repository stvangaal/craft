---
name: search-strategy
description: Formulate a research question, build a PubMed search, execute it, and store structured results
requires:
  reasoning: high
  context: standard
---

# /search-strategy — Literature Search

Guide the researcher through formulating a research question, translating it into a PubMed query, executing the search, and storing the results in a structured format for downstream processing.

## Prerequisites

- This is a craft study project (has `.craft-origin`)
- The researcher has a research question (rough is fine — we'll refine it)

## Step 1: Formulate the Question Using PICO

Ask the researcher to describe their research question in plain language. Then walk through PICO one element at a time:

1. **P (Population):** Who are the patients/participants? (e.g., "adults with ischemic stroke")
2. **I (Intervention/Exposure):** What is being studied? (e.g., "prolonged cardiac monitoring")
3. **C (Comparison):** What is it compared to? (e.g., "standard 24-hour Holter", or none)
4. **O (Outcome):** What outcomes matter? (e.g., "atrial fibrillation detection rate")

Ask ONE element at a time. Confirm each before moving on. It's fine if C is absent (not all questions are comparative).

After all elements are captured, summarize the PICO and confirm with the researcher before proceeding.

## Step 2: Build the PubMed Query

Translate PICO elements into a PubMed search query:

1. For each PICO element, identify:
   - MeSH terms (use the standard PubMed MeSH vocabulary)
   - Free-text synonyms (to catch articles not yet MeSH-indexed)
2. Combine synonyms within each element using OR
3. Combine elements using AND
4. Consider adding filters (date range, humans, English language) — ask the researcher

**Show the complete query to the researcher and get approval before executing.**

Example query structure:
```
("ischemic stroke"[MeSH] OR "cerebral infarction"[MeSH] OR "ischemic stroke"[tiab])
AND
("cardiac monitoring"[MeSH] OR "prolonged cardiac monitoring"[tiab] OR "loop recorder"[tiab])
AND
("atrial fibrillation"[MeSH] OR "atrial fibrillation"[tiab] OR "AF detection"[tiab])
```

## Step 3: Execute the Search

Use PubMed E-utilities via the `search-pubmed.sh` helper script:

```bash
./hooks/search-pubmed.sh "<pubmed-query>" "<search-name>"
```

The script:
1. Calls ESearch to get the count and PMIDs
2. If count > 250: reports the count and STOPS — return to Step 2 to refine the query with the researcher
3. If count <= 250: calls EFetch to retrieve article metadata
4. Saves results to `methods/literature-review/<search-name>/search-results.json`

**If count > 250**, tell the researcher:
> "This search returned [N] results. PubMed queries work best when they're specific enough to return a manageable set. Let's refine the query — we can narrow the date range, add more specific terms, or add filters. What would you like to adjust?"

Then loop back to Step 2.

## Step 4: Review and Record

After successful retrieval:

1. Show the researcher a summary:
   - Total results retrieved
   - Date range of articles
   - Top journals represented
   - First 5 titles as a sanity check
2. Ask: "Does this look like the right set of articles?"
3. If yes: record the search as a decision in DECISION-LOG.md via `/decision`
4. If no: refine the query (back to Step 2)

## Output Format

Results are stored at `methods/literature-review/<search-name>/search-results.json`:

```json
{
  "query": {
    "pico": {
      "population": "adults with ischemic stroke",
      "intervention": "prolonged cardiac monitoring",
      "comparison": "standard 24-hour Holter monitoring",
      "outcome": "atrial fibrillation detection rate"
    },
    "pubmed_query": "(\"ischemic stroke\"[MeSH] ...) AND ...",
    "filters": "humans, English, 2015-2025",
    "date_executed": "2026-03-16",
    "pubmed_url": "https://pubmed.ncbi.nlm.nih.gov/?term=..."
  },
  "results": [
    {
      "pmid": "12345678",
      "title": "Article title",
      "authors": ["Last FM", "Last FM"],
      "journal": "Journal Name",
      "year": "2023",
      "abstract": "Full abstract text..."
    }
  ],
  "metadata": {
    "total_count": 47,
    "retrieved": 47,
    "search_name": "cardiac-monitoring-af"
  }
}
```

## Updating the Methods Register

After a successful search, offer to add an entry to METHODS-REGISTER.md:

| Method | Type | Status | Key Artifacts | Notes |
|---|---|---|---|---|
| [search-name] literature search | literature-review | active | methods/literature-review/[search-name]/search-results.json | [N] articles retrieved |
