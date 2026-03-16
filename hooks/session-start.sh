#!/usr/bin/env bash
# session-start.sh — Craft co-pilot session startup
# Checks study project state and surfaces what needs attention.

set -euo pipefail

PROJECT_DIR="${CLAUDE_PROJECT_DIR:-.}"

# Check if this is a craft study project
if [ ! -f "$PROJECT_DIR/.craft-origin" ]; then
  echo "[CRAFT] This directory is not a craft study project."
  exit 0
fi

issues=()

# Check study-owned files
if [ ! -s "$PROJECT_DIR/STUDY-PROTOCOL.md" ] || \
   grep -q "<!-- What question" "$PROJECT_DIR/STUDY-PROTOCOL.md" 2>/dev/null; then
  issues+=("STUDY-PROTOCOL.md has not been filled in. Use /new-study to get started.")
fi

if [ ! -s "$PROJECT_DIR/DECISION-LOG.md" ] || \
   ! grep -q "^## " "$PROJECT_DIR/DECISION-LOG.md" 2>/dev/null; then
  issues+=("DECISION-LOG.md has no entries yet.")
fi

# Check if methods directory has any work
if [ -z "$(ls -A "$PROJECT_DIR/methods/" 2>/dev/null)" ]; then
  issues+=("No methods started yet. Check templates/methods/ for available method types.")
fi

# Report
if [ ${#issues[@]} -eq 0 ]; then
  echo "[CRAFT] Study project looks good. Run /status for details."
else
  echo "[CRAFT] Study project status:"
  for issue in "${issues[@]}"; do
    echo "  - $issue"
  done
fi
