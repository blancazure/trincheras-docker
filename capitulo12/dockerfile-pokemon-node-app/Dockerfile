# Stage 1: Build
# Usamos una imagen base de Node.js y aseguramos que tenga Git instalado para el entrenamiento
FROM node:18-alpine AS build

# Establecemos el directorio de trabajo dentro del contenedor
WORKDIR /app

# Instalamos Git y clonamos el repositorio de la aplicación
RUN apk add --no-cache git && \
    git clone https://github.com/blancazure/pokemon-node-app.git . && \
    cd src && \
    npm install

# Stage 2: Runtime
# Usamos una imagen base de Node.js más ligera para el combate
FROM node:18-slim AS runtime

# Añadir labels 
LABEL maintainer="Javier Rodríguez Blanco <jblanco@blancazure.com>" 
LABEL company="blancazure"

# Establecemos el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos los archivos necesarios del stage de construcción al stage de ejecución
COPY --from=build /app/src /app

# Exponemos el puerto que utilizará la aplicación
EXPOSE 3000

# Comando para ejecutar la aplicación
CMD ["node", "app.js"]
