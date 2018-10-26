# library(dplyr)
# library(ggplot2)
# library(tidyr)

# datfile<-"C:/Users/Sarah/Downloads/StormData.csv"

# if (!file.exists(datfile)){
#     url<-"https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
#     download.file(url, "StormData.zip")
#     unzip("StormData.zip")
# }

# data<-read.csv(datfile)
# sub<-select(data,EVTYPE,FATALITIES,INJURIES,PROPDMG,CROPDMG)
# sub<-group_by(sub,EVTYPE)
# means<-summarize(sub,FATALITIES=mean(FATALITIES),INJURIES=mean(INJURIES),PROPDMG=mean(PROPDMG),CROPDMG=mean(CROPDMG))
# means<-filter(means,FATALITIES!=0 & INJURIES!=0 & PROPDMG!= 0 & CROPDMG!=0)

# gather(means,"Type","Number",2:3) %>% select(EVTYPE,Type,Number) %>% arrange(desc(Number)) -> health

# htypes<-unique(health$EVTYPE[1:14])

# gather(means,"Type","Number",4:5) %>% select(EVTYPE,Type,Number)%>% arrange(desc(Number)) -> property

# ptypes<-unique(property$EVTYPE[1:10])


# ggplot(subset(health,EVTYPE %in% htypes),aes(x=EVTYPE,y=Number,fill=factor(Type)))+
# theme(axis.text.x = element_text(angle = 45, hjust = 1))+
#   geom_bar(stat="identity",position="dodge",color="black")+
#   scale_color_discrete("Type")+
#   xlab("")+ylab("Average Number of People")


ggplot(subset(property,EVTYPE %in% htypes),aes(x=EVTYPE,y=Number,fill=factor(Type)))+
theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  geom_bar(stat="identity",position="dodge",color="black")+
  scale_color_discrete("Type")+
  xlab("")+ylab("Average Damage Cost \n (Millions of Dollars)")

