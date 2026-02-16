#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# os detection
if [[ "$OSTYPE" == "darwin"* ]]; then
  IS_MAC=true
  IS_LINUX=false
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  IS_MAC=false
  IS_LINUX=true
fi

echo "==> Updating system packages..."
if [ "$IS_MAC" = true ]; then
  brew update && brew upgrade
elif [ "$IS_LINUX" = true ]; then
  sudo apt update && sudo apt upgrade -y
fi

echo "==> Updating Rust toolchain..."
if command -v rustup &>/dev/null; then
  rustup update
fi

echo "==> Updating cargo crates..."
if command -v cargo &>/dev/null; then
  while IFS= read -r crate || [ -n "$crate" ]; do
    [ -z "$crate" ] && continue
    [[ "$crate" == \#* ]] && continue
    echo "Updating crate: $crate"
    cargo install "$crate"
  done < "$DOTFILES_DIR/install/cargo-crates.txt"
fi

echo "==> Updating uv..."
if command -v uv &>/dev/null; then
  uv self update
fi

echo "==> Updating pnpm..."
if command -v pnpm &>/dev/null; then
  pnpm self-update
fi

if [ "$IS_LINUX" = true ]; then
  echo "==> Updating fzf..."
  if [ -d "$HOME/.fzf" ]; then
    git -C "$HOME/.fzf" pull
    "$HOME/.fzf/install" --all --no-bash --no-fish
  fi
fi

echo "==> Updating starship..."
if [ "$IS_MAC" = true ]; then
  brew upgrade starship
elif [ "$IS_LINUX" = true ]; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

echo "==> All updates complete!"
