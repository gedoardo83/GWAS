#create list of SNPs filtered for differential call rate in cases/controls
diffmiss <- read.table("QC_step3.call.rate.missing", header=T, as.is=T)
diffmiss <- diffmiss[diffmiss$P < 1e-5,]
write.table(diffmiss$SNP, "fail_SNPs_diffmiss.txt", row.names=F, col.names=F, quote=F)

#create plots for MAS and missing rate
lmis <- read.table("QC_step3.mis.lmiss", header=T)
png("SNPs_lmiss.png", res=1200, width=5, height=5, units="in")
plot(log10(lmis$F_MISS), ylab="Number of SNPs", xlab="Fraction missing genotypes (log10)", main="Fraction of missing data")
abline(v=log10(0.05), lty=2)
dev.off()

freq <- read.table("QC_step3.freq.frq", header=T)
png("SNPs_MAF.png", res=1200, width=5, height=5, units="in")
hist(freq$MAF, ylab="Number of SNPs", xlab="MAF", main="Minor allele frequencies")
abline(v=0.01, lty=2)
dev.off()
