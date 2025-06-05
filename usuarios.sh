#!/bin/bash

listar_usuarios() {
    echo -e "\n\033[1;34m Usuarios del sistema (UID < 1000) \033[0m"
    if command -v getent >/dev/null 2>&1; then
        getent passwd | awk -F: '$3 < 1000 {print $1}' | sort | column
    else
        echo -e "\033[33mAdvertencia: 'getent' no disponible. Se usará '/etc/passwd'.\033[0m"
        if [[ -r /etc/passwd ]]; then
            awk -F: '$3 < 1000 {print $1}' /etc/passwd | sort | column
        else
            echo -e "\033[31mError: No se puede leer '/etc/passwd'.\033[0m"
            return 1
        fi
    fi

    echo -e "\n\033[1;32m Usuarios normales (UID >= 1000) \033[0m"
    if command -v getent >/dev/null 2>&1; then
        getent passwd | awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' | sort | column
    else
        if [[ -r /etc/passwd ]]; then
            awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | sort | column
        else
            return 1
        fi
    fi
}

listar_grupos() {
    echo -e "\n\033[1;34m Grupos del sistema (GID < 1000) \033[0m"
    if command -v getent >/dev/null 2>&1; then
        getent group | awk -F: '$3 < 1000 {print $1}' | sort | column
    else
        echo -e "\033[33mAdvertencia: 'getent' no disponible. Se usará '/etc/group'.\033[0m"
        if [[ -r /etc/group ]]; then
            awk -F: '$3 < 1000 {print $1}' /etc/group | sort | column
        else
            echo -e "\033[31mError: No se puede leer '/etc/group'.\033[0m"
            return 1
        fi
    fi

    echo -e "\n\033[1;32m Grupos normales (GID >= 1000) \033[0m"
    if command -v getent >/dev/null 2>&1; then
        getent group | awk -F: '$3 >= 1000 {print $1}' | sort | column
    else
        if [[ -r /etc/group ]]; then
            awk -F: '$3 >= 1000 {print $1}' /etc/group | sort | column
        else
            return 1
        fi
    fi
}

# Ejecutar funciones
listar_usuarios
listar_grupos
