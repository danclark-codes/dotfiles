#!/bin/zsh

command -v claude &>/dev/null && return 0

# native installer - macos and linux, auto-updates in the background
curl -fsSL https://claude.ai/install.sh | bash
