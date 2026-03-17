# CRAFT

**Community for Reproducible AI Frameworks and Tools**

CRAFT helps clinician-researchers use AI in their work — rigorously and reproducibly. It gives you step-by-step workflows for common research tasks (literature review, data extraction, statistical analysis) and AI skills that handle the mechanical parts.

You copy this repo to start a new research project. CRAFT manages the scaffolding; you own the research.

## Philosophy

CRAFT is built on four beliefs. The full text is in [PHILOSOPHY.md](PHILOSOPHY.md).

1. **Learn it yourself or lose control.** These skills belong with the people asking the research questions.
2. **Trust but verify.** A knowledgeable orchestrator is not optional.
3. **Standardize or repeat the reproducibility crisis.** Structured, auditable workflows are a scientific integrity question.
4. **Start by automating the boring stuff.** Redirect your time toward the parts of research that require human judgment.

## Getting Started

### Prerequisites

- **macOS or Linux** — works natively
- **Windows** — install [WSL2](https://learn.microsoft.com/en-us/windows/wsl/install) first, then run everything inside your Linux environment
- [Git](https://git-scm.com/)
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
craft (this repo)           Your Study Project
┌──────────────────┐        ┌─────────────────────────────┐
│ workflows        │  copy  │  craft-owned  │  study-owned │
│ skills           │───────▶│  workflows    │  protocol    │
│ CLI              │        │  skills       │  methods     │
│ learning pages   │        │  settings     │  data        │
└──────────────────┘        └──────┬────────┴─────────────-┘
                                   │
          craft update ◀───────────┘
          (refreshes craft-owned files,
           never touches your research)
```

**Workflows** describe how to carry out a research process — what to do, in what order, and what to document. **Skills** are instructions that Claude Code executes — running searches, extracting data, generating code. A single workflow invokes several skills across its steps.

You direct the process. The AI handles the mechanical parts. Every decision is recorded.

## Learning Pathway

CRAFT includes a self-directed learning pathway for clinician-researchers new to the tools and methods used in AI-assisted research. Each topic has a short overview and a curated list of external resources organized by level.

- **Methods** — literature search, data extraction, reproducible analysis
- **Platforms** — GitHub, Claude Code, command line
- **Languages** — shell scripting, Python, SQL, regex

See the [learn/](learn/) directory.

## Contributing

CRAFT is maintained by a small team. If you're interested in contributing, [open an issue](https://github.com/stvangaal/craft/issues) to start a conversation.
