test = function(mat){
    ## @mat: an invertible matrix
    
    temp = makeCacheMatrix(mat)
    
    start.time = Sys.time()
    cacheSolve(temp)
    dur = Sys.time() - start.time
    print(dur)
    
    start.time = Sys.time()
    cacheSolve(temp)
    dur = Sys.time() - start.time
    print(dur)
}

## Try it on a matrix of 1000 rows and 1000 columns filled with normal random numbers.

set.seed(1110201)
r = rnorm(1000000)
mat1 = matrix(r, nrow=1000, ncol=1000)
test(mat1)