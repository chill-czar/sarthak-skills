#!/usr/bin/env bash
# Install Sarthak's (@chill_czar) workflow skills.
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/chill-czar/sarthak-skills/main/install.sh | bash
# Pass -g to install globally across all projects:
#   curl -fsSL https://raw.githubusercontent.com/chill-czar/sarthak-skills/main/install.sh | bash -s -- -g
set -euo pipefail

AGENT="${SKILLS_AGENT:-claude-code}"
EXTRA=("$@")

# Determine whether running from inside cloned repo or via curl
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || echo "")"

# Tool runner check: prefer bunx, fallback to npx
if command -v bunx >/dev/null 2>&1; then
  RUNNER="bunx"
elif command -v npx >/dev/null 2>&1; then
  RUNNER="npx"
else
  echo "Error: neither bunx nor npx was found. Please install Node.js / Bun." >&2
  exit 1
fi

echo "=========================================="
echo " Installing sarthak-skills for: $AGENT"
echo " Runner: $RUNNER skills"
echo "=========================================="

# 1. Upstream Core Spec-Driven Engineering Suite (Matt Pocock)
UPSTREAM_SKILLS="code-review diagnosing-bugs domain-modeling grill-with-docs grilling implement tdd to-spec to-tickets"
echo "==> Installing upstream engineering loop from mattpocock/skills..."
UPSTREAM_ARGS=()
for s in $UPSTREAM_SKILLS; do
  UPSTREAM_ARGS+=(--skill "$s")
done
$RUNNER skills add mattpocock/skills "${UPSTREAM_ARGS[@]}" --agent "$AGENT" -y "${EXTRA[@]}"

# 2. First-Party Custom Skills (desktop, excalidraw-animate, sarthak-skills)
echo "==> Installing first-party skills (desktop, excalidraw-animate, sarthak-skills)..."
if [ -n "$SCRIPT_DIR" ] && [ -d "$SCRIPT_DIR/skills/desktop" ]; then
  # Local install from repository checkout
  $RUNNER skills add "$SCRIPT_DIR" --skill desktop --skill excalidraw-animate --skill sarthak-skills --agent "$AGENT" -y "${EXTRA[@]}"
else
  # Remote install from GitHub
  $RUNNER skills add "chill-czar/sarthak-skills" --skill desktop --skill excalidraw-animate --skill sarthak-skills --agent "$AGENT" -y "${EXTRA[@]}"
fi

echo ""
echo "✅ Done! Successfully installed sarthak-skills for $AGENT."
echo "Direct Driver Skills ready:"
echo "  • /grill-with-docs      (Pressure-test designs + write ADRs)"
echo "  • /grill-me             (Fast adversarial plan review)"
echo "  • /to-spec              (Synthesize discussion into spec)"
echo "  • /to-tickets           (Break spec into atomic tickets)"
echo "  • /implement            (Execute code with strict TDD)"
echo "  • /code-review          (Dual standards & spec review)"
echo "  • /desktop              (Linux Mint / Cinnamon X11 control)"
echo "  • /excalidraw-animate   (Hand-drawn animated architecture diagrams)"
