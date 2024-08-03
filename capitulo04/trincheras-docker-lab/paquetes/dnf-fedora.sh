#!/bin/bash

# Actualiza la lista de paquetes disponibles y sus versiones
dnf update -y
      
# Muestra la estructura de directorios y archivos en forma de árbol.
dnf install tree -y

# Un editor de texto simple y fácil de usar en la terminal.
dnf install nano -y

# Una herramienta para transferir datos desde o hacia un servidor.
dnf install curl -y

# Permite que APT use el protocolo HTTPS para descargar paquetes y sus dependencias.
dnf install apt-transport-https -y

# Proporciona certificados de autoridades de certificación para permitir conexiones seguras HTTPS.
dnf install ca-certificates -y

#  Herramienta para cifrar y firmar datos y comunicaciones, también utilizada para verificar la autenticidad de los paquetes.
dnf install gnupg -y

# Proporciona información sobre la distribución de Linux instalada.
dnf install lsb-release -y

# Proporciona una visualización interactiva en tiempo real del uso del sistema, incluyendo la utilización de CPU, memoria y procesos activos.
dnf install htop -y

# Conjunto de herramientas de red como ifconfig y netstat.
dnf install net-tools -y

# Sistema de control de versiones distribuido
dnf install git -y