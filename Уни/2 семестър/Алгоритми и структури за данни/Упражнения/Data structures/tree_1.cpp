#include <iostream> 
using namespace std;
struct elem
{
	int key;
	elem *left, *right;
}*root = NULL;
void add(int n, elem* &t);
void inorder(elem *t);
void postorder(elem *t);
void preorder(elem *t);
int main()
{
	int num, ch;
	do {
		cout << "Menu\n";
		cout << "1. Add \n";
		cout << "2. Inorder\n";
		cout << "3. Preorder\n";
		cout << "4. Postorder\n";
		cout << "5. Exit\n";
		cout << "Your choice:";
		cin >> ch;
		switch (ch)
		{
		case 1:
			cout << "num=";
			cin >> num;
			add(num, root); cout << endl; break;
		case 2: 	inorder(root); cout << endl; break;
		case 3: 	preorder(root); cout << endl; break;
		case 4:	postorder(root); cout << endl; break;
		}
	} while (ch != 5);
	system("pause");
	return 0;
}


void add(int n, elem* &t)
{	if (t == NULL)
	{
		t = new elem;
		t->key = n;
		t->left = t->right = NULL;
	}
	else
	{
		if (t->key < n)
			add(n, t->right);
		else
			add(n, t->left);
	}
}
void inorder(elem *t)
{	if (t)
	{
		inorder(t->left);
		cout << t->key << "  ";
		inorder(t->right);
	}
}
void postorder(elem *t)
{	if (t)
	{
		postorder(t->left);
		postorder(t->right);
		cout << t->key << "  ";
	}
}
void preorder(elem *t)
{	if (t)
	{
		cout << t->key << "  ";
		preorder(t->left);
		preorder(t->right);
	}
}

