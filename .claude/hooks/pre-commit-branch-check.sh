#!/usr/bin/env bash
# Claude Code PreToolUse hook: block commits and destructive git ops on main.
#
# Reads the Bash command from the tool input JSON (stdin) and checks
# whether it would commit to main or run a destructive git operation.

set -euo pipefail

# Read tool input from stdin
INPUT=$(cat)

# Extract the command string from the JSON input
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty' 2>/dev/null || true)

if [ -z "$COMMAND" ]; then
  exit 0
fi

# Get the current branch (if we're in a git repo)
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown")

# ── Block commits on main ────────────────────────────────────────────

if [ "$BRANCH" = "main" ] || [ "$BRANCH" = "master" ]; then
  if echo "$COMMAND" | grep -qE 'git\s+commit'; then
    echo '{"decision": "block", "reason": "Cannot commit directly to main. Create a feature branch first: git checkout -b feat/your-feature"}'
    exit 0
  fi
fi

# ── Block destructive operations ─────────────────────────────────────

if echo "$COMMAND" | grep -qE 'git\s+push\s+.*--force'; then
  echo '{"decision": "block", "reason": "Force push is blocked. Use normal push or ask the user explicitly."}'
  exit 0
fi

if echo "$COMMAND" | grep -qE 'git\s+reset\s+--hard'; then
  echo '{"decision": "block", "reason": "Hard reset is blocked. This destroys uncommitted work. Ask the user explicitly."}'
  exit 0
fi

if echo "$COMMAND" | grep -qE 'git\s+(checkout|restore)\s+--?\s'; then
  echo '{"decision": "block", "reason": "Bulk file restore is blocked. This discards uncommitted changes. Ask the user explicitly."}'
  exit 0
fi

if echo "$COMMAND" | grep -qE 'git\s+clean\s+-f'; then
  echo '{"decision": "block", "reason": "git clean -f is blocked. This deletes untracked files. Ask the user explicitly."}'
  exit 0
fi

# All clear
exit 0
