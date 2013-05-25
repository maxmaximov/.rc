#!/bin/sh
# wget -nv -O - https://raw.github.com/maxmaximov/rc/master/.is/common.sh | sh
cd /home/maxmaximov
mkdir -p .ssh
echo "github.com,204.232.175.90 ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==" >> .ssh/known_hosts
chmod 700 .ssh
wget -nv -O - https://raw.github.com/maxmaximov/rc/master/.ssh/id_rsa.pub >> .ssh/authorized_keys
chmod 600 .ssh/*
ssh -o "StrictHostKeyChecking no" git@github.com
rm -rf rc
git clone git@github.com:maxmaximov/rc.git
cp -r rc/.git .
rm -rf rc
git checkout .
chown -R maxmaximov:maxmaximov /home/maxmaximov
chsh -s /bin/zsh maxmaximov
cd -
