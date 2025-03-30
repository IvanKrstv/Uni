/*
Алгоритъмът на Евклид на намиране на най-големия общ делител 
на две положителни числа може да послужи като пример
 на рекурсивен алгоритъм, в който дълбочината на рекурсията 
 не винаги може да се определи предварително:
*/
 
#include <iostream>
using namespace std;
int NGOD (int m,int n); //Prototype
int main()
{
int m, n;
cout<<"\nm=";
cin>>m;
cout<<"\nn=";
cin>>n;
cout<<"\nNGOD("<<m<<","<<n<<")="<<NGOD(m,n);
return 0;
}

int NGOD(int m,int n)
{
if  (n>m)
return(NGOD(n,m));
else
{
if (n==0)
 return(m);
else
 return(NGOD(n,m%n));
}
}


