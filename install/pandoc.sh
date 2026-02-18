#!/bin/zsh

command -v pandoc &>/dev/null && return 0

if [ "$IS_MAC" = true ]; then
  brew install pandoc
elif [ "$IS_LINUX" = true ]; then
  sudo apt install pandoc -y
fi
