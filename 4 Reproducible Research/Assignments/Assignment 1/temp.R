library(dplyr)
library(lubridate)
library(ggplot2)

data<-read.csv("C:\\Users\\Sarah\\Downloads\\activity.csv")

# Steps per Day
group_by(data, as.factor(date)) %>%
  summarize( . , Total=sum(steps, na.rm=TRUE)) %>%
  rename( . , date=1) -> sums

p<-ggplot(sums, aes(x=Total))
p+geom_histogram(color="black", fill="cadetblue")
mean(sums$Total)
median(sums$Total)

#Steps by Interval
group_by(data, as.factor(interval)) %>%
  summarize( . , avg=mean(steps, na.rm=TRUE)) %>%
  rename( . ,interval=1) -> avgs

g<-ggplot(avgs,aes(x=interval,y=avg, group=1))

g + 
    theme_classic() +
    theme(
            axis.text.x=element_blank(),
            axis.ticks.x=element_blank()
        ) +
    geom_point(color="cadetblue", alpha=1/2) + 
    geom_line(color="gray35")

avgs$interval[which(avgs$avg==max(avgs$avg))]


#Imputing missing values
sum(is.na(data$steps))


data1 <- data
for (i in 1: length(data1$steps)){
    if (is.na(data1$steps[i])){
        int <- data1$interval[i]
        data1$steps[i] <- avgs$avg[which(avgs$interval==int)]
    }
}
data1 %>%
  group_by( . , date) %>%
  summarize( . , total=sum(steps, na.rm=TRUE)) -> sums1

p1<-ggplot(sums1, aes(x=Total))
p1+geom_histogram(color="black", fill="thistle")
mean(sums1$Total)
median(sums1$Total)


# # Weekdays vs Weekends
data1$date<-as.Date(data1$date)
days<-character(0)
for (i in 1: length(data1$date)){
    if (day(data1$date[i])==6 || day(data1$date[i])==7){
        days[i]<-"Weekend"
    }else{
        days[i]<-"Weekday"
    }
}

day<-factor(days,levels=c("Weekday", "Weekend"))

data1 %>%
  mutate( . , day = day) %>%
  mutate( . ,finterval=as.factor(interval)) %>%
  select( . , c(1,2,5,4)) %>%
  rename( . ,interval=finterval) %>%
  group_by( . ,day,interval) -> data1

data1 %>%
  summarize( . ,avgsteps=mean(steps)) -> avgs1

g1 <- ggplot(avgs1,aes(x=interval,y=avgsteps, group=1))

g1 + 
    theme_classic() +
    theme(
            axis.text.x=element_blank(),
            axis.ticks.x=element_blank()
        ) +
    geom_point(color="aquamarine4", alpha=1/2) + 
    geom_line(color="gray35") +
    facet_grid(.~day)