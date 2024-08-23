# Usar una imagen oficial de Golang como imagen base para la construcción
FROM golang:1.20-alpine AS build

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar y descargar las dependencias antes de copiar todo el código
COPY go.mod go.sum ./
RUN go mod tidy

# Copiar el resto del código fuente
COPY . .

# Compilar la aplicación de Golang
RUN go build -o golang-api

# Usar una imagen mínima para correr la aplicación compilada
FROM blancazure/alpine:3.20.2

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /root/

# Copiar el binario compilado desde la fase de construcción
COPY --from=build /app/golang-api .

# Exponer el puerto en el que la API escuchará
EXPOSE 8080

# Comando para iniciar la API
CMD ["./golang-api"]
