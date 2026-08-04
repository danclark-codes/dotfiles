#!/bin/zsh

if [ "$IS_MAC" = true ]; then
  [ -d "/Applications/Firefox.app" ] || brew install --cask firefox
elif [ "$IS_LINUX" = true ]; then
  # ubuntu preinstalls firefox as a snap - switch to mozilla's apt repo
  if [ ! -f /etc/apt/sources.list.d/mozilla.list ]; then
    # remove the snap and the transitional deb
    # (no --purge, so snapd keeps a snapshot of the old profile)
    snap list firefox &>/dev/null && sudo snap remove firefox
    dpkg -s firefox &>/dev/null && sudo apt remove -y firefox

    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://packages.mozilla.org/apt/repo-signing-key.gpg | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc >/dev/null
    echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee /etc/apt/sources.list.d/mozilla.list >/dev/null

    # outrank ubuntu's snap transitional package
    printf 'Package: firefox*\nPin: origin packages.mozilla.org\nPin-Priority: 1000\n' | sudo tee /etc/apt/preferences.d/mozilla >/dev/null

    sudo apt update
    sudo apt install -y firefox
  fi

  # extensions, via enterprise policy
  sudo install -Dm 644 "$DOTFILES_DIR/config/firefox/policies.json" /etc/firefox/policies/policies.json
fi
