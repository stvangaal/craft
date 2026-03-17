---
name: repo-health
description: Use when checking the health of the craft-dev repo — runs automated checks for content integrity, structure, and CLI functionality
---

# Repo Health

Run automated health checks on the craft-dev repo.

## Process

1. Run `bin/craft-health` from the repo root
2. Present the output to the user
3. If issues are found, offer to help fix them

For a fast check that skips external links:

```bash
bin/craft-health --skip-links
```

For a full check including external link validation:

```bash
bin/craft-health
```
