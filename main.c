#include <stdio.h>
#include <math.h>
#include "NumClass.h"
int main(){
int a=0,b=0 ,i=0,temp=0;
scanf("%d" ,&a );
scanf("%d" ,&b );
while((a<=0) || (b<=0)) {
scanf("%d" ,&a );
scanf("%d" ,&b );
}
if(a>b){
	temp=b;
	b=a;
	a=temp;
}
printf("The Armstrong numbers are:");
for(i=a;i<b;i++){
	if(isArmstrong(i)==1){
		printf(" %d",i);
	}
}
    printf("\n");


printf("The Palindromes are:");
for(i=a;i<b;i++){
	if(isPalindrome(i)==1){
		printf(" %d",i);
	}
}
    printf("\n");

printf("The Prime numbers are:");
for(i=a;i<b;i++){
	if(isPrime(i)==1){
		printf(" %d",i);
	}
}
    printf("\n");

printf("The Strong numbers are:");
for(i=a;i<b;i++){
	if(isStrong(i)==1){
		printf(" %d",i);
	}
}
    printf("\n");

return 0;
}