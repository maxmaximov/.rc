#!/bin/sh
# wget -nv -O - https://raw.github.com/maxmaximov/rc/master/.is/macos.sh | sh
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
brew install colordiff ssh-copy-id wget -nv node
wget -nv -O - https://raw.github.com/maxmaximov/rc/master/.is/common.sh | sh
