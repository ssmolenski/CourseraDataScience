pollutantmean<-function(directory,pollutant,id=1:332){
    #set the pollutant type
    polltype<-if(pollutant=="sulfate"){
        2
    }else if(pollutant=="nitrate"){
        3
    }else{
        cat("Invalid pollutant name: ", pollutant, ". Please enter sulfate or nitrate.","\n")
        return(NULL)
    }

    #read in the data and combine in a single vector
    olddir<-getwd()    
    setwd(directory)
    data<-numeric()
    for(i in id){
        if(i<10){
            filename<-paste("00",i,".csv",sep="")
        } else if(i<100) {
            filename<-paste("0",i,".csv",sep="")
        } else if(i<=332) {
            filename<-paste(i,".csv",sep="")
        } else {
            cat("Invalid id: ", i, ". Please enter a range between 1 and 332.", "\n")
            return(NULL)
        }
        newdata<-read.csv(filename)
        data<-c(data,newdata[ , polltype])
    }

    setwd(olddir)
    mean(data,na.rm=TRUE)
}

complete<-function(directory,id=1:332){
    olddir<-getwd()    
    setwd(directory)

    datasums<-data.frame(id=numeric(),nobs=numeric())
    newrow<-data.frame(id=numeric(),nobs=numeric())
    for(i in id){
        if(i<10){
            filename<-paste("00",i,".csv",sep="")
        } else if(i<100) {
            filename<-paste("0",i,".csv",sep="")
        } else if(i<=332) {
            filename<-paste(i,".csv",sep="")
        } else {
            cat("Invalid id: ", i, ". Please enter a range between 1 and 332.", "\n")
            return(NULL)
        }

        data<-read.csv(filename)
        newrow[1,2]<-sum(complete.cases(data))
        newrow[1,1]<-i
        datasums<-rbind(datasums,newrow)
    }
    setwd(olddir)
    return(datasums)
}

corr<-function(directory,threshold=0){
    
    completedata<-complete(directory)
    corrvalue<-numeric()
    filenums<-numeric()
    
    for(i in seq_along(completedata[,1])){
        if(completedata[i,2]>threshold){
            filenums<-c(filenums,completedata[i,1])
        }
    }

    if(length(filenums)==0){
        return(filenums)
    }

    olddir<-getwd()
    setwd(directory)
    for(i in filenums){
        if(i<10){
            filename<-paste("00",i,".csv",sep="")
        } else if(i<100) {
            filename<-paste("0",i,".csv",sep="")
        } else {
            filename<-paste(i,".csv",sep="")
        }
        raw<-read.csv(filename)
        noNA<-raw[complete.cases(raw),]
        s_vs_n<-noNA[,2:3]
        corrvalue<-c(corrvalue,cor(s_vs_n)[1,2])
    }

    setwd(olddir)
    return(corrvalue)

}