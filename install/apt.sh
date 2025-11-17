#!/bin/zsh

# linux only
[ "$IS_LINUX" != true ] && return 0

sudo apt update
sudo apt upgrade -y
