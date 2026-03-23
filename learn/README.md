# Learning Pathway

This is a self-directed learning pathway for clinician-researchers who want to build the technical skills needed for AI-assisted research. It assumes you're comfortable with computers but new to coding, version control, and command-line tools.

Each topic page includes a short overview and a curated list of resources organized by level.

## Learning Platforms

Several platforms offer structured courses relevant to these topics. We reference specific courses throughout the topic pages.

| Platform | Notes |
|---|---|
| [DataCamp](https://www.datacamp.com) | Interactive browser-based courses. Strong coverage of Python, SQL, and data skills. Subscription-based. |
| [Coursera](https://www.coursera.org) | University-partnered courses. Quality varies — we link to specific courses and specializations rather than the platform broadly. Many courses can be audited for free. |
| [freeCodeCamp](https://www.freecodecamp.org) | Free, project-based curriculum. Good for foundational programming concepts. |
| [The Odin Project](https://www.theodinproject.com) | Free, open-source curriculum focused on web development fundamentals including Git and command line. |

## Topics

### Platforms

| Topic | Overview |
|---|---|
| [Git & GitHub](git-and-github.md) | Version control tracks every change to your work and makes collaboration possible. Git is the tool; GitHub is where projects are shared. If you've ever lost track of which version of a file is current, version control solves that permanently. |
| [Command line](command-line.md) | The command line is how you talk directly to your computer. Most AI-assisted research tools — including Claude Code — run here. Basic fluency with navigating files, running scripts, and reading output is a prerequisite for everything else in CRAFT. |
| [Claude Code](claude-code.md) | Claude Code is Anthropic's CLI for working with Claude. It's the AI assistant that executes CRAFT skills — running searches, extracting data, generating code — under your direction. Understanding how to use it effectively is central to the CRAFT workflow. |

### Languages

| Topic | Overview |
|---|---|
| [Markdown](markdown.md) | Markdown is a plain-text formatting language used for documentation, README files, and research notes. It's how content is written in GitHub, CRAFT workflows, and most code-based projects. If you can write an email, you can write Markdown — it takes minutes to learn the basics. |
| [Python](python.md) | Python is the default language for data work in research. It has mature libraries for statistics, data manipulation, and machine learning. You don't need to become a software engineer — but reading Python, understanding its logic, and modifying AI-generated code is essential for maintaining control of your pipeline. |
| [SQL](sql.md) | SQL is the language for querying databases. If your research involves clinical data, administrative datasets, or any structured data source, you will encounter SQL. Understanding it lets you inspect, validate, and extract data directly rather than depending on someone else to pull it for you. |
| [Regex](regex.md) | Regular expressions are patterns for matching text. They're used in data cleaning, text extraction, and search. A small investment in regex pays off every time you need to find, validate, or transform structured text — which in clinical research is often. |

### Methods

| Topic | Overview |
|---|---|
| [Literature search](literature-search.md) | AI can accelerate literature search from weeks to hours, but speed without structure produces noise. This topic covers how to formulate reproducible search strategies, execute them programmatically, and document what you did so others can verify it. |
| [Data extraction](data-extraction.md) | Extracting structured data from clinical records, PDFs, and published literature is where AI has the most immediate impact on research productivity. This topic covers how to design extraction schemas, validate AI-generated output, and build pipelines that are auditable and reproducible. |
| [Reproducible analysis](reproducible-analysis.md) | A reproducible analysis is one that someone else — or future you — can re-run and get the same results. This topic covers the practices that make that possible: scripted analyses, version-controlled code, documented dependencies, and clear separation of data from logic. |

## How-To Guides

Standalone procedural guides for specific setup tasks.

| Guide | Purpose |
|---|---|
| [Python environments](python-environments.md) | Set up a virtual environment and Jupyter kernel for CRAFT notebooks |
