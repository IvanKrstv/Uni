#include <iostream>
using namespace std;
int fib (int i);
int main()
{
int n;
cout<<"n=";
cin>>n;
for (int j=0; j<n; j++)
cout<<fib(j)<<"  ";
return 0;
}
int fib (int i)
{
if (i<1)
 return 0;
if (i==1)
 return 1;
return fib(i-1)+fib(i-2);
}

