#!/bin/bash
disco_comandos_habituales(){
    echo "Seleccione un comando para ejecutar: df, du, ls"
    read comando

    case $comando in
        df)
            echo "Mostrando uso del disco:"
            df -h 
            ;;
        du)
            echo "Mostrando el uso del espacio por carpeta:"
            du -sh *
            ;;
        ls)
            echo "Listando archivos:"
            ls -lh
            ;;
        *)
            echo "Comando no reconocido. Usa df, du o ls."
            ;;
    esac
}
# Muestre el espacio libre y utilizado en los sistemas de archivos montados.

mostrar_espacio_disco (){
    echo " espacio libre y utilizado"
      df-h
}

#Permita al usuario ingresar una ruta y muestre el tamaño ocupado por ese
#directorio/archivo (du -sh <ruta>).

mostrar_tamano_ruta(){
    read -p "Ingrese por favor la ruta del archivo o directorio:" ruta

    if [-e "$ruta"];then
    du -sh "$ruta"
    
    else
    echo "la ruta indicada no existe"

    fi
}
listar_archivos(){
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
