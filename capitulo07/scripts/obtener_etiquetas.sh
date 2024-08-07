#!/bin/bash

# Obtener todos los IDs de los contenedores. El comando 'docker ps -a -q' 
# lista todos los contenedores (activos e inactivos) y muestra solo sus IDs.
container_ids=$(docker ps -a -q)

# Iterar sobre cada contenedor utilizando los IDs obtenidos.
for id in $container_ids; do
  # Obtener las etiquetas del contenedor. 'docker inspect' devuelve 
  # información detallada del contenedor. 
  # '--format' permite formatear la salida utilizando una plantilla Go. 
  # '{{json .Config.Labels}}' extrae las etiquetas en formato JSON.
  labels=$(docker inspect --format '{{json .Config.Labels}}' $id)
  
  # Imprimir el ID del contenedor.
  echo "Contenedor ID: $id"
  # Imprimir las etiquetas asociadas al contenedor. Si no tiene etiquetas, se mostrará 'null'.
  echo "Etiquetas: $labels"
  # Imprimir una línea separadora para mayor claridad en la salida.
  echo "----------------------"
done
