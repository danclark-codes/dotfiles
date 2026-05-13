#!/bin/zsh

command -v godot &>/dev/null && return 0

if [ "$IS_MAC" = true ]; then
  return 0
elif [ "$IS_LINUX" = true ]; then
  command -v unzip &>/dev/null || sudo apt install -y unzip

  latest_tag=$(curl -fsSLI -o /dev/null -w '%{url_effective}' https://github.com/godotengine/godot/releases/latest | sed 's|.*/tag/||')
  zip="Godot_v${latest_tag}_mono_linux_x86_64.zip"
  install_dir="$HOME/.local/share/godot"
  tmp=$(mktemp -d)
  curl -fsSL -o "$tmp/$zip" "https://github.com/godotengine/godot/releases/download/${latest_tag}/${zip}"
  rm -rf "$install_dir"
  mkdir -p "$install_dir"
  unzip -q "$tmp/$zip" -d "$install_dir"
  binary="$install_dir/Godot_v${latest_tag}_mono_linux_x86_64/Godot_v${latest_tag}_mono_linux.x86_64"
  chmod +x "$binary"
  mkdir -p "$HOME/.local/bin"
  ln -sf "$binary" "$HOME/.local/bin/godot"
  rm -rf "$tmp"
fi
