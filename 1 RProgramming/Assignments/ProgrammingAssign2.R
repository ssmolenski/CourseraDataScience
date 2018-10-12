
#Create a list of functions, which can store a matrix and its inverse in one object
makeCacheMatrix <- function(x = matrix()) {

        #initialize an empty matrix for the inverse
        INV<-matrix()

        #set function takes a matrix and stores it in the object. It will also overwrite any stored inverse to a 0 matrix.
        set<-function(y){
                x<<-y
                INV<<-matrix()
        }

        #get function returns the stored matrix
        get<-function() x

        #setinverse takes a matrix and stores it as the inverse
        setinverse<-function(inv) INV<<-inv

        #getinverse returns a stored inverse (or a 0 matrix, if none is set)
        getinverse<-function() INV

        #returns the list of functions to store in the object
        list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}

#Takes a cacheMatrix and sets its inverse if one is not stored. Returns the inverse.
cacheSolve <- function(x, ...) {

        #First check to see if an inverse is already stored...
        INV<-x$getinverse()
        #If the inverse variable is not a 0 matrix, returns the stored inverse value
        if(!all(INV==0)){
                message("Getting cached data")
                return(INV)
        }

        #if no inverse is solved, solve for inverse and store the value in the cacheMatrix
        a<-x$get()
        INV<-solve(a,...)
        x$setinverse(INV)

        #return the calculated inverse
        INV
}
