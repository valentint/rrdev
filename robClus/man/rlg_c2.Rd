% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{rlg_c2}
\alias{rlg_c2}
\title{Internal function for concentration steps (refinement) in rlg}
\usage{
rlg_c2(x, d, cluster, alpha = 0.05, niter2 = 20L)
}
\arguments{
\item{x}{Rcpp::NumericMatrix, The input data.}

\item{d}{Rcpp::NumericVector, A numeric vector of length equal to the number 
of clusters to be detected. 
Each component of vector \code{d} indicates the intrinsic dimension of the affine subspace 
where observations on that cluster are going to be clustered. All the elements 
of vector \code{d} should be smaller than the problem dimension minus 1.}

\item{cluster}{Rcpp::NumericVector  A numeric vector of size \code{n} containing 
the cluster assignment for each observation. Cluster names are integer numbers}

\item{alpha}{double, The proportion of observations to be trimmed.}

\item{niter2}{int, The maximum number of concentration steps to be performed for 
the \code{nkeep} solutions kept for further iteration. The concentration steps 
are stopped, whenever two consecutive steps lead to the same data partition.}
}
\description{
Internal function for concentration steps (refinement) in rlg
}
