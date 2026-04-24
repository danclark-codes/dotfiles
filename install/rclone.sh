#!/bin/zsh

command -v rclone &>/dev/null && return 0

if [ "$IS_MAC" = true ]; then
  brew install rclone
elif [ "$IS_LINUX" = true ]; then
  sudo apt install rclone -y
fi
