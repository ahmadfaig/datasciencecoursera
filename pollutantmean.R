pollutantmean <- function(directory, pollutant, id=1:332) {
    
    files = list.files(path=directory, pattern="*.csv")
    MyData <- lapply(paste(directory,"/",files,sep=""), read.csv, header = TRUE, sep=",")
    combined <- do.call(rbind , MyData)
    meanRet <- 0
    if(pollutant=="sulfate"){
        meanRet <- mean(combined$sulfate[combined$ID %in% id], na.rm = TRUE)
    }
    if(pollutant=="nitrate"){
        meanRet <- mean(combined$nitrate[combined$ID %in% id], na.rm = TRUE)
    }
    meanRet
}