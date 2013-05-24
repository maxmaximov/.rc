#!/bin/sh
# wget -O - https://raw.github.com/maxmaximov/rc/master/.is/common.sh | sh
cd
mkdir -p .ssh
chmod 700 .ssh
wget -O - https://raw.github.com/maxmaximov/rc/master/.ssh/id_rsa.pub >> .ssh/authorized_keys
chmod 600 .ssh/*
git clone git@github.com:maxmaximov/rc.git
mv rc/.git .
rm -rf rc
git checkout .
cd -
chsh -s /bin/zsh
zsh
