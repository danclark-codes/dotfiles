#!/bin/zsh

command -v ffmpeg &>/dev/null && return 0

if [ "$IS_MAC" = true ]; then
  brew install ffmpeg
elif [ "$IS_LINUX" = true ]; then
  sudo apt install ffmpeg -y
fi
