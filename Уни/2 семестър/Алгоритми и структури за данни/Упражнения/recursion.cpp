// Recursion
#include <iostream>
using namespace std;

void rec(int i)
{
	cout << i;
	if (i > 0)
		//{
		rec(i - 1);
	// rec(i-1);
	//}
	cout << i;
}

int main()
{
	rec(5);
	return 0;
}



// Recursicon Powering 
#include <iostream>
using namespace std;
int calculate(int, int);
int main()
{
	int base, power, result;
	cout << "Enter base number: ";
	cin >> base;
	cout << "Enter power number(positive integer): ";
	cin >> power;
	result = calculate(base, power);
	cout << base << "^" << power << " = " << result;
	return 0;
}

int calculate(int base, int power)
{
	if (power != 0)
		return (base * calculate(base, power - 1));
	else
		return 1;
}



// Fibonacci
#include <iostream>
using namespace std;
int fib(int i);
int main()
{
	int n;
	cout << "n=";
	cin >> n;
	for (int j = 0; j < n; j++)
		cout << fib(j) << "  ";
	return 0;
}

int fib(int i)
{
	if (i < 1)
		return 0;
	if (i == 1)
		return 1;
	return fib(i - 1) + fib(i - 2);
}



// Factiorial
#include <iostream>
using namespace std;
long f(int n);//prototype
int main()
{
	int n;
	cout << "\nInput the integer:";
	cin >> n;
	cout << "\n" << n << "! = " << f(n);
	return 0;
}

long f(int n)
{
	if (n > 0)
		return (n * f(n - 1));
	else
		return(1);
}

// Factorial iter
#include <iostream>
using namespace std;
void factor(int n);//prototype
int main()
{
	int n;
	cout << "\nInput the integer: ";
	cin >> n;
	factor(n);
	return 0;
}
void factor(int n)
{
	int rez = 1;
	for (int i = 1; i <= n; i++)
		rez *= i;
	cout << "\nn!=" << rez;
}



// Evklid
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



// Hanoy towers 
#include <iostream>
using namespace std;
void hanoj(char A, char C, char B, int n);
int main()
{
	char A = 'A', B = 'B', C = 'C';
	int n;
	cout << "Enter the disk's number n:";
	cin >> n;
	hanoj(A, C, B, n);
	return 0;
}

void hanoj(char A, char C, char B, int n)
{
	if (n == 1)
		cout << "Move the disk 1 from " << A << " to " << C << endl;
	else
	{
		hanoj(A, B, C, n - 1);
		cout << "Move the disk " << n << " from " << A << " to " << C << endl;
		hanoj(B, C, A, n - 1);
	}
}