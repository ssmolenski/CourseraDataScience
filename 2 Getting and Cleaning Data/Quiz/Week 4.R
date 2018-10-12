# library(dplyr)
# data2<-read.csv("C:/Users/Sarah/Downloads/data2.csv")

# data2 %>% tbl_df %>%
#         rename(countrycode=X,rank=Gross.domestic.product.2012,country=X.2,gdp=X.3) %>%
#         select(countrycode,rank,country,gdp) %>%
#         mutate_if(is.factor,as.character) %>%
#         filter(countrycode!="",rank!="",country!="",gdp!="") -> data2

# data2$gdp<-gsub(",","",data2$gdp)
# data2$gdp<-as.numeric(data2$gdp)
# data2$rank<-as.numeric(data2$rank)
# mean(data2$gdp)

# data3<-read.csv("C:/Users/Sarah/Downloads/data3.csv")

data3 %>% tbl_df %>%
        rename(countrycode=CountryCode,notes=Special.Notes) %>%
        select(countrycode,notes) %>%
        mutate_if(is.factor,as.character) -> data3

sum(grepl("Fiscal year end: June",data3$notes))


# library(quantmod)
# amzn = getSymbols("AMZN",auto.assign=FALSE)
# sampleTimes = index(amzn)
# sum(year(sampleTimes)==2012)
# from2012<-sampleTimes[year(sampleTimes)==2012]
# sum(weekdays(from2012)=="Monday")