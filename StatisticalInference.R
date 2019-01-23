library(ggplot2)

#Title
#Overview:
#Simulations: 

#Parameters:
n=1000
lambda<-.2
#Sample data
Sam<-rexp(n, lambda)
#Simulate data
Sim<-matrix(rexp(n*40,lambda),n)
Means<-apply(Sim, 1, mean)
SimMn<-mean(Means)


#Sample Mean versus Theoretical Mean:
#Theoretical mean
TheoMn<-1/lambda
SamMn<-mean(Sam)

#Sample Variance versus Theoretical Variance: 
#Sample variance
SamVar<-var(Sam)

#Theoretical variance
TheoVar<-(-1/lambda)^2

#Distribution: 
hist(Sam)
hist(Sim)


hist(Means)