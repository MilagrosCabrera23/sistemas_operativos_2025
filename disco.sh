#!/bin/bash

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
