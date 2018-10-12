library(dplyr)
library(lubridate)
library(ggplot2)

# data<-read.csv("C:\\Users\\Sarah\\Downloads\\activity.csv")

#Steps per Day
byday <- group_by(data, date)
sums <- summarize(byday, Total=sum(steps, na.rm=TRUE))
p<-ggplot(sums, aes(x=Total))
p+geom_histogram(color="black", fill="cadetblue")
mean<-mean(sums$Total)
median<-median(sums$Total)

#Steps by Interval
byint <- group_by(data, as.factor(interval))
avgs <- summarize(byint, avg=sum(steps, na.rm=TRUE))
avgs<-rename(avgs,interval=1)

g<-ggplot(avgs,aes(x=interval,y=avg, group=1))

g + 
    theme_classic() +
    theme(
            axis.text.x=element_blank(),
            axis.ticks.x=element_blank()
        ) +
    geom_point(color="cadetblue", alpha=1/2) + 
    geom_line(color="gray35")


ind<-which(avgs$avg==max(avgs$avg))
maxint<-avgs$interval[maxint]