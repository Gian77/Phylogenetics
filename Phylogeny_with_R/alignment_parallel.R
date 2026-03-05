# options
cat("Setting up R options.\n\n")
options(scipen = 9999)

# libraries
cat("Loading R libraries.\n\n")
library(tidyverse)
library(msa)
library(phangorn)
library(ape)
library(DECIPHER)
library(future)
library(future.apply)

# path
cat("Load data PATH.\n\n")
data_path = "/mnt/home/benucci/Phylogeny_in_R/otu_alignment/"
results_path = "/mnt/home/benucci/Phylogeny_in_R/results/"

# import
cat("Import otu representative sequences file into R.\n\n")
otu_99 <- readDNAStringSet(file.path(data_path,"otus_99.fasta"), format="fasta", 
                           seek.first.rec=TRUE, use.names=TRUE)

# Set up parallel processing
cat("Set up parallel processing...\n\n")
plan("multicore", workers = 42)
cat("Parallel workers:", future::nbrOfWorkers(), "\n\n")

# align
cat("Align sequences in parallel...\n\n")
results <- future_lapply(list("simple", "custom", "desc"), function(type) {
  if (type == "simple") {
    msa(otu_99, method = "Muscle")
  } else if(type == "custom") {
    msa(otu_99, 
        method = "Muscle",
        gapOpening = -10,
        gapExtension = -0.5,
        maxiters = 2,
        cluster = "upgmamax",
        order = "input",
        verbose = TRUE)
  } else if (type == "decipher") {
    # DECIPHER alignment (directly on DNAStringSet)
    AlignSeqs(otu_99, processors = NULL)  # NULL = all available cores
  }
}, future.seed = TRUE)

aligned_otu_99_simple <- results[[1]]
aligned_otu_99_custom <- results[[2]]
aligned_otu_99_desc <- results[[3]]

# save
cat("All done! Save results.\n\n")
saveRDS(object=aligned_otu_99_simple, file=file.path(results_path, "alignment_simple.RDS"))
saveRDS(object=aligned_otu_99_custom, file=file.path(results_path, "alignment_custom.RDS"))
saveRDS(object=aligned_otu_99_desc, file=file.path(results_path, "alignment_desc.RDS"))
