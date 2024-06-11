#!/bin/zsh


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# ~~~~~~~~~ Environment Variables ~~~~~~~~~~~
export REPOS="$HOME/repos"
export GITUSER="danclark-codes"
export GHREPOS="$REPOS/github.com/$GITUSER"
setopt auto_cd

# ~~~~~~~~~ History ~~~~~~~~~~~~~~~~~~~~~~~~~
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

HISTFILE="$HOME/.histfile"
export HISTSIZE=25000
export HISTFILESIZE=25000


# ~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~~
# alias definitions
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [ -f ~/.repo_aliases ]; then
	. ~/.repo_aliases
fi

# Set up fzf key bindings and fuzzy completion
source ~/.fzf/shell/completion.zsh
source ~/.fzf/shell/key-bindings.zsh

# rust
. "$HOME/.cargo/env"

# neovim
export PATH="$PATH:/opt/nvim-linux64/bin"

# ~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~
# using starship prompt for all prompt needs
# github.com/starship/starship
eval "$(starship init zsh)"
