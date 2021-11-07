#include <stdio.h>
#include "NumClass.h"

int isPrime(int p){
int i , f;
i=2;
f=1;
while (i<=p/2){
    if(p%i==0){
        f=0;
        break;
    }
    i++;
}
     return f;
 } 

int isStrong(int num){
int r=0,sum=0,a=0,i,fact=1;
a=num;
while(num>0){
    fact=1;
    i=1;
    r=num%10;
    for(i=1;i<=r;i++){
        fact=i*fact;
    }
    sum=sum+fact;
    num=num/10;
}
 if (sum == a){
     return 1;
 }
 else
     return 0;
}

