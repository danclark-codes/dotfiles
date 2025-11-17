# dotfiles

Portable dotfiles for macOS and Linux using ZDOTDIR.

## Setup

```bash
git clone https://github.com/danclark-codes/dotfiles ~/code/github.com/danclark-codes/dotfiles
cd ~/code/github.com/danclark-codes/dotfiles
chmod +x setup  # if needed
./setup
```

Restart terminal or: `source ~/.zshenv`

Update git identity emails in `git/.gitconfig-*` files for each account.

## Structure

```
.zshenv              # bootstrap, sets ZDOTDIR
zsh/                 # all zsh configs
  .zshrc            # main config with OS detection
  .zsh_aliases      # aliases
  .zsh_functions    # functions
git/                 # git configs
  .gitconfig        # main config with conditional includes
  .gitconfig-*      # identity files per account
config/              # XDG configs
  starship.toml     # starship prompt (empty = defaults)
```

## Functions

- `gstatus` - check all repos in ~/code for uncommitted/unpushed changes
- `clone <url>` - clone to organized structure in ~/code
- `repo [query]` - fzf search and cd into repos

## Platform Notes

- macOS: Uses homebrew fzf, VS Code path
- Linux: Uses ~/.fzf install, nvim path, pyenv