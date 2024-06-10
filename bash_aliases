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
ga='git add --all'
gs='git status'

# neovim
alias nv='nvim'
