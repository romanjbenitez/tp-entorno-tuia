#!/bin/bash

# Directorio que contiene las imágenes a procesar
path_imagenes="$1"

# Expresión regular para validar los nombres de las personas
regex="^[A-Z][a-z]+"

# Verificar si se proporcionó el directorio de imágenes como parámetro
if [ -z "$path_imagenes" ] || [ ! -d "$path_imagenes" ]; then
  echo "Ruta de imágenes inválida."
  exit 1
fi

# Crear el directorio de salida si no existe
mkdir "imagenes_procesadas"

# Iterar sobre las imágenes en el directorio
for imagen in "imagenes_procesadas"/*.jpg; do
    nombre_imagen=$(basename "$imagen")
    nombre_sin_extension="${nombre_imagen%.*}"

    # Verificar si el nombre de la imagen coincide con la expresión regular
    if [[ $nombre_sin_extension =~ $regex ]]; then
        # Procesar la imagen con ImageMagick
	convert "$imagen" -gravity center -resize 512x512+0+0 -extent 512x512 "imagenes_procesadas/$nombre_sin_extension.jpg"
        echo "Imagen procesada: $nombre_imagen"
    else
        echo "Imagen sin procesar: $nombre_imagen (nombre invalido)"
    fi
done

