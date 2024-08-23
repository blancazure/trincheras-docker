# Usar una imagen oficial de Node.js como imagen base
FROM blancazure/node:18-alpine

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copiar los archivos package.json y package-lock.json para instalar dependencias
COPY package*.json ./

# Instalar las dependencias de la aplicación
RUN npm install --production

# Copiar el resto de los archivos de la aplicación
COPY . .

# Establecer las variables de entorno necesarias
ENV NODE_ENV=production

# Exponer el puerto en el que la aplicación escuchará
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["npm", "start"]
