# Development

This guide is for people contributing to craft itself — not for researchers using craft in a study project.

## Branching

- `main` is always releasable. Study projects pull from `main` via `craft update`.
- Feature work happens on `feature/<name>` branches (e.g., `feature/literature-review-workflow`).
- Merge to `main` when the feature is complete and tested.

## Backlog

Work is tracked in [GitHub Issues](../../issues). Pick an issue, assign yourself, and create a feature branch.

## Testing Changes

Before merging to `main`, verify your changes work in a study project:

```bash
# Bootstrap a fresh project
~/craft/bin/craft bootstrap /tmp/test-study

# Make your changes to craft, then update the test project
cd /tmp/test-study
./craft update

# Verify the update applied correctly
```

## Pull Requests

- Keep PRs focused — one feature or fix per PR.
- Reference the issue number in the PR description (e.g., "Closes #12").
- Get a review before merging when possible.
