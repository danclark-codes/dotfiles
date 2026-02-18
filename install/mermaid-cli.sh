#!/bin/zsh

# linux uses npm.sh
[ "$IS_MAC" != true ] && return 0

command -v mmdc &>/dev/null && return 0

brew install mermaid-cli
