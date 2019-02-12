data(mtcars)

head(mtcars)

boxplot(mtcars$mpg~mtcars$am)

fit1<-lm(mpg~factor(am),data=mtcars)
summary(fit1) 
fit2<-lm(mpg~factor(am)+wt,data=mtcars)
summary(fit2)
fit3<-lm(mpg~factor(am)+wt+hp,data=mtcars) #when we include both hp and wt, we find that the coeff transmission type is no longer statistically significant (large std error). This implies that wt and hp are highly correlated (understandable).
summary(fit3)
fit4<-lm(mpg~factor(am)+hp,data=mtcars)
summary(fit4)


plot(fit1,which=1)
plot(fit2,which=1)
plot(fit3,which=1)
plot(fit4, which=1)

#residual plot for fit4 looks the best

summary(fit4) #slope coef is difference in mean of mpg of automatics and manuals. ie, manuals have a 5.277 mpg increase, on average.
