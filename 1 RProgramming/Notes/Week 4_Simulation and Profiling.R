# # # Simulation and Profiling

# # Viewing Data
# There are many functions built into R for viewing and visualizing data.
# R also includes many built in datasets:
#data() # View the list of built-in datasets
data(morley) # Load a dataset
#?morley # Display info on the dataset
head(morley,5) # Shows the first five rows
tail(morley) # Shows the last six rows
summary(morley) # Displays common statistics of the dataset
str(morley) # Gives more detailed information on the data types and observations
dim(morley) # Prints dimensions of object (rows v cols)
ncol(morley) # Number of columns
nrow(morley) # Number of rows
#table(morley) # Displays data as tables (not super helpful in this case)
split(morley,morley$Expt) #View the results of the 5 separate experiments as a list


# # Simulation

# Generating random numbers:
# Every distribution functions has the following variable prefixes
rnorm(5) #Generates 5 random numbers with a normal distribution
dnorm(0) #Returns the value of the Probability Density Function for a normal
# distribution, given x (the variable), the mean, and the std.
#Note: the integral of the PDF over an interval of time is the probability that some
# event will happen within that interval.
pnorm(2) #Returns integral of PDF from -infinity to q (input argument). Setting
#lower.tail=FALSE will give integral from q to infinity.
qnorm(pnorm(2)) #Opposite of pnorm. Given an probability (the quantile), it will return the
# x-axis value.

#R has many built in distributions in addition to the normal distribution:
#Poisson distribution:
rpois(5,2) #generates 5 random numbers on a poisson dist. with a mean of 2.
#also has dpois(),ppois()... etc.
#Binomial distribution:
rbinom(5,1,.5) #generates 5 0or1 values with 50% chance of each.
#also has dbinom() etc.

#Setting seed allows you to generate the same random numbers (ie, reproducible)
set.seed(1)

#Simulate Linear Model:
set.seed(20)
x<-rnorm(100) #variable
e<-rnorm(100,0,2) #noise
y<-0.5+2*x+e #linear relationship
summary(y)
#plot(x,y)

#Simulate Binary Model:
set.seed(20)
x2<-rbinom(100,1,.5) #binary variable
e2<-rnorm(100,0,2) #noise
y2<-.5+2*x2+e2 #relationship
summary(y2)
#plot(x2,y2)

#Simulate Poisson model:
set.seed(1)
x3<-rnorm(100)
log.mu<-.5+.3*x3
y3<-rpois(100,exp(log.mu))
summary(y3)
#plot(x3,y3)

#Random Sampling:
sample(1:10,4) #draw a random sample from a vector. Can also specify probibility of each outcome.


# # Base Graphics
attach(mtcars)
par(mfrow=c(2,2)) #par can set various plot settings. This will make a 2x2 grid
plot(wt,mpg, main="Scatterplot of wt vs. mpg")
plot(wt,disp, main="Scatterplot of wt vs disp")
hist(wt, main="Histogram of wt")
boxplot(wt, main="Boxplot of wt")




# # Optimization / R Profiler

#Profiling lets you see how much time is spent in different parts of a program
#system.time() takes a function and returns the elapsed time to carry it out

#Don't use system.time along with the R Profiler
#Rprof()
#summaryRprof()
# $by.total and $by.self
# $sample.interval and $sampling.time

