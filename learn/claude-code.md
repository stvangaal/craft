# Claude Code

Claude Code is Anthropic's agentic coding tool. It runs in your terminal, reads your codebase, edits files, executes commands, and integrates with your development tools. In CRAFT, Claude Code is the AI assistant that executes skills — running searches, extracting data, generating code, and managing workflows — under your direction.

What makes Claude Code different from a chatbot is that it can take action. It doesn't just suggest code — it reads your files, writes changes, runs tests, and commits to Git. You describe what you want in plain language, and Claude Code figures out which files to read, what changes to make, and how to verify they work. You approve each step before it happens.

Understanding how to use Claude Code effectively — how to give it clear instructions, how to review its work, and how to guide it when it goes off track — is central to the CRAFT workflow. You don't need to write code from scratch; you need to direct an AI that writes code for you.

## Getting Started

Claude Code requires a [Claude subscription](https://claude.com/pricing) (Pro, Max, Teams, or Enterprise) or an [Anthropic Console](https://console.anthropic.com) account.

**Install via terminal (macOS, Linux, WSL):**

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

**Or via Homebrew:**

```bash
brew install --cask claude-code
```

Then start Claude Code in any project directory:

```bash
cd your-project
claude
```

You'll be prompted to log in on first use. Claude Code is also available as a [VS Code extension](https://docs.anthropic.com/en/docs/claude-code/vs-code), a [desktop app](https://code.claude.com), and [in the browser](https://claude.ai/code).

## Quick References

- [Claude Code Overview](https://docs.anthropic.com/en/docs/claude-code/overview) — official documentation covering installation, capabilities, and all available interfaces
- [Quickstart Guide](https://docs.anthropic.com/en/docs/claude-code/quickstart) — step-by-step walkthrough of your first session: exploring a codebase, making changes, and committing with Git
- [Best Practices](https://docs.anthropic.com/en/docs/claude-code/best-practices) — patterns for writing effective prompts and getting better results
- [Common Workflows](https://docs.anthropic.com/en/docs/claude-code/common-workflows) — guides for everyday tasks: debugging, refactoring, writing tests, and working with Git

## Courses

No formal courses exist for Claude Code. The documentation above is the primary learning resource. Within Claude Code itself, you can type `/help` for available commands or ask questions like "how do I create custom skills?" directly in a session.
