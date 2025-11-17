#!/bin/zsh

if [ "$IS_MAC" = true ]; then
  [ -d "/Applications/Docker.app" ] && return 0
  brew install --cask docker
elif [ "$IS_LINUX" = true ]; then
  command -v docker &>/dev/null && return 0
  sudo apt install docker.io docker-compose -y
fi
