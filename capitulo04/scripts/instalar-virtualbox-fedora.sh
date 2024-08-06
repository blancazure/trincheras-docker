#!/bin/bash

# Instalar wget, curl, gcc, make, perl, bzip2, dkms, kernel-devel y kernel-headers
sudo dnf install wget curl gcc make perl bzip2 dkms kernel-devel kernel-headers -y

# Verificar la instalación de kernel-devel
rpm -q kernel-devel 

# Mostrar la versión actual del kernel
uname -r

# Actualizar todos los paquetes
sudo dnf update -y

# Reiniciar el sistema inmediatamente
sudo reboot now

# Descargar el repositorio de VirtualBox para Fedora y guardarlo en /etc/yum.repos.d/
sudo wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo -P /etc/yum.repos.d/

# Importar la clave GPG de Oracle para VirtualBox
sudo rpm --import https://www.virtualbox.org/download/oracle_vbox_2016.asc

# Buscar paquetes relacionados con VirtualBox
dnf search virtualbox

# Instalar VirtualBox versión 7.0
sudo dnf install VirtualBox-7.0 -y

# Configurar VirtualBox
sudo /sbin/vboxconfig
