## R script for installing the 
## Many packages I work with
## Useful when re-installing R


# Data manipulation -------------------------------------------------------
install.packages("tidyverse")
install.packages("broom")
install.packages("readxl")

# Computing ---------------------------------------------------------------
install.packages("foreach")
install.packages("doParallel")
install.packages("devtools")
install.packages("microbenchmark")


# Statistics --------------------------------------------------------------
install.packages("car")
install.packages("vegan")
install.packages("FactoMineR")
install.packages("mvoutlier")
install.packages("distr")
install.packages("extraDistr")
install.packages("factoextra") 

# Genetic analysis --------------------------------------------------------
install.packages("HardyWeinberg")
install_bioc("Biostrings") #needed for SimRad, will install a bunch of other Bioconductor stuff
source("https://bioconductor.org/biocLite.R")
biocLite("ShortRead")
biocLite("GenomeInfoDbData") #needed for SimRad
install.packages("SimRAD")
install.packages("randomForest")


# Maps --------------------------------------------------------------------
install.packages("maps")
install.packages("mapplots")
install.packages("mapdata")
install.packages("GISTools")
install.packages("ggmap")
install.packages("geosphere")


# Spatial analysis --------------------------------------------------------
install.packages("sp")
install.packages("raster")
install.packages("tiff")
install.packages("rgdal")

# Bayesian Stats-----------------------------------------------------------
install.packages("rstan")
install.packages("loo")
install.packages("rstanarm")
install.packages("bayesplot")
install.packages("coda")
install.packages("mvtnorm") # for rethinking
devtools::install_github("rmcelreath/rethinking")
install.packages("MCMCglmm")


# Manuscript generation ---------------------------------------------------
install.packages("knitr")
install.packages("kableExtra")
install.packages("tinytex")
install.packages("png")


# Plotting --------------------------------------------------------------------
install.packages("wesanderson")
install.packages("ggrepel")
install.packages("cowplot")






