rm(list = ls())

kau <- read.delim(file.choose(), header = T, sep = "\t") 
bro <- read.delim(file.choose(), header = T, sep = "\t") 

NoSp <- function(table, species){
	table <- cbind(table,Species=rep(species,len=nrow(table)))
	table <- table[order(table$Group),]
	table <- na.omit(table)
	ibaqs <- sum(as.numeric(table$iBAQ))
	per <- cbind(table, ibaq_percentage = table$iBAQ/ibaqs)
	per <- per[!(per$Group=="SP"),]
	per <- per[!(per$Group=="CHIT"),]
}

Sp <- function(table, species){
	table <- cbind(table,Species=rep(species,len=nrow(table)))
	table <- table[order(table$Group),]
	table <- na.omit(table)
	ibaqs <- sum(as.numeric(table$iBAQ))
	per <- cbind(table, ibaq_percentage = table$iBAQ/ibaqs)
}

kau_1 <- Sp(kau, "Octopus kaurna")
bro_1 <- Sp(bro, "Hapalochlaena maculosa")

kau_2 <- NoSp(kau, "Octopus kaurna")
bro_2 <- NoSp(bro, "Hapalochlaena maculosa")


bsp <- rbind(kau_1,bro_1)
bsp_nsp <- rbind(kau_2, bro_2)

library(ggplot2)
library(RColorBrewer)

ggplot(data=bsp, aes(x=Species, y=ibaq_percentage, fill=Group)) + 
geom_bar(stat="identity") + scale_fill_brewer(palette="Set3") + 
ylab("iBAQ %") + 
theme(panel.background = element_rect(fill = "white"), 
	axis.title.x = element_blank(), 
	axis.title.y = element_text(size = 16, colour = "black"), 
	axis.text = element_text(size = 16, colour = "black", face = "italic"))


ggplot(data=bsp_nsp, aes(x=Species, y=ibaq_percentage, fill=Group)) + 
geom_bar(stat="identity") + scale_fill_brewer(palette="Set3") + 
ylab("iBAQ %") + 
theme(panel.background = element_rect(fill = "white"), 
	axis.title.x = element_blank(), 
	axis.title.y = element_text(size = 16, colour = "black"), 
	axis.text = element_text(size = 16, colour = "black", face = "italic"))
