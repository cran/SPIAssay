\name{SPIATest}
\alias{SPIATest}

\title{Function to compute SPIA test}

\description{Function \code{SPIATest} computes SPIA distance and performs probabilistic test
on a set of cell lines. 
}
\usage{
SPIATest(x, row.names = TRUE, test.prob = TRUE,
         test.param = list(Pmm=0.1, nsigma=2, 
         Pmm_nonM=0.6, nsigma_nonM=3, 
         PercValidCall=0.9), verbose = FALSE)
}

\arguments{
  \item{x}{a matrix with a column for each cell line and a row for each SNP}
  \item{row.names}{specify if the first column of x contains SNPs names/identificators}
  \item{test.prob}{specify if the function has to perform SPIA probabilistic test}
  \item{test.param}{specify the parameters of the probabilistic test.
    \itemize{
		  \item Pmm: SNP probability of mismatch in a matching population
		  \item nsigma: area limit for Pmm
		    \itemize{
		            \item Pmm_nonM: SNP probability of mismach in a non matching population
                \item nsigma_nonM: area limit for Pmm_nonM
                \item PercValidCall: percentage of valid SNP calls to consider the test valid
		    }
        
    }}
  \item{verbose}{print verbose information}
}

\value{
  \item{SPIAresult}{a matric with a line for each cell line and with columns with the informationss about distances
    In particular, each row of SPIAresult has 7 columns:
    \enumerate{
           \item SPIA distance
           \item number of valid calls
           \item number of total calls
           \item number of calls where one of the two SPNs are not available
           \item number of calls where both SNPs are not available
           \item number of calls where SNP change from AA, BB to AB or from AB to AA, BB
           \item number of calls where SNP change from AA to BB or from BB to AA
    }}
  \item{parameters}{the parameters used by the test (test.param)}
  \item{input.param}{the number of samples (N_samples), the number of SNPs (N_SNPs), and if the probabilistic test has been done (test.prob)}
}
\author{Francesca Demichelis <francesca.demichelis@unitn.it>, Davide Prandi <davide.prandi@unitn.it>}

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
colnames(GenotypeCalls) <- 
 c("SNP_ID","CellLine1","CellLine2","CellLine3","CellLine4")

# Encode the data into SPIA format.
# SPIA uses 0 for AA, 1 for BB, 2 for AB, and NA for NoCall
# therefore, GenotypeCalls has to be encoded by meand of
# toSPIAData
encoding <- c("AA","BB","AB","NoCall")
SPIAGenotypeCalls <- toSPIAData(GenotypeCalls,encoding)

# Perform SPIA analysis
SPIAanalysis <- SPIATest(SPIAGenotypeCalls)
# This analysis give an error because there are not enough SNPs

# Perform SPIA analysis with parameters SPIAParam 
# to reduce the 'similar' region
SPIAParam <- 
 list(Pmm=0.1, nsigma=1, Pmm_nonM=0.6, nsigma_nonM=1, PercValidCall=0.7)
SPIAanalysis <- 
 SPIATest(SPIAGenotypeCalls,row.names=TRUE,test.prob=TRUE,SPIAParam)

}
