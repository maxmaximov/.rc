#!/bin/sh
# wget -qO - https://raw.github.com/maxmaximov/rc/master/.is/ubuntu.sh | sh
sudo apt-get update
sudo apt-get -yq install software-properties-common
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get -yq install colordiff vim zsh git nodejs
wget -qO - https://raw.github.com/maxmaximov/rc/master/.is/common.sh | sh
