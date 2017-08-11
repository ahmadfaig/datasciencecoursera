rankhospital <- function(state, outcome, num = "best"){
    dataRow <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    if(!is.element(state,dataRow$State)){
        stop('invalid state')
    } 
    
    if(!is.element(outcome,c('heart attack', 'heart failure', 'pneumonia'))){
        stop('invalid outcome')
    } 
    
    i <- 0
    if(outcome == 'heart attack'){
        i = 11
    } else if(outcome == 'heart failure'){
        i = 17
    } else {
        i = 23
    }
    
    completeData <- dataRow[complete.cases(as.numeric(dataRow[,i])),c(2,7,i)]
    completeDataState = completeData[completeData[,2] == state,]
    completeDataStateSorted = completeDataState[order(as.numeric(completeDataState[,3]),completeDataState[,1]),]
    
    if(num == "best"){
        num = 1
    } else if(num == "worst"){
        num = nrow(completeDataStateSorted)
    }
    
    if(num > nrow(completeDataStateSorted)){
        NA
    }
    
    return(completeDataStateSorted[num,1])
}

head(outcome[complete.cases(outcome[,11]),c(2,11)][outcome$State == "TX", ][order(outcome[,2], outcome$Hospital.Name),],20)