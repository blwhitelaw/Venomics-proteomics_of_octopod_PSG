#requires toxintable from refined code

rm(list=ls())

toxintable <- read.delim(file.choose(), header = T, sep = "\t")
tox_hit <- read.csv(file.choose(), header = T, sep = ",")

names(tox_hit) <- "accession"

mixe <- merge(tox_hit, toxintable, by = "accession" )

uni <- mixe[!duplicated(mixe$orf_id),]



get_fasta_n_tab <- function(ref_toxin_table, file_name) {

library (seqinr)

setwd("~/Desktop")

write.table(ref_toxin_table, paste(c(file_name, ".txt"), collapse = ""), sep = "\t", col.names = T, row.names = F)

ref_toxin_table$accession <- paste(ref_toxin_table$accession, ref_toxin_table$uniprot_accession, ref_toxin_table$protein_name, ref_toxin_table$go_terms, sep= "   ")

write.fasta(sequences = as.list(ref_toxin_table$peptide), 
	names = ref_toxin_table[["accession"]], 
	file.out = paste(c(file_name, ".fasta"), collapse = ""), open = "w", nbchar = 80)

}
