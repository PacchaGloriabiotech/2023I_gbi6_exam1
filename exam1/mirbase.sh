# Delimitar la variable para guardar el archivo en donde se van a guardar los resultados

elegans="elegans.txt"

# Contar la cantidad de artículos con la palabra "PUBMED"

Pubmet=$(grep -c "PUBMED" data/miRNA.dat)

# Contar la cantidad de estudios de micro RNA en la revista Nature relacionados con C. elegans.

Nature=$(grep -c "Nature.*elegans" data/miRNA.dat)

# Contar la cantidad de micro RNA estudiados con una longitud de 139 pares de bases
BP=$(grep -c "139 BP" data/miRNA.dat)

# Guardar los resultados en el archivo elegans.txt

echo "Artículos con la palabra PUBMED: $Pubmet" > "$elegans"
echo "Estudios de micro RNA en la revista Nature relacionados con C. elegans: $Nature" >> "$elegans"
echo "Micro RNA estudiados con una longitud de 139 pares de bases: $BP" >> "$elegans"

# Imprimir mensaje que indicar que se han guardado los resultados.

echo "Los resultados se han guardado en $elegans."
