complete <- function(directory, id=1:332) {
    df <- data.frame(id=integer(), nobs=integer())
    for(i in id){
        temp = ""
        if(i<10){
            temp <- paste("00",i,sep="")
        } else if(i<100){
            temp <- paste("0",i,sep="")
        } else {
            temp <- paste("",i,sep="")
        }
        MyData = read.csv(paste(directory,"/",temp,".csv",sep=""), sep=",")
        sumnobs = sum(complete.cases(MyData))
        df[nrow(df) + 1,] = c(i,sumnobs)
    }
    df
}