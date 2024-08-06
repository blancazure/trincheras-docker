#!/bin/bash

# Instalar el repositorio EPEL para obtener paquetes adicionales
sudo dnf install epel-release -y

# Instalar herramientas necesarias como wget, curl, gcc, make, perl, bzip2, dkms, kernel-devel y kernel-headers
sudo dnf install wget curl gcc make perl bzip2 dkms kernel-devel kernel-headers -y

# Verificar la instalación del paquete kernel-devel
rpm -q kernel-devel

# Mostrar la versión actual del kernel
uname -r

# Actualizar todos los paquetes del sistema
sudo dnf update -y

# Reiniciar el sistema para aplicar actualizaciones
sudo reboot now

# Agregar el repositorio de VirtualBox
sudo dnf config-manager --add-repo=https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo

# Buscar paquetes disponibles de VirtualBox
dnf search virtualbox

# Instalar VirtualBox versión 7.0
sudo dnf install VirtualBox-7.0 -y

# Configurar VirtualBox con los módulos del kernel necesarios
sudo /sbin/vboxconfig
