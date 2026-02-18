#!/bin/zsh

# linux uses npm.sh
[ "$IS_MAC" != true ] && return 0

command -v claude &>/dev/null && return 0

brew install claude
