# Utiliza una imagen base mínima
FROM alpine:latest

# Añadir labels
LABEL maintainer="Javier Rodríguez Blanco <jblanco@blancazure.com>"
LABEL company="blancazure"

# Instalar utilidades necesarias para trabajar con redes
RUN apk update && apk add --no-cache \
    iputils \
    net-tools \
    busybox-extras \
    iproute2 \
    curl \
    wget \
    bind-tools

# Establecer el directorio de trabajo
WORKDIR /root

# Comando por defecto
CMD ["/bin/sh"]
