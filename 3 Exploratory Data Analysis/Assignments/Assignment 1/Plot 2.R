library(dplyr)
library(tidyr)
library(lubridate)

if (!file.exists("household_power_consumption.txt")){
    url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(url,"data.zip")
    unzip("data.zip")
}

data<-read.table("household_power_consumption.txt", header=TRUE, na.strings="?",sep=";")
data<-unite(data,"Date",Date,Time,sep=" ")
start<-ymd("2007-02-01")
end<-ymd("2007-02-03")
data[["Date"]]<-strptime(data[ ,1],"%d/%m/%Y %H:%M:%S")
data <- subset(data, Date >= start & Date < end)

png("Plot 2.png")
with(data,plot(Date,Global_active_power,type="l",ylab="Global Active Power (kilowatts)"))
dev.off()