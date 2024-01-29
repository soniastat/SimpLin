SimpLinR <- function(x, y){
  
  ## Error Checking
  if (length(x) != length(y)) {
    stop("Input vectors must have the same length.")
  }
  
  if (!is.numeric(x) | !is.numeric(y)) {
    print("Either x or y (or both) is not a numeric vector")
  }
  
  ## If there is no error, run SimpLinCpp
  result <- SimpLinCpp(x, y)
  return(result)
  
}

