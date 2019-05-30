//CT
	
// X0: char '+' '-' '*' '!' and '#' 
	.globl decision 
decision: 
	// decide the operation and branch there
	AND X9, X0, #255 //char
	// 35 -> # non_sense
	// 33 -> ! factorial
	// 42 -> * mul 
	// 43 -> + add 
	// 45 -> - sub 
	
	ADD X0, X31, X31
	SUB X31, X9, #33
	B.EQ factorial
	
	SUB X31, X9, #43
	B.EQ add

	SUB X31, X9, #45
	B.EQ sub

	SUB X31, X9, #42
	B.EQ mul

	SUB X31, X9, #35
	B.EQ no_of_Ones
factorial:
	ADD X0, X0, #1
	SUB X2, X1, #1
	B while
while:	
	CMP X1, X31
	B.LE fin
	CMP X2, X31
	B.LE fin
	MUL X0, X0, X2
	MUL X0, X0, X1	
	SUB X1, X1, #2
	SUB X2, X2, #2
	B while
fin: 
	BR X30


add:
	ADD X0, X1, X2
	BR X30
sub: 
	SUB X0, X1,X2
	BR X30
mul:
	MUL X0, X1, X2
	BR X30

no_of_Ones: 
	ADD X1,X1,X2
	ADD X2, X1, X31
	B non_sense

non_sense: //gives the amount of 1s in the sum the data in bit representation of the data
	CMP X2, X31
	BR.EQ X30
	RSL X2, X1, #1
	CMP X2, X1		// it must have gotten smaller if least significant bit was 1
	RSL X1, X1, #1
	BL.LE there_is_one
	B non_sense

there_is_one:
	ADD X0, X0, #1
	B non_sense 
