## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#x=matrix results in the solve() to work properly by defining
#the matrix as a square
makeCacheMatrix <- function(x = matrix()) {
}

## Write a short comment describing this function
#argument has defined x as a matrix, which again allows for proper
#operation of the solve() and hopefully no erroneous messages.......
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

# 1. makecachematrix: This function creates a special "matrix" object
#that can cache its inverse:
# Its puspose is to store a martix and a cached value of the inverse of the  
# matrix. Contains the following functions: 
# * setthematrix      set the value of a matrix 
# * getthematrix      get the value of a matrix 
# * cachetheinverse   get the inverse of the matrix
# * gettheinverse     get the inverse of the matrix 
#sources for this project: 
#R Programming for Data Science, Roger Peng, 2015
#R cookbook, Paul Teetor, 2011
#this is my attempt to figure this thing out.........


makeCacheMatrix <- function (x = numeric()) {
  storeddata <- NULL  #retains value to cache or if nothing is stored saves it as "NULL"
  setthematrix <- function(mydata) {  #set the pathway of the matrix
    x <<- mydata  #defines x as "mydata"
    storeddata <<- NULL  #initial run of the function, the cache will be empty b/c of new value designation
  }
  gethematrix <- function() { #gets the stored matrix
    mydata
  }
  settheinverse <- function(solve) {  #the current argument (inverse)  is
    storeddata <<- solve   #then stored in the cache
  }
  gettheinverse <- function() {   #retrieve the cached value (inverse of the Matrix) through the function
    storeddata  #cached value (inverse of the Matrix)
  }
   #return a list. (each element is a defined in the function)
  list(setthematrix = setthematrix, getthematrix = getthematrix, settheinverse = settheinverse, gettheinverse = gettheinverse) 
}

#2. cachesolve: The function is designed to compute the inverse of the special "matrix"
#returned by makecachematrix. should the inverse have already been calculated
#(and the matrix is unchanged), then the cacheSolve should both search the cache and 
#retrieve the inverse from the cache

cacheSolve <- function(x,...) {
  inverse <- x$gettheinverse()   # retrieve the cached value(s)
  if(!is.null(inverse)) {   #if the value is in the cache, the function will return it
    message("hold on a minute, I'm getting the cached data")  #display message of retreiving data
    return(inverse)
  }
  storeddata <- x$getthematrix()    # (1) search the matrix
  inverse <- solve(storeddata)      # (2) calculate the inverse
  x$cachetheinverse(inverse)        # (3) store the data in the cache
  inverse                           # displaythe inverse
}
