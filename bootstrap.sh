#!/bin/bash

# exit on error
set -euo pipefail

REPO_DIR="$HOME/code/github.com/danclark-codes/dotfiles"

sudo apt update
sudo apt install -y git curl

mkdir -p "$(dirname "$REPO_DIR")"
[ -d "$REPO_DIR" ] || git clone https://github.com/danclark-codes/dotfiles "$REPO_DIR"

cd "$REPO_DIR"
./setup.sh
