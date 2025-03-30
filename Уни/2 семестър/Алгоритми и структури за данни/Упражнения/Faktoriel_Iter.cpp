#include <iostream>
using namespace std;
void factor(int n);//prototype
int main()
 {
   int n;
   cout<<"\nInput the integer: ";
   cin>>n;
   factor(n);
   return 0;
 }
void factor(int n)
{
     int rez=1;
     for(int i=1;i<=n;i++)
	rez*=i;
     cout<<"\nn!="<<rez;
    }

