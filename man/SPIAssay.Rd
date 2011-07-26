\name{SPIAssay}
\alias{SPIAssay}
\docType{package}
\title{A genetic-based assay for the identification of cell lines}

\description{
The SNP Panel Identification Assay (SPIA) is a package that enables an 
accurate determination of cell line identity from the genotype of single nucleotide 
polymorphisms (SNPs). The SPIA test allows to discern when two cell lines are close 
enough to be called similar and when they are not. 
}
\details{
\tabular{ll}{
Package: \tab SPIAssay\cr
Type: \tab Package\cr
Version: \tab 1.0.0\cr
Date: \tab 2011-07-26\cr
License: \tab GPL Version 2 or later.\cr
}

The most important function of the package is \code{SPIATest} that computes SPIA distance
on a set of cell lines and perform the associated probabilistic test. Another important function is 
\code{SPIAPlot} that creates a summary graph of the SPIA test. Finally, \code{toSPIAData} function
encodes generic representations of genotype calls into a format compatible with SPIA.
}
\author{
Francesca Demichelis <demichelis@science.unitn.it>, Davide Prandi <prandi@science.unitn.it>

Maintainer: Davide Prandi <prandi@science.unitn.it>

}
\references{

Demichelis F, Greulich H, Macoska JA, Beroukhim R, Sellers WR, Garraway L, Rubin MA. 
SNP panel identification assay (SPIA): a genetic-based assay for the identification of cell lines. 
\emph{Nucleic Acids Res}. 2008;36:2446-2456.

}
\keyword{ package }
\examples{

library(SPIAssay)

# An example of genotype calls with:
# - four cell lines
# - for each cell line five SNP calls
GenotypeCalls <- rbind(
c("SNP1", "AA", "AA", "AB", "AB"),
c("SNP2", "NoCall", "AA", "AB", "AB"),
c("SNP3", "AB", "AB", "AA" , "AB"),
c("SNP4", "BB", "BB", "BB", "BB"),
c("SNP5", "AB", "BB", "AA", "AA"))
colnames(GenotypeCalls) <- c("SNP_ID","CellLine1","CellLine2","CellLine3","CellLine4")

# Encode the data into SPIA format.
# SPIA uses 0 for AA, 1 for BB, 2 for AB, and NA for NoCall
# therefore, GenotypeCalls has to be encoded by meand of toSPIAData
encoding <- c("AA","BB","AB","NoCall")
SPIAGenotypeCalls <- toSPIAData(GenotypeCalls,encoding)

# Perform SPIA analysis with parameters SPIAParam
SPIAParam <- list(Pmm = 0.1, nsigma = 1, Pmm_nonM = 0.6, nsigma_nonM = 1, PercValidCall=0.7)
SPIAanalysis <- SPIATest(SPIAGenotypeCalls, row.names = TRUE, test.prob = TRUE, SPIAParam)

# Plot SPIA pairwise comparison
SPIAPlot(SPIAanalysis)
}
