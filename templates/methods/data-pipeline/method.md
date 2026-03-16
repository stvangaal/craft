# Method: Data Pipeline

## Purpose

Extract, clean, transform, and validate data from source systems into analysis-ready datasets.

## Steps

1. **Source identification** — Document data sources (`/source-manifest`)
2. **Extraction** — Pull data from source systems
3. **Cleaning** — Handle missing values, outliers, formatting
4. **Transformation** — Derive variables, link datasets (`/transform`)
5. **Validation** — Verify output against expectations (`/validate-pipeline`)
6. **Output** — Produce analysis-ready dataset with documentation

## Key Artifacts

- Source manifest (fields, provenance, known quirks)
- Transformation log (each step documented)
- Validation report
- Output schema

## What "Reproducible" Means

Given the same source data, the pipeline produces identical output. Every transformation step is documented and auditable.

## Skills

- `/source-manifest` — document a data source
- `/transform` — write and document a transformation step
- `/validate-pipeline` — run validation checks
