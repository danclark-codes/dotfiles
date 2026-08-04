#!/bin/zsh

# linux only - macos already ships zsh as the login shell
[ "$IS_LINUX" != true ] && return 0

command -v zsh &>/dev/null || sudo apt install zsh -y

# make zsh the login shell - takes effect on next login
[ "$SHELL" = "$(command -v zsh)" ] || chsh -s "$(command -v zsh)"
