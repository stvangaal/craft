# Data Extraction

Data extraction is the process of pulling structured information from unstructured or semi-structured sources — clinical notes, published papers, PDFs, discharge summaries, pathology reports. In clinical research, this is often the most time-consuming part of a study: reading hundreds of documents and recording specific data points in a spreadsheet.

AI has the most immediate impact on research productivity here. Large language models can read clinical text and extract structured fields — diagnoses, medications, dosages, dates, outcomes — with accuracy that approaches trained human abstractors. But "approaches" is the key word. The value of AI in data extraction is not replacing human judgment; it's generating a first pass that humans review, correct, and validate.

This topic covers how to design extraction schemas, use AI tools to extract data from clinical text and published literature, validate AI-generated output, and build pipelines that are auditable and reproducible. If your research involves chart review, literature data extraction, or any process where you're turning unstructured text into a structured dataset, these skills apply directly.

## Getting Started

Data extraction in CRAFT uses Claude Code as the primary extraction tool. The technical prerequisites are:

| Resource | Notes |
|---|---|
| [Claude Code](claude-code.md) | The AI assistant used to execute extraction tasks in CRAFT workflows |
| [Python](python.md) | Scripts for processing, validating, and analyzing extracted data |
| [Regex](regex.md) | Useful for pattern-based extraction from semi-structured text (dates, codes, dosages) |

## Quick References

- [Machine Learning in Medicine: A Practical Introduction to NLP](https://doi.org/10.1186/s12874-021-01347-1) — BMC Methods paper providing an accessible introduction to NLP for clinical researchers, covering tokenization, named entity recognition, and classification
- [Extracting Medical Information from Clinical Text with NLP](https://www.analyticsvidhya.com/blog/2023/02/extracting-medical-information-from-clinical-text-with-nlp/) — practical walkthrough of extracting clinical entities from unstructured notes

## Guides

| Guide | Source | Notes |
|---|---|---|
| [Clinical Natural Language Processing](https://www.coursera.org/learn/clinical-natural-language-processing) | Coursera (U. Colorado) | Covers regex for clinical text, text handling in code, and techniques for extracting information from clinical notes |
| [Using NLP to Extract Information from Clinical Text in EHR](https://doi.org/10.1093/jamia/ocaf176) | JAMIA | Systematic review of NLP approaches for extracting structured information from electronic health records for clinical registries |
