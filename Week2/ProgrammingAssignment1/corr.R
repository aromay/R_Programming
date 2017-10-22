corr <- function(directory, threshold = 0) {
  # initialize data vector
  
  alldata <- complete(directory, 1:332)
  nobs <- alldata$nobs
  
  # find the valid ids
  
  ids <- alldata$id[nobs > threshold]
  
  # get CSV files in directory
  
  filenames <- as.character(list.files(directory) )
  filepaths <- paste(directory, filenames, sep="/")
  
  # iterate through CSV files, reading each file and adding it to alldata data table
  
  x <- 0 
  
  result <- rep(0, length(ids))
  
  for(i in ids){
    tmpfile <- read.csv(filepaths[i])
    
    x <- x + 1
    result[x] <- cor(tmpfile$sulfate, tmpfile$nitrate, use="complete.obs")
  }
  
  return(result)
}