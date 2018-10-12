# # # # Programming with R

# # Control Structures:

# These are the else/if else/else, for, while, etc. loops. They work pretty much the
# same as you would expect.
# See below for syntax and examples


# # Functions:

#Functions are initialized like any other object, assigning some name to an object "function",
#which takes the arguments of your function.
#Functions can take any sort of object (including other functions) as arguments
#Default values are set by putting an equality in the arguments
#An indefinite number of inputs can be indicated with '...' as an argument. This must have no
#arguments without default values after it.

my_function <- function(func,...,num=1){
        cat("Your function syntax is:", "\n" )
        print(args(func))
    
    #if/else if/else statements can include as many else-ifs as necessary, but
    #they must have an else at the end.
    #if loops without an else can also be used.
    if(num==1){
        print("No value set. Default value will (1) be used")
    } else if (num<=0){
        print("Error: input value must be greater than or equal to 1. Aborting.")
        return(NULL) #Return some value immediately. Otherwise, function will print the last line
    } else{
        print("Default value overridden.")
    }

    #For loops take (variable in sequence), where the iteration variable is incremented after
    #each loop. The does not have to be numeric.
    for(i in 1:num) { 
       
       if(i==2){
           next #skips this iteration of the for loop
       }
        div=num/i
        cat("Iteration:",i, "\n", num, "divided by", i, "is", div, "\n") #cat() is like print(), but better
    }

    #To deal with the indefinite number of input values, unpack them into a list
    args<-list(...)

    #Take care with while loops; they can easily result in an infinite loop
    #This is a bad idea and a for loop would be better, but for education purposes:
    j<-1
    while(j<=length(args)){
        print(args[[j]])
        j<-j+1
    }

    #repeat is JUST an infinte loop until break is encountered. Be wary!
    repeat {
       print("Oh shiii...")
        break
    }

    #If you accidentally fuck up, try esc or ctrl+c to abort
}

#now call the function with suitable input. Note that num must be named to be changed.
my_function(mean,"a","cat",5,T,num=5)

# Binary operators

#Define new operators with
"%operator_name%" <-function(left,right){ #don't forget the "" around the operator
    #stuff happens here
    }

# # Scoping

#Free variables are variables used inside a function that have not been passed in
#as arguments.
#R will search for a definition of the variable the same way it searches for the
#definition of a function, whenever you call a function. 
#ie, if it is defined in your workspace, R will use that definition. If it is not,
#R will continue on down the list of environments until it finds a definition (or not)
freevar<-10
scope_function<-function(x,y){x+y/freevar}

#Scoping lets us do cool things with functions BECAUSE R can have functions inside of
#functions. So a function can return a function, and we can have something like:
make.power<-function(n){
    pow<-function(x){
        x^n
    }
    pow 
}

#make.power returns the function pow, where the input n has already been set
#we can now choose an exponent value and assign that function to some other name:
cube<-make.power(3)
square<-make.power(2)
cube(3)
square(2)

#The input passed to these new functions is actually the value of x, because 
#make.power returned the function pow, which takes only x as an argument, and we then
#assigned that form of pow to cube and square.

#We can check the value of the free variable, n, in each of these functions with:
ls(environment(cube)) #returns all the objects that are defined in an environment
get("n", environment(cube)) #returns the value of n inside the cube environment


# # Dates and Times

#Dates and times have their own respective classes: Date, POSIXct (number of seconds) 
#or POSIXlt (info as list) 
today<-Sys.Date() #The current date as YYYY-MM-DD
weekdays(today) #Gives day of week
months(today) #Gives month
quarters(today) #Gives quarter (winter=1?)
#convert numeric dates to Date class with:
as.Date("2010-02-10")

time<-Sys.time() 
timelist<-as.POSIXlt(time) #coerces time into POSIXlt form
str(unclass(timelist)) #prints the time as a neat list
timelist$year #extract the year from time

#We can also use strptime to convert strings to times
datestring<-"September 29, 1991 04:23"

extractdate<-strptime(datestring,"%B %d, %Y %H:%M")
age<-Sys.time()-extractdate
cat("My birthday is ", datestring,". I am ", age, "seconds old.")



# # Other functions and shit

#seq_along()
#seq_len()
#mean() has a rm.na argument that will remove NAs from the values passed to it