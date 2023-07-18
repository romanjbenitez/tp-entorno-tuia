
Este archivo contiene instrucciones y descripciones sobre cómo utilizar y trabajar con este proyecto.

## Levantar el proyecto

Para levantar el proyecto, sigue los siguientes pasos:

1. Clona el proyecto en tu máquina local.

2. Ejecuta el siguiente comando para construir la imagen de Docker:

   ```bash
   docker build -t app .
   ```

3. Luego, ejecuta el siguiente comando para ejecutar el contenedor Docker:

   - PowerShell o Linux:

     ```bash
     docker run -it -v ${PWD}:/output app
     ```

   - Windows CMD:

     ```bash
     docker run -it -v %cd%:/output app
     ```

## Scripts disponibles

### generar.sh

El script `generar.sh` genera imágenes basadas en un número pasado como argumento. Las imágenes generadas se guardan en un archivo llamado `img_generadas.tar`, y también se genera y guarda la suma de verificación en el archivo `suma_verificacion.txt`.

Uso del script:

```bash
./generar.sh <número>
```

### descomprimir.sh

El script `descomprimir.sh` recibe dos parámetros: la ruta de un archivo de imágenes a descomprimir y su suma de verificación. El script valida los datos y luego extrae las imágenes descomprimidas en un directorio llamado `imagenes_extraidas`.

Uso del script:

```bash
./descomprimir.sh <ruta_archivo_imágenes> <suma_verificación>
```

### procesar.sh

El script `procesar.sh` recibe como parámetro un directorio de imágenes y las comprime.

Uso del script:

```bash
./procesar.sh <directorio_imágenes>
```

### comprimir.sh

El script `comprimir.sh` realiza las siguientes acciones:

1. Genera un archivo con la lista de nombres de todas las imágenes.
2. Genera un archivo con la lista de nombres válidos.
3. Genera un archivo con el total de personas cuyo nombre finaliza con la letra "a".
4. Genera un archivo comprimido que incluye los archivos generados anteriormente y todas las imágenes. El archivo comprimido se puede encontrar en la raíz del proyecto fuera del contenedor.

Uso del script:

```bash
./comprimir.sh
```
