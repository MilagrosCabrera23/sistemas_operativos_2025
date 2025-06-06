#!/bin/bash

diagnostico_memoria() {
    echo -e "\033[1;34m Diagnóstico rápido de Memoria y Sistema de Archivos \033[0m"

    local errores=0

    # Validaciones
    for cmd in free vmstat head ps df; do
        if ! command -v $cmd >/dev/null 2>&1; then
            echo -e "\033[31mError: el comando '$cmd' no está instalado o no está disponible.\033[0m"
            errores=1
        fi
    done

    if [[ $errores -eq 1 ]]; then
        return 1
    fi

    echo -e "\n\033[1;32m> Uso de memoria RAM y SWAP (free -h):\033[0m"
    free -h

    echo -e "\n\033[1;32m> Estadísticas del sistema (vmstat -s):\033[0m"
    vmstat -s | grep -E "total memory|used memory|free memory|buffer|cache"

    echo -e "\n\033[1;32m> Contenido de /proc/meminfo (primeras 10 líneas):\033[0m"
    head -n 10 /proc/meminfo

    echo -e "\n\033[1;32m> Procesos con mayor uso de memoria:\033[0m"
    ps -eo pid,user,%mem,command --sort=-%mem | head -n 6

    echo -e "\n\033[1;32m> Información del sistema de archivos (df -h):\033[0m"
    df -h
}
