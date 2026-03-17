# CRAFT

**Community for Reproducible AI Frameworks and Tools**

CRAFT is a toolkit for clinician-researchers who want to use AI methods in their research with rigour. It provides structured workflows that describe how to carry out research processes step by step, paired with machine skills that handle specific tasks — literature search, data extraction, statistical coding — within those workflows.

You use CRAFT by copying this repo to start a new research project. CRAFT manages the scaffolding (workflows, skills) while you own the research (protocol, methods, data, decisions).

## Philosophy

CRAFT is built on four beliefs. The full text is in [PHILOSOPHY.md](PHILOSOPHY.md).

1. **Learn it yourself or lose control.** These skills belong with the people asking the research questions.
2. **Trust but verify.** A knowledgeable orchestrator is not optional.
3. **Standardize or repeat the reproducibility crisis.** Structured, auditable workflows are a scientific integrity question.
4. **Start by automating the boring stuff.** Redirect your time toward the parts of research that require human judgment.

## Getting Started

### Prerequisites

- macOS or Linux
- Git
- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) (CLI)

### Create a New Study Project

```bash
# Clone craft (once)
git clone <craft-repo-url> ~/craft

# Bootstrap a new project
~/craft/bin/craft bootstrap ~/Projects/my-study
```

This creates a study project with craft-owned scaffolding and study-owned files for your research. See [CRAFT-WORKFLOW.md](CRAFT-WORKFLOW.md) for how file ownership works.

### Update an Existing Project

```bash
# From inside your study project
./craft update
```

This refreshes craft-owned files (workflows, skills) without touching your research files.

## How CRAFT Works

```
                      ┌───────────────────┐
                      │   craft (repo)    │
                      │                   │
                      │ skills, CLI,      │
                      │ workflows, docs   │
                      └──────┬───────┬────┘
                             │       │
               craft bootstrap       │
               (one-time setup)      │
                             │       │
                             ▼       │
    ┌────────────────────────────────────┐  │
    │       Study Project(s)             │  │
    │                                    │  │
    │  ┌─────────────┐  ┌────────────┐   │  │
    │  │ craft-owned │  │ study-owned│   │  │
    │  │             │  │            │   │  │
    │  │ skills      │  │ CLAUDE.md  │   │  │
    │  │ workflows   │  │ protocol   │   │  │
    │  │ philosophy  │  │ methods    │   │  │
    │  │ settings    │  │ data       │   │  │
    │  │ hooks       │  │ decisions  │   │  │
    │  └──────▲──────┘  └────────────┘   │  │
    │         │                          │  │
    └─────────┼──────────────────────────┘  │
              │                             │
              └──────── craft update ───────┘
                        (on demand, refreshes
                        craft-owned files only)
```

CRAFT pairs **workflows** with **skills**.

**Workflows** are human-readable documents that describe how to carry out a research process — what to do, in what order, what decisions to document, and which skills to invoke at each step. There are few workflows, each covering a broad research activity (e.g., designing a statistical analysis plan, conducting a literature review).

**Skills** are machine-readable instructions that Claude Code can execute — running searches, generating test data, structuring extracted data. Skills are atomic: each one does a specific job. A single workflow may invoke several skills across its steps.

The researcher directs the process. The AI handles the mechanical parts. Every methodological decision is recorded.

## Learning Pathway

CRAFT includes a self-directed learning pathway for clinician-researchers new to the tools and methods used in AI-assisted research. Each topic has a short overview and a curated list of external resources organized by level.

- **Methods** — literature search, data extraction, reproducible analysis
- **Platforms** — GitHub, Claude Code, command line
- **Languages** — shell scripting, Python, SQL, regex

See the [learn/](learn/) directory.

## Development

CRAFT is maintained by a small team. If you're contributing to craft itself (not using it for a study), this section is for you.

### Repo Structure

```
craft/
├── bin/craft              # CLI (bootstrap, update)
├── workflows/             # Human-readable research workflows
├── .claude/skills/        # Machine skills (Claude Code slash commands)
├── .claude/settings.json  # Claude Code configuration
├── learning/              # Self-directed learning resources
├── PHILOSOPHY.md          # The four beliefs
└── CRAFT-WORKFLOW.md      # File ownership and workflow rules
```

### Making Changes

Changes to craft-owned files propagate to study projects via `craft update`. Test changes by bootstrapping a fresh project and verifying the update path works.
