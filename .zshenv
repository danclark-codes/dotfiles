#!/bin/zsh

# Set ZDOTDIR to point to this repo's zsh config
export ZDOTDIR="${HOME}/code/github.com/danclark-codes/dotfiles/zsh"

# XDG Base Directory
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# cargo/rust (currently in live ~/.zshenv)
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"