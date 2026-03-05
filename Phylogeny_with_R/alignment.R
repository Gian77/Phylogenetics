# options
cat("Setting up R options.\n")
options(scipen = 9999)

# libraries
cat("Loading R libraries.\n")
library(tidyverse)
library(msa)
library(phangorn)
library(ape)

# path
cat("Load data PATH.\n")
data_path = "/mnt/home/benucci/Phylogeny_in_R/otu_alignment/"

# import
cat("Import otu representative sequences file into R.\n")
otu_99 <- readDNAStringSet(file.path(data_path,"otus_99.fasta"), format="fasta", 
                           seek.first.rec=TRUE, use.names=TRUE)

# align
cat("Align sequences...\n")
aligned_otu_99_simple <- msa(otu_99,
			     method = "Muscle") 

aligned_otu_99_custom <- msa(otu_99, 
			 method = "Muscle",
	                 gapOpening = -10,      # More reasonable gap opening penalty
	                 gapExtension = -0.5,   # Small but non-zero extension penalty
	                 maxiters = 2,          # Default, usually sufficient
	                 cluster = "upgmamax",  # Good choice
	                 order = "input",
	                 verbose = TRUE)

# save
cat("All done! Save results.\n")
saveRDS(object=aligned_otu_99_simple, file="aligment_simple.RDS")
saveRDS(object=aligned_otu_99_custom, file="aligment_custom.RDS")
