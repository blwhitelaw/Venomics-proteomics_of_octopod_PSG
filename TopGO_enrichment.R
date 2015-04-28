# requires Map file from trinotate database
# orf_to_go.rb Trinotate.sqlite > orf2go.map
# change map file species

rm(list = ls())

library(topGO)

geneID2GO <- readMappings(file.choose())

geneNames <- names(geneID2GO)

toxin <- read.delim(file.choose(), header = T, sep = "\t")
toxin <- toxin[which(toxin$protein_probability >= 0.99),]

gotest<-function(file,ont, topibaq){

	toxin <- toxin[order(-toxin$iBAQ),]
	toxin<- toxin[1:topibaq,]

	myInterestingGenes = toxin[,"orf_id"]

	geneList <- factor(as.integer(geneNames %in% myInterestingGenes))
    	names(geneList) <- geneNames


	GOdata <- new("topGOdata", ontology = ont, allGenes = geneList,annot = annFUN.gene2GO, gene2GO = geneID2GO)
	resultFis <- runTest(GOdata, algorithm = "classic", statistic = "fisher")

	allRes <- GenTable(GOdata, classic = resultFis,orderBy = "weight", ranksOf = "classic", topNodes = 20)
    	showSigOfNodes(GOdata, score(resultFis), firstSigNodes = 5, useInfo = 'all')

	setwd("~/Desktop")
	write.table(allRes, file, sep = "\t", col.names = T, row.names = F)

}

