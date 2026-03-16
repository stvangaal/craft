# CLAUDE.md — {{PROJECT_NAME}}

## Project Overview

<!-- 2-3 sentences. What is this study about? -->

## Project Status

<!-- Current phase, what's in progress. -->

## Research Workflow

This project uses **CRAFT** (Community for Reproducible AI Frameworks and Tools) for reproducible AI-assisted research. See `CRAFT-WORKFLOW.md` for governing rules and `PHILOSOPHY.md` for foundational beliefs.

Key documents:
- `STUDY-PROTOCOL.md` — study design and research question
- `METHODS-REGISTER.md` — maps artifacts to methods
- `DECISION-LOG.md` — append-only record of methodological decisions

## Craft Skills Available

Run `/status` to see what's available and what needs attention.

## Running `craft update`

To pull the latest templates, skills, and hooks from craft:

```bash
craft update
```

This overwrites craft-owned files only. Your study-specific files are never touched.
