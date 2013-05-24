#!/bin/sh
sudo apt-get --yes install vim zsh git colordiff nodejs
cd
git clone --no-checkout git@github.com:maxmaximov/rc.git
mv rc/.git .
rmdir rc
git reset --mixed HEAD
cd -
sudo chsh -s /bin/bash maxmaximov
