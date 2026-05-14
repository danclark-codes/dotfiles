#!/bin/zsh

if [ "$IS_MAC" = true ]; then
  command -v dotnet &>/dev/null && return 0
  brew install --cask dotnet-sdk
elif [ "$IS_LINUX" = true ]; then
  # install latest LTS plus .NET 8 (needed by spacetimedb)
  dotnet_bin="$HOME/.dotnet/dotnet"
  if [ -x "$dotnet_bin" ] \
    && "$dotnet_bin" --list-sdks 2>/dev/null | grep -q '^8\.' \
    && "$dotnet_bin" --list-sdks 2>/dev/null | grep -E '^[0-9]+\.' | grep -vq '^8\.'; then
    return 0
  fi

  tmp=$(mktemp -d)
  curl -fsSL https://builds.dotnet.microsoft.com/dotnet/scripts/v1/dotnet-install.sh -o "$tmp/dotnet-install.sh"
  chmod +x "$tmp/dotnet-install.sh"
  "$tmp/dotnet-install.sh" --channel LTS --install-dir "$HOME/.dotnet"
  "$tmp/dotnet-install.sh" --channel 8.0 --install-dir "$HOME/.dotnet"
  rm -rf "$tmp"
fi
