#include <iostream>
using namespace std;

void rec (int i){

cout << i;
if (i>0)
//{
 rec(i-1);
// rec(i-1);
//}
cout << i;
}

int main()
{
	rec (5);
return 0;
}
