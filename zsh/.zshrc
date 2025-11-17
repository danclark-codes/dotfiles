#!/bin/zsh

# exit if not interactive
case $- in
    *i*) ;;
      *) return;;
esac

# os detection
if [[ "$OSTYPE" == "darwin"* ]]; then
    IS_MAC=true
    IS_LINUX=false
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    IS_MAC=false
    IS_LINUX=true
fi

# environment variables
export REPOS="$HOME/code"
export GITUSER="danclark-codes"
export GHREPOS="$REPOS/github.com/$GITUSER"
setopt auto_cd

# history
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
HISTFILE="$HOME/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=100000

# aliases
if [ -f "$ZDOTDIR/.zsh_aliases" ]; then
    . "$ZDOTDIR/.zsh_aliases"
fi

# functions
if [ -f "$ZDOTDIR/.zsh_functions" ]; then
    . "$ZDOTDIR/.zsh_functions"
fi

# platform specific config
if [ "$IS_MAC" = true ]; then
    # macos specific
    # local bin env (adds ~/.local/bin to PATH)
    [ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

    # vs code cli
    export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

elif [ "$IS_LINUX" = true ]; then
    # linux specific
    export PATH="$PATH:/opt/nvim-linux64/bin"

    # rust
    [ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
fi

# uv python (cross-platform)
command -v uv >/dev/null && eval "$(uv generate-shell-completion zsh)"

# nvm (cross-platform)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# fzf (cross-platform but different paths)
if [ "$IS_MAC" = true ]; then
    # macos fzf from homebrew
    command -v fzf >/dev/null && source <(fzf --zsh)
elif [ "$IS_LINUX" = true ]; then
    # linux fzf from git clone
    [ -f ~/.fzf/shell/completion.zsh ] && source ~/.fzf/shell/completion.zsh
    [ -f ~/.fzf/shell/key-bindings.zsh ] && source ~/.fzf/shell/key-bindings.zsh
fi

# starship prompt
command -v starship >/dev/null && eval "$(starship init zsh)"