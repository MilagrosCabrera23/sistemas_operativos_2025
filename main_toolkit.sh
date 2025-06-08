#!/bin/bash

source "$(dirname "$0")/procesos.sh"
source "$(dirname "$0")/archivos.sh"
source "$(dirname "$0")/disco.sh"
source "$(dirname "$0")/usuarios.sh"
source "$(dirname "$0")/memoria.sh"
source "$(dirname "$0")/seguridad.sh"

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
    "ARCHIVOS: Listar archivos en un directorio" \
    "DISCO: Mostrar espacio libre y utilizado" \
    "DISCO: Mostrar el tamaño ocupado por un directorio/archivo" \
    "DISCO: Comandos habituales (df, du, ls)" \
    "USUARIOS: Mostrar usuarios del sistema" \
    "USUARIOS: Mostrar grupos del sistema" \
    "MEMORIA: Diagnóstico rápido de Memoria" \
    "SEGURIDAD: Verificar logs del sistema" \
    "SEGURIDAD: Comandos habituales (last, lastb, ls -l, grep, journalctl)" \
    "Salir"; do
    case $REPLY in
      1) proceso_mostrar; break ;;
      2) proceso_informacion; break ;;
      3) proceso_finalizar; break ;;
      4) proceso_comandos_habituales; break ;;
      5) archivos_crear; break ;;
      6) archivos_crear_directorio; break ;;
      7) archivos_listar; break ;;
      8) disco_mostrar_espacio_libre; break ;;
      9) disco_mostrar_tamano_ruta; break ;;
      10) disco_comandos_habituales; break ;;
      11) usuarios_listar; break ;;
      12) usuarios_grupos_listar; break ;;
      13) diagnostico_memoria; break ;;
      14) seguridad_verificar_logs; break ;;
      15) seguridad_comandos_habituales; break ;;
      16) echo "Saliendo..."; exit 0 ;;
      *) echo "Opción inválida"; break ;;
    esac
  done
done
