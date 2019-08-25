#------------------------
#1er Parcial númerico
#Jose Nicolas Garcia Pineda
#------------------------

# 1.a) Implemente en R o Python un algoritmo que le permita sumar ´unicamente los elementos de la
# sub matriz triangular superior o triangular inferior, dada la matriz cuadrada An. Imprima varias
#| pruebas, para diferentes valores de n y exprese f(n) en notaci´on O() con una gr´afica que muestre
# su orden de convergencia

upperTriangle <- function(x, diag=FALSE, byrow=FALSE)
{
  if(byrow)
    t(x)[rev(upper.tri(x, diag=diag))]
  else
    x[upper.tri(x, diag=diag)]
  
}

"upperTriangle<-" <- function(x, diag=FALSE, byrow=FALSE, value)
{
  if(byrow) {
    ret <- t(x)
    ret[rev(upper.tri(x, diag=diag))] <- value
    t(ret)
  }
  else {        
    x[upper.tri(x, diag=diag)] <- value
    x
    
  }
}

lowerTriangle <- function(x, diag=FALSE, byrow=FALSE)
{
  if(byrow)
    t(x)[rev(lower.tri(x, diag=diag))]
  else
    x[lower.tri(x, diag=diag)]
  
}

"lowerTriangle<-" <- function(x, diag=FALSE, byrow=FALSE, value)
{
  if(byrow) {
    ret <- t(x)
    ret[rev(lower.tri(x, diag=diag))] <- value
    t(ret)
  }
  else {        
    x[lower.tri(x, diag=diag)] <- value
    x
  }
}

#Pruebas

x <- matrix( 1:25, nrow=5, ncol=5)

x
x2 <- upperTriangle(x, diag=TRUE)
x3 <- upperTriangle(x, diag=TRUE, byrow=TRUE)

sum(x2)
sum(x3)

#la función tomada es gracias al orden de convergencia por O(n+1) lo que nos dice que nuestro algoritmo es de complejidad O(n)
f = function(x) (x+1)
curve(f, 1,25); abline(h=0, v=0) #gráfico para decidir un intervalo

#----------------------------------------------------------------------------------------------------
#1b)Implemente en R o Python un algoritmo que le permita sumar los elementos de una matriz cuadrada
#An. Imprima varias pruebas, para diferentes valores de n y exprese f(n) en notaci´on O() con una
#gráfica que muestre su orden de convergencia.

mat <- matrix( 1:9, nrow=3, ncol=3)
aux = sum(mat)
cat ("Rsultado de la suma de elementos es: ", aux)

mat2 <- matrix( 1:16, nrow=4, ncol=4)
aux2 = sum(mat2)
cat ("Rsultado de la suma de elementos es: ", aux2)

mat3 <- matrix( 1:25, nrow=5, ncol=5)
aux3 = sum(mat3)
cat ("Rsultado de la suma de elementos es: ", aux3)

#Teniendo en cuenta que R soporta algebra vectorial, la libreria SUM cuenta con cnotación O(n^2)
f = function(x) (x^2)
curve(f, 1,9); abline(h=0, v=0) #gráfico para decidir un intervalo

#----------------------------------------------------------------------------------------------------
#1c) Implemente en R o Python un algoritmo que le permita sumar los n2 primeros números naturales
#al cuadrado. Imprima varias pruebas, para diferentes valores de n y exprese f(n) en notaci´on O()
#con una gr´afica que muestre su orden de convergencia

#Ecuación suma numeros naturales al cuadrado
sumaNaturalCuadrado <- function(n)
{
  ( ( n*(n+1)*((2*n)+1) )/6 )  
}

#pruebas
sumaNaturalCuadrado(2)
sumaNaturalCuadrado(3)
sumaNaturalCuadrado(4)

# Como en el algoritmo creado no usamos ningún ciclo y sólo operaciones algebraicas tenermos una complejidad
# de O de una constante O(k) lo que podemos expresar en una complejidad constante o función 

f <- function(x){return(rep(1,length(x)))}
curve(f, 1,30); abline(h=0, v=0) #gráfico para decidir un intervalo