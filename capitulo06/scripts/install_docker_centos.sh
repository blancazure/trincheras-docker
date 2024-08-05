#!/bin/bash

# Actualizar la lista de paquetes
sudo yum update -y

# Instalar paquetes necesarios
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

# Añadir el repositorio de Docker
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# Instalar Docker
sudo yum install -y docker-ce

# Iniciar Docker
sudo systemctl start docker

# Habilitar Docker para que inicie al arrancar el sistema
sudo systemctl enable docker

# Verificar la instalación
sudo systemctl status docker

# Añadir el usuario actual al grupo docker
sudo usermod -aG docker $USER

# Mensaje final
echo "Docker se ha instalado correctamente en CentOS."
echo "Cierra y vuelve a abrir tu sesión para aplicar los cambios de grupo."
