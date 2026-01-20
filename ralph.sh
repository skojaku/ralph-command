#!/bin/bash
set -e

MAX_ITERATIONS=${1:-25}
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🚀 Starting Ralph Wuggle Loop for Psychological Safety Scale Development"
echo "Working directory: $SCRIPT_DIR"
echo "Max iterations: $MAX_ITERATIONS"

for i in $(seq 1 $MAX_ITERATIONS); do
  echo ""
  echo "═══════════════════════════════════════════════════════════════"
  echo "═══ Iteration $i of $MAX_ITERATIONS ═══"
  echo "═══════════════════════════════════════════════════════════════"
  echo ""

  # Change to script directory for relative paths to work
  cd "$SCRIPT_DIR"

  OUTPUT=$(cat "$SCRIPT_DIR/prompt.md" \
    | claude --dangerously-skip-permissions 2>&1 \
    | tee /dev/stderr) || true

  if echo "$OUTPUT" | grep -q "<promise>COMPLETE</promise>"; then
    echo ""
    echo "✅ All stories complete! Ralph Wuggle Loop finished successfully."
    exit 0
  fi

  echo ""
  echo "⏳ Waiting 2 seconds before next iteration..."
  sleep 2
done

echo ""
echo "⚠️ Max iterations ($MAX_ITERATIONS) reached without completion."
echo "Check prd.json for remaining stories."
exit 1
