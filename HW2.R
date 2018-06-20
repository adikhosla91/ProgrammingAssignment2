## The first fucntion does the follwoing jobs:
## set the value of the matrix
## get the value ot the mateix
## set the value of the inverse matrix
## get the value of the inverse matrix
makecachematrix<-function(x=matrix()){
  m<-NULL
  set<-function(y){
    x<<-y
    y<<-NULL
  }
  get<-function()x
  setinverse<-function(solve) m<<-solve()
  getinverse<- function()m
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

## the second function does the following jobs:
## it checks if the inverse of the matrix exist in the cache memory and returns the answer from the cahe memery without computation
## if not it retrns the result and stores the value in the cache memory
cachesolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data,...)
  x$setinverse(m)
  m
}
