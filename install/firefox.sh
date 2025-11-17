#!/bin/zsh

if [ "$IS_MAC" = true ]; then
  [ -d "/Applications/Firefox.app" ] && exit 0
  brew install --cask firefox
elif [ "$IS_LINUX" = true ]; then
  command -v firefox &>/dev/null && exit 0
  sudo apt install firefox -y
fi
