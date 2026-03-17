# Reproducible Analysis

A reproducible analysis is one that someone else — or future you — can re-run and get the same results. This means scripted analyses instead of point-and-click workflows, version-controlled code instead of files on a desktop, documented dependencies instead of "it works on my machine," and clear separation of data from logic.

Reproducibility is not a nice-to-have in research — it's a methodological requirement. If a reviewer or collaborator can't verify how you got from raw data to published results, the analysis is incomplete. The reproducibility crisis in science is well-documented, and most of it comes down to the same practical problems: analyses that can't be re-run because the steps weren't recorded, dependencies changed, or data was modified in place without a record.

The good news is that reproducibility is largely a set of habits, not a specialized skill. If you version-control your code, script your analyses, document your environment, and never modify raw data directly, you've solved most of the problem. This topic covers the tools and practices that make those habits concrete.

## Getting Started

Reproducible analysis builds on tools covered elsewhere in this pathway. The key building blocks are:

| Resource | Notes |
|---|---|
| [Git & GitHub](git-and-github.md) | Version control is the foundation — every change to your analysis code is tracked and recoverable |
| [Python](python.md) | Scripted analyses in Python replace manual, unrepeatable steps |
| [Command Line](command-line.md) | Running scripts, managing environments, and automating workflows happens here |

## Quick References

- [The Turing Way](https://the-turing-way.netlify.app) — community-maintained handbook for reproducible, ethical, and collaborative data science; covers version control, testing, environments, and documentation
- [Good Enough Practices in Scientific Computing](https://doi.org/10.1371/journal.pcbi.1005510) — PLOS Computational Biology paper outlining practical, achievable standards for data management, analysis scripts, and project organization
- [Reproducible Research (Coursera / Johns Hopkins)](https://www.coursera.org/learn/reproducible-research) — covers concepts and tools for reproducible analysis including literate programming, version control, and organizing projects. Can be audited free

## Guides

| Guide | Source | Notes |
|---|---|---|
| [FAIR Guiding Principles for Scientific Data Management](https://doi.org/10.1038/sdata.2016.18) | Scientific Data (Nature) | Framework for making data Findable, Accessible, Interoperable, and Reusable — the standard for research data management |
| [Ten Simple Rules for Reproducible Computational Research](https://doi.org/10.1371/journal.pcbi.1003285) | PLOS Computational Biology | Concise, actionable rules covering scripted workflows, version control, recording environments, and sharing code |
