# dotfiles

Portable dotfiles for macOS and Linux using ZDOTDIR.

## Setup

Fresh machine — installs git and curl, clones the repo, runs setup:

```bash
curl -fsSL https://raw.githubusercontent.com/danclark-codes/dotfiles/main/bootstrap.sh | bash
```

If curl is missing: `wget -qO- https://raw.githubusercontent.com/danclark-codes/dotfiles/main/bootstrap.sh | bash`

Already cloned:

```bash
cd ~/code/github.com/danclark-codes/dotfiles
./setup.sh
```

Run `setup.sh`, never source it — sourcing breaks the `$0` path lookup.

Setup sets zsh as the login shell, so log out and back in to pick it up.

Update git identity emails in `git/.gitconfig-*` files for each account.

## Structure

```
.zshenv             # bootstrap, sets ZDOTDIR
zsh/                # all zsh configs
  .zshrc            # main config with OS detection
  .zsh_aliases      # aliases
  .zsh_functions    # functions
git/                # git configs
  .gitconfig        # main config with conditional includes
  .gitconfig-*      # identity files per account
config/             # XDG configs
  starship.toml     # starship prompt (empty = defaults)
```

## Functions

- `gsa` - check all repos in ~/code for uncommitted/unpushed changes
- `clone <url>` - clone to organized structure in ~/code
- `repo [query]` - fzf search and cd into repos

## Platform Notes

- macOS: Uses homebrew fzf, VS Code path
- Linux: Uses ~/.fzf install, nvim path