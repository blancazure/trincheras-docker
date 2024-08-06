#!/bin/bash

# Actualiza la lista de paquetes disponibles y sus versiones
dnf update -y
      
# Instala la herramienta 'tree' para mostrar la estructura de directorios y archivos en forma de árbol
dnf install tree -y

# Instala el editor de texto 'nano', simple y fácil de usar en la terminal
dnf install nano -y

# Instala 'curl', una herramienta para transferir datos desde o hacia un servidor
dnf install curl -y

# Instala los certificados de autoridades de certificación para permitir conexiones seguras HTTPS
dnf install ca-certificates -y

# Instala 'gnupg', una herramienta para cifrar y firmar datos y comunicaciones, también utilizada para verificar la autenticidad de los paquetes
dnf install gnupg -y

# Instala el conjunto de herramientas de red 'net-tools', que incluye utilidades como ifconfig y netstat
dnf install net-tools -y

# Instala 'git', un sistema de control de versiones distribuido
dnf install git -y
