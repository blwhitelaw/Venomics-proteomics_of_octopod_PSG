rm(list=ls())

library(VennDiagram)

kau_099 <- read.delim(file.choose(), header = T, sep = "\t") 
bro_099 <- read.delim(file.choose(), header = T, sep = "\t") 

top_ibaq_f_n_t <- function(data, file_name,top) {
	data <- na.omit(data)
	data <- data[order(-data$iBAQ),]
	data <- data[1:top,]

	library (seqinr)

	setwd("~/Desktop")

	write.table(data, paste(c(file_name, ".txt"), collapse = ""), sep = "\t", col.names = T, row.names = F)

	data$accession <- paste(data$accession, data$uniprot_accession, data$protein_name, sep= "   ")

	write.fasta(sequences = as.list(data$peptide), 
	names = data[["accession"]], 
	file.out = paste(c(file_name, ".fasta"), collapse = ""), open = "w", nbchar = 80)
}
