# CLAUDE.md — craft

## Project Overview

CRAFT (Community for Reproducible AI Frameworks and Tools) is a toolkit for reproducible AI-assisted research. This repo provides templates and a CLI for bootstrapping and maintaining research study projects.

## Project Status

Phase 0 — initial scaffolding. CLI (`craft bootstrap`, `craft update`) is functional.

## Development Workflow

This is the craft tooling repo, not a study project. Changes here propagate to study projects via `craft update`.

## Key Documents

| Document | Purpose |
|---|---|
| `PHILOSOPHY.md` | The four beliefs (from CRAFT charter) |
| `CRAFT-WORKFLOW.md` | Governing rules for craft projects |
| `bin/craft` | CLI entry point |
| `templates/` | Document templates (Tier 1-3) |

## CLI Usage

```bash
# Bootstrap a new study project
craft bootstrap ~/Projects/my-study

# Update an existing study project (run from within the project)
craft update
```
