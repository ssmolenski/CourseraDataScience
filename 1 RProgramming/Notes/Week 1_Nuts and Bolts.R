# # # # Reference: "R Programming" chapters 3-11

# # # Data Types:

# # Lists:

# Lists are vector-type objects, which can handle elements of differing type.
# Just like vectors, lists can be assigned names at creation:
my_list<-list(foo=1,bar=list("rawr","dino","saur"),bra=1+4i,ket=TRUE)
my_list

# Similarly, lists can be subset in the same ways as a vector. However, depending
# on the method of subsetting, it may return either a list or a vector
my_list[1] #ruturns a list
my_list[[1]] #returns a vector
my_list$bar #returns a vector
my_list["bar"] #returns a a list
my_list[["bar"]] #returns a vector

# Extracting multiple elements can only be done with single brackets:
my_list[c(1,3)] #returns a list

# Trying to pass a vector to a double-bracket operator will actually return the
# 3rd element of the 1st element (which) doesn't exist. But:

my_list[[c(2,3)]]


# # Matrices

# A matrix is exactly what you think it is. Can only contain one data type:
my_matrix<-matrix(1:6,2,3)
my_matrix

#elements can be named after creation:
dimnames(my_matrix)<-list(c("a","b"),c("c","d","e"))
my_matrix

# Subset a matrix using [row,col], or leaving blank to include the whole row/col:
my_matrix[1,2]
my_matrix[ ,3]

# Both of these will return a numeric vector. If we want a matrix, set drop=F:
my_matrix[ , 3, drop=FALSE]

# Factors are vectors with levels (which are different than names)
# think of names as the question and levels as the answer (provided there are 
# a discrete number of choices):
my_factor<-factor(c("male","female","female","trans","nonbinary","female"))
my_factor
table(my_factor)

#R will automatically arrange the levels, unless the order is name explicit.
#Sometimes it's relevant:
my_factor2<-factor(c("agree","agree","strongly disagree", "neutral", "agree", "disagree"),levels=c("strongly agree","agree","neutral", "disagree", "strongly disagree"))
my_factor2


# # Data Frames

# A data frame is like a matrix that can take different types of elements
# (like a list, but a matrix)
my_dataframe<-data.frame(Name=c("Darin",NA,"Emery","Jo","Katy","Quinn"),Gender=my_factor) #apparently you can pass it a factor
my_dataframe

nrow(my_dataframe)
ncol(my_dataframe)

#subsetting data frames works the same as matrices:
my_dataframe[1:3,]

#Find all rows with any NA values:
complete.cases(my_dataframe)
my_dataframe[complete.cases(my_dataframe), ]


# # # Importing data

#read.table takes a file with (default) tab delimiter. 
#read.csv takes files with (default) comma delimiter and header=T
# my_data<-read.csv("C:\\Users\\Sarah\\Documents\\GitHub\\datasciencecoursera\\hw1_data.csv")

#sample()