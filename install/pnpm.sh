#!/bin/zsh

command -v pnpm &>/dev/null && return 0

echo "Installing pnpm..."
export PNPM_HOME="$HOME/.local/share/pnpm"
mkdir -p "$PNPM_HOME"

# unpack the standalone release directly - the official installer only runs
# `pnpm setup` to edit shell rc files, and we manage PATH ourselves
if [ "$IS_MAC" = true ]; then
  PNPM_ASSET="pnpm-darwin-arm64.tar.gz"
else
  PNPM_ASSET="pnpm-linux-x64.tar.gz"
fi

curl -fsSL "https://github.com/pnpm/pnpm/releases/latest/download/$PNPM_ASSET" | tar -xz -C "$PNPM_HOME"
chmod +x "$PNPM_HOME/pnpm"
export PATH="$PNPM_HOME:$PATH"
