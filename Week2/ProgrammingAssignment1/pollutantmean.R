pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332) {
  # initialize data vector
  
  alldata <- c()
  
  # get CSV files in directory
  
  filenames <- as.character(list.files(directory) )
  file_paths <- paste(directory, filenames, sep="/")
  
  # iterate through CSV files, reading each file and adding it to alldata data table
  
  for(i in id){
      tmpfile <- read.csv(file_paths[i])
      validvalues <- tmpfile[!is.na(tmpfile[, pollutant]), pollutant]
      alldata <- c(alldata, validvalues)
  }
  
  # calculate mean
  
  result <- mean(alldata)
  return(result)
}

