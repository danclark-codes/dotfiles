#!/bin/zsh

command -v whisper-cpp &>/dev/null && return 0

if [ "$IS_MAC" = true ]; then
  brew install whisper-cpp
fi
