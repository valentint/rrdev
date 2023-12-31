% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{tclust_c1}
\alias{tclust_c1}
\title{Internal function for concentration steps (initializations) in tclust2}
\arguments{
\item{x}{Rcpp::NumericMatrix, The input data.}

\item{k}{The number of clusters initially searched for.}

\item{alpha}{double, The proportion of observations to be trimmed.}

\item{restrC}{Restriction type (0 for restriction on eigenvalues or determinant)}

\item{deterC}{Restriction on determinants (true or false)}

\item{restr_fact}{The constant \code{restr_fact >= 1} constrains the allowed 
differences among group scatters in terms of eigenvalues ratio. Larger values 
imply larger differences of group scatters, a value of 1 specifies the 
strongest restriction.}

\item{niter1}{int, The number of concentration steps to be performed for the 
nstart initializations.}

\item{opt}{Define the target function to be optimized. A classification likelihood 
target function is considered if \code{opt="HARD"} and a mixture classification 
likelihood if \code{opt="MIXT"}.}

\item{equal_weights}{A logical value, specifying whether equal cluster weights 
shall be considered in the concentration and assignment steps.}

\item{zero_tol}{The zero tolerance used. By default set to 1e-16.}
}
\description{
Internal function for concentration steps (initializations) in tclust2
}
