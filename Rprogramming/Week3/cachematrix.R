## functions do

## Write a short comment describing this function
##makeCacheMatrix consists of set,get,getinverse and setinverse
makeCacheMatrix <- function(x = matrix()) { ##default is matrix
    m<-NULL
    set<-function(y){
        x<<-y
        m<<-NULL
    }
    get<-function()x ##returns value of the matrix argument
    setinverse<-function(invMatrix)m<<-invMatrix
    getinverse<-function()m
    list(set=set,get=get,
         setinverse=setinverse,
         getinverse=getinverse)

}



## Write a short comment describing this function
##Used to get cached data
cacheSolve <- function(x, ...) {
    m<-x$getinverse()
    if(!is.na(m)){
        ## Return a matrix that is the Inverse of 'x' 
        message("getting cached data")
        return (m)
    }
    data<-x$get()
    m<-solve(data,...)
    x$setinverse(m)
    m
}
