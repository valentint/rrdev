% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bfact.R
\name{summary.bfact}
\alias{summary.bfact}
\title{summary.bfact The \code{summary} method for class \code{bfact}}
\usage{
\method{summary}{bfact}(object, hide.emtpy = TRUE, show.clust, show.alt, ...)
}
\arguments{
\item{object}{An object of class \code{bfact} as returned from \code{bfact()}.}

\item{hide.emtpy}{A logical value specifying whether clusters without doubtful 
assignment shall be hidden.}

\item{show.clust}{A logical value specifying whether the number of doubtful 
assignments per cluster shall be displayed.}

\item{show.alt}{A logical value specifying whether the alternative cluster 
assignment shall be displayed.}

\item{\ldots}{Arguments passed to or from other methods.}
}
\description{
The summary method for class \code{bfact}.
}
\examples{
 sig <- diag (2)
 cen <- rep (1, 2)
 x <- rbind(mvtnorm::rmvnorm(360, cen * 0,   sig),
 	       mvtnorm::rmvnorm(540, cen * 5,   sig * 6 - 2),
 	       mvtnorm::rmvnorm(100, cen * 2.5, sig * 50)
 )

 clus.1 <- tclust2(x, k = 2, alpha=0.1, restr.fact=12)
 clus.2 <- tclust2(x, k = 3, alpha=0.1, restr.fact=1)

 dsc.1 <- bfact(clus.1)
 summary(dsc.1)

 dsc.2 <- bfact(clus.2)
 summary(dsc.2)

}
\references{
\enc{García}{Garcia}-Escudero, L.A.; Gordaliza, A.; \enc{Matrán}{Matran}, C. and Mayo-Iscar, A. (2011), 
   "Exploring the number of groups in robust model-based clustering." \emph{Statistics and Computing}, \bold{21} 
   pp. 585-599, <doi:10.1007/s11222-010-9194-z>
}
