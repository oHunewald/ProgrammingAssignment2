## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# returns a list of functions to:
# set a matrix
# get a matrix 
# cache the inverse
# get the inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  setMatrix <- function(y) {
    x <<- y
    i <<- NULL
  }
  getMatrix <- function() x
  cacheInverse <- function(inv) i <<- inv
  getsetmean <- function(inv) i <<- inv
  getInv <- function() i
  list(setMatrix = setMatrix, getMatrix = getMatrix,
       cacheInverse = cacheInverse,
       getInv = getInv)
}


## Write a short comment describing this function

# this function is reading the cache value for the inverse matrix
# if the inverse matrix doesn't exists, it calculates it and stores it
# in the cache
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getInv()
  
  # return cached value, if exists
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  # if inverse doesn't exists in cache, calculate it and store it into cache
  myMatrix <- x$getMatrix()
  myInverse <- solve(myMatrix)
  
  x$cacheInverse(myInverse)
  
  myInverse
}
