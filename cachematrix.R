## These functions work together in an Objec Oriented Programming philosophy. The first one (makeCacheMatrix) 
## receives a matrix, stores it and caches its inverse. The second (cacheSolve) calculates the inverse of the 
## matrix and returns to the first function.

## The function makeCacheMatrix receives a matrix, stores it, caches its inverse. This is made possible by 
## returning a list of functions 

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        
        set <- function(y) {
                x <<- y
                m <<- NULL
                
        }
        
        get <- function() {x}
        
        setinv <- function(solve) {m <<- solve}
        
        getinv <- function () {m}
        
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## The function cacheSolve uses the functions returned by makeCacheMatrix for testing if the inverse of the
## matrix has been already calculated. If so, it returns the inverse of the matrix. If not, it calculates it 
## returning the value for makeCacheMatrix.

cacheSolve <- function(x, ...) {
        m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m
}
