// Stack Array
#include <iostream>
using namespace std;
int stack[100], n=100, top=-1;

void push(int val) {
   if(top>=n-1)
   cout<<"Stack Overflow"<<endl;
   else {
      top++;
      stack[top]=val;
   }
}

void pop() {
   if(top<=-1)
   cout<<"Stack Underflow"<<endl;
   else {
      cout<<"The popped element is "<< stack[top] <<endl;
      top--;
   }
}

void display() {
   if(top>=0) {
      cout<<"Stack elements are:";
      for(int i=top; i>=0; i--)
      cout<<stack[i]<<" ";
      cout<<endl;
   } else
   cout<<"Stack is empty";
}

int main() {
   int ch, val;
   cout<<"1) Push in stack"<<endl;
   cout<<"2) Pop from stack"<<endl;
   cout<<"3) Display stack"<<endl;
   cout<<"4) Exit"<<endl;
   do {
      cout<<"Enter choice: "<<endl;
      cin>>ch;
      switch(ch) {
         case 1: {
            cout<<"Enter value to be pushed:"<<endl;
            cin>>val;
            push(val);
            break;
         }
         case 2: {
            pop();
            break;
         }
         case 3: {
            display();
            break;
         }
         case 4: {
            cout<<"Exit"<<endl;
            break;
         }
         default: {
            cout<<"Invalid Choice"<<endl;
         }
      }
   }while(ch!=4);
   return 0;
}



// Stack Dynamic
#include <iostream>
using namespace std;
void push(int n);   		//prototype
int pop(int& n);    		//prototype

struct elem {
    int key;
    elem* next;
} *start = NULL, * p = NULL;

void Display() {
    if (start) {
        cout << "Elements in the stack:\n";
        elem* temp = start;
        while (temp != NULL) {
            cout << temp->key << endl;
            //           cout << temp->next->key;
            temp = temp->next;
        }
    }
    else {
        cout << "Stack is empty.\n";
    }
}

int main()
{
    int num;
    cout << "Input integers (to end enter 0):\n";
    bool a = true;
    while (a)
    {
        cin >> num;
        if (num == 0)
            break;
        push(num);
    }
    cout << "\nStack:  ";
    Display();

    while (pop(num))
        cout << num << "  ";
    return 0;
}

void push(int n)		//�������� �� ������� � �����
{
    p = start;
    start = new elem;		//��������� �� �������
    start->key = n;
    start->next = p;		//������������ �� ��� ����
}

int pop(int& n)	     //��������� �� ������� �� �����
{
    if (start)		//�������� �� �������� ����
    {
        n = start->key;
        p = start;
        start = start->next;
        delete p;	    //��������� �� ��������� �������
        return 1;
    }
    else
        return 0;		//������ � ������
}