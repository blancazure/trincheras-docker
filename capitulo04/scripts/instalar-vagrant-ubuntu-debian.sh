#!/bin/bash

# Actualizar la lista de paquetes disponibles
sudo apt-get update

# Actualizar los paquetes instalados
sudo apt-get upgrade -y

# Instalar el paquete curl
sudo apt-get install -y curl

# Añadir la clave GPG para el repositorio de HashiCorp
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

# Añadir el repositorio de HashiCorp a la lista de fuentes de apt
sudo apt add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# Actualizar nuevamente la lista de paquetes disponibles con el nuevo repositorio añadido
sudo apt-get update

# Instalar Vagrant
sudo apt-get install vagrant -y

# Verificar la versión instalada de Vagrant
vagrant --version
