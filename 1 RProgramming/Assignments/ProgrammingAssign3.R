#Part 1: Plot the 30-day mortality rates for heart attack
outcome<-read.csv("C:\\Users\\Sarah\\Documents\\DataScience\\datasciencecoursera\\RProgramming\\Assignments\\ProgAssignment3\\outcome-of-care-measures.csv",colClasses="character")
#outcome[,11]<-as.numeric(outcome[,11])
#hist(outcome[,11],xlab="Heart Attack Death Rates",main="30-day Death Rates from Heart Attack", ylab="Number of Hospitals")

#Part 2: Finding the Best Hospital
best<-function(state,condition){
    
    #Save the column names
    connames<-replace(names(outcome),c(11,17,23),c("heart attack","heart failure","pneumonia"))

    #Cut out relevant state data and relabel columns
    by_state<-split(outcome,outcome$State)
    instate<-as.data.frame(by_state[state])
    colnames(instate)<-connames
    #coerce data into numeric form, because fuck
    suppressWarnings(instate[condition]<-lapply(instate[condition],as.numeric))
    instate<-instate[complete.cases(instate), ]

    order<-instate[order(instate[condition],instate["Hospital.Name"]),]
    order$RankCol<-c(1:nrow(instate[condition]))
    
    order[1,"Hospital.Name"]
}

#Part 3:
rankhospital <- function(state, condition, num = "best") {
    
    #Extracting state data to usable form
    connames<-replace(names(outcome),c(11,17,23),c("heart attack","heart failure","pneumonia"))
    by_state<-split(outcome,outcome$State)
    instate<-as.data.frame(by_state[state])
    colnames(instate)<-connames
    suppressWarnings(instate[condition]<-lapply(instate[condition],as.numeric))
    #Toss all NA values
    instate<-instate[complete.cases(instate), ]

    #Interpret num input
    rank<-if(num=="best"){
        1
    }else if(num=="worst"){
        nrow(instate[condition])
    }else{
        num
    }

    #Order the data by outcome
    order<-instate[order(instate[condition],instate["Hospital.Name"]),]
    order$RankCol<-c(1:nrow(instate[condition]))
    
    order[which(order$RankCol==rank),"Hospital.Name"]
}

rankall <- function(condition, num = "best") {
    keep<-c(2,7,11,17,23)
    names<-c("hospital name","state","heart attack","heart failure","pneumonia")

    relevant<-outcome[,keep]
    colnames(relevant)<-names

    by_state<-split(relevant,relevant$state)
    
    listed<-matrix(,,2)
    statenames<-names(by_state)
    for(i in statenames){
        listed<-rbind(listed,c(i,rankhospital(i,condition,num)))
    }
    
    colnames(listed)<-c("state","hospital")
    listed<-listed[complete.cases(listed),]


}

