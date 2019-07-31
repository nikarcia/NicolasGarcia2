#include <iostream>
#include <math.h>
# define M_PI           3.14159265358979323846 

using namespace std;

int main()
{
    long double a,b,c,fc;
    a=0;
	b=3;
	c=0;
	fc=999;

 while (!(fc>-0.00000001 && fc<0.00000001)){
 c++;
 fc=exp(a)-M_PI*a;
    b=exp(a)/M_PI;
     a=b;
 };
  cout<<c<<"  " << a << endl;
  cout<<"interacciones  "<<c<<endl;
  
    a=1;
	b=3;
	c=0;
	fc=999;
  
   while (!(fc>-0.00000001 && fc<0.00000001)){
 c++;
 fc=exp(a)-M_PI*a;
    b=exp(a)/M_PI;
     a=b;
 };
  cout<<c<<"  " << a << endl;
  cout<<"interacciones  "<<c;
 
 
    return 0;
}
