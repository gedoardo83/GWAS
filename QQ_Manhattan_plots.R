#######################################################
###  QQplot and Manhattan plot using qqman package  ###
#######################################################

library(qqman)
#load results of association analysis
assoc <- read.table("results_file", header=T, as.is=T)

#draw qqplot
message("QQ plot for method1...")
png(file="qq_plot.png", res=1200, height=5, width=5, units="in")
qq(assoc$P_value)
dev.off()

#draw manhattan plot
message("Manhattan plot for method1...")
png(file="manhattan_plot.png", res=1200, height=5, width=6, units="in")
manhattan(assoc, chr="CHR", bp="BP", snp="SNP", p="P" )
dev.off()

######################################
###  Manual computation of qqplot  ###
######################################

#Given assoc a summary statistics from plink
#observed –log10 p-values
p.obs=-log10(sort(assoc$P,decreasing=F))

#expected –log10 p-values
p.exp=-log10( 1:length(p.obs)/length(p.obs) )

#plot observed vs. expected –log10 p-values (before QC) 
plot(p.exp, p.obs, pch=19, main= "QQ plot (before QC)", xlab="expected -log10 p-value", ylab="observed -log10 p-value")

#equality line
abline(0, 1, lty=2, col="red")
