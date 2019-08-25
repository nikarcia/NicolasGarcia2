formula = function(f, x0, x1, tol){
  
  k = 0
  #Par imprimir estado
  cat("----------------------------------------------------------\n")
  cat(formatC( c("x1","x2"), width = -15, format = "f", flag = " "), "\n")
  cat("----------------------------------------------------------\n")
  x2=0

  
  if((f(x1)*f(x0))<0){
    
  repeat{
    
    x2 =(x1-(f(x1)/(f(x1)-f(x0)))*(x1-x0))
    
    cat(formatC( c(x1,x2), digits=7, width = -15, format = "f", flag = " "), "\n")
    
    if ( (f(x2)*f(x1))<0){
      x0=x1
      x1=x2
      
    }
    if((f(x2)*f(x1))>=0){
      x1=x2
      x0=x0}
    
    
    # imprimir estado
    cat(formatC( c(x1,x2), digits=9, width = -15, format = "f", flag = " "), "\n")
    k = k+1
    
    
    #until
    if( abs(f(x2))<tol ){
      cat("----------------------------------------------------------\n\n")
      cat("Cero de f es approx: ", x2 ,"iteraciones", k)
      break;
    }
    
  } #repeat
  }#if 
}
## Pruebas
f = function(x) log(x+2)-sin(x)

curve(f, -3,3); abline(h=0, v=0) #gráfico para decidir un intervalo
options(digits = 15)
formula(f, -1.8, -1, 0.000000001)

