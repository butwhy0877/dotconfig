#!/bin/sh

echo "enabling dnf parallel downloads"
echo "fastestmirror=True
max_parallel_downloads=10" >> /etc/dnf/dnf.conf
wait;
dnf update
wait;
dnf install zsh
wait;
echo "now please setup the user"
