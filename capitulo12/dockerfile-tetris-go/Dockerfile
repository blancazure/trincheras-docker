# ------------------------ Etapa 1: Clonar el repositorio ------------------------
FROM alpine/git AS cloner
RUN apk add --no-cache git
WORKDIR /app
RUN git clone https://github.com/blancazure/tetris-go.git .

# ------------------------ Etapa 2: Compilar la aplicación ------------------------
FROM golang:1.20-alpine AS builder
WORKDIR /app
COPY --from=cloner /app/src .
RUN go build -o servidor-tetris .

# ------------------------ Etapa 3: Crear una imagen ligera ------------------------
FROM alpine:3.18

# Etiquetas
LABEL maintainer="Javier Rodríguez Blanco <jblanco@blancazure.com>"
LABEL company="blancazure"

# Crear un usuario y grupo no privilegiado
RUN addgroup -S tetrisgroup && adduser -S usuario_tetris -G tetrisgroup

WORKDIR /home/usuario_tetris
COPY --from=builder /app/servidor-tetris .
COPY --from=cloner /app/src/static ./static/
COPY --from=cloner /app/src/templates ./templates/

# Asignar permisos al usuario
RUN chown -R usuario_tetris:tetrisgroup /home/usuario_tetris

# Configurar la variable de entorno para el puerto
ARG PUERTO_TETRIS=8080
ENV PORT=$PUERTO_TETRIS

# Exponer el puerto
EXPOSE $PORT

# Usar el usuario no privilegiado
USER usuario_tetris

# Añadir HEALTHCHECK
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD wget --spider http://localhost:$PORT || exit 1

# Control de la señal STOPSIGNAL
STOPSIGNAL SIGINT

# Ejecutar la aplicación
CMD ["./servidor-tetris"]
