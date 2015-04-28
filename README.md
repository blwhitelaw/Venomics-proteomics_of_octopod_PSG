# thesis_putative_toxin_id

##
1. `Venn_all_0.99_proteins.R` generates a venn diagram from two species using SwissPrott identifiers as a proxy for protein function  
2. `Stacked_Bar_iBAQ.R` generates stacked bar graphs comparing two species based on putative toxin iBAQ expression
3. `Top_iBAQ.R` sorts all proteins based on their iBAQ expression values from highest to lowest. outputs include a tabular table and a fasta file
4. `TopGO_enrichment.R` performs a GO term enirchment analysis using the Fisher's exact test. enrichment analysis can be performed on each of the three GO catagories MF (Molecular Function), BP (Biological Process) and CC (cellular component). Graph generated is based on the top five enriched terms.
5. `refine_toxintable.R` filters proteins in accordance with the following criteria: 0.99% protein probability, <500 amino acids long, >3 cysteines, a cysteine % > 0.02 and contains a signal peptide. 