##
##  Test the new function tclust2() in the package robClus by comparing 
##  the results to the current function tclust() in the package 'tclust'.
##
##  Use different data sets
##  Use different parameters:
##  - alpha
##  - restr: "eigen" or "deter"
##  - restr.factor and cshape

library(tclust)
library(robClus)
library(mclust)         # for adjustedRandIndex()
library(mlbench)


alpha <- 0
restr <- "deter"
restr.fact <- 12

## === Example 1: MD5
data (M5data)
x <- M5data[, 1:2]
c1 <- tclust(x, k=3, alpha=alpha, restr=restr, restr.fact=restr.fact)
c2 <- tclust2(x, k=3, alpha=alpha, restr=restr, restr.fact=restr.fact, nstart=1000)
c3 <- tclust2(x, k=3, alpha=alpha, restr=restr, restr.fact=restr.fact, cshape=1, nstart=1000)

c1$unrestr.fact
c2$unrestr.fact

(adj1 <- adjustedRandIndex(c1$cluster, c2$cluster))
(adj2 <- adjustedRandIndex(c2$cluster, c3$cluster))
    
## === Example 2: IRIS =====================================================
x <- iris[, 1:4]
c1 <- tclust(x, k=3, alpha=alpha, restr=restr, restr.fact=restr.fact)
c2 <- tclust2(x, k=3, alpha=alpha, restr=restr, restr.fact=restr.fact, nstart=1000)
c3 <- tclust2(x, k=3, alpha=alpha, restr=restr, restr.fact=restr.fact, cshape=1, nstart=1000)

c1$unrestr.fact
c2$unrestr.fact

(adj1 <- adjustedRandIndex(c1$cluster, c2$cluster))
(adj2 <- adjustedRandIndex(c2$cluster, c3$cluster))

## === Example 3: Swiss banknotes ==========================================
data(swissbank)
x <- swissbank

c1 <- tclust(x, k=3, alpha=alpha, restr=restr, restr.fact=restr.fact)
c2 <- tclust2(x, k=3, alpha=alpha, restr=restr, restr.fact=restr.fact, nstart=1000)
c3 <- tclust2(x, k=3, alpha=alpha, restr=restr, restr.fact=restr.fact, cshape=1, nstart=1000)

c1$unrestr.fact
c2$unrestr.fact

(adj1 <- adjustedRandIndex(c1$cluster, c2$cluster))
(adj2 <- adjustedRandIndex(c2$cluster, c3$cluster))

## === Example 3: Wine =====================================================
data(wine)
x <- wine[, -ncol(wine)]

c1 <- tclust(x, k=3, alpha=alpha, restr=restr, restr.fact=restr.fact)
c2 <- tclust2(x, k=3, alpha=alpha, restr=restr, restr.fact=restr.fact, nstart=1000)
c3 <- tclust2(x, k=3, alpha=alpha, restr=restr, restr.fact=restr.fact, cshape=1, nstart=1000)

c1$unrestr.fact
c2$unrestr.fact

(adj1 <- adjustedRandIndex(c1$cluster, c2$cluster))
(adj2 <- adjustedRandIndex(c2$cluster, c3$cluster))

## === Example 3: Wholesale =====================================================
data(wholesale)
x <- wholesale[, -c(1, ncol(wholesale))]

c1 <- tclust(x, k=3, alpha=alpha, restr=restr, restr.fact=restr.fact)
c2 <- tclust2(x, k=3, alpha=alpha, restr=restr, restr.fact=restr.fact, nstart=1000)
c3 <- tclust2(x, k=3, alpha=alpha, restr=restr, restr.fact=restr.fact, cshape=1, nstart=1000)

c1$unrestr.fact
c2$unrestr.fact

(adj1 <- adjustedRandIndex(c1$cluster, c2$cluster))
(adj2 <- adjustedRandIndex(c2$cluster, c3$cluster))

