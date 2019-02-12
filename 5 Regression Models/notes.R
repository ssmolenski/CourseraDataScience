#library(UsingR)

#The jitter function spreads out data to simlate the measurement errors and make high frequency data more visible.
plot(jitter(child,4)~parent, galton)

fit<-lm(child~parent,galton)

x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)

Y<-x*w^(1/2)
X<-w^(1/2)

#Deviance is a measure of badness of fit (higher number indicate worse fit)
deviance(fit)

#The difference between the observed value and the predicted value is called the residual.

#Relevel a factor with the given variable as the first level. This can be used for comparing all variables to this one (first) variable in multivariable models.
xnew<-relevel(factor,"level")
fit2<-lm(y~xnew)
#The estimate column will tell how much each variable mean differs from the mean of the chosen level. The intercept will be the mean of the chosen level.
summary(fit2)$coef

#dfbeta calculates the effect each point has on each coefficient
head(dfbeta(fit))

#rstandard computes the standard residual for each point
head(rstandard(fit))

#the which=1 parameter in plot allows you to easily plot residuals
plot(fit,which=1)

#which=3 plots Scale-Location plot, which shows the sqrt of standard residuals against fitted values
plot(fit,which=3)

#which=2 plots standardized residuals against theoretical values (Normal QQ Plot)
plot(fit,which=2)

#rstudent calculates the Studentized residuals for each point. Studentized residuals estimate the stdev of individual residuals.
head(rstudent(fit))

#Cook's distance is the sum of the squared differences between values fitted with and without a particular sample.
head(cooks.distance(fit))
plot(fit,which=5)

#Use the generalized linear model function to create models for not-necessarily linear data (ie, binomial data):
glm(y~x, family="binomial")

#confint() will give the exact lower and upper bounds to the 95% confidence interval for the coefficients of a model
conlfint(fit)