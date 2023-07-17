#!/bin/bash

# Directorio que contiene las imágenes a procesar
path_imagenes="$1"

# Verificar si se proporcionó el directorio de imágenes como parámetro
if [ -z "$path_imagenes" ] || [ ! -d "$path_imagenes" ]; then
  echo "Ruta de imágenes inválida."
  exit 1
fi

# Crear el directorio de salida si no existe
mkdir -p "imagenes_procesadas"

# Iterar sobre las imágenes en el directorio
for imagen in "$path_imagenes"/*.jpg; do
    if [ -f "$imagen" ]; then
        nombre_imagen=$(basename "$imagen")
        nombre_sin_extension="${nombre_imagen%.*}"

        # Verificar si el nombre de la imagen cumple con los criterios
        if [[ "$nombre_sin_extension" == [A-Z]* && "$nombre_sin_extension" == *[!A-Z]* ]]; then
            # Procesar la imagen con ImageMagick
            convert "$imagen" -gravity center -resize 512x512+0+0 -extent 512x512 "imagenes_procesadas/$nombre_sin_extension.jpg"
            echo "Imagen procesada: $nombre_imagen"
        else
            echo "Imagen sin procesar: $nombre_imagen (nombre inválido)"
        fi
    fi
done

