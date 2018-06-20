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