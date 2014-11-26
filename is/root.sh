#!/bin/sh
# ssh root@host "wget -qO - https://raw.github.com/maxmaximov/rc/master/is/root.sh | sh"
useradd -m maxmaximov
echo "maxmaximov	ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
ssh-add
wget -qO - https://raw.github.com/maxmaximov/rc/master/is/ubuntu.sh | sh
