# Delimitar variables que tengan los archivos en donde se va a guardar los resultados

separacion="pdb.csv"
conteo="pdb_count.csv"

# Separar las columnas "resName1", "PDB Classification" y "Uniprot Acc" en el archivo de salida

cut -d ',' -f 5,18,21 data/mahomes/sites.csv > "$separacion"

# Calcular el conteo de tipos únicos de elementos en cada columna.

cut -d ',' -f 1 "$separacion" | sort | uniq -c > "$conteo"
cut -d ',' -f 2 "$separacion" | sort | uniq -c >> "$conteo"
cut -d ',' -f 3 "$separacion" | sort | uniq -c >> "$conteo"

# Imprimir mensaje de finalización
echo "La separación de columnas y el conteo de elementos únicos han sido completados."
echo "Los resultados se han guardado en $separacion y $conteo."
