##  roxygen2::roxygenise("C:/users/valen/onedrive/myrepo/rrdev/robClus", load_code=roxygen2:::load_installed)

#'  LG5data data
#'
#' A data set in dimension 10 with three clusters around affine subspaces
#'  of common intrinsic dimension. A 10\% background noise is added uniformly 
#'  distributed in a rectangle containing the three main clusters. 
#' @name LG5data
#' @docType data
#' @usage data(LG5data)
#' @format The first 10 columns are the variables. The last column is the true 
#'  classification vector where symbol "0" stands for the contaminating data points. 
#' @examples 
#' #--- EXAMPLE 1 ------------------------------------------ 
#' data (LG5data)
#' x <- LG5data[, 1:10]
#' clus <- rlg(x, d = c(2,2,2), alpha=0.1, trace=TRUE)
#' plot(x, col=clus$cluster+1)
#' @keywords datasets
NULL

#'  M5data data
#'
#' A bivariate data set obtained from three normal bivariate distributions with 
#'  different scales and proportions 1:2:2. One of the components is very overlapped 
#'  with another one. A 10\% background noise is added uniformly distributed in a rectangle 
#'  containing the three normal components and not very overlapped with the three mixture 
#'  components. A precise description of the M5 data set can be found in 
#'  García-Escudero et al. (2008).
#'
#' @name M5data
#' @docType data
#' @usage data(M5data)
#' @format The first two columns are the two variables. The last column is the true 
#'  classification vector where symbol "0" stands for the contaminating data points. 
#' @source García-Escudero, L.A.; Gordaliza, A.; Matrán, C. and Mayo-Iscar, A. (2008), 
#'  "A General Trimming Approach to Robust Cluster Analysis". Annals of Statistics, 
#'  Vol.36, pp. 1324-1345.
#' @examples 
#' #--- EXAMPLE 1 ------------------------------------------ 
#' data (M5data) 
#' x <- M5data[, 1:2] 
#' clus <- tclust2(x, k=3, alpha=0.1, nstart=200, niter1=3, niter2=17, 
#'    nkeep=10, opt="HARD", equal.weights=FALSE, restr.fact=50, trace=TRUE) 
#' plot (x, col=clus$cluster+1)
#' @keywords datasets
NULL

#'  The wine dataset from the UCI Machine Learning Repository
#'
#'  The wine dataset contains the results of a chemical analysis of wines grown in 
#'  a specific area of Italy. Three types of wine are represented in the 178 samples, 
#'  with the results of 13 chemical analyses recorded for each sample. The \code{class} 
#'  variable is a categoric variable. The data contains no missing values and consits 
#'  of only numeric data, with a three class target variable (\code{class}) for classification.
#'
#' @name wine
#' @docType data
#' @usage data(wine)
#' @format A data frame containing 178 observations in 14 variables (13 numerical and one categorical). 
#' The variables are as follows:
#'
#' \itemize{
#'      \item \code{Alcohol} Alcohol
#'      \item \code{Malic} Malic acid
#'      \item \code{Ash} Ash
#'      \item \code{Alcalinity} Alcalinity of ash 
#'      \item \code{Magnesium} Magnesium
#'      \item \code{Phenols} Total phenols
#'      \item \code{Flavanoids} Flavanoids
#'      \item \code{Nonflavanoids} Nonflavanoid phenols
#'      \item \code{Proanthocyanins} Proanthocyanins
#'      \item \code{Color} Color intensity
#'      \item \code{Hue} Hue 
#'      \item \code{Dilution} D280/OD315 of diluted wines.
#'      \item \code{Proline} Proline
#'      \item \code{class} The type of wine, into one of three classes, 
#'          1 (59 obs), 2(71 obs), and 3 (48 obs).
#'  }
#'
#' @source \url{http://archive.ics.uci.edu/ml/datasets/Wine}
#' @examples 
#' #--- EXAMPLE 1 ------------------------------------------ 
#' data (wine) 
#' x <- wine[, -ncol(wine)] 
#' clus <- tclust2(x, k=3, alpha=0.1, nstart=200, niter1=3, niter2=17, 
#'    nkeep=10, opt="HARD", equal.weights=FALSE, restr.fact=50, trace=TRUE) 
#' plot (x, col=clus$cluster+1)
#'  plot(clus)
#' @keywords datasets
NULL

#' Wholesale customers dataset
#'
#' The data set refers to clients of a wholesale distributor. It includes the annual 
#'  spending in monetary units  on diverse product categories.
#'
#' @name wholesale
#' @docType data
#' @usage data(wholesale)
#' @format A data frame containing 440 observations in 8 variables (6 numerical and two categorical). 
#' The variables are as follows:
#'
#' \itemize{
#'      \item \code{Region} Customers' Region - Lisbon (coded as 1), Porto (coded as 2) or Other (coded as 3)
#'      \item \code{Fresh} Annual spending on fresh products
#'      \item \code{Milk} Annual spending on milk products
#'      \item \code{Grocery} Annual spending on grocery products
#'      \item \code{Frozen} Annual spending on frozen products
#'      \item \code{Detergents} Annual spending on detergents and paper products
#'      \item \code{Delicatessen} Annual spending on and delicatessen products
#'      \item \code{Channel}  Customers' Channel - Horeca (Hotel/Restaurant/Café) or 
#'              Retail channel. Horeca is coded as 1 and Retail channel is coded as 2
#'  }
#'
#' @source Abreu, N. (2011). Analise do perfil do cliente Recheio e desenvolvimento de 
#'  um sistema promocional. Mestrado em Marketing, ISCTE-IUL, Lisbon. 
#'  url={https://api.semanticscholar.org/CorpusID:124027622}
#'
#' @examples 
#' #--- EXAMPLE 1 ------------------------------------------ 
#' data (wholesale) 
#' x <- wholesale[, -c(1, ncol(wholesale))] 
#' clus <- tclust2(x, k=3, alpha=0.1, nstart=200, niter1=3, niter2=17, 
#'    nkeep=10, opt="HARD", equal.weights=FALSE, restr.fact=50, trace=TRUE) 
#'  plot (x, col=clus$cluster+1)
#'  plot(clus)
#' @keywords datasets
NULL

#' Pinus nigra dataset
#'
#' To study the growth of the wood mass in a cultivated forest of \emph{Pinus nigra} 
#'  located in the north of Palencia (Spain), a sample of 362 trees was studied. 
#'  The data set is made of measurements of heights (in meters), in variable "HT", 
#'  and diameters (in millimetres), in variable "Diameter", of these trees. 
#'  The presence of three linear groups can be guessed apart from a small group 
#'  of trees forming its own cluster with larger heights and diameters one isolated 
#'  tree with the largest diameter but small height. More details on the 
#'  interpretation of this dataset in García-Escudero et al (2010).
#'
#' @name pine
#' @docType data
#' @usage data(pine)
#' @format A data frame containing 362 observations in 2 variables. 
#' The variables are as follows:
#'
#' \itemize{
#'      \item \code{Diameter} Diameter
#'      \item \code{HT} Height
#'  }
#'
#' @references García-Escudero, L. A., Gordaliza, A., Mayo-Iscar, A., and San Martín, R. (2010). 
#'  Robust clusterwise linear regression through trimming. 
#'  \emph{Computational Statistics & Data Analysis}, 54(12), 3057--3069.
#'
#' @keywords datasets
NULL
