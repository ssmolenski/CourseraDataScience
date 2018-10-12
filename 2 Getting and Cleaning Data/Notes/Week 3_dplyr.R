# # # dplyr

# # Manipulation with dplyr
library(dplyr)
library(tidyr)
library(readr)

#dplyr works with tabular data from a variet of sources (data tables, 
#databases, multidimentional arrays..). So we begin with a dataframe:
#Remember the stupid hospital DF? Let's make it less stupid.

hosdf<-read.csv("C:\\Users\\Sarah\\Documents\\DataScience\\datasciencecoursera\\RProgramming\\Assignments\\ProgAssignment3\\outcome-of-care-measures.csv",stringsAsFactors=FALSE,na.strings="Not Available")

#We first transform it into a "data frame tibble". 
hospitals<-tbl_df(hosdf)
rm("hosdf")

#Printing a tibble to the console automatically prints only the first ten rows 
#and as many columns as fit neatly in the console. 
#hospitals - don't actually print this, because there are 5 million column 
#names with 100-character long names

#dplyr provides five "verb" functions: select(), filter(), arrange(), mutate(),
#and summarize()

#select() allows us to subset specific columns by name. Note that we can also 
#use the : operator for column names. Columns will be arranged in the order 
#they are passed to select()
data<-select(hospitals, 2, 7, 11, 17, 23)
data
#hint, select has a special function called contains(), which can search for 
#a string in column names

#Or we can specify which columns to exclude with a -:
data2<-select(hospitals,-1,-(3:6),-(8:10),-(12:16),-(18:22),-(24:47))
data2

#rename() lets us quickly rename multiple columns with the syntax NewName = 
#OldName. Don't switch it, dumbass.
data3<-rename(data,Name=Hospital.Name,HeartAttack = Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, HeartFailure = Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, Pneumonia=Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
data3

#filter() allows us to subset rows based on their values, using true/false expressions:
filter(data3,State=="CA")
filter(data3,State=="CA",HeartAttack<=20)
filter(data3,State=="CA",!is.na(Pneumonia))


#arrange lets us sort the data based on data values.
heart_ordered<-arrange(data3,HeartAttack,Name) #third argument is the value to
# sort by WITHIN HeartAttack (ie, the tiebreaker)
arrange(data3,desc(Pneumonia)) #descending order


#mutate() allows us to quickly create calculated columns from others:
mutate(data3,MeanMortality=mean(c(HeartAttack,Pneumonia,HeartFailure),na.rm=TRUE))


#summarize() collapses the dataset to a single row. 
summarize(data3,mean(HeartAttack,na.rm=TRUE))

#This is most powerful when used with grouped data.
#group_by() allows us to group a tibble by values in a given column:
by_state<-group_by(data3,State)
summarize(by_state,mean(HeartAttack,na.rm=TRUE)) #Now we get the mean for each state.
#We can summarize with multiple variables:
state_sum<-summarize(by_state, AvgHeartAttack = mean(HeartAttack,na.rm=TRUE),AvgHeartFailure = mean(HeartFailure,na.rm=TRUE), AvgPneumonia = mean(Pneumonia,na.rm=TRUE))
#within dplyr functions, we can use internal functions like n() and n_distinct
#() to count the number of values or the number of distinct values in a column.

#We can split data by percentages. ie, to get the top 1%:
top1<-quantile(state_sum$AvgHeartAttack,na.rm=TRUE, probs=.01)
top_states<-filter(state_sum,AvgHeartAttack<top1)
arrange(top_states,AvgHeartAttack)


# # Merging Data
#merge() will merge two dataframes that share a measurement. ie, if you 
#gather data from two different sources on the same subject, you can merge 
#those into one df. By default, merge() will merge based on a common column 
#name. If the columns have different labels in each df, those must be 
#passed to the function:
df1<-data.frame(Day=sample(1:50,10,replace=TRUE),Temp=sample(50:100,10,replace=TRUE))
df2<-data.frame(Date=sample(1:50,10,replace=TRUE),Percipitation=seq(0,.9,by=.1))

#all=TRUE will keep all dates from both dfs, even if the other df does not 
#have that date/day recorded.
merge(df1,df2,by.x="Day",by.y="Date",all=TRUE)
#join() from the plyr package does the same thing, but the columns must 
#have the same name. However, this is more convenient if you want to merge 
#more than one data frames with join_all(dflist)


# # # Chaining / Piping
#The %>% operator can be used to pass the result of one function to another 
#function, without having to create temporary variables or use clunky syntax

Heart_sorted<-
    hospitals %>%
    select(2,7,11,17,23) %>%
    rename(Name = Hospital.Name,
            HeartAttack = Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, HeartFailure = Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, Pneumonia = Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
    ) %>%
    group_by(State) %>%
    arrange(HeartAttack,Name)

Heart_sorted


# # # Tidying Data with tidyr

#gather() gathers columns together and turns them into rows, for when column 
#names are actually values. "key" is the name you want to give the column 
#where gather() will store the column... names... (awkward, I know, but it is). 
#"value" is the column name for the values it pulls from the table. By default, 
#gather() will collapse all columns, so be sure to add -column_name for any 
#columns you want to preserve:
gather(df,key,value,-columnname,na.rm=TRUE)

#separate() will separate a single column into two (or more?) columns.
separate()

#spread() is the opposite of gather() and will fix rows that should actually by 
#columns. Now key is the name of the column where the values that SHOULD be 
#columns are stored. value is the values that should be in those columns.
spread(df,key,value)

#parse_number("string") returns the number that it finds in string

