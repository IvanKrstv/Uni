#include <iostream>
using namespace std;
void push_l (int n);	//prototype
void push_r (int n);	//prototype
int pop_l (int &n);		//prototype
int pop_r (int &n);		//prototype
struct elem
{	int key;
elem *next;}
*leftt=NULL, *rightt=NULL;

void push_l (int n)
{ elem *p;
p=leftt;
leftt=new elem;
leftt->key=n;
leftt->next=p;
if (rightt==NULL)
{ //добавяне в празен дек
   rightt=leftt;}
}
void push_r (int n)
{	elem *p;
p=rightt;
rightt=new elem;
rightt->key=n;
rightt->next=NULL;
if (leftt==NULL)	//добавяне на първи елемент
  leftt=rightt;
else
  p->next=rightt;
}

int pop_l (int &n)
{	elem *p;
if (leftt)
{n=leftt->key;
   p=leftt;
  leftt=leftt->next;
  if (leftt==NULL)
    //последен елемент
     rightt=NULL;
delete p;
return 1;
} //if(leftt)
else
   return 0;
}

int pop_r (int &n)
{	elem *p;
if (rightt)
{
   n=rightt->key;
   if (leftt==rightt) //последен елемент
     {	delete rightt;
      leftt=rightt=NULL;
      }
   else //leftt==rightt
     {	p=leftt;
      while (p->next!=rightt)
         p=p->next;
      p->next=NULL;
     delete rightt;
     rightt=p;
      }
return 1;
} //rigth
else
   return 0;
}

int main()
{	int ch;
do
{
int num;
cout<<"\n		Menu:\n";
cout<<"1 - Input leftt\n";
cout<<"2 - Input rightt\n";
cout<<"3 - Output leftt\n";
cout<<"4 - Output rightt\n";
cout<<"5 - Exit\n";
cout<<"Your choice: ";
cin>>ch;
switch (ch)
{
case (1):
case (2):
cout<<"\nInput number: ";
cin>>num;
if (ch==1)
push_l(num);
else
push_r(num);
break;
case (3):
{
if (leftt==NULL)
cout <<" The Deck is empty!";
while (pop_l(num))
cout<<num<<"\t";
break;
} //case(3)
case (4):
{
if (rightt==NULL)
cout <<" The Deck is empty!";
while(pop_r(num))
cout<<num<<"\t";
} //case(4)
} //switch
} while (ch!=5);
return 0;
} //main()

