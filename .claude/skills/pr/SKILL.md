---
name: pr
description: Use when ready to create a pull request — handles push and PR creation. Suggests security review when agent-facing code is modified.
---

# Create Pull Request

Handles the full pre-PR workflow: health check, push, and PR creation.

## Process

1. **Check branch** — verify you're not on `main`. If you are, stop.

2. **Run health check** — if `bin/craft-health` exists, run it and address any failures before proceeding.

3. **Check for agent-facing changes** — run `git diff main...HEAD --name-only` and check if any changed files are in `.claude/`, `hooks/`, `.githooks/`, or `bin/`. If so, suggest running `/security-review` before proceeding. Ask the user — don't block.

4. **Review changes** — show `git log main...HEAD --oneline` so the user can confirm the commits that will be in the PR.

5. **Push the branch** — push to origin with `-u` flag if not already tracking.

6. **Create the PR** — use `gh pr create` with:
   - A concise title (under 70 characters)
   - A body summarizing changes, referencing the relevant issue
   - Format:
     ```
     ## Summary
     - [bullet points of what changed and why]

     Closes #<issue-number>
     ```

## Notes

- If the health check raises failures, fix them before proceeding.
- If `bin/craft-health` does not exist, skip the health check step.
- Keep PRs focused — one feature or fix per PR.
- This skill does NOT run security review automatically — it suggests it when relevant files are changed.
