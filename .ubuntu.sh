#!/bin/sh
sudo apt-get --yes install vim zsh git colordiff nodejs
cd
git clone git@github.com:maxmaximov/rc.git
mv rc/.git .
rm -rf rc
git checkout .
cd -
sudo chsh -s /bin/bash maxmaximov
