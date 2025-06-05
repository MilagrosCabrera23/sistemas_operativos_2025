#!/bin/bash

# disco_listar_archivos(){

# }

disco_comandos_habituales(){
echo "Seleccione un comando para ejecutar: df, du,ls"
read comando

case $comando in
    df)
         echo "Mostrando uso del disco:"
         df -h 
        ;;
    du)
        echo "Mostrando el uso del espacio por carpeta :"
        du -sh *
        ;;
    ls)
        echo "Listando archivos:"
        ls -lh
        ;;
    *)
        echo "Comando no reconocido,use alguno de estos: df, du o ls"
        ;;
esac
}

