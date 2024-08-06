#!/bin/bash

# Instalar el grupo de paquetes "virtualization hypervisor"
sudo dnf group install -y "virtualization hypervisor"

# Instalar el grupo de paquetes "virtualization tools"
sudo dnf group install -y "virtualization tools"

# Habilitar e iniciar el servicio de libvirtd
sudo systemctl enable --now libvirtd

# Añadir el repositorio de HashiCorp para la instalación de Vagrant
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

# Instalar Vagrant desde el repositorio añadido
sudo dnf install -y vagrant

# Habilitar el repositorio crb (CodeReady Builder)
sudo dnf config-manager --set-enabled crb

# Instalar las librerías de desarrollo de libvirt
sudo dnf install -y libvirt-devel

# Instalar el plugin de Vagrant para libvirt
vagrant plugin install vagrant-libvirt

# Verificar la versión instalada de Vagrant
vagrant --version
