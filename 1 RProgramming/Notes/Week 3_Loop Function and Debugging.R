# # # Loop Functions and Debugging

# # Loop Functions

#lapply loops over a list and evaluate a function on each element
x<-list(a=1:5, b=rnorm(10), c=rnorm(20),d=rnorm(15))
lapply(x, mean)

#lapply can also be used with annonymous functions (ie, define the
#function within the function call):
y<- list(a=matrix(1:4,2,2), b=matrix(1:6,3,2)) 
lapply(y, function(elt) elt[,1]) #extracts first collumn

#sapply is the same as lapply, but the return value will be simplified
sapply(x,mean) #returns a numeric vector instead of a list

#apply is used to apply a function to the rows or columns of a matrix/array
z<-matrix(rnorm(200),20,10)
apply(z,2,mean) 
#second argument says which dimension to preserve. All other dimensions
# will be collapsed (ie, this will sum over all 10 columns, preserving 
#the 10 and collapsing the 20 rows). Or, function is applied over the 
#given dimension (1 or 2, in this case, meaning average the rows or columns)

#vapply is like sapply, except you specify the expected final result
#it will throw an error if the result is different from the specification.

# mapply() can take multiple lists/matrices etc. and pass them in parrallel 
# to a function: (set of args after fun must match the number of args that fun takes)
mapply(rep,1:4,4:1)
names<-c("Gary","Mandy","Jo","Tara")
junc<-rep("is",4)
gender<- c("a man", "a woman","gender non-conforming", "a trans woman")
mapply(paste,names,junc,gender)


#tapply() apply a function over subsets of a vector, where the second 
#argument, INDEX, is a factor or list of factors, which sorts the values
#of the first argument into groups
menages<-c(sample(100,5))
womenages<-c(sample(100,5))
otherages<-c(sample(100,5))
allages<-c(menages,womenages,otherages)
f<-gl(3,5,labels=c("men","women","other")) #generates a factor of labels
tapply(allages,f,mean) #takes the mean in each category
tapply(allages,f,range) #gives min/max for each category

#split takes an object and splits it into groups as defined by the factor:
split(allages,f,drop=FALSE) #returns a list. Drop removes empty levels
#This can be useful in splitting more complicated data objects, such as
#dataframes. The dataframe can even be subset and a column passed as f.

interaction()


# # Debugging Tools

# message() warning() stop()
# traceback() 
# debug() type n to move to next line
# browser() trace() 
#recover() options(error=recover)


# # Other stuff
#runif()
#rowSums(),rowMeans(), colSums(), colMeans()
#An array is a matrix of arbitrary dimensions
#summary()
#head()
#invisible()