# Handy

Screen annotation and drawing tool for presentations and screencasts. Lets you draw, highlight, and annotate directly on top of your desktop.

## Install

1. Download the AppImage from <https://handy.hamonikr.org>
2. Move it to `~/.local/bin/` and make it executable:
   ```sh
   chmod +x ~/.local/bin/Handy-*.AppImage
   ```
3. Create a desktop entry at `~/.local/share/applications/handy.desktop`:
   ```ini
   [Desktop Entry]
   Name=Handy
   Exec=$HOME/.local/bin/Handy-*.AppImage
   Type=Application
   Categories=Utility;
   ```
