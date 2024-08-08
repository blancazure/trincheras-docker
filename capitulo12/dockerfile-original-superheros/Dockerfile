# Usar la imagen base de Caddy, el héroe desconocido
FROM caddy:2-alpine

# Etiqueta de mantenedor, nuestro Nick Fury
LABEL maintainer="Javier Rodríguez Blanco <jblanco@blancazure.com>"

# Establecer el directorio de trabajo, la Batcueva
WORKDIR /srv

# Copiar los archivos de la aplicación, nuestro equipo de superhéroes
COPY src/ /srv

# Exponer el puerto utilizado por Caddy, nuestra señal de llamada
EXPOSE 80

# Comando para ejecutar el servidor Caddy, listos para la acción
CMD ["caddy", "file-server", "--root", "/srv"]