diagnostico_memoria() {
    echo -e "\033[1;34m Diagnóstico rápido de Memoria \033[0m"

    local errores=0

    # Validar que el comando 'free' esté disponible
    if ! command -v free >/dev/null 2>&1; then
        echo -e "\033[31mError: el comando 'free' no está instalado o no está disponible.
Por favor, instala el paquete adecuado para poder mostrar el uso de memoria.\033[0m"
        errores=1
    fi

    # Validar que el comando 'vmstat' esté disponible
    if ! command -v vmstat >/dev/null 2>&1; then
        echo -e "\033[31mError: el comando 'vmstat' no está instalado o no está disponible.
Por favor, instala el paquete adecuado para poder mostrar el estado del sistema.\033[0m"
        errores=1
    fi

    # Validar que el comando 'head' esté disponible
    if ! command -v head >/dev/null 2>&1; then
        echo -e "\033[31mError: el comando 'head' no está instalado o no está disponible.
Por favor, instala el paquete adecuado para poder leer '/proc/meminfo'.\033[0m"
        errores=1
    fi

    # Validar que el comando 'ps' esté disponible
    if ! command -v ps >/dev/null 2>&1; then
        echo -e "\033[31mError: el comando 'ps' no está instalado o no está disponible.\033[0m"
        errores=1
    fi

    # Si hubo algún error, salir con código 1
    if [[ $errores -eq 1 ]]; then
        return 1
    fi

    # Mostrar el uso de memoria RAM y SWAP con formato legible
    echo -e "\n\033[1;32m> Uso de memoria (free -h):\033[0m"
    free -h

    # Mostrar estadísticas resumidas del sistema relacionadas con memoria
    echo -e "\n\033[1;32m> Estado del sistema (vmstat -s):\033[0m"
    vmstat -s | grep -E "total memory|used memory|free memory|buffer|cache"

    # Mostrar las primeras líneas del archivo /proc/meminfo con detalles de memoria
    echo -e "\n\033[1;32m> Primeras líneas de /proc/meminfo:\033[0m"
    head -n 10 /proc/meminfo

    # Mostrar los procesos que más memoria consumen, ordenados de mayor a menor
    echo -e "\n\033[1;32m> Procesos con mayor uso de memoria:\033[0m"
    ps -eo pid,user,%mem,command --sort=-%mem | head -n 6
} "