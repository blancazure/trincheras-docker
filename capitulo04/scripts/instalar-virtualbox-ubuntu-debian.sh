#!/bin/bash

# Actualiza la lista de paquetes disponibles
sudo apt update

# Descarga la clave pública de Oracle VirtualBox y la convierte al formato adecuado
curl https://www.virtualbox.org/download/oracle_vbox_2016.asc | gpg --dearmor > oracle_vbox_2016.gpg

# Descarga otra clave pública de Oracle VirtualBox y la convierte al formato adecuado
curl https://www.virtualbox.org/download/oracle_vbox.asc | gpg --dearmor > oracle_vbox.gpg

# Instala la clave pública convertida en el directorio de claves de confianza de apt
sudo install -o root -g root -m 644 oracle_vbox_2016.gpg /etc/apt/trusted.gpg.d/

# Instala la otra clave pública convertida en el directorio de claves de confianza de apt
sudo install -o root -g root -m 644 oracle_vbox.gpg /etc/apt/trusted.gpg.d/

# Añade el repositorio de VirtualBox a la lista de fuentes de apt
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

# Actualiza de nuevo la lista de paquetes disponibles para incluir el repositorio añadido
sudo apt update

# Instala los encabezados del kernel y dkms necesarios para compilar módulos de kernel
sudo apt install -y linux-headers-$(uname -r) dkms

# Instala VirtualBox versión 7.0
sudo apt install virtualbox-7.0 -y
