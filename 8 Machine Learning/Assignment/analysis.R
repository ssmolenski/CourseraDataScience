library(caret)
library(ElemStatLearn)
library(randomForest)

setwd("C:\\Users\\Sarah\\Documents\\DataScience\\CourseraSpecialization\\8 Machine Learning\\Assignment")

set.seed(1234)

data <- read.csv("pml-training.csv")[,c(8:11,37:49,60:68,84:86,102,113:124,140,151:160)]
test <- read.csv("pml-testing.csv")[,c(8:11,37:49,60:68,84:86,102,113:124,140,151:160)]


inTrain <- createDataPartition(y=data$classe, p=.70, list=FALSE)
train <- data[inTrain,]
crossVal <- data[-inTrain,]

zeroVar <- nearZeroVar(train)
train <- train[-c(zeroVar,1:7)]
crossVal <- crossVal[-c(zeroVar,1:7)]
test <- test[-c(zeroVar,1:7)]

# N=c(300, 500, 700)
# M=c(10,20)
# A=0
# Nbest=0
# Mbest=0

# for(n in N){
#     cat("For n = ", n, "\n")
#     for(m in M){
#         cat("   and m = ", m, "\n")
#         ffit <- randomForest(classe~., data=train, ntree=n, mtry=m)
#         pred <- predict(ffit, crossVal)
#         acc<-confusionMatrix(pred, crossVal$classe)$overall['Accuracy']
#         cat("      accuracy is ", acc, "\n")

#         if(acc > A) {
#             cat("         new record!\n")
#             A=acc
#             Nbest=n
#             Mbest=m
#             bestfit=ffit
#         }
#     }
# }

bestfit <- randomForest(classe~., data=train)

predictions <- predict(bestfit, test)

