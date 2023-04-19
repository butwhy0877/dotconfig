# dotfiles for i3 
necessary dot files plus install script (install.sh)

don't want the hassle. really.

also to learn how to use git on the command line

## todo
- [x] make an install script
> - [ ] improve the install script
> - [ ] qol improvements
- [ ] .gitignore cleanup

## installation guide (rudimentary)
THIS GUIDE IS INTENDED FOR FEDORA DISTRIBUTION (SPECIFICALLY FEDORA 38)

prerequisite:
you MUST be a root user

1. move necessary files to their intended location
> backgrounds pictures to /usr/share/backgrounds (necessary if slick-greeter.conf is moved to its intended location)

> keyd-default.conf to /etc/keyd/default.conf 

> slick-greeter.conf to /etc/lightdm

> 20-amdgpu.conf to /etc/X11/xorg.conf.d

> doas.conf to /etc/doas.conf

> the rest of the files goes to the home directory 

2. make prep.sh and install.sh executable
``` bash
chmod +x prep.sh
chmod +x install.sh
```
note: make sure to cd into the folder first

3. run prep.sh  

this will enable dnf parallel downlaods, and install zsh for setting up user

4. make your user

5. run install.sh

this will enable rpm fusion, add and install brave browser,
add copr repository for keyd and i3status-rust, install and setup go and lf (file manager)
and install packages listed in the install.sh
it will also remove sudo (replaced with opendoas)

this script will also make systemd target graphical target (comment this out if you want to use xinit or startx)

6. -tbd- log in as your user and run user.sh

7. reboot to lightdm and proceed
