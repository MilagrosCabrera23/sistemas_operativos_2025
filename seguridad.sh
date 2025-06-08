seguridad_verificar_logs(){
    while true; do
     echo "Seleccione una opción:"
    echo "1) Ver últimas 15 líneas de /var/log/auth.log"
    echo "2) Buscar errores de autenticación con 'Failed' en /var/log/auth.log"
    echo "3) Ver errores recientes del sistema (journalctl)"
    echo "4) Ver logs de SSH en las últimas dos horas (journalctl)"
    echo "5) Salir"

    read opcion 

    case $opcion in
    1) echo "Mostrando las últimas 15 líneas de /var/log/auth.log:"
        sudo tail -n 15 /var/log/auth.log
    ;;
    2)   echo "Buscando errores en /var/log/auth.log:"
         grep "Failed" /var/log/auth.log
            ;;
    3)    echo "Mostrando errores recientes del sistema:"
          journalctl -p err -n 20
            ;;
    4)  echo "Mostrando logs SSH en las últimas 2 horas:"
        journalctl -u ssh --since "2 hour ago"
            ;;
    5)  echo "Saliendo del programa."
       break
    ;;
    *) echo "Opcion no valida."
    ;;
    esac
done
}

seguridad_comandos_habituales(){
    echo "Seleccione una opción: (last, lastb, ls -l, grep, journalctl)"
    read com

    com=$(echo "$com" | tr '[:upper:]' '[:lower:]')
    if [[ "$com" == "last" ]]; then
        echo "Mostrando las sesiones exitosas:"
        last

    elif [[ "$com" == "lastb" ]]; then
        echo "Mostrando los intentos fallidos de login:"
      lastb

    elif [[ "$com" == "ls -l" || "$com" == "ls" ]]; then
        read -p "Ingrese el directorio a listar (por defecto actual): " dir
        dir=${dir:-.}
        echo "Listando archivos en $dir:"
        ls -l "$dir"

     elif [[ "$com" == "grep" ]]; then
        read -p "Ingrese la palabra a buscar: " palabra
        read -p "Ingrese el archivo donde buscar: " archivo
        if [[ -f "$archivo" ]]; then
            echo "Buscando '$palabra' en $archivo:"
            grep "$palabra" "$archivo"
        else
            echo "El archivo '$archivo' no existe."
        fi

      elif [[ "$com" == "journalctl" ]]; then
        echo "Mostrando los últimos logs del sistema:"
        journalctl -xe | less

    else
        echo "Comando no reconocido. Por favor, ingrese: last, lastb, ls -l, grep, journalctl."
    fi
}