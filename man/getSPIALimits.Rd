\name{getSPIALimits}
\alias{getSPIALimits}

\title{Function \code{getSPIALimits} computes the limits for the SPIA test}

\description{Function \code{CgetSPIALimits} computes the limits for the probabilist test associated with SPIA.
}
\usage{
getSPIALimits(N,Pmm = 0.1, nsigma = 2, Pmm_nonM = 0.6, nsigma_nonM = 3, verbose = FALSE)
}

\arguments{
\item{N}{number of valida calls}
\item{Pmm}{probability of mismatch in a matching population (dafault 0.1)}
\item{nsigma}{parameter that characterize the limit for mm (dafault 2)}
\item{Pmm_nonM}{probability of mismach in a non matching population (dafault 0.6)}
\item{nsigma_nonM}{parameter that characterize the limit for mm_nonM (dafault 3)}
\item{verbose}{print verbose information on error}
}

\value{
A list with three elements:\cr
 1. inferior limit \cr
 2. superior limit \cr
 3. error signal}
\author{Francesca Demichelis <francesca.demichelis@unitn.it>, Davide Prandi <davide.prandi@unitn.it>}

\keyword{internal}

