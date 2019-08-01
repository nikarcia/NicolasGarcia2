/******************************************************************************

                              Online C++ Compiler.
               Code, Compile, Run and Debug C++ program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <iostream>
#include <math.h>
#define pi 3.14159265359
using namespace std;

long double funcion(long double x){
    return exp(x)-pi*x;
}

long double derivada(long double x){
    return exp(x)-pi;
}

int main()
{
    long double x1=0,x2=0,fx=999;
    int raices=0,contador=0;
    
    while (raices<2){
        
    while (!(fx>-0.00000001 && fx<0.00000001) ){
        x2=x1-funcion(x1)/derivada(x1);
        fx=funcion(x2);
        x1=x2;
        contador++;
    }
    raices++;
    fx=999;
    x1=x2+0.6;
    
      cout<<contador<<" raiz " <<raices<<"  "<<x2<<endl;
    }
    

    return 0;
}
