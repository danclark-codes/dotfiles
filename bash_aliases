#!/bin/bash

# ls shortcuts
alias ls='exa -alhF --icons --no-permissions --no-time --group-directories-first'
alias la='exa -alhF --icons --group-directories-first'

# cd's
alias ..='cd ..'
alias ...='cd ../..'


# navigation shortcuts
alias home='cd $HOME'
alias dot='$GHREPOS/dotfiles'

# git
gia='git add --all'
gis='git status'
dirtypush='git add --all;git commit -m "dirty push - $(date +%Y-%m-%d)";git push'

# neovim
alias v='nvim'
