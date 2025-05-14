#!/bin/bash

# Función 1
funcion1() {
    # EVE
    echo "Función 1 procesos en ejecución: Por implementar"
}


funcion2() {
    echo "Función 2: Ingrese el PID del proceso que desea inspeccionar:"
    read pid

    # Validar que sea un número
    if [[ "$pid" =~ ^[0-9]+$ ]]; then
        # Obtener información del proceso
        ps -p "$pid" -o pid,ppid,user,%cpu,%mem,cmd
    else
        echo "PID inválido. Debe ser un número."
    fi
}


# Función 3
funcion3() {
    echo "Función 3: Enviar una señal a un proceso"
    echo "Ingrese el PID del proceso:"
    read pid

    # Validar que el PID sea numérico
    if [[ "$pid" =~ ^[0-9]+$ ]]; then
        # Mostrar confirmación antes de matar
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


function ejecutar_comandos(){
   echo "Seleccione una opción: (ps, top, pgrep, kill)"
    read comando

    comando=$(echo "$comando" | tr '[:upper:]' '[:lower:]')

    if [[ "$comando" == "ps" ]]; then
        echo "Mostrando procesos con ps:"
        ps aux

    elif [[ "$comando" == "top" ]]; then
        echo "Mostrando procesos con top en modo batch:"
        top -b -n 1

    elif [[ "$comando" == "pgrep" ]]; then
        echo "Ingrese el nombre del proceso a buscar:"
        read nombre
        pgrep -l "$nombre"

    elif [[ "$comando" == "kill" ]]; then
        echo "Ingrese el PID del proceso a finalizar:"
        read pid

        # Validar que el PID sea un número
        if [[ $pid =~ ^[0-9]+$ ]]; then
            kill "$pid" && echo "Proceso $pid finalizado."
        else
            echo "PID inválido. Debe ser un número."
        fi

    else
        echo "Comando no reconocido. Por favor, ingrese: ps, top, pgrep o kill."
    fi
}

# Función 5: Crear un archivo y elegir su extensión
function crear_archivo() {

    echo "Ingrese el nombre del archivo sin su extensión:"
    read nombre_archivo

    if [[ -z "$nombre_archivo" || ${#nombre_archivo} -lt 3 ]]; then 
        echo "El nombre del archivo no puede estar vacío ni tener menos de 3 letras."
        return
    else 
        echo "Nombre del archivo guardado correctamente: $nombre_archivo"
    fi

    echo "Ingrese la extensión del archivo (Por ej: sh, txt, py, etc):"
    read extension_archivo 

    if [[ -z "$extension_archivo" || ${#extension_archivo} -lt 2 ]]; then 
        echo "La extensión no puede estar vacía y debe tener al menos 2 caracteres."
        return
    else 
        echo "La extensión del archivo se guardó correctamente: $extension_archivo"
    fi

    archivo = "${nombre_archivo}.${extension_archivo}"

       if [[ -e "$archivo" ]]; then
        echo "El archivo '$archivo' ya existe. No se creó uno nuevo."
    else
        touch "$archivo"
        echo "Archivo '$archivo' creado exitosamente."
    fi
}

