\name{ComputingSPIADistance}
\alias{ComputingSPIADistance}

\title{Function \code{ComputingSPIADistance} computes SPIA distance bewteen two SNPs vectors}

\description{Function \code{ComputingSPIADistance} computes SPIA distance between two cell lines.
}
\usage{
ComputingSPIADistance(vector1, vector2, defaultDigists = 5, verbose = FALSE)
}

\arguments{
  \item{vector1}{a vector representing the SNPs of the first cell line}
  \item{vector2}{a vector representing the SNPs of the second cell line}
  \item{defaultDigists}{significative digits (default 5)}
  \item{verbose}{verbose mode}
}

\value{
A row with informations of about the distance
 1. SPIA distance  
 2. number of valid calls
 3. number of total calls
 4. number of calls where one of the two SPNs are not available
 5. number of calls where both SNPs are not available
 6. number of calls where SNP change from {AA,BB} to AB or from AB to {AA,BB}
 7. number of calls where SNP change from AA to BB or from BB to AA}
\author{Francesca Demichelis <francesca.demichelis@unitn.it>, Davide Prandi <davide.prandi@unitn.it>}
\keyword{internal}

