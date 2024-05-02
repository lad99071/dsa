#include <iostream>
using namespace std;
class node
{
  public:
  int data;
  node *left;
  node *right;
};
class bst
{
  public:
  node *root;
  int cnt;
  bst()
  {
    cnt=0;
    root=NULL;
  }
  void insert();
  int search(int key);
  void inorder(node *temp);
  void smallest();
  void greatest();
  void mirror(node *root);
  int height(node *root);
};
void bst::insert()
{
  int flag=0;
  node *new_node,*temp;
  new_node=new node(); //memory allocation
  new_node->left=NULL;
  new_node->right=NULL;
  cout<<"Enter the data: ";
  cin>>new_node->data;
  if(root==NULL)
  {
    root=new_node;
  }
  else
  {
    temp=root;
    while(flag==0)
    { 
      if(new_node->data < temp->data)
      {
        if(temp->left==NULL)
        {
          temp->left=new_node;
          flag=1;
        } 
        else
        {
          temp=temp->left;
        }
      }
      else if(new_node->data > temp->data)
      {

        if(temp->right==NULL)
        {
          temp->right=new_node;
          flag=1;
        }
        else
        {
          temp=temp->right;
        }
      }
      else
      {
        cout<<"Data already exists";
      }
    }
  }
}
int bst::search(int key)
{
  node *temp;
  temp=root;
  while(1)
  {
    if(key < temp->data)
    {
      if(temp->left !=NULL)
      {
        temp=temp->left;
      }
      else
      { 
        return 0;
      }
    }
    else if(key > temp->data)
    {
      if(temp->right !=NULL)
      {
        temp=temp->right;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return 1;
    }
  }
}
void bst::inorder(node *temp)
{
if(temp!=NULL)
{
inorder(temp->left);
cout<<temp->data<<"\t";
cnt++;
inorder(temp->right);
}
}

void bst::smallest()
{ node *temp;
  temp=root;
  while(temp->left!=NULL)
  {
    temp=temp->left;
  }
  cout<<"smallest node="<<temp->data;
}


void bst::greatest()
{ node *temp;
  temp=root;
  while(temp->right!=NULL)
  {
    temp=temp->right;
  }
  cout<<"greatest node="<<temp->data;
}

void bst::mirror(node *root)
{ node *temp;
  if(root!=NULL)
  {
    temp=root->left;
    root->left=root->right;
    root->right=temp; 
    mirror(root->left);
    mirror(root->right);
  }
}
int bst::height(node *root)
{ int left_height,right_height;
  if(root==NULL)
    return(0);
  if (root->left==NULL && root->right==NULL)
    return(0);
  left_height=height(root->left);
  right_height=height(root->right);
  if(left_height > right_height)
     return(left_height+1);

  else
     return(right_height+1);

}

int main()
{
int choice,key,pos;
bst b;
do
{
cout<<"1.Insert node\n";
cout<<"2.Search node\n";
cout<<"3.Inorder\n";
cout<<"4.smallest\n";
cout<<"5.greatest\n";
cout<<"6.mirror\n";
cout<<"7.height\n";
cout<<"8.Exit\n";
cout<<"Enter your choice: ";
cin>>choice;
switch(choice)
{
case 1:b.insert();
break;
case 2:cout<<"Enter the node to be searched: ";
cin>>key;
if(pos=b.search(key))
{
cout<<"Node found at \t"<<pos<<"\t location\n";
}
else
{
cout<<"Node not found";
}
break;
case 3:cout<<"Inorder traversal\n";
b.inorder(b.root);
break;
case 4:cout<<"smallest number\n";
b.smallest();
break;
case 5:cout<<"greatest number\n";
b.greatest();
break;
case 6:cout<<"mirror numbers\n";
b.mirror(b.root);
break;
case 7:cout<<"height\n";
b.height(b.root);
break;
case 8:cout<<"\nExiting...";
break;
default:cout<<"Wrong choice!";
break;
}
}while(choice!=8);
}
