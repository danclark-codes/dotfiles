#!/bin/zsh

# Set up fzf key bindings and fuzzy completion
[-f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
