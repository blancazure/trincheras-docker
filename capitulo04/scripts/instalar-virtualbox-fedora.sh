#!/bin/bash

sudo dnf install wget curl gcc make perl bzip2 dkms kernel-devel kernel-headers  -y
rpm -q kernel-devel 
uname -r
sudo dnf update -y
sudo reboot now
sudo wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo -P /etc/yum.repos.d/
sudo rpm --import https://www.virtualbox.org/download/oracle_vbox_2016.asc
dnf search virtualbox
sudo dnf install VirtualBox-7.0 -y
sudo /sbin/vboxconfig