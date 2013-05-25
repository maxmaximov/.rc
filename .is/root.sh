#!/bin/sh
# ssh root@host "wget -nv -O - https://raw.github.com/maxmaximov/rc/master/.is/root.sh | sh"
useradd -mG maxmaximov
echo -e "maxmaximov\tALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
ssh-add
wget -nv -O - https://raw.github.com/maxmaximov/rc/master/.is/ubuntu.sh | sh
