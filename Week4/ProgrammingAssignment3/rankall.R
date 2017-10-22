# helper function for getting the hospital name

get_ranked_hospital <- function(state_hospitals, column, num = "best") {
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

rankall <- function(outcome, num = "best") {
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
    
    ## For each state, find the hospital of the given rank
    
    all_hospitals[, column] <- as.numeric(all_hospitals[, column])
    
    states = unique(all_hospitals[, 7])
    states <- sort(states)
    num_states <- length(states)
    
    return_data <- matrix(, nrow = num_states, ncol = 2)
    
    for (i in 1:num_states)
    {
        ## print(states[i])
        state_hospitals <- subset(all_hospitals, State==states[i])
        
        return_data[i, 1] <- get_ranked_hospital(state_hospitals, column, num)[1]
        return_data[i, 2] <- states[i]
    }
    
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    
    return_data
}
