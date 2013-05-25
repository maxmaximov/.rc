#!/bin/sh
# wget -nv -O - https://raw.github.com/maxmaximov/rc/master/.is/ubuntu.sh | sh
sudo apt-get update
sudo apt-get --yes install software-properties-common
sudo add-apt-repository --yes ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get --yes install colordiff vim zsh git nodejs npm
wget -nv -O - https://raw.github.com/maxmaximov/rc/master/.is/common.sh | sh
