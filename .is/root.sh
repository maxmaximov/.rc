#!/bin/sh
# ssh root@host "wget -nv -O - https://raw.github.com/maxmaximov/rc/master/.is/root.sh | sh"
useradd -mG sudo maxmaximov
wget -nv -O - https://raw.github.com/maxmaximov/rc/master/.is/ubuntu.sh | sh
