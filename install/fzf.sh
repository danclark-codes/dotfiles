#!/bin/zsh

command -v fzf &>/dev/null && return 0

if [ "$IS_MAC" = true ]; then
  brew install fzf
elif [ "$IS_LINUX" = true ]; then
  sudo apt install -y fzf
fi
