# dotool

Simulates keyboard and mouse input using Linux's uinput module. Works on Wayland (including GNOME), X11, and TTYs. Required by Voxtype to auto-type transcriptions.

- <https://sr.ht/~geb/dotool/>

## Why dotool

GNOME's Wayland compositor doesn't support the `virtual-keyboard` protocol, so `wtype` doesn't work. `ydotool` lacks keyboard layout awareness and has broken Unicode support. `eitype` (libei) works but shows a permission dialog every session. dotool uses uinput at the kernel level — no compositor support needed, no dialogs.

## Install

Build dependencies (can be removed after building):

```sh
sudo apt install golang-go libxkbcommon-dev scdoc
```

Build and install:

```sh
git clone https://git.sr.ht/~geb/dotool /tmp/dotool
cd /tmp/dotool
./build.sh
sudo ./build.sh install
sudo udevadm control --reload
sudo udevadm trigger
```

Add your user to the `input` group (requires logout/login to take effect):

```sh
sudo usermod -aG input $USER
```

Remove build dependencies:

```sh
sudo apt remove golang-go golang-1.24-go golang-src
sudo apt autoremove
```

Clean up source:

```sh
rm -rf /tmp/dotool
```

## Verify

After logging back in:

```sh
groups | grep input
echo "type hello" | dotool
```
