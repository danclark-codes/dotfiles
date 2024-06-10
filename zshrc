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
export DOTFILES="$GHREPOS/dotfiles"
export SCRIPTS="$DOTFILES/scripts"
export OBSIDIAN="$GHREPOS/obsidian-vault"

# ~~~~~~~~~ History ~~~~~~~~~~~~~~~~~~~~~~~~~
HISTCONTROL=ignoreboth

shopt -s histappend
HISTFILE="$HOME/.histfile"
HISTSIZE=25000
HISTFILESIZE=25000



# ~~~~~~~~~~~~~~~ Functions ~~~~~~~~~~~~~~~~~~~~~~~~

# This function is stolen from rwxrob

clone() {
	local repo="$1" user
	local repo="${repo#https://github.com/}"
	local repo="${repo#git@github.com:}"
	if [[ $repo =~ / ]]; then
		user="${repo%%/*}"
	else
		user="$GITUSER"
		[[ -z "$user" ]] && user="$USER"
	fi
	local name="${repo##*/}"
	local userd="$REPOS/github.com/$user"
	local path="$userd/$name"
	[[ -d "$path" ]] && cd "$path" && return
	mkdir -p "$userd"
	cd "$userd"
	echo gh repo clone "$user/$name" -- --recurse-submodule
	gh repo clone "$user/$name" -- --recurse-submodule
	cd "$name"
} && export -f clone

# ~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~~
# alias definitions
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Set up fzf key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# rust
. "$HOME/.cargo/env"

# ~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~
# using starship prompt for all prompt needs
# github.com/starship/starship
eval "$(starship init zsh)"
