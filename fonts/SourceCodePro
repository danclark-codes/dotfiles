#!/bin/bash

# create .fonts folder
mkdir -p ~/.fonts/SourceCodePro/

# download and install if missing
if [ -z "find ~/.fonts/SourceCodePro/ -name \"*.ttf\"" ]; then
	# Source Code Pro nerd font
	curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/SourceCodePro.tar.xz

	# extract
	tar -xf SourceCodePro.tar.xz -C ~/.fonts/SourceCodePro/

	# refresh font cache, which references ~/.fonts/ automatically
	fc-cache -fv 2>&1 > /dev/null # Suppressing output but showing errors

	rm SourceCodePro.tar.xz
fi

