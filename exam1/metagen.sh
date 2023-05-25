# Delimitar la variable que tiene el archivo en donde se van a guardar los resultdos

gata="gata.txt"

# Contar registros hasta el nivel de especies en el archivo de metagenoma

grep -c -w "species" data/metagen/infants_metagenome.txt

# Realizar la búsqueda de los fragmentos de interés y guardarlos en el archivo gata

grep -E "TATA|GAGA|GATA" data/metagen/mygenomemap.sam > "$gata"


# Mensaje de realizacion 

echo "Se realizo el conteo de registro de especies."

echo "Se ha realizado la busqueda de fragmentos y se guardo en $gata."
