# Blender

Open-source 3D creation suite supporting modeling, sculpting, animation, rendering, compositing, and video editing.

## Install

1. Download the latest Linux tar archive from <https://www.blender.org/download/>
2. Extract to `~/.local/share/blender/` (or your preferred location):
   ```sh
   mkdir -p ~/.local/share/blender
   tar xf blender-*.tar.xz -C ~/.local/share/blender --strip-components=1
   ```
3. Create a desktop entry at `~/.local/share/applications/blender.desktop`:
   ```ini
   [Desktop Entry]
   Name=Blender
   Exec=$HOME/.local/share/blender/blender
   Icon=$HOME/.local/share/blender/blender.svg
   Type=Application
   Categories=Graphics;3DGraphics;
   ```
