# helper function for getting the hospital name

get_hospital_name <- function(state_hospitals, column, num = "best") {
    values <- state_hospitals[, column]
    sorted <- sort(values)
    
    if (num== "best")
        valid_value <- sorted[1]
    else if (num == "worst")
        valid_value <- sorted[length(sorted)]
    else if (num > length(sorted))
        return(NA)
    else
        valid_value = sorted[num]
    
    index <- which(values == valid_value)
    hospital_name <- state_hospitals[index, 2]
    hospital_name
}

rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    
    all_hospitals <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check that outcome is valid
    ## The outcomes can be one of "heart attack", "heart failure", or "pneumonia".
    
    if (outcome == "heart attack")
        column <- 11
    else if (outcome == "heart failure")
        column <- 17
    else if (outcome == "pneumonia")
        column <- 23
    else
        stop("invalid outcome")
    
    
    ## Check that state is valid
    
    state_hospitals <- subset(all_hospitals, State==state)
    valid_values <- state_hospitals[, column]
    
    if (length(valid_values) == 0)
        stop("invalid state")
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    
    state_hospitals[, column] <- as.numeric(state_hospitals[, column])
    return(get_hospital_name(state_hospitals, column, num))
}
