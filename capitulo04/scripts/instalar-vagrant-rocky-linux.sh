#!/bin/bash

sudo dnf group install -y "virtualization hypervisor"
sudo dnf group install -y "virtualization tools"
sudo systemctl enable --now libvirtd
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo dnf install -y vagrant
sudo dnf config-manager --set-enabled crb
sudo dnf install -y libvirt-devel
vagrant plugin install vagrant-libvirt
vagrant --version