#!/bin/zsh

command -v eza &>/dev/null && return 0

if [ "$IS_MAC" = true ]; then
  brew install eza
elif [ "$IS_LINUX" = true ]; then
  sudo apt install eza -y
fi
