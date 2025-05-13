#!/bin/bash

source "$(dirname "$0")/procesos.sh"

if [[ $? -ne 0 ]]; then
  echo "Error al importar procesos.sh"
  exit 1
fi

while true; do
  echo ""
  echo "====== Toolkit de Terminal ======"
  select opt in \
    "Función 1: funcion1" \
    "Función 2: funcion2" \
    "Función 3: funcion3" \
    "Salir"; do
    case $REPLY in
      1) funcion1; break ;;
      2) funcion2; break ;;
      3) funcion3; break ;;
      4) echo "Saliendo..."; exit 0 ;;
      *) echo "Opción inválida"; break ;;
    esac
  done
done
