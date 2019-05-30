//CT
#include <stdio.h>

extern int decision(char op, int x, int y);

void Test(){
	int x = rand() % 50;
	int y = rand() % 50;
	printf("Arguments are: x:%d, y:%d", x, y);
	printf("The operation %c is resolved: %d ", '+', decision('+', x, y));
	printf("The operation %c is resolved: %d ", '-',  decision('+', x, y));
	printf("The operation %c is resolved: %d ", '*', decision('+', x, y));
	printf("The operation %c is resolved: %d ", '!',  decision('+', x, y));
	printf("The operation %c is resolved: %d ", '#', decision('#', x, y));
	
}


int main(void){

Test();

return 0;

}
