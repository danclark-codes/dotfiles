#!/bin/zsh

if [ "$IS_MAC" = true ]; then
  [ -d "/Applications/Firefox.app" ] && return 0
  brew install --cask firefox
elif [ "$IS_LINUX" = true ]; then
  command -v firefox &>/dev/null && return 0
  sudo apt install firefox -y
fi
