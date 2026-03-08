#!/usr/bin/env bash
set -euo pipefail

TOOLS_DIR="$(cd "$(dirname "$0")" && pwd)"
BIN_DIR="$TOOLS_DIR/bin"
SKILLS_DIR="$TOOLS_DIR/skills"
TARGET_DIR="$HOME/.local/bin"
SKILLS_TARGET="$HOME/.claude/skills"
CLAUDE_MD="$HOME/.claude/CLAUDE.md"

START_MARKER="<!-- claude-tools:start -->"
END_MARKER="<!-- claude-tools:end -->"

# --- prereq checks ---

check_prereqs() {
  local missing=0

  if command -v jq &>/dev/null; then
    echo "  jq $(jq --version 2>&1) ✓"
  else
    echo "  ERROR: jq not found. Install with: brew install jq"
    missing=1
  fi

  if command -v python3 &>/dev/null; then
    local ver
    ver=$(python3 -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
    if python3 -c "import sys; exit(0 if sys.version_info >= (3,8) else 1)" 2>/dev/null; then
      echo "  python3 $ver ✓"
    else
      echo "  ERROR: python3 >= 3.8 required (found $ver)"
      missing=1
    fi
  else
    echo "  ERROR: python3 not found"
    missing=1
  fi

  if command -v ffmpeg &>/dev/null; then
    echo "  ffmpeg ✓"
  else
    echo "  WARNING: ffmpeg not found. Install with: brew install ffmpeg"
    echo "  (required for claude-video-transcript, claude-video-screenshot)"
  fi

  if command -v whisper-cli &>/dev/null; then
    echo "  whisper-cli ✓"
  else
    echo "  WARNING: whisper-cli not found. Install with: brew install whisper-cpp"
    echo "  (required for claude-video-transcript)"
  fi

  if command -v uv &>/dev/null; then
    echo "  uv $(uv --version 2>&1) ✓"
  else
    echo "  WARNING: uv not found. Install with: curl -LsSf https://astral.sh/uv/install.sh | sh"
    echo "  (required for claude-pptx-extract)"
  fi

  if [[ $missing -eq 1 ]]; then exit 1; fi
}

# --- symlink bin/claude-* to ~/.local/bin/ ---

install_tools() {
  mkdir -p "$TARGET_DIR"

  local count=0
  for tool in "$BIN_DIR"/claude-*; do
    [[ -f "$tool" ]] || continue
    [[ "$tool" == *.py ]] && continue
    local name
    name=$(basename "$tool")
    chmod +x "$tool"
    ln -sf "$tool" "$TARGET_DIR/$name"
    echo "  $name → $TARGET_DIR/$name"
    count=$((count + 1))
  done

  if [[ $count -eq 0 ]]; then
    echo "  (no tools found in bin/)"
  fi

  if [[ ":$PATH:" != *":$TARGET_DIR:"* ]]; then
    echo ""
    echo "  WARNING: $TARGET_DIR is not in your PATH"
    echo "  Add to your shell profile: export PATH=\"\$HOME/.local/bin:\$PATH\""
  fi
}

# --- symlink skills to ~/.claude/skills/ ---

install_skills() {
  mkdir -p "$SKILLS_TARGET"

  local count=0
  for skill_dir in "$SKILLS_DIR"/*/; do
    [[ -d "$skill_dir" ]] || continue
    [[ -f "$skill_dir/SKILL.md" ]] || continue
    local name
    name=$(basename "$skill_dir")
    ln -sfn "$skill_dir" "$SKILLS_TARGET/$name"
    echo "  /$name → $SKILLS_TARGET/$name"
    count=$((count + 1))
  done

  if [[ $count -eq 0 ]]; then
    echo "  (no skills found in skills/)"
  fi
}

# --- update ~/.claude/CLAUDE.md with tool listing ---

update_claude_md() {
  mkdir -p "$(dirname "$CLAUDE_MD")"
  [[ -f "$CLAUDE_MD" ]] || touch "$CLAUDE_MD"

  # build tool listing from DESCRIPTION var in each script
  local listing=""
  for tool in "$BIN_DIR"/claude-*; do
    [[ -f "$tool" ]] || continue
    [[ "$tool" == *.py ]] && continue
    local name desc
    name=$(basename "$tool")
    desc=$(grep '^DESCRIPTION=' "$tool" | head -1 | sed 's/^DESCRIPTION="//' | sed 's/"$//')
    listing="$listing- \`${name}\` — ${desc}"$'\n'
  done

  # assemble the managed block
  local block
  block=$(printf '%s\n%s\n\n%s\n%s' "$START_MARKER" "# Claude Tools" "$listing" "$END_MARKER")

  if grep -q "$START_MARKER" "$CLAUDE_MD"; then
    # replace existing block between markers
    local tmp
    tmp=$(mktemp)
    awk -v start="$START_MARKER" -v end="$END_MARKER" '
      $0 == start { skip=1; next }
      $0 == end { skip=0; next }
      !skip { print }
    ' "$CLAUDE_MD" > "$tmp"
    # insert the new block where the old one was (append at end for simplicity)
    printf '\n%s\n' "$block" >> "$tmp"
    mv "$tmp" "$CLAUDE_MD"
    echo "  Updated tool listing in $CLAUDE_MD"
  else
    printf '\n%s\n' "$block" >> "$CLAUDE_MD"
    echo "  Added tool listing to $CLAUDE_MD"
  fi
}

# --- main ---

echo "claude-tools installer"
echo "======================"
echo ""
echo "Checking prerequisites..."
check_prereqs
echo ""
echo "Installing tools..."
install_tools
echo ""
echo "Installing skills..."
install_skills
echo ""
echo "Updating Claude config..."
update_claude_md
echo ""
echo "Done."
