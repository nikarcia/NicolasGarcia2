/******************************************************************************

                              Online C++ Compiler.
               Code, Compile, Run and Debug C++ program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <iostream>

using namespace std;

int main()
{
    int contador =0;
    cout<<"ingrese el numero  "<<endl;
   float n=7;
   cin>>n;
    cout<<"ingrese el error permitido  "<<endl;
   float e=0.000001;
      cin>>e;
    cout<<"ingrese el valor inicial  "<<endl;
   float x=2.5;
      cin>>x;
   float y=0;
   
   y=(x+(n/x))/2;
   contador++;
   
   while((x-y||y-x)>e){
       x=y;
       y=(x+(n/x))/2;
       contador++;
   }
   
   cout<<"la raiz cuadrada de "<<n<<" es "<< y<<endl;
   cout<<"numero de operaciones : "<<contador;

    return 0;
}
