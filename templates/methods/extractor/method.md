# Method: LLM Extractor

## Purpose

Build, validate, and deploy LLM-based extractors that pull structured data from unstructured clinical text.

## Steps

1. **Task definition** — What are you extracting? From what source? (`/new-extractor`)
2. **Schema design** — Define the extraction output schema
3. **Prompt engineering** — Write and iterate on prompts (`/version-prompt`)
4. **Gold standard** — Build human-annotated ground truth (`/gold-standard`)
5. **Validation** — Measure extractor performance (`/validate-extractor`)
6. **Deployment** — Run extractor at scale with monitoring

## Key Artifacts

- Extraction schema (what fields, what types, what constraints)
- Prompt versions (each version saved with change rationale)
- Gold-standard annotation set
- Performance report (precision, recall, F1 per field)

## What "Reproducible" Means

Extractor performance is measured against human-annotated ground truth. Prompt versions are tracked. Someone else can run the same prompt against the same data and verify the reported performance.

## Skills

- `/new-extractor` — set up a new extractor
- `/version-prompt` — save a prompt version
- `/gold-standard` — build or import annotations
- `/validate-extractor` — run performance evaluation
- `/compare-versions` — compare prompt versions
