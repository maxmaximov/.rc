#!/bin/sh
# wget -O - https://raw.github.com/maxmaximov/rc/master/is/.macos.sh | sh
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
brew install colordiff ssh-copy-id wget node
wget -O - https://raw.github.com/maxmaximov/rc/master/is/.common.sh | sh
