#!/bin/sh
#
# to be run after logging as user

echo "this script should be run after logging in as the user"
echo "NOTE: this script expects that you have opendoas installed"
echo "press any key to continue"
read;

echo "make home owned by user"
doas chown -R $USER $HOME
wait;
doas dnf install tar
wait;
pip install autotiling
