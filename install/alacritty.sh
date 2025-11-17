#!/bin/zsh

# linux only
[ "$IS_LINUX" != true ] && return 0

command -v alacritty &>/dev/null && return 0

sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt update
sudo apt install alacritty -y
