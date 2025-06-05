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

disco_mostrar_espacio_libre (){
    echo " espacio libre y utilizado"
      df -h
}

disco_mostrar_tamano_ruta(){
    read -p "Ingrese por favor la ruta del archivo o directorio: " ruta

    if [-e "$ruta"];then
    du -sh "$ruta"
    
    else
    echo "la ruta indicada no existe"

    fi
}

