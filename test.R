library(Rcpp)
library(devtools)

uninstall() ## Only run this when you make change one of your file and want to install the package again.

compileAttributes()
build()
install(build_vignettes = TRUE)
library(SimpLin)

set.seed(1)
x <- rnorm(10)
y <- 2 + x + rnorm(10) 

lm(y ~ x) # in-built R code
SimpLinCpp(x, y) # My SimpLin code

# usethis::use_vignette("SimpLin") ## Build vignette

