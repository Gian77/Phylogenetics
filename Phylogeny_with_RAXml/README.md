# Load conda anev 

```
module purge
module load Miniforge3
conda activate raxmlNG
```

# Check tool versions

```
muscle -version
trimal --version
modeltest-ng --version
raxml-ng --version
```

# MUSCLE alignment (multicore)
```
muscle -align otus_99.fasta -output otus99.aln.fasta -threads 42

# Use MUSCLE5 super5 algorithm for large datasets
muscle -super5 otus_99.fasta -output otus99.aln.fasta -threads 42

```

# Trim alignment (recommended)

## Conservative automatic trimming:
```
trimal -in otus99.aln.fasta -out otus99.trim.fasta -automated1
```
# If this is ITS and you expect messy regions, consider also trying a stricter trim and comparing:
```
trimal -in otus99.aln.fasta -out otus99.trim_gappy.fasta -gappyout
```




