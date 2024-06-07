#!/bin/bash

# Add packages here to be installed
declare -a packages=("zsh" "git" "gh" "curl" "python3-pip" "fzf")

# Install packages
for package in "${packages[@]}"
do
	if type -p $package > /dev/null; then
		sudo apt-get -y -qq install $package
	fi
done


# Install git-completion and git-prompt
curl -sOL https://github.com/git/git/raw/master/contrib/completion/git-completion.bash
mv ./git-completion.bash ~/.git-completion.bash

curl -s https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -o ./.git-prompt.sh
mv ./.git-prompt.sh ~/.git-prompt.sh
