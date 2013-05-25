#!/bin/sh
# wget -nv -O - https://raw.github.com/maxmaximov/rc/master/.is/ubuntu.sh | sh
sudo apt-get --yes install colordiff vim zsh git nodejs
wget -nv -O - https://raw.github.com/maxmaximov/rc/master/.is/common.sh | sh
