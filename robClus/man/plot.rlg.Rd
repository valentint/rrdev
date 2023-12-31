% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.rlg.R
\name{plot.rlg}
\alias{plot.rlg}
\title{Plot an 'rlg' object}
\usage{
\method{plot}{rlg}(
  x,
  which = c("all", "scores", "loadings", "eigenvalues"),
  sort = TRUE,
  ask = (which == "all" && dev.interactive(TRUE)),
  ...
)
}
\arguments{
\item{x}{An \code{rlg} object to plot.}

\item{which}{Select the required plot.}

\item{sort}{Whether to sort.}

\item{ask}{if \code{TRUE}, the user is \emph{ask}ed before each plot, see \code{par(ask=.)}. 
Default is \code{ask = which=="all" && dev.interactive()}.}

\item{\dots}{Other parameters to be passed to the lower level functions.}
}
\description{
Different plots for the results of 'rlg' analysis, stored in an 
   \code{rlg} object, see Details.
}
\examples{
 data (LG5data)
 x <- LG5data[, 1:10]
 clus <- rlg(x, d = c(2,2,2), alpha=0.1)
 plot(clus, which="eigenvalues") 
 plot(clus, which="scores") 

}
