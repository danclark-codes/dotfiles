#!/bin/zsh

command -v pnpm &>/dev/null && return 0

echo "Installing pnpm..."
export PNPM_HOME="$HOME/.local/share/pnpm"
# SHELL=/dev/null prevents pnpm setup from appending to .zshrc (we manage PATH ourselves)
curl -fsSL https://get.pnpm.io/install.sh | SHELL=/dev/null sh - 2>/dev/null || true
export PATH="$PNPM_HOME:$PATH"
