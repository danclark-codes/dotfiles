#!/bin/bash

# exit on error
set -e

# get repo directory
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# os detection
if [[ "$OSTYPE" == "darwin"* ]]; then
    export IS_MAC=true
    export IS_LINUX=false
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export IS_MAC=false
    export IS_LINUX=true
fi

echo "==> Installing software and tools..."
INSTALL_DIR="$DOTFILES_DIR/install"

# run install scripts in order
. "$INSTALL_DIR/brew.sh"
. "$INSTALL_DIR/apt.sh"
. "$INSTALL_DIR/azure-cli.sh"
. "$INSTALL_DIR/cargo.sh"
. "$INSTALL_DIR/claude.sh"
. "$INSTALL_DIR/docker.sh"
. "$INSTALL_DIR/eza.sh"
. "$INSTALL_DIR/ffmpeg.sh"
. "$INSTALL_DIR/fzf.sh"
. "$INSTALL_DIR/gh.sh"
. "$INSTALL_DIR/mermaid-cli.sh"
. "$INSTALL_DIR/opentofu.sh"
. "$INSTALL_DIR/pandoc.sh"
. "$INSTALL_DIR/pnpm.sh"
. "$INSTALL_DIR/rclone.sh"
. "$INSTALL_DIR/starship.sh"
. "$INSTALL_DIR/uv.sh"
. "$INSTALL_DIR/alacritty.sh"
. "$INSTALL_DIR/firefox.sh"
. "$INSTALL_DIR/vscode.sh"

echo "==> Installing Claude tools..."
"$DOTFILES_DIR/claude-tools/install.sh"

echo "==> Setting up dotfiles..."

# single symlink for zsh bootstrap
ln -sf "$DOTFILES_DIR/.zshenv" "$HOME/.zshenv"

# git config
ln -sf "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"

# starship config
mkdir -p "$HOME/.config"
ln -sf "$DOTFILES_DIR/config/starship.toml" "$HOME/.config/starship.toml"

# claude code config
mkdir -p "$HOME/.claude"
ln -sf "$DOTFILES_DIR/config/CLAUDE.md" "$HOME/.claude/CLAUDE.md"

# alacritty config
rm -rf "$HOME/.config/alacritty"
ln -sf "$DOTFILES_DIR/config/alacritty" "$HOME/.config/alacritty"

# fonts
"$DOTFILES_DIR/fonts/SauceCodeProNF"

echo "==> Setup complete! Restart your shell or run: source ~/.zshenv"
