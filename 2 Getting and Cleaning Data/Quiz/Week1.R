#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv","C:\\Users\\Sarah\\Documents\\DataScience\\datasciencecoursera\\Getting and Cleaning Data\\Notes\\data1")

#data<-read.csv("C:\\Users\\Sarah\\Documents\\DataScience\\datasciencecoursera\\Getting and Cleaning Data\\Notes\\data1.csv")
#Val<-data$VAL #subset the property values
#Val<-Val[complete.cases(Val)] #Remove NAs
#sum(Val>=24) #Find all properties with value>=$1,000,000

#library(xlsx)
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx","C:\\Users\\Sarah\\Documents\\DataScience\\datasciencecoursera\\Getting and Cleaning Data\\Quiz\\data.xlsx",mode="wb")
#dat<-read.xlsx("C:\\Users\\Sarah\\Documents\\DataScience\\datasciencecoursera\\Getting and Cleaning Data\\Quiz\\data.xlsx",1,rowIndex=18:23,colIndex=7:15)
#sum(dat$Zip*dat$Ext,na.rm=T)


#library(XML)
#fileurl<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
#doc<-xmlTreeParse(fileurl,useInternal=TRUE)
#rootNode<-xmlRoot(doc)
#zips<-xpathSApply(rootNode,"//zipcode",xmlValue)
#zips<-as.numeric(zips)
#sum(zips==21231)


#library(data.table)
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv","C:\\Users\\Sarah\\Documents\\DataScience\\datasciencecoursera\\Getting and Cleaning Data\\Quiz\\data2.csv")
#DT<-fread("C:\\Users\\Sarah\\Documents\\DataScience\\datasciencecoursera\\Getting and Cleaning Data\\Quiz\\data2.csv")

#ptm <- proc.time()
#DT[,mean(pwgtp15),by=SEX]
#mean(DT$pwgtp15,by=DT$SEX)
#tapply(DT$pwgtp15,DT$SEX,mean)
#sapply(split(DT$pwgtp15,DT$SEX),mean)
#mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
#rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
#proc.time() - ptm