#!/bin/zsh

command -v gh &>/dev/null && return 0

if [ "$IS_MAC" = true ]; then
  brew install gh
elif [ "$IS_LINUX" = true ]; then
  sudo apt install gh -y
fi
