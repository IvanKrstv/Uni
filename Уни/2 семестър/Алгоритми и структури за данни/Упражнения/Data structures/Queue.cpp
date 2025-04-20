// Queue array
#include <iostream>
using namespace std;

#define SIZE 5
int A[SIZE];
int front = -1;
int rear = -1;
//function to check if queue is empty
bool isempty()
{
 if(front == -1 && rear == -1)
 return true;
 else
 return false;
}
//function to insert element in queue
void enqueue ( int value )
{
 if (rear == SIZE-1)
  cout<<"Queue is full \n";
 else
 {
  if( front == -1)
   front = 0;
  rear++;
  A[rear] = value;
 }
}
//function to remove element from queue
void dequeue ( )
{
 if( isempty() )
  cout<<"Queue is empty\n";
 else
 if( front == rear )
  front = rear = -1;
 else
  front++;
}
//function to display element at front
void showfront( )
{
 if( isempty())
  cout<<"Queue is empty\n";
 else
  cout<<"element at front is:"<<A[front]<<"\n";
}
//function to display elements of the queue
void displayQueue()
{
 if(isempty())
  cout<<"Queue is empty\n";
 else
 {
  for( int i=front ; i<= rear ; i++)
   cout<<A[i]<<" ";
  cout<<"\n";
 }
}

int main()
{
 //inserting elements in queue
 cout<<"Inserting elements in queue\n";
 enqueue(2);
 displayQueue();
 enqueue(3);
 displayQueue();
 enqueue(5);
 displayQueue();
 enqueue(7);
 displayQueue();
 enqueue(8);

 displayQueue();
 // queue is full
 enqueue(9);
 //show element at front
 showfront();

 cout<<"Removing elements from queue\n";
 //removing elements from the queue
 dequeue();
 displayQueue();
 dequeue();
 displayQueue();
 dequeue();
 displayQueue();
 dequeue();
 displayQueue();
 dequeue();

 return 0;
}





// Queue dynamic
struct elem {
	int key;
	elem* next;
} *first = NULL, *last = NULL, *p = NULL;

void enque(int n)
{
	p = last;
	last = new elem;
	last->key = n;
	last->next = NULL;
	if (p != NULL)
		p->next = last;
	if (first == NULL)
		first = last;
}

void deque(int& n)
{
	if (first)
	{
		n = first->key;
		p = first;
		first = first->next;
		if (first == NULL)
			last = NULL;
		delete p;
		return 1;
	}
	else return 0;
}

int main()
{
	int num;
	cout << "Enter integers, 0 for end:" << endl;
	do
	{
		cin >> num;
		if (num != 0)
			enque(num);
	} while (num != 0);

	while (deque(num))
		cout << num << " ";

	return 0;
}