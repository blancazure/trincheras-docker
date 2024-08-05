#!/bin/bash

# Actualizar la lista de paquetes
sudo apt-get update

# Instalar paquetes necesarios
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Añadir la clave GPG oficial de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Añadir el repositorio de Docker
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

# Actualizar la lista de paquetes con el repositorio de Docker
sudo apt-get update

# Instalar Docker
sudo apt-get install -y docker-ce

# Verificar la instalación
sudo systemctl status docker

# Añadir el usuario actual al grupo docker
sudo usermod -aG docker $USER

# Mensaje final
echo "Docker se ha instalado correctamente en Ubuntu."
echo "Cierra y vuelve a abrir tu sesión para aplicar los cambios de grupo."
