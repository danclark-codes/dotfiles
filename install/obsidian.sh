#!/bin/zsh

if [ "$IS_MAC" = true ]; then
  [ -d "/Applications/Obsidian.app" ] && return 0
  brew install --cask obsidian
elif [ "$IS_LINUX" = true ]; then
  command -v obsidian &>/dev/null && return 0

  latest_tag=$(curl -fsSLI -o /dev/null -w '%{url_effective}' https://github.com/obsidianmd/obsidian-releases/releases/latest | sed 's|.*/tag/v||')
  deb="obsidian_${latest_tag}_amd64.deb"
  tmp=$(mktemp -d)
  curl -fsSL -o "$tmp/$deb" "https://github.com/obsidianmd/obsidian-releases/releases/download/v${latest_tag}/${deb}"
  sudo apt install -y "$tmp/$deb"
  rm -rf "$tmp"
fi
