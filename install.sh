#!/bin/zsh

set -e

# os detection
if [[ "$OSTYPE" == "darwin"* ]]; then
    export IS_MAC=true
    export IS_LINUX=false
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export IS_MAC=false
    export IS_LINUX=true
fi

INSTALL_DIR="$(cd "$(dirname "$0")" && pwd)/install"

# run install scripts in order
. "$INSTALL_DIR/brew.sh"
. "$INSTALL_DIR/apt.sh"
. "$INSTALL_DIR/eza.sh"
. "$INSTALL_DIR/fzf.sh"
. "$INSTALL_DIR/gh.sh"
. "$INSTALL_DIR/starship.sh"
. "$INSTALL_DIR/uv.sh"
. "$INSTALL_DIR/docker.sh"
. "$INSTALL_DIR/alacritty.sh"
. "$INSTALL_DIR/firefox.sh"
. "$INSTALL_DIR/vscode.sh"
