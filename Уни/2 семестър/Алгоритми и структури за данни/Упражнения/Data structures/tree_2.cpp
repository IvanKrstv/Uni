#include<iostream>
using namespace std;
struct elem
{
	int key;
	elem *pleft, *pright;
}*root = NULL;
int menu();
void add(int n, elem *&t);
void inorder(elem *t);
int del(int k);
elem *&search(int k);
elem *search_iter(elem *t, int k);
int height(elem *t);
void printnode(int n, int h);
void show(elem *t, int h);

int main()
{
	int n = 0, num,h;
	do
	{
		n = menu();
		switch (n)
		{
		case 1:
		{cout << "num=";
		cin >> num;
		add(num, root);
		break;}
		case 2:
		{
			cout << "All elements\n";
			inorder(root);
			break;
		}
		case 3:
		{
			cout << "search:";
			cin >> num;
			elem *&p = search(num);
			if (p == NULL)
				cout << "the item is NOT in the tree\n";
			else
				cout << "the item is in the tree\n";
			break;
		}
		case 4: //search_iter
		{
			cout << "search:";
			cin >> num;
			elem *&p = search(num);
			if (p == NULL)
				cout << "the item is NOT in the tree\n";
			else
				cout << "the item is in the tree\n";
			break;
		}
		case 5:
		{
			cout << "Enter the item to be deleted:";
			cin >> num;
			if (del(num)== 0)
				cout << "the item is NOT in the tree\n";
			break;
		}
		case 6:
		{
			h = height(root);
			show(root, h);
			cout << "\n";

		}
		}
	} while (n != 7);
}
int menu()
{
	int izbor = 0;
	do
	{
		cout << "\n Menu\n";
		cout << "1.Add\n";
		cout << "2.Print\n";
		cout << "3. Search\n";
		cout << "4. Search_iter\n";
		cout << "5. Delete\n";
		cout << "6.Show\n";
		cout << "7.End\n";
		cout << "Enter your choice:";
		cin >> izbor;
	} while (izbor < 1 || izbor>7);
	return izbor;
}

	
void add(int n, elem *&t)
	{
		if (t == NULL)
		{
			t = new elem;
			t->key = n;
			t->pleft = t->pright = NULL;
		}
		else
		{
			if (t->key < n)
				add(n, t->pright);
			else
				add(n, t->pleft);
		}
	}
void inorder(elem *t)
{if(t)
	{
	inorder(t->pleft);
	cout << t->key << "  ";
	inorder(t->pright);
	}
}
elem *&search(int k)
{
	elem **p = &root;
	for (;;)
	{
		if (*p == NULL)
			return *p;
		if (k < (*p)->key)
			p = &(*p)->pleft;
		else
			if (k > (*p)->key)
				p = &(*p)->pright;
			else
				return *p;
	}
}
elem *search_iter(elem *t, int k)
{
	while (t && t->key != k)
		if (t->key < k)
			t = t->pright;
		else
			t = t->pleft;
	return t;

}
int del(int k)
{
	elem *&p = search(k), *p0 = p, **qq, *q;
	if (p == NULL)
		return 0;
	if (p->pright == NULL)
	{
		p = p->pleft;
		delete p0;
	}
	else
		if (p->pleft == NULL)
		{
			p = p->pright;
			delete p0;
		}
		else
		{
			qq = &p->pleft;
			while ((*qq)->pright)
				qq = &(*qq)->pright;
			p->key = (*qq)->key;
			q = *qq;
			*qq = q->pleft;
			delete q;
		}
	return 1;
}
int height(elem *t)
{
	int u, v;
	if (!t)
		return -1;
	u = height(t->pleft);
	v = height(t->pright);
	if (u>v)
		return u + 1;
	else
		return v + 1;
}
void printnode(int n, int h)
{
	for (int i = 0;i<h;i++)
		cout << "\t";
	cout << n << "\n";
}
void show(elem *t, int h)
{
	if (t)
	{
	show(t->pright, h + 1);
	printnode(t->key, h);
	show(t->pleft, h + 1);}
}

