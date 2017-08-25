## These functions will help creating a Matrix with cache capabilities.
## Calculation that is going to be cached is inverse of matrix result.

## makeCacheMatrix will take a matrix and return a list of four functions
## attributed to the matrix given.

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## cacheSolve will serve as validator to check if there is a cached value
## to avoid recalculation.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()
        if(!is.null(i)) {
            message("getting cached data")
        }
        data <- x$get()
        i = solve(data, ...)
        x$setinverse(i)
        i
}
