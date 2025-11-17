#!/bin/zsh

# linux only
[ "$IS_LINUX" != true ] && exit 0

command -v alacritty &>/dev/null && exit 0

sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt update
sudo apt install alacritty -y
