# library(AppliedPredictiveModeling)
# data(segmentationOriginal)
# library(caret)
# library(e1071)
# library(dplyr)
# library(rattle)

# training <- filter(segmentationOriginal, Case=="Train")
# testing <- filter(segmentationOriginal, Case=="Test")

# set.seed(125)
# modfit <- train(Class~.,method="rpart",data=training) 
# fancyRpartPlot(modfit$finalModel)

#####################################################################################

# library(pgmm)
# data(olive)
# olive = olive[,-1]

# modfit <- train(Area~.,method="rpart",data=olive) 
# newdata = as.data.frame(t(colMeans(olive)))
# predictions <- predict(modfit, newdata)
# predictions

#####################################################################################

# library(ElemStatLearn)
# data(SAheart)
# set.seed(8484)
# train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
# trainSA = SAheart[train,]
# testSA = SAheart[-train,]

# set.seed(13234)

# modfit <- suppressWarnings( train(chd~tobacco+ldl+typea+obesity+alcohol+age,method="glm", family="binomial",data=trainSA) )

# train_pred <- predict(modfit, trainSA)
# test_pred <- predict(modfit, testSA)

# train_val <- trainSA$chd
# test_val <- testSA$chd

# missClass = function(values,prediction){sum(((prediction > 0.5)*1) != values)/length(values)}

# missClass(train_val,train_pred)
# missClass(test_val,test_pred)


#####################################################################################

library(ElemStatLearn)
library(randomForest)
data(vowel.train)
data(vowel.test)

vowel.train$y<-factor(vowel.train$y)
vowel.test$y<-factor(vowel.test$y)

set.seed(33833)

modfit <- randomForest(y~., data=vowel.train)

order(-varImp(modfit))