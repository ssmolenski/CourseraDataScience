###############################################################################
#                                Caret Package                                #
###############################################################################

library(caret)
library(kernlab)
data(spam)

#We create a data partition to separate training and test sets, using p=.75 to
#tell the function that we want the training set to be 75% of the data
#The y parameter is the column containing the outcome. You pass this to the
#function to ensure training/test split has proportionally the same amount of
#each outcome.
inTrain <- createDataPartition(y=spam$type, p=.75, list=FALSE)

#Explicitly separate training and testing sets
training <- spam[inTrain,]
testing <- spam[-inTrain,]

#Training a Generalized Linear Model
set.seed(32343)
modelFit <- train(type ~., data=training, method='glm')
modelFit

modelFit$finalModel

#Get predictions from test data
predictions <- predict(modelFit, newdata=testing)
predictions

#To determine accuracy along with false positive / true positive etc values:
confusionMatrix(predictions, testing$type)

###############################################################################
#                                Data Splitting                               #
###############################################################################

#       CROSS VALIDATION

#For Cross Validation, we can split the training set into k "folds".
#list=TRUE parameter tells function to return indicies as a set of lists
#returnTrain=TRUE tells the function to fold the training set, not the test set
#Setting this parameter to FALSE will fold the test set, instead.
folds <- createFolds(y=spam$type, k=10, list=TRUE, returnTrain=TRUE)
sapply(folds, length)

folds[[1]][1:10]
folds[[2]][1:10]

#          RESAMPLING

#If, instead, we wanted to perform resampling or bootstrapping, we can use:
folds2<- createResample(y=spam$type,times=10,list=TRUE)
sapply(folds2, length)

folds2[[1]][1:10]

#       TIME SLICES

tme <- 1:1000
folds3 <- createTimeSlices(y=tms, initialWindow=20, horizon=10)
names(folds3)

###############################################################################
#                                Training Options                             #
###############################################################################

args(train.default)
args(trainControl)

###############################################################################
#                             Plotting Predictors                             #
###############################################################################
library(ISLR)
library(ggplot2)
library(Hmisc)
data(Wage)
summary(Wage)

inTrain <- createDataPartition(y=Wage$wage, p=.7, list=FALSE)

training1 <- Wage[inTrain,]
testing1 <- Wage[-inTrain,]

featurePlot(x=training[,c("age","education","jobclass")],y=training$wage,plot="pairs")

qplot(age, wage, data=training, colour=jobclass)

qq <- qqplot(age, wage, colour=education, data=training)
qq + geom_smooth(method='lm', formula=y~x)

#Breaks data into factors based on quantile groups. From the Hmisc package
cutWage <- cut2(training$wage, g=3)
table(cutWage)

p1 <- qplot(cutWage, age, data=training, fill=cutWage, geom=c("boxplot"))
p2 <- qplot(cutWage, age, data=training, fill=cutWage, geom=c("boxplot", "jitter"))
grid.arrange(p1,p2,ncol=2)

t1 <- table(cutWage, training$jobclass)
t1

prop.table(t1,1) #Proportion in each row

qplot(wage, colour=education, data=training, geom="density")