#!/bin/zsh

command -v fzf &>/dev/null && return 0

if [ "$IS_MAC" = true ]; then
  brew install fzf
elif [ "$IS_LINUX" = true ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --all --no-bash --no-fish
fi
