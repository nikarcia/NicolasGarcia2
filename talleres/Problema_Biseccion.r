#Problema Bisección
#Esteban Moreno & Pablo Veintemilla

bisect <- function(f, a, b, maxiter = 100, tol = NA)
{
  if (!is.na(tol)) warning("Deprecated: Argument ’tol’ not used anymore.")
  if (f(a)*f(b) > 0) stop("f(a) and f(b) must have different signs.")
  x1 <- min(a, b); x2 <- max(a,b)
  xm <- (x1+x2)/2.0
  n <- 1
  while (x1 < xm && xm < x2 && n < maxiter) {
    n <- n+1
    if (sign(x1) != sign(x2) && x1 != 0 && x2 != 0) {
      xm <- 0.0
      if (f(xm) == 0.0) {x1 <- x2 <- xm; break}
    }
    if (sign(f(x1)) != sign(f(xm))) {
      x2 <- xm
    } else {
      x1 <- xm
    }
    xm <- (x1 + x2) / 2.0
  }
  return(list(root=xm, f.root=f(xm), iter=n, estim.prec=abs(x1-x2)))
}
regulaFalsi <- function(f, a, b, maxiter = 100, tol = .Machine$double.eps^0.5)
  
{
  x1 <- a; x2 <- b
  f1 <- f(x1); f2 <- f(x2)
  if (f1*f2 > 0) stop("f(a) and f(b) must have different signs.")
  m <- 0.5 # Illinois rule
  niter <- 0
  while (abs(x2-x1) >= tol && niter <= maxiter) {
    niter <- niter + 1
    x3 <- (x1*f2-x2*f1)/(f2-f1); f3 <- f(x3)
    if(f3*f2 < 0) {
      x1 <- x2; f1 <- f2
      x2 <- x3; f2 <- f3
    } else {
      # m <- f2/(f2+f3) 
      # m <- if (1-f3/f2 > 0) 1-f3/f2 else 0.5 # Andersen/Bjoerk
      f1 <- m * f1
      x2 <- x3; f2 <- f3
    }
  }
  if (niter > maxiter && abs(x2-x1) >= tol)
    cat("regulaFalsi stopped without converging.\n")
  return(list(root = x3, f.root = f3, niter = niter, estim.prec = x1-x2))
}

require(pracma)
f = function(x) exp(x)
bisect(f, 0, 3, 1e-8)
