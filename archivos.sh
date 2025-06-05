archivos_crear() {
    echo "Ingrese el nombre del archivo sin su extensión:"
    read nombre

    if [[ -z "$nombre" || ${#nombre} -lt 3 ]]; then 
        echo "El nombre del archivo no puede estar vacío ni tener menos de 3 letras."
        return
    else 
        echo "Nombre del archivo guardado correctamente: $nombre"
    fi

    echo "Ingrese la extensión del archivo (Por ej: sh, txt, py, etc):"
    read extension 

    if [[ -z "$extension" || ${#extension} -lt 2 ]]; then 
        echo "La extensión no puede estar vacía y debe tener al menos 2 caracteres."
        return
    else 
        echo "La extensión del archivo se guardó correctamente: $extension"
    fi

    archivo="${nombre}.${extension}"

    if [[ -e "$archivo" ]]; then
        echo "El archivo '$archivo' ya existe. No se creó uno nuevo."
    else
        touch "$archivo"
        echo "Archivo '$archivo' creado exitosamente."
    fi
}

archivos_crear_directorio() {
    while true; do
        echo "Ingrese el nombre del directorio:"
        read nombre

        # Eliminar espacios al principio y al final
        nombre="${nombre#"${nombre%%[![:space:]]*}"}" 
        nombre="${nombre%"${nombre##*[![:space:]]}"}" 

        # Validación: el nombre no puede estar vacío o ser menor de 3 caracteres
        if [[ -z "$nombre" || ${#nombre} -lt 3 ]]; then 
            echo -e "\033[33mEl nombre del directorio no puede estar vacío ni tener menos de 3 letras. Por favor, elija otro nombre.\033[0m"
            continue
        fi
       
        # Validación: el nombre solo puede contener letras, números, guiones y guiones bajos
        if [[ "$nombre" =~ [^a-zA-Z0-9_-] ]]; then
            echo -e "\033[33mEl nombre del directorio solo puede contener letras, números, guiones y guiones bajos. Por favor, elija otro nombre.\033[0m"
            continue  
        fi
        
        # Validación: si el directorio ya existe
        if [[ -e "$nombre" ]]; then
            echo -e "\033[31mEl directorio '$nombre' ya existe. No se creó uno nuevo.\033[0m"
            return 
        fi
        
        mkdir "$nombre"
        echo -e "\033[32mDirectorio '$nombre' creado exitosamente.\033[0m"
        break
    done
}

archivos_listar(){
    while true; do
        echo "Ingrese el directorio que desea listar:"
        read dir

        if [ -z "$dir" ]; then
        echo " Directorio no valido, por favor ingrese nuevamente el directorio"
        continue
        fi 

        if [ -d "$dir" ]; then
        echo " Listando archivos del directorio $dir:"
        ls -l "$dir"
        break

        else
        echo " El directorio $dir no existe"
        fi
    done
}
