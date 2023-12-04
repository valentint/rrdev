
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `robClus`: Robust Trimmed Clustering

The package `robClus` is a development version of extensions to the
TCLUST (method, algorithm and package).

## Installation

The `robClus` package is NOT on CRAN (The Comprehensive R Archive
Network) and the latest release can be installed only from sources.

## Building from source

To install the latest stable development version from GitHub, you can
pull this repository and install it using

    ## install.packages("remotes")
    remotes::install_github("valentint/rrdev", subdir="robClus")

Of course, if you have already installed `remotes`, you can skip the
first line (I have commented it out).

## Example 1: Feasible robust model-based clustering

Outlying data can heavily influence standard clustering methods. At the
same time, clustering principles can be useful when robustifying
statistical procedures. These two reasons motivate the development of
feasible robust model-based clustering approaches. Instead of trying to
“fit” noisy data, a proportion alpha of the most outlying observations
is trimmed. The `robClus` package efficiently handles different cluster
scatter constraints. Graphical exploratory tools are also provided to
help the user make sensible choices for the trimming proportion as well
as the number of clusters to search for.

``` r
library(robClus)
#> Robust Clustering Based on Trimming (version 2.0-2)
data (M5data)
x <- M5data[, 1:2]

clus.a <- tclust2(x, k = 3, alpha = 0.1, restr.fact =  1,
                  restr = "eigen", equal.weights = TRUE)
clus.b <- tclust2(x, k = 3, alpha = 0.1, restr.fact =  1,
                   equal.weights = TRUE)
clus.c <- tclust2(x, k = 3, alpha = 0.1, restr.fact =  1,
                  restr = "deter", equal.weights = TRUE)
clus.d <- tclust2(x, k = 3, alpha = 0.1, restr.fact = 50,
                  restr = "eigen", equal.weights = FALSE)

pa <- par (mfrow = c (2, 2))
plot (clus.a, main = "(a) tkmeans")
plot (clus.b, main = "(b) Gallegos and Ritter")
plot (clus.c, main = "(c) Gallegos")
plot (clus.d, main = "(d) tclust")
```

![](README-example-1-1.png)<!-- -->

``` r
par (pa)
```

## Example 2: Improved initialization approach

The estimation of trimmed clustering partitions is time consuming,
therefore another issue is the improvement of the computational
procedure. The new function followes an improved initialization
methdology which makes it much faster than the old one. For this example
it will be necessary to instal the old `tclust` package as well as the
`microbenchmark`package.

``` r
## install.packages(c("tclust", "microbenchmark", "mclust")
```

``` r
library(microbenchmark) # for microbenchmark()
library(tclust)         # for tclust()
library(robClus)        # for tclust2()
library(mclust)         # for adjustedRandIndex()
#> Package 'mclust' version 6.0.0
#> Type 'citation("mclust")' for citing this R package in publications.

data (M5data)
x <- M5data[, 1:2]

## Compare the results of tclust() and tclust2()
c1 <- tclust2(x, k=3, alpha=0.1, restr.fact=50)
c2 <- tclust(x, k=3, alpha=0.1, restr.fact=50)
(adj <- adjustedRandIndex(c1$cluster, c2$cluster))
#> [1] 0.9803242

## Compare the computational time of tclust() and tclust2()
microbenchmark(tclust2(x, k=3, alpha=0.1, restr.fact=50),
               tclust(x, k=3, alpha=0.1, restr.fact=50), times=10)
#> Unit: milliseconds
#>                                             expr      min       lq     mean
#>  tclust2(x, k = 3, alpha = 0.1, restr.fact = 50) 137.7361 139.8446 143.1430
#>   tclust(x, k = 3, alpha = 0.1, restr.fact = 50) 441.7993 443.2767 451.7707
#>    median       uq      max neval
#>  142.7377 144.6260 154.8022    10
#>  452.5319 459.8815 462.8124    10
```

## Example 3: Parallel computing

Further improvement of the computational time, especially in case of
large data sets can be achieved by parallel omputing which is
implemented in the new `tclust()` function.

``` r
library(doParallel)     # for detecCores()
#> Loading required package: foreach
#> Loading required package: iterators
#> Loading required package: parallel
library(robClus)        # for tclust2()

p <- 100
ni <- c(3600, 5400, 1000)
sigma <- diag(p)
center <- rep(1, p)
x <- rbind(mvtnorm::rmvnorm(ni[1], center * 0,   sigma),
           mvtnorm::rmvnorm(ni[2], center * 5,   sigma*6),
           mvtnorm::rmvnorm(ni[3], center * 2.5, sigma*50))

## How many cores do you have?
(ncores <- detectCores())
#> [1] 12

(ptime_par <- system.time({c1 <- tclust2(x, k=3, alpha=0.1, restr.fact=50, parallel=TRUE)})[3])
#> elapsed 
#>   17.87
(ptime_seq <- system.time({c2 <- tclust2(x, k=3, alpha=0.1, restr.fact=50, parallel=FALSE)})[3])
#> elapsed 
#>   43.38
```

On my laptop with 12 cores and p=100 the parallel version is more than
twice faster.

Please note, that if you repeat the example with, say, p=2, the parallel
version will be much slower.

## Example 4: Mixture modelling

To illustrate the option for mixture modeling in the new tclust function
we will consider the well-known Fisher IRIS data set and as in McLachlan
and peel (2000) will try to model only the “virginica” class. The
mixture modelling option is selected by setting `opt="MIXT"`
(alternative to `opt="HARD"` which is the default).

``` r
library(robClus)        # for tclust2()
library(mclust)         # for adjustedRandIndex()    

x <- iris[iris[,5]=="virginica", 1:4]
c1 <- tclust2(x, k=2, alpha=0.1, nstart=1000, opt="HARD")
c2 <- tclust2(x, k=2, alpha=0.1, nstart=1000, opt="MIXT")

(adj1 <- adjustedRandIndex(c1$cluster, c2$cluster))
#> [1] 1

pa <- par (mfrow = c (1, 2))
plot (c1, main = "(a) Classification likelihood")
plot (c2, main = "(b) Mixture likelihood")
```

![](README-example-4-1.png)<!-- -->

``` r
par (pa)
```
