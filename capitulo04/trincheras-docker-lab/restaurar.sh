#!/bin/bash

PS3="Selecciona una MV: "

while true; do
  clear
  select MV in ubuntu fedora debian centos Todas Salir
  do
    case $REPLY in
      1|2|3|4)
        echo "Restaurando mv-lab-docker-$MV..."
        ./restaurar-$MV.sh
        sleep 3
        break
        ;;

      5)
        echo "Restaurando todas las MV..."
        ./restaurar-todas.sh
        break 2
        ;;

      6)
        break 2
        ;;

      *)
        echo "Segmentation fault (core dumped)"
        sleep 1
        break;
        ;;
    esac
  done
done