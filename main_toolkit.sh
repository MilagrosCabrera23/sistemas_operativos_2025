#!/bin/bash

source "$(dirname "$0")/procesos.sh"
source "$(dirname "$0")/archivos.sh"

if [[ $? -ne 0 ]]; then
  echo "Error al importar archivos auxiliares"
  exit 1
fi

while true; do
  echo ""
  echo "====== Toolkit de Terminal ======"
  select opt in \
    "PROCESOS: Mostrar procesos en ejecución" \
    "PROCESOS: Información de un proceso" \
    "PROCESOS: Finalizar un proceso" \
    "PROCESOS: Comandos habituales (ps, top, pgrep, kill)" \
    "ARCHIVOS: Crear un archivo" \
    "ARCHIVOS: Crear un directorio" \
    "Salir"; do
    case $REPLY in
      1) proceso_mostrar; break ;;
      2) proceso_informacion; break ;;
      3) proceso_finalizar; break ;;
      4) procesos_comandos_habituales; break ;;
      5) archivos_crear; break ;;
      6) archivos_crear_directorio; break ;;
      7) echo "Saliendo..."; exit 0 ;;
      *) echo "Opción inválida"; break ;;
    esac
  done
done
