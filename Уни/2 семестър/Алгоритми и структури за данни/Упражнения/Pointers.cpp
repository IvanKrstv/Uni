// Pointers 1
#include<iostream>
using namespace std;
int main()
{
	int q, *pq;
	pq = &q; // pq - ��������� ������ �� q
	cout << "pq=" << pq << endl; 
	cout << "&q=" << &q << endl;// &q - ����� ������ �� q
	q = 10;
	cout << "q=" << q << endl;
	cout << "*pq=" << *pq << endl;  //*pq ����� ����������, ����������� �� ������, //����� �� ���������, �.�. 10
	*pq = 20;// �������� 20 �� ��������� �� q ����������� ���������, ����� ���� //������ �� ���� ����������
	cout << "q=" << q << endl;
	cout << "*pq=" << *pq << endl;
	cout << "&pq=" << &pq << endl;//������� ������ �� ���������
    return 0; 
}

// Pointers 2
#include<iostream>
using namespace std;
int main()
{

	int q, * pq;
	pq = &q; // pq - ïðèñâîÿâà àäðåñà íà q
	cout << "pq=" << pq << endl;
	pq++;// àäðåñà ùå ñå óâåëè÷è
	cout << "pq=" << pq << endl;

	float   qf, * pqf;
	pqf = &qf;
	cout << "pqf=" << pqf << endl;
	pqf++; // àäðåñà ùå ñå óâåëè÷è 
	cout << "pqf=" << pqf << endl;

	double   qd, * pqd;
	pqd = &qd;
	cout << "pqd=" << pqd << endl;
	pqd++; // àäðåñà ùå ñå óâåëè÷è 
	cout << "pqd=" << pqd << endl;

	return 0;
}

// Pointers 3
#include<iostream>
using namespace std;
int main()
{

	int q, * pq;
	pq = &q;
	*pq = 20;

	(*pq)++;
	cout << "q=" << q << endl;
	cout << "*pq=" << *pq << endl;
	*pq += 1;
	cout << "q=" << q << endl;
	cout << "*pq=" << *pq << endl;
	++*pq;
	cout << "q=" << q << endl;
	cout << "*pq=" << *pq << endl;


	return 0;
}

// Pointers 4
#include<iostream>
#include <stdio.h>
#include <stdlib.h>
using namespace std;
int main()
{
	int* pa, a[3] = { 10,20,30 };

	pa = a;
	cout << *pa << "\t" << *(pa + 1) << "\t" << *(pa - 2) << endl;
	cout << *a << "\t" << *(a + 1) << "\t" << *(a + 2) << endl;
	cout << a[0] << "\t" << a[1] << "\t" << a[2] << endl;
	cout << endl;
	cout << *pa << "\t" << *pa - 1 << "\t" << *pa + 2 << endl;
	cout << *a << "\t" << *a + 1 << "\t" << *a + 2 << endl;
	cout << a[0] << "\t" << a[1] - 1 << "\t" << a[2] + 2 << endl;
	cout << pa << endl;
	cout << &pa << endl;

	cout << a << endl;
	cout << &a << endl;

	//pa[1] = 10;
	//ca[4] = 20;
	//cout << pa[1] << " " << ca[4] << " " << endl;

	return 0;
}
