#!/bin/zsh

command -v spacetime &>/dev/null && return 0

[ "$IS_LINUX" != true ] && return 0

curl -fsSL https://install.spacetimedb.com | bash -s -- --yes
