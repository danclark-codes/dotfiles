#!/bin/zsh

command -v starship &>/dev/null && return 0

if [ "$IS_MAC" = true ]; then
  brew install starship
elif [ "$IS_LINUX" = true ]; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi
