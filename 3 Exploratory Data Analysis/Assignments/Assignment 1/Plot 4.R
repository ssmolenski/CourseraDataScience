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

png("Plot 4.png")
par(mfrow=c(2,2))
with(data,plot(Date,Global_active_power,type="l"))
with(data,plot(Date,Voltage,type="l"))

with(data,plot(Date,Sub_metering_1,type="l"))
with(data,points(Date,Sub_metering_2,type="l",col="red"))
with(data,points(Date,Sub_metering_3,type="l",col="blue"))
legend("topright",col=c("black","red","blue"), lty=c("solid","solid","solid"), legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))

with(data,plot(Date,Global_reactive_power,type="l"))
dev.off()

