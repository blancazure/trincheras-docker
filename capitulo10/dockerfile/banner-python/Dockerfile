# Usar una imagen mínima de Python
FROM python:3.9-slim

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el código de la aplicación al directorio de trabajo
COPY ascii_server.py /app/

# Instalar los paquetes de Python necesarios
RUN pip install Flask pyfiglet

# Exponer el puerto (opcional, solo para documentación)
EXPOSE 5000

# Añadir labels
LABEL maintainer="Javier Rodríguez Blanco <jblanco@blancazure.com>"
LABEL company="blancazure"

# Establecer el punto de entrada (ENTRYPOINT) para que acepte el parámetro del puerto
ENTRYPOINT ["python", "ascii_server.py", "-p"]

# Comando por defecto (CMD) que usará el puerto 5000 si no se especifica otro
CMD ["5000"]
