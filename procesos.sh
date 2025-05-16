#!/bin/bash

# Función 1
mostrar_procesos() {
    echo -e "PID\tUSER\t%CPU\t%MEM\tCOMMAND"
ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | head -n 30
}

proceso_informacion() {
    echo "Ingrese el PID del proceso que desea inspeccionar:"
    read pid

    if [[ "$pid" =~ ^[0-9]+$ ]]; then        
        ps -p "$pid" -o pid,ppid,user,%cpu,%mem,cmd
    else
        echo "PID inválido. Debe ser un número."
    fi
}

proceso_finalizar() {
    echo "Ingrese el PID del proceso que desea finalizar:"
    read pid

    if [[ "$pid" =~ ^[0-9]+$ ]]; then
        echo "¿Está seguro que desea enviar SIGTERM al proceso $pid? (s/n):"
        read confirmacion
        if [[ "$confirmacion" == "s" || "$confirmacion" == "S" ]]; then
            kill -15 "$pid" && echo "Proceso $pid terminado con SIGTERM."
        else
            echo "Operación cancelada."
        fi
    else
        echo "PID inválido. Debe ser un número."
    fi
}

procesos_comandos_habituales(){
   echo "Seleccione una opción: (ps, top, pgrep, kill)"
    read com

    com=$(echo "$com" | tr '[:upper:]' '[:lower:]')

    if [[ "$com" == "ps" ]]; then
        echo "Mostrando procesos con ps:"
        ps aux

    elif [[ "$com" == "top" ]]; then
        echo "Mostrando procesos con top en modo batch:"
        top -b -n 1

    elif [[ "$com" == "pgrep" ]]; then
        echo "Ingrese el nombre del proceso a buscar:"
        read nombre
        pgrep -l "$nombre"

    elif [[ "$com" == "kill" ]]; then
        echo "Ingrese el PID del proceso a finalizar:"
        read pid

        if [[ $pid =~ ^[0-9]+$ ]]; then
            kill "$pid" && echo "Proceso $pid finalizado."
        else
            echo "PID inválido. Debe ser un número."
        fi

    else
        echo "Comando no reconocido. Por favor, ingrese: ps, top, pgrep o kill."
    fi
}

