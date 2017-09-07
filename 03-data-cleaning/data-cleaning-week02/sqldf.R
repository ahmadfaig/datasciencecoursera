install.packages("sqldf")
library(sqldf)
acs = read.csv("data.csv")
sqldf("select pwgtp1 from acs where AGEP < 50")