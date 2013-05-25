#!/bin/sh
# wget -nv -O - https://raw.github.com/maxmaximov/rc/master/.is/common.sh | sh
cd /home/maxmaximov
mkdir -p .ssh
chmod 700 .ssh
wget -nv -O - https://raw.github.com/maxmaximov/rc/master/.ssh/id_rsa.pub >> .ssh/authorized_keys
chmod 600 .ssh/*
ssh -o "StrictHostKeyChecking no" git@github.com
git clone git@github.com:maxmaximov/rc.git
mv rc/.git .
rm -rf rc
git checkout .
chown -R maxmaximov:maxmaximov /home/maxmaximov
chsh -s /bin/zsh maxmaximov
cd -
