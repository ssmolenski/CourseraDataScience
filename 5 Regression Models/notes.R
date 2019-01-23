#library(UsingR)

#The jitter function spreads out data to simlate the measurement errors and make high frequency data more visible.
#plot(jitter(child,4)~parent, galton)

#fit<-lm(child~parent,galton)

x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)

Y<-x*w^(1/2)
X<-w^(1/2)

#Deviance is a measure of badness of fit (higher number indicate worse fit)
deviance(fit)

#The difference between the observed value and the predicted value is called the residual.