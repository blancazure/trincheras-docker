#!/bin/bash

# Actualiza todos los paquetes instalados en el sistema
sudo yum update

# Instala Vagrant utilizando el gestor de paquetes dnf
sudo dnf install -y vagrant

# Verifica la instalación de Vagrant mostrando la versión instalada
vagrant --version