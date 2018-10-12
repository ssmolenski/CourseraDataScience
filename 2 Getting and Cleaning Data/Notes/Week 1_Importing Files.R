# # Downloading Files in R
# Scripting data download makes the process reproducible, so that it can be
# included in the final process.

file.exists("directoryName") #checks working directory for a directory. Bool
#dir.create("directoryName") #creates a directory within the working directory
list.files()

download.file() #download data from a specified url into a destination file. 
#Agnostic to file type.
date() #Keep track of date that data was accessed

# # Reading in data

#na.strings: when reading in data with read.table or read.csv, specify 
#character(s) that represents a missing value.

library(xlsx)
read.xlsx() #requires xlsx package
#Can read only specific rows or columns from an excel file.
read.xlsx2() #faster, but don't use for subsetting data when reading in.

#XML is the basis for most web scraping. This is the actual html code to 
#generate a given webpage (etc)
#Right click -> view source to view html file
library(XML)
doc<-xmlTreeParse(fileUrl)
htmldoc<-htmlTreeParse()
rootNode<-xmlRoot(doc) #RootNodes can be subset just like lists.
rootNote[[1]]
rootNode[[1]][[1]]
xmlName()
xmlSApply() #Like sapply... but for XML rootnodes instead of lists
#More information about accessing data with XPath (separate language)

#JSON files are Javascript files
library(jsonlite)
jsonData<_fromJSON(url)
#Subset json files much like data.frames (arrays may be nested)
myjson<-toJSON() #write as json file
data2<-fromJSON(myjson) #Creates data.frame

# # Data Table
#Like a data frame, but in C and more efficient
library(data.table)
data.table()
tables() #table() for data tables
#subsetting columns is weird