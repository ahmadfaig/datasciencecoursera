corr <- function(directory, threshold = 0){
    temp = complete(directory)
    df = temp[temp$nobs >= threshold,]
    retVal = vector('numeric')
    
    for(i in df$id){
        temp = ""
        if(i<10){
            temp <- paste("00",i,sep="")
        } else if(i<100){
            temp <- paste("0",i,sep="")
        } else {
            temp <- paste("",i,sep="")
        }
        MyData = na.omit(read.csv(paste(directory,"/",temp,".csv",sep=""), sep=","))
        if(nrow(MyData)>0){
            vec_cor<-cor(MyData$nitrate,MyData$sulfate)
            retVal<-c(retVal,vec_cor)
        }
    }
    retVal
}