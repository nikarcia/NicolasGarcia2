#include <iostream>
#include <math.h>
# define M_PI           3.14159265358979323846 

using namespace std;

int main()
{
    long double a,b,c;
    long double fa,fb,fc;
    a=0;
	b=3;
	c=0;
    fa=exp(a)-M_PI*a;       cout<<"fa  "<<fa<<endl;
    fb=exp(b)-M_PI*b;        cout<<"fb  "<<fb<<endl;
    fc=999;
    int con=0;
    
    while(!(fc>-1*10 && fc<0.000000001)){
        con++;
        if((fa*fb)<0){
            //cout<<"si hay raiz entre "<<a<<" y "<<b<<endl;
            
            c=(a+b)/2;          cout<<con <<"  c  "<<c;
            fc=(c*c*c+5*c-1);   cout<<"       fc  "<<fc<<endl;
            
            if((fa*fc)<0){
                           // cout<<"si hay raiz entre a y c "<<a<<" y "<<c<<endl;
                            fb=fc;
                            b=c;
            }
            if((fb*fc)<0){
                           // cout<<"si hay raiz entre b y c "<<b<<" y "<<c<<endl;
                            fa=fc;
                            a=c;
            }
        }
        
    }
    cout<<"la raiz esta en  " << c << endl;

    return 0;
}