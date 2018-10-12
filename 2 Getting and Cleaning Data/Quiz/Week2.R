#1


#2
# # Did not need this at ALL
# library(sqldf)
# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv","C:\\Users\\Sarah\\Documents\\DataScience\\datasciencecoursera\\Getting and Cleaning Data\\Quiz\\data2.0.csv")
# acs<-read.csv("C:\\Users\\Sarah\\Documents\\DataScience\\datasciencecoursera\\Getting and Cleaning Data\\Quiz\\data2.0.csv")



#3
#Accessing lines in an html document is unnecessarily complicated. We can read the html text in line by line with readLines(), which can then be subset like a vector.
con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])



#4
# .for files are fixed width files. They can be read with the default R:
# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for","C:\\Users\\Sarah\\Documents\\DataScience\\datasciencecoursera\\Getting and Cleaning Data\\Quiz\\data2.2.for")
#For some reason if you try to read it straight from the web it gives a 
#different answer.
# df <- read.fwf(
#   file= "C:\\Users\\Sarah\\Documents\\DataScience\\datasciencecoursera\\Getting and Cleaning Data\\Quiz\\data.for",
#   widths=c(-1, 9, -5, 4, 4, -5, 4, 4, -5, 4, 4, -5, 4, 4), #These are the 
#   #widths of the columns, counted manually. (-) values indicate columns to 
#   #be ignored (ie, whitespace). This automatically separates the two data 
#   #values that are smushed together in the file.
#   skip=4
# )
# sum(df[,4])






