# Etapa de clonado para clonar el repositorio
FROM alpine/git AS clonado

# Clona el repositorio
WORKDIR /app
RUN git clone https://github.com/blancazure/contar-chistes-sh.git .

# Etapa final para crear la imagen ligera
FROM alpine:3.20

# Añadir labels 
LABEL maintainer="Javier Rodríguez Blanco <jblanco@blancazure.com>" 
LABEL company="blancazure"

# Establece el directorio de trabajo y copia el contenido necesario en una única capa
WORKDIR /app
RUN apk add --no-cache bash coreutils sed

# Copia el contenido de la carpeta src del repositorio clonado desde la etapa del clonado
COPY --from=clonado /app/src /app/

# Añadir permisos de ejecución al script
RUN chmod +x /app/contar-chistes.sh

# Establece el punto de entrada
ENTRYPOINT ["/app/contar-chistes.sh"]

# Valores predeterminados para los parámetros
CMD ["-t", "2", "-f", "./chuck-norris.txt"]