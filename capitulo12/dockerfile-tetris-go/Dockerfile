# ------------------------ Etapa 1: Clonar el repositorio ------------------------
FROM alpine/git AS cloner
RUN apk add --no-cache git
WORKDIR /app
RUN git clone https://github.com/blancazure/tetris-go.git .

# ------------------------ Etapa 2: Compilar la aplicación ------------------------
FROM golang:1.22.6-alpine3.20 AS builder
WORKDIR /app
COPY --from=cloner /app/src .

# Inicializar el módulo Go si no existe
RUN [ ! -f go.mod ] && go mod init tetris-go || true
RUN go mod tidy

# Compilar la aplicación Go
RUN go build -o servidor-tetris .

# ------------------------ Etapa 3: Crear una imagen ligera ------------------------
FROM golang:1.22.6-alpine3.20

# Etiquetas
LABEL maintainer="Javier Rodríguez Blanco <jblanco@blancazure.com>"
LABEL company="blancazure"

WORKDIR /root
COPY --from=builder /app/servidor-tetris .
COPY --from=cloner /app/src/static ./static/
COPY --from=cloner /app/src/templates ./templates/

# Configurar la variable de entorno para el puerto
ARG PUERTO_TETRIS=8080
ENV PORT=$PUERTO_TETRIS

# Exponer el puerto
EXPOSE $PORT

# Añadir HEALTHCHECK
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD wget --spider http://localhost:$PORT || exit 1

# Control de la señal STOPSIGNAL
STOPSIGNAL SIGINT

# Ejecutar la aplicación
CMD ["./servidor-tetris"]
