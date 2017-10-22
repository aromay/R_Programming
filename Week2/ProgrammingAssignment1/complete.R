complete <- function(directory, id = 1:332) {
  # initialize data vector
  
  nobs <- rep(0, length(id))
  
  # get CSV files in directory
  
  filenames <- as.character(list.files(directory) )
  file_paths <- paste(directory, filenames, sep="/")
  
  # iterate through CSV files, reading each file and adding it to alldata data table
  
  x <- 0 
  
  for(i in id){
    tmpfile <- read.csv(file_paths[i])
    
    x <- x + 1
    nobs[x] <- sum(complete.cases(tmpfile))
  }
  
  # calculate final results
  
  result <- data.frame(id = id, nobs = nobs)
  return(result)
}