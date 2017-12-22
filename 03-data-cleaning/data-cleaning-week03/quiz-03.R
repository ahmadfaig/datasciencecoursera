if(!file.exists("./data")){dir.create("./data")}
fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
download.file(fileUrl,destfile = "./data/GDP.csv",method="curl")
fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
download.file(fileUrl,destfile = "./data/education.csv",method="curl")

GDPData<-read.csv("./data/GDP.csv")

educationData<-read.csv("./data/education.csv")

mergedData <- merge(educationData,GDPData[5:194,],by.x = "CountryCode",by.y="X", all=FALSE)

mergedDataSort <- mergedData[order(as.numeric(gsub(",","",mergedData$X.3))),]

mean(as.numeric(as.character(mergedDataSort[mergedDataSort$Income.Group=="High income: OECD",]$Gross.domestic.product.2012)))

mean(as.numeric(as.character(mergedDataSort[mergedDataSort$Income.Group=="High income: nonOECD",]$Gross.domestic.product.2012)))