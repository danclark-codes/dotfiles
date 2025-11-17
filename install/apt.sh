#!/bin/zsh

# linux only
[ "$IS_LINUX" != true ] && exit 0

sudo apt update
sudo apt upgrade -y
