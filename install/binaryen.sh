#!/bin/zsh

# wasm-opt is used by the spacetimedb cli to optimize wasm modules
command -v wasm-opt &>/dev/null && return 0

[ "$IS_LINUX" != true ] && return 0

sudo apt install binaryen -y
