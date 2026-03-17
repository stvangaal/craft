# CRAFT Workflow

## Principles

1. **Process traceability** — Every research output traces to a documented method. No orphan artifacts.
2. **Decision provenance** — Methodological choices are captured where they're made, not reconstructed after the fact.
3. **Opinionated co-pilot** — Craft nudges toward discipline but never hard-blocks. Overrides are recorded, not prevented.
4. **Job-specific methods** — Each job type has its own method template with appropriate rigor. Common principles bind them.
5. **Reproducibility through documentation, not determinism** — Capture what was done and why, not exact outputs.
6. **Language/tool agnostic** — Craft governs methodology, not implementation.

## File Ownership

Every file in a craft study project is either **craft-owned** or **study-owned**.

- **Craft-owned files** are managed by the craft repo. They are overwritten by `craft update`. Do not customize them per-study — your changes will be lost on the next update.
- **Study-owned files** belong to the study. They are created once by `craft bootstrap`, then never touched by craft again.

### Craft-owned

- `PHILOSOPHY.md`
- `CRAFT-WORKFLOW.md`
- `skills/`
- `hooks/`
- `.claude/settings.json`

### Study-owned

- `CLAUDE.md`
- `STUDY-PROTOCOL.md`
- `DECISION-LOG.md`
- `methods/` (researcher's work)
- `data/` (research data)

## Method Types

Craft supports five method types. Each has associated skills in `skills/`.

1. **Literature Review** — search, screen, extract, synthesize
2. **Data Pipeline** — source, extract, clean, transform, validate
3. **Experiment** — hypothesize, protocol, collect, analyze, interpret
4. **LLM Extractor** — define, design schema, prompt, validate, deploy
5. **REB Application** — requirements, parse form, generate, review, submit
