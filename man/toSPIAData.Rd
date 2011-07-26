\name{toSPIAData}
\alias{toSPIAData}
\title{Function to code SNPs data into SPIA format}
\description{
  Function \code{toSPIAData} encodes SNPs information in a format accepted by SPIA, i.e., 0 for AA, 1 for BB, 2 for AB, NA for NoCall.
}
\usage{
toSPIAData(SNPMatrix, encoding)
}
\arguments{
  \item{SNPMatrix}{a matrix with a column for each cell line and a row for each SNP}
  \item{encoding}{a four elements ecnoding vector describing the encoding used in SNPMatrix. 
For instance, (0,2,1,-1) says that SNPMatrix uses 0 for AA, 2 for BB, 1 for AB, and -1 for NoCall}
}
\value{
  a matrix with a column for each cell line and a row for each SNP encoded with the SPIA format
}
\author{Francesca Demichelis <demichelis@science.unitn.it>, Davide Prandi <prandi@science.unitn.it>}
\examples{
   SNPcall <- c("snp1",0,1,2,-1)
   encoding <- c(0,2,1,-1)
   SPIA_SNPcall <- toSPIAData(SNPcall, encoding)
   print(SNPcall)
   print(SPIA_SNPcall)
}
\keyword{misc}

