rm(list=ls())

library(VennDiagram)

kau_099 <- read.delim(file.choose(), header = T, sep = "\t") 
bro_099 <- read.delim(file.choose(), header = T, sep = "\t") 

Vennn <- function(data_1, data_2, species_1, species_2){
	data1 <- cbind(data_1,Species=rep(species_1,len=nrow(data_1)))
	data2 <- cbind(data_2,Species=rep(species_2,len=nrow(data_2)))

	all <- rbind(data1, data2)
	uni <- all[duplicated(all$accession),]

	grid.newpage()
	draw.pairwise.venn(nrow(data1), nrow(data2), nrow(uni), 
	category = c(species_1, species_2), lty = rep("blank", 
    2), fill = c("light blue", "yellow"), alpha = rep(0.5, 2), 
    cat.pos = c(0, 0), cat.dist = rep(0.025, 2),
    cat.fontface = rep("italic", 2))
}
