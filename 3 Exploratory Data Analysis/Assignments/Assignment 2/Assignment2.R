library(dplyr)
library(ggplot2)

if (!file.exists("Source_Classification_Code.rds")){
    url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
    download.file(url,"data.zip")
    unzip("data.zip")
}

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
group_by(NEI,year) %>% summarize(total=sum(Emissions)) -> totals

png("plot1.png")
with(totals,plot(year,total, xaxt="n", pch=19, main="Total pm2.5 in US"))
axis(side=1,at=c(1999,2002,2005,2008))
dev.off()

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips=="24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
subset(NEI, fips=="24510") %>% group_by(year) %>% summarize(total=sum(Emissions)) -> Baltimoretotals

png("plot2.png")
with(Baltimoretotals,plot(year,total, xaxt="n", pch=19, main="Total pm2.5 in Baltimore"))
axis(side=1,at=c(1999,2002,2005,2008))
dev.off()

# Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
subset(NEI, fips=="24510") %>% group_by(year,type) %>% summarize(total=sum(Emissions)) -> Baltimorettotals

png("plot3.png")
qplot(year,total,data=Baltimorettotals,facets=.~type, main="Total pm2.5 in Baltimore") + geom_smooth(method="lm",se=FALSE, lwd=.5, col="black")
dev.off()

# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
clevels<-levels(SCC$EI.Sector)[c(13,18,23)] 
SCCcoal<-filter(SCC,EI.Sector %in% clevels)
filter(NEI, SCC %in% SCCcoal$SCC) %>% group_by(year) %>% summarize(total=sum(Emissions)) -> coalcomb

png("plot4.png")
with(coalcomb, plot(year, total, main="Total pm2.5 from Coal Combustion in US"))
dev.off()

# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
mlevels<-levels(SCC$EI.Sector)[43:52] 
SCCmobile<-filter(SCC,EI.Sector %in% mlevels)
filter(NEI, SCC %in% SCCmobile$SCC) %>% filter(fips=="24510") %>% group_by(year) %>% summarize(total=sum(Emissions)) -> Baltimoremobile

png("plot5.png")
with(Baltimoremobile, plot(year, total, main="Total pm2.5 from motor vehicles in Baltimore"))
dev.off()

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips=="06037"). Which city has seen greater changes over time in motor vehicle emissions?

filter(NEI, SCC %in% SCCmobile$SCC) %>% filter(fips=="06037") %>% group_by(year) %>% summarize(total=sum(Emissions)) -> LAmobile

png("plot6.png")
par(mfrow=c(1,2), oma=c(2,2,5,1))
with(Baltimoremobile, plot(year, total, ylim=c(0,11000),main="Baltimore"))
with(LAmobile, plot(year,total,ylim=c(0,11000),yaxt="n",main="LA"))
axis(2,at=c(2000,4000,6000,8000,10000))
title(main="Total pm2.5 from motor vehicles", outer=TRUE)
dev.off()