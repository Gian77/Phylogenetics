# Phylogeny with RAXml

# Load conda envs in the HPCC at Michigan State

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

# I considered two alignment options for large trees: mafft and muscle

## 📂 Repository Structure

```
├── mafft
│   ├── 01_mafft.sb
│   ├── 02_trimal.sb
│   ├── 03_modelTestNG.sb
│   ├── 04_raxmlNG.sb
│   ├── 05_bootstrap.sb
│   ├── 06_support.sb
│   ├── 07_iqtree2.sb
│   └── compare_alignments.sh
├── muscle
│   ├── 01_muscle.sb
│   ├── 02_trimal_muscle.sb
│   ├── 03_modelTestNG_muscle.sb
│   ├── 04_raxmlNG_muscle.sb
│   ├── 05_bootstrap_muscle.sb
│   ├── 06_support_muscle.sb
│   ├── 07_iqtree2_muscle.sb
│   └── compare_alignments_muscle.sh
├── README.md
├── results
│   ├── otus99_aln_mafft.fasta
│   ├── otus99_aln_muscle.fasta
│   ├── otus99_mafft_trim_bs.raxml.bootstraps
│   ├── otus99_mafft_trim_bs.raxml.log
│   ├── otus99_mafft_trim_bs.raxml.rba
│   ├── otus99_mafft_trim_bs.raxml.reduced.phy
│   ├── otus99_mafft_trim.fasta
│   ├── otus99_mafft_trim_gappy.fasta
│   ├── otus99_mafft_trim_iq2.bionj
│   ├── otus99_mafft_trim_iq2.ckp.gz
│   ├── otus99_mafft_trim_iq2.contree
│   ├── otus99_mafft_trim_iq2.iqtree
│   ├── otus99_mafft_trim_iq2.log
│   ├── otus99_mafft_trim_iq2.mldist
│   ├── otus99_mafft_trim_iq2.model.gz
│   ├── otus99_mafft_trim_iq2.splits.nex
│   ├── otus99_mafft_trim_iq2.treefile
│   ├── otus99_mafft_trim_iq2.ufboot
│   ├── otus99_mafft_trim_ml.raxml.bestModel
│   ├── otus99_mafft_trim_ml.raxml.bestTree
│   ├── otus99_mafft_trim_ml.raxml.bestTreeCollapsed
│   ├── otus99_mafft_trim_ml.raxml.log
│   ├── otus99_mafft_trim_ml.raxml.mlTrees
│   ├── otus99_mafft_trim_ml.raxml.rba
│   ├── otus99_mafft_trim_ml.raxml.reduced.phy
│   ├── otus99_mafft_trim_ml.raxml.startTree
│   ├── otus99_mafft_trim_mt.ckp
│   ├── otus99_mafft_trim_mt.log
│   ├── otus99_mafft_trim_mt.out
│   ├── otus99_mafft_trim_mt.out.ckp
│   ├── otus99_mafft_trim_mt.out.log
│   ├── otus99_mafft_trim_mt.out.out
│   ├── otus99_mafft_trim_mt.out.tree
│   ├── otus99_mafft_trim_mt.tree
│   ├── otus99_mafft_trim.raxml.bestModel
│   ├── otus99_mafft_trim.raxml.bestTree
│   ├── otus99_mafft_trim.raxml.bestTreeCollapsed
│   ├── otus99_mafft_trim.raxml.log
│   ├── otus99_mafft_trim.raxml.mlTrees
│   ├── otus99_mafft_trim.raxml.rba
│   ├── otus99_mafft_trim.raxml.reduced.phy
│   ├── otus99_mafft_trim.raxml.startTree
│   ├── otus99_mafft_trim_spprt.raxml.log
│   ├── otus99_mafft_trim_spprt.raxml.support
│   ├── otus99_muscle_trim_bs.raxml.bootstraps
│   ├── otus99_muscle_trim_bs.raxml.log
│   ├── otus99_muscle_trim_bs.raxml.rba
│   ├── otus99_muscle_trim_bs.raxml.reduced.phy
│   ├── otus99_muscle_trim.fasta
│   ├── otus99_muscle_trim_gappy.fasta
│   ├── otus99_muscle_trim_mt.ckp
│   ├── otus99_muscle_trim_mt.log
│   ├── otus99_muscle_trim_mt.out
│   ├── otus99_muscle_trim_mt.tree
│   ├── otus99_muscle_trim.raxml.bestModel
│   ├── otus99_muscle_trim.raxml.bestTree
│   ├── otus99_muscle_trim.raxml.bestTreeCollapsed
│   ├── otus99_muscle_trim.raxml.log
│   ├── otus99_muscle_trim.raxml.mlTrees
│   ├── otus99_muscle_trim.raxml.rba
│   ├── otus99_muscle_trim.raxml.reduced.phy
│   └── otus99_muscle_trim.raxml.startTree
├── sequence_data
│   ├── otus_99.fasta
│   └── otus_99_filtered.fasta
├── slurm-3001478.out
└── slurm-3001487.out
```

⚠️  [WARNINGS]
Use mafft for faster alignments
Use MUSCLE5 super5 algorithm for large datasets
Use automatic trimming (recommended): ff this is ITS and you expect messy regions, consider also trying a stricter trim and comparing restuls

## 🚀 Clone and Use

`git clone git@github.com:Gian77/Phylogenetics.git`
