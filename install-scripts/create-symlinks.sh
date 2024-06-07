#!/bin/zsh

log_file=./install_progress_log.txt

# where this repo is stored
dotfiles_dir=~/dotfiles

# Delete any existing dot files and folders
sudo rm -rf ~/.bashrc >> /dev/null 2>&1
sudo rm -rf ~/.bash_aliases >> /dev/null 2>&1
sudo rm -rf ~/.gitconfig >> /dev/null 2>&1
sudo rm -rf ~/.zshrc >> /dev/null 2>&1



# Create symlinks for dot files
ln -sf $dotfiles_dir/bashrc ~/.bashrc
ln -sf $dotfiles_dir/bash_aliases ~/.bash_aliases
ln -sf $dotfiles_dir/gitconfig ~/.gitconfig
ln -sf $dotfiles_dir/zsh/zshrc ~/.zshrc

