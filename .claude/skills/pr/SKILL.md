---
name: pr
description: Use when ready to create a pull request — runs security review, then creates the PR. Replaces manual gh pr create.
---

# Create Pull Request

Runs the full pre-PR workflow: security review, commit, push, and PR creation.

## Process

1. **Check branch** — verify you're not on `main`. If you are, stop.

2. **Run security review** — invoke the `/security-review` process:
   - Identify changed files via `git diff main...HEAD --name-only`
   - Analyze each file for prompt injection, malicious code, and secrets
   - Present flags to the reviewer for approval
   - Commit the review record to `dev/security-reviews/`
   - Update `dev/security-decisions.md` with any approved patterns

3. **Push the branch** — push to origin with `-u` flag if not already tracking.

4. **Create the PR** — use `gh pr create` with:
   - A concise title (under 70 characters)
   - A body summarizing changes, referencing the relevant issue
   - Include the security review summary

## Notes

- If the security review raises flags that the reviewer rejects, stop and fix them before proceeding.
- If the branch already has a security review record, ask the reviewer if they want to re-run it (files may have changed since the last review).
- CI will verify the security review record exists — this skill ensures it's always there.
