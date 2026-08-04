#!/bin/zsh

# linux only
[ "$IS_LINUX" != true ] && return 0

sudo apt update
sudo apt upgrade -y

# base tools the other install scripts assume exist
sudo apt install -y curl gnupg unzip
