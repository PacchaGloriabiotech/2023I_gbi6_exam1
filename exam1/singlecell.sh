
#  Primero se realiza una busqueda de los documentos en cada una de las carpetas.
#Primero se recorre todas las carpetas.
for carpeta in data/singlecell/*; do
    # Bucle for para recorrer los archivos dentro de cada subcarpeta
    for archivo in "$carpeta"/*; do
        # Obtener la extensión del archivo
        extension="${archivo##*.}"
        # Imprimir el resultado de extension y guardar el resultado en el archivo extensiones.txt
        echo "$extension" >> extensiones_ar.txt
    done
done

# Ordenar y contar las extensiones
sort extensiones_ar.txt | uniq -c > extensiones.txt

# Imprimir el resultado
echo "Conteo de extensiones de archivos:"
cat extensiones.txt

# Eliminar el archivo temporal
rm extensiones_ar.txt
