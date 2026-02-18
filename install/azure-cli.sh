#!/bin/zsh

command -v az &>/dev/null && return 0

if [ "$IS_MAC" = true ]; then
  brew install azure-cli
elif [ "$IS_LINUX" = true ]; then
  curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
fi
