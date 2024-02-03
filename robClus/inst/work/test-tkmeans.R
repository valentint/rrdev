    library(tclust)
    library(robClus)
    library(mclust)         # for adjustedRandIndex()
    library(mlbench)
    library(trimcluster)
        
    alpha=0.1
    
    ## === Example 1: IRIS =====================================================

    x <- iris[, 1:4]
    c1 <- tkmeans(x, k=3, alpha=alpha, nstart=50, iter.max=20, equal.weights=TRUE)
    c2 <- tkmeans2(x, k=3, alpha=alpha, nstart=500)
    c3 <- trimkmeans(x, k=3, trim=alpha, runs=50, maxit=20)

    (adj1 <- adjustedRandIndex(c1$cluster, c2$cluster))
    (adj2 <- adjustedRandIndex(c1$cluster, c3$classification))

    ## === Example 2: MD5 =====================================================
    data (M5data)
    x <- M5data[, 1:2]

    c1 <- tkmeans(x, k=3, alpha=alpha, nstart=50, iter.max=20, equal.weights=TRUE)
    c2 <- tkmeans2(x, k=3, alpha=alpha, nstart=500)
    c3 <- trimkmeans(x, k=3, trim=alpha, runs=50, maxit=20)

    (adj1 <- adjustedRandIndex(c1$cluster, c2$cluster))
    (adj2 <- adjustedRandIndex(c1$cluster, c3$classification))

    ## === Example 3: Swiss banknotes ==========================================    
    data(swissbank)
    x <- swissbank

    c1 <- tkmeans(x, k=3, alpha=alpha, nstart=50, iter.max=20, equal.weights=TRUE)
    c2 <- tkmeans2(x, k=3, alpha=alpha, nstart=500)
    c3 <- trimkmeans(x, k=3, trim=alpha, runs=50, maxit=20)

    (adj1 <- adjustedRandIndex(c1$cluster, c2$cluster))
    (adj2 <- adjustedRandIndex(c1$cluster, c3$classification))

    ## === Example 3: Wine =====================================================
     
    data(wine)
    x <- wine[, -ncol(wine)]

    c1 <- tkmeans(x, k=3, alpha=alpha, nstart=50, iter.max=20, equal.weights=TRUE)
    c2 <- tkmeans2(x, k=3, alpha=alpha, nstart=500)
    c3 <- trimkmeans(x, k=3, trim=alpha, runs=50, maxit=20)

    (adj1 <- adjustedRandIndex(c1$cluster, c2$cluster))
    (adj2 <- adjustedRandIndex(c1$cluster, c3$classification))

    ## === Example 3: Wholesale ================================================
     
    data(wholesale)
    x <- wholesale[, -c(1, ncol(wholesale))]

    c1 <- tkmeans(x, k=3, alpha=alpha, nstart=50, iter.max=20, equal.weights=TRUE)
    c2 <- tkmeans2(x, k=3, alpha=alpha, nstart=500)
    c3 <- trimkmeans(x, k=3, trim=alpha, runs=50, maxit=20)

    (adj1 <- adjustedRandIndex(c1$cluster, c2$cluster))
    (adj2 <- adjustedRandIndex(c1$cluster, c3$classification))

##  Test parameter 'points' ===================================================
    library(tclust)
    library(robClus)
    library(mclust)         # for adjustedRandIndex()
    alpha <- 0.1
    x <- iris[, 1:4]
    c1 <- tkmeans(x, k=3, alpha=alpha, nstart=50, iter.max=20, equal.weights=TRUE)
    id <- sample(nrow(x), 3)
    c2a <- tkmeans2(x, k=3, alpha=alpha, nstart=200)
    c2b <- tkmeans2(x, k=3, alpha=alpha, nstart=100, points=as.matrix(x[id,]))

    (adj1a <- adjustedRandIndex(c1$cluster, c2a$cluster))
    (adj1b <- adjustedRandIndex(c1$cluster, c2b$cluster))
    
##  Test parameter 'equal.waights' in tkmeans =================================
    library(tclust)
    library(robClus)
    library(mclust)         # for adjustedRandIndex()
    alpha <- 0.1
    data (M5data)
    x <- M5data[, 1:2]
    c1 <- tkmeans(x, k=3, alpha=alpha, nstart=50, iter.max=20, equal.weights=TRUE)
    c2 <- tkmeans(x, k=3, alpha=alpha, nstart=50, iter.max=20, equal.weights=FALSE)

    (adj1 <- adjustedRandIndex(c1$cluster, c2$cluster))
    all.equal(c1,c2)
    
