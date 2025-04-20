#include<iostream>
using namespace std;
void brickSort(int arr[], int n) {   
	bool flag = false;   
	while(!flag)	{      
		flag = true;      	
		for(int i = 1; i<n-1; i= i+2)	{   
		      if(arr[i] > arr[i+1])	{   
		         swap(arr[i], arr[i+1]);
		            flag = false;        
		 }      }      
		for(int i = 0; i<n-1; i= i+2)	{ 
		        if(arr[i] > arr[i+1])	{ 
		           swap(arr[i], arr[i+1]); 
		           flag = false;         }      }  
	 }
}
int main() 
	{  
		 int data[] = {54, 74, 98, 154, 98, 32, 20, 13, 35, 40};   
		int n = sizeof(data)/sizeof(data[0]);   
		cout << "Sorted Sequence ";   
		brickSort(data, n);   
		for(int i = 0; i <n;i++)
			{      
				cout << data[i] << " "; 
			  }   
	return 0;
	}

