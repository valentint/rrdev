##  VT::18.03.2024
##
##  rlg() should return in $obj the  "sum of squared orthogonal distances" and not
##  "the sum of the square roots of the squared euclidean norms", see mail from Luis Angel from 05.03.2024
##

library(robClus)
data (LG5data)
x <- LG5data[, 1:10]

set.seed(1234)
clus <- rlg(x, d = c(2,2,2), alpha=0.1)

##  save(clus, file="clus-0.rda")       # the original code
##  save(clus, file="clus-1.rda")       # sqrt removed  - identical to the original code
##  save(clus, file="clus-2.rda")       # norm squared
##  save(clus, file="clus-3.rda")       # sqrt removed and norm squared (identical to 2)
save(clus, file="clus-4.rda")           # norm2est instead of norm (should be faster) (identical to 3)

clus$obj
##  [1] 16.27322    - the original code 

##  [1] 1.54969     - the corrected code

