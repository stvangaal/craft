# Method: REB Application

## Purpose

Generate and review Research Ethics Board applications, with particular attention to describing AI methodology in a way that ethics boards can evaluate.

## Steps

1. **Identify requirements** — Determine which REB, what forms, what sections
2. **Parse institution form** — If a specific form is provided, parse its structure (`/new-reb`)
3. **Generate sections** — Fill sections from the study protocol and methods register
4. **AI methodology section** — Describe AI tools, data handling, de-identification (`/reb-ai-methods`)
5. **Review** — Check for completeness and common gaps (`/reb-review`)
6. **Submit** — Final review and submission

## Key Artifacts

- REB application draft
- AI methodology description
- Data handling plan

## What "Reproducible" Means

The application accurately describes the AI methods used. The data handling plan reflects actual practice. Another researcher using the same craft methods could produce a comparable application.

## Skills

- `/new-reb` — generate an REB application from study protocol
- `/reb-ai-methods` — generate AI methodology section
- `/reb-review` — review application for gaps
