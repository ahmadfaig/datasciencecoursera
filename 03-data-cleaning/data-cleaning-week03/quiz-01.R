if(!file.exists("./data")){dir.create("./data")}
fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(fileUrl,destfile = "./data/housingData.csv",method="curl")

housingData<-read.csv("./data/housingData.csv")

agricultureLogical <- (housingData$ACR == 3 & housingData$AGS == 6)

print(which(agricultureLogical))