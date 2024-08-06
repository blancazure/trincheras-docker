#!/bin/bash

sudo dnf install epel-release -y
sudo dnf install wget curl gcc make perl bzip2 dkms kernel-devel kernel-headers  -y
rpm -q kernel-devel 
uname -r
sudo dnf update -y
sudo reboot now
sudo dnf config-manager --add-repo=https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo
dnf search virtualbox
sudo dnf install VirtualBox-7.0 -y
sudo /sbin/vboxconfig