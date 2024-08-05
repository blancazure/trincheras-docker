#!/bin/bash

# Obtener todos los IDs de los contenedores
container_ids=$(docker ps -a -q)

# Iterar sobre cada contenedor
for id in $container_ids; do
  # Obtener las etiquetas del contenedor
  labels=$(docker inspect --format '{{json .Config.Labels}}' $id)
  echo "Contenedor ID: $id"
  echo "Etiquetas: $labels"
  echo "----------------------"
done