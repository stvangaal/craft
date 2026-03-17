---
name: commit
description: Use when creating a git commit — enforces branch safety, explicit staging, commit message quality, and lightweight secrets check.
---

# Commit

Creates a git commit with guardrails that enforce project git conventions.

## Process

1. **Check branch** — verify you're not on `main`. If you are, stop and ask the user to create a feature branch first.

2. **Show changes** — run `git status` and `git diff` (staged + unstaged) so the user can review what will be committed.

3. **Stage files explicitly** — add files by name, never with `git add -A` or `git add .`. Ask the user if you're unsure which files to include.

4. **Scan staged files for secrets** — check staged diffs for patterns that suggest secrets:
   - API keys (`sk-`, `ghp_`, `api_key`, `API_KEY`)
   - Tokens (`token=`, `bearer`, `authorization`)
   - Passwords (`password=`, `passwd`, `secret=`)
   - Private keys (`BEGIN RSA PRIVATE KEY`, `BEGIN OPENSSH PRIVATE KEY`)
   - Base64 blobs longer than 100 characters on a single line
   - `.env` files

   If any are found, flag them and ask the user before proceeding. Do not commit until confirmed.

5. **Draft commit message** — write a message that:
   - Explains **why** the change was made, not what changed (the diff shows that)
   - References the GitHub issue number when one exists (e.g., `Closes #15` or `Part of #8`)
   - Is concise — one line summary, optional body for context
   - Show the draft to the user for approval before committing

6. **Commit** — create the commit. Never amend a previous commit unless the user explicitly asks.

7. **Confirm** — run `git status` after commit to verify success.

## Notes

- If there are no changes to commit, say so and stop.
- If there are unstaged changes the user might have forgotten, mention them.
- This skill does NOT push or create PRs — use `/pr` for that.
