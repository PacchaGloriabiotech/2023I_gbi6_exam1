# Delimitar una variable para poder guardar mi archivo

denint="denint.csv"

# Imprimo el encabezado con archivo, filas, columnas  y guardo en la variable denint 
#que tiene el archivo donde se va a guardar los resultados

echo "Archivo , Filas , Columnas" > "$denint"

# Bucle for para recorrer los archivos .csv
# Realiza una busqueda en cada archivo csv que se encuentra en denvint y cuenta el numero
# de filas y columnas y guardo en mi archivo denint.

for i in ./data/denvint/*.csv; do
    # Conteo del numero de filas utilizando wc -l.
    filas=$(wc -l < "$i")
    # Conteo del numero de columnas separando los espacios de , por \n y utilizando wc -l
    columnas=$(head -n 1 "$i" | tr ',' '\n' | wc -l)
    # Guardar los resultados en el archivo de salida denint.csv
    echo "$(basename "$i"),$filas ,$columnas" >> "$denint"
done

#  Imprimir que se ha guardado correctamente el conteo.
echo "Los resultados del conteo se han guardado en $denint."
