#!/bin/sh
# wget -O - https://raw.github.com/maxmaximov/rc/master/.is/root.sh | sh
useradd -m maxmaximov
su maxmaximov
cd
wget -O - https://raw.github.com/maxmaximov/rc/master/.is/ubuntu.sh | sh
