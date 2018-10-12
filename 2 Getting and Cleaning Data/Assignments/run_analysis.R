library(dplyr)
library(tidyr)
library(devtools)
library(stringr)

setwd("C:/Users/Sarah/Downloads/Dataset/UCI HAR Dataset")

#Read in the features and split into a vector, then subset only mean/std values
readLines("features.txt") %>% strsplit(" ") -> features
features<-features[grepl("(mean|std)",features)]
features<-features[!grepl("Freq",features)]

#Read in activity labels and transform to neat
activity_labels<-readLines("activity_labels.txt")
activity_labels<-gsub("\\d\\s","",activity_labels)
gsub("\\_"," ",activity_labels) %>% tolower() -> activity_labels

#Read in participant and activity data and turning numbers to labels
readLines("test/subject_test.txt") %>% as.numeric -> subjects_test
readLines("train/subject_train.txt") %>% as.numeric -> subjects_train
participants<-c(subjects_test,subjects_train)
# rm(subjects_test,subjects_train)

readLines("test/y_test.txt") %>% as.numeric -> activity_test
readLines("train/y_train.txt") %>% as.numeric -> activity_train
activity1<-character()
activity2<-character()
for(i in 1:length(activity_test)){
    activity1[i]<-activity_labels[activity_test[i]]
}
for(i in 1:length(activity_train)){
    activity2[i]<-activity_labels[activity_train[i]]
}
activities<-c(activity1,activity2)
# rm(activity_labels,activity_test,activity_train,activity1,activity2)

#Reading in data and removing empty elements
readLines("test/X_test.txt") %>% strsplit(" ") -> data_test
for (i in 1:length(data_test)){
    data_test[[i]]<-data_test[[i]][grepl("\\d",data_test[[i]])]
}

readLines("train/X_train.txt") %>% strsplit(" ") -> data_train
for (i in 1:length(data_train)){
    data_train[[i]]<-data_train[[i]][grepl("\\d",data_train[[i]])]
}

#Extracting the element names and numbers for relevant mean/std data
subset<-numeric()
names<-character()
for(i in 1:length(features)) {
    subset<-c(subset,as.numeric(features[[i]][1]))
    names<-c(names,features[[i]][2])
}

#cleaning up names
gsub("\\-"," ", names) %>%
gsub("\\Q()\\E","", .) %>%
gsub("^t","",.) %>%
gsub("^f","FFT ",.) %>%
gsub("Mag"," magnitude",.) %>%
gsub("BodyAcc[^J]","raw accel signal ",.)%>%
gsub("BodyGyro[^J]","raw gyro signal ",.)%>%
gsub("GravityAcc[^J]","gravity accel ",.)%>%
gsub("Jerk","",.) %>%
gsub("Acc","accel",.) %>%
gsub("Gyro","angular velocity",.) %>%
gsub("Gravity","gravity ",.) %>%
gsub("Body","",.)->names
# rm(features)

#Subsetting only the elements containing mean/std data
for(i in 1:length(data_test)){
    data_test[[i]]<-data_test[[i]][subset]
}

for(i in 1:length(data_train)){
    data_train[[i]]<-data_train[[i]][subset]
}

#bind lists of vectors into data frames and bind participants/activities as new columns
as.data.frame(do.call(rbind, data_test)) %>% tbl_df -> test_df
as.data.frame(do.call(rbind, data_train)) %>% tbl_df -> train_df
data<-rbind(test_df,train_df)
names(data)<-names
data<-mutate(data,participant=participants,activity=activities)
last<-ncol(data)
data<-select(data,last,(last-1),1:(last-2))

#Convert all the shitty factors into numbers
data %>% mutate_if(is.factor,as.character) -> data
for(i in 3:ncol(data)){
    col<-data[[i]]
    newcol<-numeric()
    for(j in 1:length(col)){
        num<-as.numeric(str_extract(col[j], "\\d\\.\\d+"))
        exp<-str_extract(col[j],"e(\\+|\\-)\\d+")
        multiplier <- if (exp=="e+000"){1}
                    else if (exp=="e-001"){.1}
                    else if (exp=="e-002"){.01}
                    else if (exp=="e-003"){.001}
                    else if (exp=="e-004"){.0001}
                    else if (exp=="e-005"){.00001}
                    else if (exp=="e-006"){.000001}
                    else if (exp=="e-007"){.0000001}
                    else if (exp=="e-008"){.00000001}
                    else {exp}
        newcol[j]<-num*multiplier
    }
    data[[i]]<-newcol
}

#write.csv(data,file="tidydata.csv")
write.table(data,"data.txt",row.name=FALSE)

data<-group_by(data,activity,participant)
meandata<-summarize_all(data,mean)

#write.csv(meandata,file="meandata.csv")
write.table(meandata,"summary.txt",row.name=FALSE)



