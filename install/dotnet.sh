#!/bin/zsh

command -v dotnet &>/dev/null && return 0

if [ "$IS_MAC" = true ]; then
  brew install --cask dotnet-sdk
elif [ "$IS_LINUX" = true ]; then
  tmp=$(mktemp -d)
  curl -fsSL https://builds.dotnet.microsoft.com/dotnet/scripts/v1/dotnet-install.sh -o "$tmp/dotnet-install.sh"
  chmod +x "$tmp/dotnet-install.sh"
  "$tmp/dotnet-install.sh" --channel LTS --install-dir "$HOME/.dotnet"
  rm -rf "$tmp"
fi
