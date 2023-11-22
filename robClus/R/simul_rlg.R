#' Simulate contaminated data set for applying rlg
#' 
#' @description Simulate alpha*100\% contaminated data set for applying rlg by 
#'  generating a k=3 components with equal size  and            # 
#'  common underlying dimension q_1=q_2=q_3=q
#' 
#' @param n number of observations
#' @param p dimension (\code{p >= 2} and \code{p > q})
#' @param q intrinsic dimension
#' @param var The smaller 'var' the smaller the scatter around the lower dimensional space
#' @param sep.means Parameter controlling the location vectors separation
#' @param alpha contamination level
#' 
#' @return a list with the following items
#' \itemize{
#'     \item x - The generated dataset
#'     \item true - The true classification
#' }
#' 
#' @export
#' 
#' @examples 
#'  res <- simula.rlg(q=5, p=200, n=150, var=0.01, sep.means=0.00)
#'  plot(res$x,col=res$true+1)
#'
simula.rlg <- function(q=2, p=10, n=200, var=0.01, sep.means=0.0, alpha=0.05){
  
  if (q >= p) stop("Invalid intrinsic dimension")
  
  par_n  = max(2, ceiling(n*(1-alpha)/3))
  par_sd = sqrt(var)
  
  rot1 = qr.Q(qr(matrix(rnorm(p*p),ncol=p)))
  rot2 = qr.Q(qr(matrix(rnorm(p*p),ncol=p)))
  
  U1 = qr.Q(qr(matrix(rnorm(p*q),ncol=q))) 
  U2 = rot1%*%U1
  U3 = rot2%*%U2
  
  Q1 = matrix(runif(q*par_n), ncol = par_n)
  Q2 = matrix(runif(q*par_n), ncol = par_n)
  Q3 = matrix(runif(q*par_n), ncol = par_n)
  
  X1 = rnorm(p,0,sep.means)%*%t(rep(1,par_n)) + U1%*%Q1 + matrix(rnorm(p*par_n, sd=par_sd), ncol=par_n)
  X2 = rnorm(p,0,sep.means)%*%t(rep(1,par_n)) + U2%*%Q2 + matrix(rnorm(p*par_n, sd=par_sd), ncol=par_n)
  X3 = rnorm(p,0,sep.means)%*%t(rep(1,par_n)) + U3%*%Q3 + matrix(rnorm(p*par_n, sd=par_sd), ncol=par_n)
  
  X <- t(cbind(X1, X2, X3))
  
  # contaminating
  n.cont <- n-3*par_n
  rr <- max(1,abs(X))
  X.cont <- matrix(runif(n.cont*p,-rr,rr),ncol=p)
  
  X <-  rbind(X,X.cont)
  
  # true
  true <- c(rep(1:3, each=par_n),rep(0,n.cont))
  
  # return
  return(list(x=X,true=true))
}
