# Primera etapa: Clonación del repositorio
FROM ubuntu:22.04 AS builder

# Instalación de dependencias para clonar y construir
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Directorio de trabajo
WORKDIR /app

# Clonar el repositorio
RUN git clone https://github.com/blancazure/tesseract-ocr-python.git .

# Segunda etapa: Construcción de la imagen final
FROM ubuntu:22.04

LABEL maintainer="Javier Rodríguez Blanco <jblanco@blancazure.com>"
LABEL company="blancazure"

# Instalación de dependencias necesarias
RUN apt-get update && \
    apt-get install -y python3 python3-pip tesseract-ocr poppler-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Crear un usuario y grupo no root
RUN useradd -m ocruser

# Cambiar al usuario ocruser
USER ocruser

# Directorio de trabajo
WORKDIR /app

# Copiar el código fuente y los archivos necesarios de la primera etapa
COPY --from=builder /app/src /app

# Instalar las dependencias de Python desde el requirements.txt
RUN pip3 install --user --no-cache-dir -r requirements.txt

# Crear las carpetas de entrada y salida y establecer los permisos correctos
RUN mkdir entrada salida && \
    chmod -R 777 entrada salida

# Comando para ejecutar la aplicación
CMD ["python3", "app.py"]