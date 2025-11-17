#!/bin/zsh

# mac only
[ "$IS_MAC" != true ] && return 0

command -v brew &>/dev/null && return 0

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
