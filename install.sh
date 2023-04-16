#!/bin/sh

echo "remember to move the stuff from the dotfile folder first"
echo "press any key to continue"
read;

echo "enabling dnf parallel downloads"
echo "skip_if_unavailable=True         
fastestmirror=True 
max_parallel_downloads=10" >> /etc/dnf/dnf.conf 
dnf update

rpmfusion() {
	dnf install \
	https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm 
	wait;
	dnf install \
	https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm 
	wait;
}

brave() {
	dnf config-manager --add-repo https://brave-browser-rpm-nightly.s3.brave.com/brave-browser-nightly.repo 
	wait;
	rpm --import https://brave-browser-rpm-nightly.s3.brave.com/brave-core-nightly.asc 
	wait;
}

copr() {
	dnf copr enable atim/i3status-rust 
	wait;
	dnf copr enable dspom/keyd 
	wait;
}

go() {
	dnf install tar &
	wait;
	wget https://go.dev/dl/go1.20.3.linux-amd64.tar.gz > /tmp/go1.20.3.linux-amd64.tar.gz &
	wait;
	tar -C /usr/local -xzf /tmp/go1.20.3.linux-amd64.tar.gz &
	wait;
	env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest &
	wait;
}

rpmfusion || error "user exited."
wait;
brave || error "user exited."
wait;
copr || error "user exited."
wait;
go || error "user exited."
echo "the next step is dnf installation"
echo "press any key to continue"
read;

dnf --setopt install_weak_deps=False install zsh opendoas @base-x NetworkManager NetworkManager-wifi network-manager-applet cava clifm dunst i3 i3status-rust kitty mpd mpdris2 dmenu keyd vim mpv ffmpeg flatpak pipewire python3-pip fontawesome-fonts fontawesome5-fonts google-noto-cjk-fonts google-noto-emoji-color-fonts google-noto-sans-mono-vf-fonts google-noto-sans-symbols-fonts google-noto-sans-symbols2-fonts brave-browser-nightly discord lightdm lightdm-settings slick-greeter pop-icon-theme pop-gtk3-theme
wait;
systemctl enable keyd.service 
wait;
systemctl start keyd.service 
echo "enabling booting to gui"
systemctl set-default graphical.target
wait;
echo "go compile gomp @ https://github.com/aditya-K2/gomp"
echo "also download the necessary pip packages"
echo "and also rpm packages"
