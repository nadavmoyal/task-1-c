#include <stdio.h>
#include <math.h>
#include "NumClass.h"

int isArmstrong2(int a,int len){
    int i,t;
    if (a!=0){
    t=1;
    i=0;
    while(i<len){
        t*=(a%10);
        i++;
    }
    return ( t+ isArmstrong2(a*0.1,len));
    }
    return 0;
}

int isArmstrong(int a){
    int temp ,leng=0;
    temp=a;
    while (temp > 0) {
        leng++;
        temp = temp/ 10;
    }
    int f=isArmstrong2(a,leng);
    if (f==a){
        return 1;
    }
    return 0;
}

int isPalindrome(int a)
{
    int opp =rev(a);
    if(a != opp)
    {
        return 0;
    }
    return 1;
}

int rev(int a)
{   
    int len=-1;
    int temp=a;
    while(temp!=0){
    temp=temp/10;
    len++;
    }
    if(a != 0){
    int r=a%10;
    return (rev(a*0.1)+ r*pow(10,len));
    }
    else{
        return 0;
    }
}