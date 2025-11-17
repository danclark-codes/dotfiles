#!/bin/zsh

command -v uv &>/dev/null && return 0

if [ "$IS_MAC" = true ]; then
  brew install uv
elif [ "$IS_LINUX" = true ]; then
  curl -LsSf https://astral.sh/uv/install.sh | sh
fi
