#!/bin/sh

echo "remember to move the stuff from the dotfile folder first"
echo "press any key to continue"
read;

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


rpmfusion || error "user exited."
wait;
brave || error "user exited."
wait;
copr || error "user exited."
wait;
echo "the next step is dnf installation"
echo "press any key to continue"
read;
dnf update
wait;

dnf install opendoas @base-x light compton NetworkManager NetworkManager-wifi network-manager-applet feh maim cava clifm dunst i3 i3status-rust kitty mpd mpdris2 dmenu keyd vim mpv ffmpeg flatpak fuse pipewire pulseaudio-utils python3-pip fira-code-fonts fontawesome-fonts fontawesome5-fonts google-noto-cjk-fonts google-noto-emoji-color-fonts google-noto-sans-mono-vf-fonts google-noto-sans-symbols-fonts google-noto-sans-symbols2-fonts brave-browser-nightly discord lightdm lightdm-settings slick-greeter pop-icon-theme pop-gtk3-theme
wait;
systemctl enable keyd.service 
wait;
systemctl start keyd.service 
echo "enabling booting to gui"
systemctl set-default graphical.target
wait;
rm /etc/dnf/protected.d/sudo.conf
wait;
dnf remove sudo
wait;
dnf autoremove
wait;
echo "go compile gomp @ https://github.com/aditya-K2/gomp"
echo "also download the necessary pip packages"
echo "and also rpm packages"
