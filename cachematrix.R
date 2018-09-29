# to test this function:
# create a sample square matrix that is reversible (det <> 0)
# matrixobject = matrix(c(1,2,2,1), nrow=2, ncol=2)
# wrapped <- makeCacheMatrix(matrixobject)
# cacheSolve(wrapped)
# cacheSolve(wrapped)

# creates a wrapper for a cached vaue
# usage : wrapped <- makeCacheMatrix(matrixobject)
makeCacheMatrix <- function(x = numeric()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}

# calls on cach wrapper to calculated or use cached value
# cacheSolve(wrapped)
cacheSolve <- function(x, ...) {
    m <- x$getsolve()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setsolve(m)
    m
}