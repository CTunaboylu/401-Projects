//CT
#include <stdio.h>

#define TRIAL 6

extern int Ack(int x, int y)

void Test_4_X_EQ_0(){
	int y, x = 0;
	for(int i=0; i<6, i++){
		y = rand() % 20;
		printf("Solution for Ackerman values where  x = %d and y = %d is &d ", x, y,Ack(x,y));
	}
}

void Test_4_y_EQ_0(){
	int y = 0, x;
	for(int i=0; i<6, i++){
		x = rand() % 20;
		printf("Solution for Ackerman values where  x = %d and y = %d is &d ", x, y,Ack(x,y));
	}
}

void Test_Series_Expansion_4_Ackerman(){
	int y;
	for(int i=1; i<4, i++)
		for(int k=0; k<2, k++){
			y = rand() % 20;
			printf("Solution for Ackerman values where  x = %d and y = %d is &d ", i, y,Ack(i,y));
		}
	// Recursion can only be calculated when y = 0 where x = 4, so give valid and an invalid case	
		printf("Solution for Ackerman values where  x = %d and y = %d is &d ", 4, 0,Ack(4,y));
		printf("Solution for Ackerman values where  x = %d and y = %d is &d ", 4, 5,Ack(4,y));
}

int main(void){

	//printf( "Enter Ackerman function values separated by a space (x y):");
	//scanf("%d %d", &x, &y);
	Test_4_X_EQ_0();
	Test_4_y_EQ_0();
	Test_Series_Expansion_4_Ackerman();

	return 0;
}
