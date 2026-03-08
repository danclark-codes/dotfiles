# Voxtype

Offline voice-to-text with push-to-talk for Wayland. Uses NVIDIA Parakeet TDT v3 for fast, accurate transcription with punctuation and capitalisation. Text is auto-typed into the focused window via dotool.

- <https://github.com/peteonrails/voxtype>
- <https://voxtype.io>

## Prerequisites

- dotool (see [dotool.md](dotool.md))
- `wl-clipboard` for clipboard fallback:
  ```sh
  sudo apt install wl-clipboard
  ```

## Install

1. Check your CPU's AVX support:
   ```sh
   grep -o 'avx512[a-z]*\|avx2' /proc/cpuinfo | sort -u
   ```
2. Download the matching ONNX binary from the [latest release](https://github.com/peteonrails/voxtype/releases):
   - AVX-512: `voxtype-*-linux-x86_64-onnx-avx512`
   - AVX2: `voxtype-*-linux-x86_64-onnx-avx2`
   - NVIDIA GPU: `voxtype-*-linux-x86_64-onnx-cuda`
3. Install the binary:
   ```sh
   chmod +x voxtype-*-linux-x86_64-onnx-*
   mv voxtype-*-linux-x86_64-onnx-* ~/.local/bin/voxtype
   ```

## Download model

```sh
voxtype setup model
```

Select `parakeet-tdt-0.6b-v3-int8` (670 MB, quantised, fast on CPU) or `parakeet-tdt-0.6b-v3` (2.6 GB, full precision).

## Configure

Create `~/.config/voxtype/config.toml`:

```toml
engine = "parakeet"

[hotkey]
enabled = false

[audio]
device = "default"
sample_rate = 16000
max_duration_secs = 60

[parakeet]
model = "parakeet-tdt-0.6b-v3-int8"

[output]
mode = "type"
fallback_to_clipboard = true
type_delay_ms = 0

[output.notification]
on_transcription = true
```

Hotkey is disabled because GNOME Wayland doesn't support app-level global shortcuts — we use a GNOME custom keybinding instead.

## GNOME keybinding

Set up Super+I to toggle recording:

```sh
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings \
  "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ \
  name 'Voxtype Toggle Transcribe'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ \
  command "$(which voxtype) record toggle"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ \
  binding '<Super>i'
```

**Note:** If you already have custom keybindings, append to the existing list instead of replacing it.

## Systemd user service

```sh
voxtype setup systemd
```

This creates `~/.config/systemd/user/voxtype.service`, enables it, and starts it. Voxtype will start automatically on login.

Useful commands:

```sh
systemctl --user status voxtype    # Check status
systemctl --user restart voxtype   # Restart
journalctl --user -u voxtype -f    # View logs
```

## Usage

Press **Super+I** to start recording, speak, press **Super+I** again to stop. Transcribed text is typed into the focused window.
