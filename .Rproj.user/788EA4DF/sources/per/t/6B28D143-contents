SimpLinR <- function(x, y){
  
  ## Error Checking
  if (length(x) != length(y)) {
    stop("Input vectors must have the same length.")
  }
  
  
  ## If there is no error, run SimpLinCpp
  result <- SimpLinCpp(x, y)
  return(result)
  
}

