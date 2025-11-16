!#/bin/zsh

# If not running interactively, do nothing
case $- in
    *i*) ;;
      *) return;;
esac


. "$HOME/.local/bin/env"

# Add VS Code to path
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# zsh_aliases
if [ -f "$HOME/.zsh_aliases" ]; then
    . "$HOME/.zsh_aliases"
fi

# also check for bash_aliases
if [ -f "$HOME/.bash_aliases" ]; then
    . "$HOME/.bash_aliases"
fi

# prompt history
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=100000
setopt EXTENDED_HISTORY         # Write to history file in the ":start:elapsed;command" format
setopt INC_APPEND_HISTORY       # Incrementally append commands to history immediately, rather than when shell exits
setopt HIST_FIND_NO_DUPS        # Deduplicate history find results
setopt HIST_IGNORE_ALL_DUPS     # Delete old recorded entry if new entry is a duplicate


# node version manager
# https://github.com/nvm-sh/nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# starship terminal prompt
# https://starship.rs/
eval "$(starship init zsh)"
