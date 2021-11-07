#include <stdio.h>
#include <math.h>
#include "NumClass.h"
int isArmstrong(int a){
int len=0,i=0,sum=0;
int num=a;
while(a!=0){
    a=a/10;
    len++;
    }
int arr [len];
a=num;
while(a!=0){
    arr[i]=a%10;
    a=a/10;
    i++;
    }
    i=0;
    while(i<len){
    sum=sum+pow(arr[i],len);  
    i++;
    }
    if(sum==num){
        return 1;
    }
    return 0;
 }

 int isPalindrome(int a){
 int n=0;
 int b=a;
 while(1!=0){
      if(a!=0){
      n=n*10+a%10;
      a=a*0.1;
      }
      else break;
 }
   if(b!=n){
       return 0;
   }
   return 1;
}
