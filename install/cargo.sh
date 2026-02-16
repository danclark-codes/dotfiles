#!/bin/zsh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# install rustup if not present
if ! command -v cargo &>/dev/null; then
  echo "Installing rustup..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  . "$HOME/.cargo/env"
fi

# install crates from list
while IFS= read -r crate || [ -n "$crate" ]; do
  [ -z "$crate" ] && continue
  [[ "$crate" == \#* ]] && continue
  echo "Installing crate: $crate"
  cargo install "$crate"
done < "$SCRIPT_DIR/cargo-crates.txt"
