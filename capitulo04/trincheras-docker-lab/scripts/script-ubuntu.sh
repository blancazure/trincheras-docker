#!/bin/bash

# Actualiza la lista de paquetes disponibles y sus versiones
apt-get update

# Instala las versiones más recientes de todos los paquetes actualmente instalados en el sistema
apt-get upgrade -y
      
# Instala la herramienta 'tree' para mostrar la estructura de directorios y archivos en forma de árbol
apt-get install tree -y 

# Instala el editor de texto 'nano', simple y fácil de usar en la terminal
apt-get install nano -y 

# Instala 'curl', una herramienta para transferir datos desde o hacia un servidor
apt-get install curl -y

# Permite que APT use el protocolo HTTPS para descargar paquetes y sus dependencias
apt-get install apt-transport-https -y

# Proporciona certificados de autoridades de certificación para permitir conexiones seguras HTTPS
apt-get install ca-certificates -y

# Instala 'gnupg', una herramienta para cifrar y firmar datos y comunicaciones, también utilizada para verificar la autenticidad de los paquetes
apt-get install gnupg -y

# Proporciona información sobre la distribución de Linux instalada
apt-get install lsb-release -y

# Instala 'net-tools', un conjunto de herramientas de red como ifconfig y netstat
apt-get install net-tools -y
