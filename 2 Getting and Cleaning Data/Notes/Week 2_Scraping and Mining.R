# # Reading Data With SQL

#Databases are linked tables for data storage. We can access databases via
# the SQL language, which can be used in conjunction with other language
# (like R).

#There are numerous R packages for use with SQL. Which one you use is
# determined by what sort of database you wish to connect to. ie, if a
# database is hosted via MySQL, you must use RMySQL to connect to it.
#Other databases:
#PostgresSQL - RPostgresSQL
#Oracle Database - ROracle
#These R packages connect to the databases, but the actual manipulation of
# data within R comes from the DBI package. It's not necessary to add the 
#other packages to the library.
#It also doesn't appear necessary to actually install MySQL in any other way
#than through the RMySQL installation

#library(DBI)

# #Connect to the database. Store the connection in an object, which can then
# # be passed to DBI functions.
# con<-dbConnect(RMySQL::MySQL(),
#         dbname="company",
#         host="courses.csrrinzqubik.us-east-1.rds.amazonaws.com",
#         port=3306,
#         user="student",
#         password="datacamp") #Not all databases will require all of these

# dbListTables(con) #lists all the tables stored within the database. There
# # might be a lot.
# dbReadTable(con, "employees") #prints out the employees table (be careful,
# # it might be giant). Can be stored in an object.

# #dbGetQuery takes SQL commands and applies them to a database.
# result<-dbGetQuery(con,"show databases;") #result will hold a dataframe of 
# #all the databases available on the MySQL server. This is useful if you
# #don't know which database to connect to (or what the name is). However, 
# #we have already explicitly connected to a database within con, by setting
# # dbname

# dbListFields(con,"employees") #Lists column names within table

# dbGetQuery(con,"select count(*) from employees") #Count number of rows
# query<-dbSendQuery(con,"select * from employees where id between 1 and 6") #Select only a subset of the data by using an SQL command and dbSendQuery.
# # This creates a connection, NOT a table.
# Employees1to6<- fetch(query) #This creates the dataframe with only employees
# # who had id numbers between 1 and 6.
# quantile(Employees1to6$id) #Displays quantiles, which is very not helpful
# #for this particular subset of data.

# EmployeeSmall<-fetch(query,n=2) #fetches only the top two results
# dim(EmployeeSmall)
# print(EmployeeSmall)
# dbClearResult(query) #Closes the connection

# dbDisconnect(con) #When you're finished accessing the database, explicitly 
# #disconnect.

# # Reading/Writing Data with HDF5

#HDF5 stands for Hierarchal Data Format; HDF5 is made up of nested groups,
# which contain one or more data sets and their respective data, and
# datasets, which can be multidimensional arrays of data elements with
# metadata.

#library(rhdf5)

#create an hdf5 file
# created=h5createFile("example.h5")

# created=h5createGroup("example.h5","Group 1")
# created=h5createGroup("example.h5","Group 2")
# created=h5createGroup("example.h5","Group 1/A")
# h5ls("example.h5")

# Animals=matrix(c("dolphin","shark","cat","bear"),nr=2,nc=2)
# h5write(Animals,"example.h5","Group 1/Animals")
# Arr=array(seq(.1,2.0,by=.1),dim=c(5,2,2))
# attr(Arr,"scale")<-"liter"
# h5write(Arr,"example.h5","Group 1/A/Art")
# h5ls("example.h5")

# df=data.frame(1L:5L,seq(0,1,length.out=5), c("ab","cde","fghi","a","s"),
#     stringsAsFactors=FALSE)
# h5write(df,"example.h5","df")
# h5ls("example.h5")

# readAnimals=h5read("example.h5", "Group 1/Animals")
# readArt=h5read("example.h5","Group 1/A/Art")
# readdf=h5read("example.h5","df")
# readAnimals

# h5write(c("dog","gorilla"),"example.h5","Group 1/Animals",index=list(1:2,1))
# h5read("example.h5","Group 1/Animals")

# # Reading Data from the Web
#Webscraping is programatically extracting data from the HTML code of websites

# con=url("https://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
# htmlCode=readLines(con)
# close(con)
# htmlCode

library(XML)
url<-"http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html<-htmlTreeParse(url,useInternalNodes=TRUE)
xpathSApply(html,"//title", xmlValue)

# library(httr)
# html2=GET(url)
# content2=content(tml2,as="text")
# parsedHtml=htmlParse(content2,asText=TRUE)
# xpathSApply(parsedHtml,"//title",xmlValue)

# google=handle("http://google.com") #Setting a handle allows you to authenticate only once.

# # Reading Data from APIs
#FIGURE OUT HOW TO USE AN API