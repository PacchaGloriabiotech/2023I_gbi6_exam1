#---------------Funcion 1
import csv
from Bio import Entrez
from Bio import SeqIO
from collections import Counter
def source(data): 
    seqs = open(data, "r")
    secuencias  = open("data/acces.gb", "w")
    for linea in seqs: 
        Entrez.email = "gloria.paccha@est.ikiam.edu.ec"
        handle=Entrez.efetch(db="nucleotide" ,id=linea ,rettype="gb", retmode="text")
        data=(handle.read())
        secuencias.write(data) 
    record_gb = list(SeqIO.parse("data/acces.gb", "genbank"))
    source = []
    for i in range(len(record_gb)):
        source.append(record_gb[i].annotations["source"])
        frecuencias = collections.Counter(source)
    frecuencias = collections.Counter(source)
    tabla = pd.DataFrame(frecuencias.items(), columns=["Especie", "Frecuencia"])
    tabla.to_csv("results/frecuencias.csv") 
    return tabla
##--------------------------Funcion para descargar la data de las accesiones

def descarga(id_acces):
    acces=[]
        ##Entrar a la web
    Entrez.email = "gloria.paccha@est.ikiam.edu.ec" 
    with Entrez.efetch( db="nucleotide", rettype="gb", retmode="text", id= id_acces
                  ) as handle: 
        for seq_record in SeqIO.parse(handle, "gb"): 
            acces.append(seq_record)
    print(acces)
    SeqIO.write(acces, "data/acces.gb", "genbank")
    
##---------------------Funcion 2 

import csv
import matplotlib.pyplot as plt
import seaborn as sns
from Bio import Entrez, SeqIO
from Bio.SeqUtils.ProtParam import ProteinAnalysis

def sequences(id_acces, output_csv='results/glupeptides.csv', output_png='results/glupeptides.png'):
    Entrez.email = 'tu_correo@ejemplo.com'  # Cambia esto por tu dirección de correo electrónico

    peptides = []

    for accession in id_acces:
        # Realizar búsqueda en Nucleotide con la accession
        handle = Entrez.efetch(db='nucleotide', id=accession, rettype='gb', retmode='text')
        record = SeqIO.read(handle, 'genbank')
        handle.close()

        # Obtener la secuencia de ADN
        dna_sequence = record.seq

        # Traducir la secuencia de ADN a una secuencia de aminoácidos
        protein_sequence = dna_sequence.translate()

        # Separar los péptidos que comienzan con metionina
        split_peptides = [str(peptide) for peptide in protein_sequence.split('M') if peptide]

        # Calcular el peso molecular e índice de inestabilidad de cada péptido
        for peptide in split_peptides:
            analysis = ProteinAnalysis(peptide)
            molecular_weight = analysis.molecular_weight()
            instability_index = analysis.instability_index()

            peptides.append({
                'Péptido': peptide,
                'Peso Molecular': molecular_weight,
                'Índice de Inestabilidad': instability_index
            })

    # Guardar los resultados en un archivo CSV
    with open(output_csv, 'w', newline='') as csvfile:
        fieldnames = ['Péptido', 'Peso Molecular', 'Índice de Inestabilidad']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(peptides)

    print(f'Resultados guardados en {output_csv}')

    # Generar el jointplot
    df = pd.DataFrame(peptides)
    sns.set(style='ticks')
    g = sns.jointplot(data=df, x='Peso Molecular', y='Índice de Inestabilidad', kind='scatter', s=50, color='b')
    g.set_axis_labels('Peso Molecular', 'Índice de Inestabilidad')
    g.fig.suptitle('Péptidos: Peso Molecular vs Índice de Inestabilidad', fontsize=14)
    plt.savefig(output_png)
    plt.show()
    print(f'Gráfico guardado en {output_png}')

