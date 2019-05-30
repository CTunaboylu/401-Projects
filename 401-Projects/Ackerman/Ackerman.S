//CT
// ACKERMAN ~ Beck's Recursion: A(x,y) = { A(1,y) = 2 + y, A(2,y) = 2y, A(3,y) = y^2 , A(4, y) = 2^(2^(2^(2...))) , incomputable return it as it is}

//Hot spots
// A(0,y) = y+1
// A(1,0) = 2
// A(2,0) = 3
// A(3,0) = 5
// A(4,0) = 10
	.globl Ack
Ack: 
	// X0 : x, X1 : y
	//check x == 0 
	CBZ X0, ack_0_y

	// check y == 0
	// special case check here
	CMP X1, #0
	B.EQ y_zero 	
	// time for recursion
	//Beck's Recursion: A(x,y) = {
	// A(1,y) = 2 + y, 
     	CMP X0, #1
	B.EQ ack_1
	// A(2,y) = 2y, 
     	CMP X0, #2
	B.EQ ack_2
	// A(3,y) = y^2 ,
     	// prepare the registers
     	CMP X0, #3
	B.EQ ack_3
	// A(4, y) = 2^(2^(2^(2...))) , incomputable return it as it is}
	#4 // compare n to 0
 	// since we checked if y is equal to 0 or not, which handles the special case Ack(4,0)     
     	CMP X0, #4
	B.EQ error 

y_zero: 	
     	CMP X0, #1
	B.EQ ack_1_0
     	CMP X0, #2
	B.EQ ack_2_0
     	CMP X0, #3
	B.EQ ack_3_0
     	CMP X0, #4
	B.EQ ack_4_0
	CMP X0, #5
	B.GE error:
// since the recursion is always in second parameter part, put value in X1 ?
ack_0_y: // Ack(0,y) : A(0,y) = y+1
    	ADD X0, X1, #1
    	BR X30
ack_1_0: // A(1,0) = 2
	ADD X0, X31, #2
    	BR X30
ack_2_0: // A(2,0) = 3
	ADD X0, X31, #3
    	BR X30 
ack_3_0: // A(3,0) = 5
	ADD X0, X31, #5
    	BR X30
ack_4_0: // A(4,0) = 10
	ADD X0, X31, #10
    	BR X30
// RECURSIONS
ack_1: // Ack(1,y) recursion
	// 2 + y
	ADD X1, X1, #2
	BR X30 
ack_2: // Ack(2,y) recursion
	// 2*y 
	ADD X1, X1, X1
	BR X30
ack_3: // Ack(3,y) recursion
	// 2^y I know that X1 is y 
	CMP X31, X3
	BR.EQ X30
	MUL X1, X1, #2 	
	SUB X3, X3, #1
	B ack_3
	
	
error: // if not the special case Ack(4,0) = 10, give error for  Ack(4,y) recursion

	// 2^(2^(2 ... ) - y exponents : calculation impossible
	// err code = 0 since there is no 0 value in this process ?
	ADD X1, X31, X31 
	SUB X1, X1, #1
	BR X30 // return -1 



