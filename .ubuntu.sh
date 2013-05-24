#!/bin/sh
# wget -O - http://raw.github.com/maxmaximov/rc/master/.ubuntu.sh | sh
sudo apt-get --yes install vim zsh git colordiff nodejs
cd
git clone git@github.com:maxmaximov/rc.git
mv rc/.git .
rm -rf rc
git checkout .
cd -
sudo chsh -s /bin/bash maxmaximov
zsh
