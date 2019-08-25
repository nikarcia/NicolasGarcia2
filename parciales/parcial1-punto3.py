import numpy as np
import math

def jacobian_example(xy):
    x, y = xy
    return [[math.exp(x+y)*(x+y+1)+1, (x+y+1)*math.exp(x+y)],
            [2*math.exp(2*x+y)*(2*x+y+1)+1,(2*x+y+1)*math.exp(2*x+y)]]

def function_example(xy):
    x, y = xy
    return [x+(x+y)*math.exp(x+y)-3, x+(2*x+y)*math.exp(2*x+y)-4]

def newton(fun, x_init, jacobian):
    max_iter = 50
    error = 1e-6
    x_last = x_init
    for k in range(max_iter):
        # Solve J(xn)*( xn+1 - xn ) = -F(xn):
        J = np.array(jacobian(x_last))
        F = np.array(fun(x_last))
        diff = np.linalg.solve( J, -F )
        x_last = x_last + diff
        #print("x_last" , x_last)
        print("ERROR : ",np.linalg.norm(diff)  , k)
        # Stop condition:
        if np.linalg.norm(diff) < error:
            print("convergence! " , np.linalg.norm(diff)," < ", error ,  "  nre iter:", k )
            break
    else: # only if the for loop end 'naturally'
        print('not converged')
    return x_last
    
def  funcion1(x,y):
   return  x+(x+y)*math.exp(x+y)-3

def funcion2(x,y):
    return x+(2*x+y)*math.exp(2*x+y)-4
    
def derivadax(x,y):
     return math.exp(x+y)*(x+y+1)+1

def derivaday(x,y):
     return (2*x+y+1)*math.exp(2*x+y)
    
def newton_mejorado(x_init , funcion1 , funcion2 , derivadax , derivaday):
    max_iter = 50
    error = 1e-6
    x_last = x_init
    x0=x_init[0]
    y0=x_init[1]
    
    for k in range(max_iter):
          x1=x0-funcion1(x0,y0)/derivadax(x0,y0)
          y1=y0-funcion2(x1,y0)/derivaday(x1,y0)
          dx=math.fabs(x1-x0)
          dy=math.fabs(y1-y0)
          x0=x1
          y0=y1
          x_last[0]=x1
          x_last[1]=y1
          
          # Stop condition:
          print("ERROR:", dx , dy ,k)
          if math.fabs(funcion1(x1,y1)) < error:
            print("convergence! " , funcion1(x1,y1)," < ", error ,  "  nre iter:", k )
            break
    else: # only if the for loop end 'naturally'
        print('not converged')
    return x_last

# For the example:
x_sol = newton(function_example, [0.0,0.0], jacobian_example )
print('soluion con newton:', x_sol )
#print( function_example(x_sol) )

x_sol_mejorado = newton_mejorado([0.0,0.0],funcion1,funcion2 , derivadax ,derivaday)
print('soluion con newton_mejorado:', x_sol_mejorado )
#print( function_example(x_sol_mejorado) )