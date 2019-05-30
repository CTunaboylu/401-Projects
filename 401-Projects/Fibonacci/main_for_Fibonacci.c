//CT
#include <stdio.h>

#define TRIAL 10
extern int Fibonacci(int order);

void F_Test(int x){
printf("%dth fibonacci number is %d", x, Fibonacci(x));
}


int main(void) {

for(int i=0; i< TRIAL ; i++)
	F_Test((int)rand() %25);

return 0;
} 
