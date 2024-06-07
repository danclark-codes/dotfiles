#!/bin/bash

# takes too long, can be done manually
# sudo apt update &>/dev/null && sudo apt upgrade -y &>/dev/null


# install packages
source ./install-scripts/install-packages.sh

# install fonts
source ./install-scripts/install-fonts.sh

# create symlinks
source ./install-scripts/create-symlinks.sh

