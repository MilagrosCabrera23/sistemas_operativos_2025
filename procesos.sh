#!/bin/bash

# Función 1
funcion1() {
    # EVE
    echo "Función 1 procesos en ejecución: Por implementar"
}

# Función 2
funcion2() {
    # FRAN
    echo "Función 2 ingresar un PID y muestre info del proceso: Por implementar"
}


# Función 3
funcion3() {
   
    echo "Función 3 enviar una señal por su PID: Por implementar"
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

