#!/bin/sh
# wget -nv -O - https://raw.github.com/maxmaximov/rc/master/.is/ubuntu.sh | sh
sudo apt-get update
sudo apt-get --yes install python3-software-properties
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get --yes install colordiff vim zsh git nodejs
wget -nv -O - https://raw.github.com/maxmaximov/rc/master/.is/common.sh | sh
