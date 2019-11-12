#Problema Función Steffensen
#nicolas garcia


FuncionSteffensen = function(f,x0,tol)
{
  
  Ei = c() #vector
  Ej = c() #vector
  issues = c() #vector
  ite = c() #vector

  cat(formatC(c("i","x_i","f(x)","Error est."), width = -15, format = "f", flag = " "),"\n")
  maxi = 1000
  i = 1
  while (i <= 1000)
  {
    ite = c(ite,i)
    x1 = x0 - ((f(x0))^2)/(f(x0+f(x0))-f(x0))
    Error = abs(x1 - x0)
    issues = c(Errores, Error)
    x0 = x1
    cat(formatC( c(i,x0,f(x0),Error), digits = 8, width = -15, format = "f", flag = " "), "\n")
    if(Error < tol)
      break;
    i = i + 1
    
  }
  cat("Cero de funcion: ", x0, " con error <=", Error, "iteraciones: ", i)
  plot(ite,issues, type = "l", xlab = "No. Iteraciones",ylab="Error")
  #Errores Ei vs Ei+1
  for(b in 1:i){
    if(b!=i){
      Ei[b]=issues[b]
      Ej[b]=issues[b+1]  
    }
  }
  plot(Ei,Ej, type = "l", xlab = "Error i",ylab="Error i+1")
}


f = function(x) exp(x)-pi*x
FuncionSteffensen(f, 0, 1e-6)