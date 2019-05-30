//Obvious implementation log(n) 
// CT
	.globl Fibonacci
Fibonacci:
	// X0: nth fibonacci number
	CBZ X0, exit
	//if test passes we will need X19 and X20 to be ready 
	ADD X2, X31, X31 
	ADD X2,X2, #1
	ADD X3, X31, X31 
	ADD X3, X3, #1
	
	CMP X0, #2 // 0th 1st and 2nd fibonacci numbers are not needed to be calculated
	B.LE exit 
	
	AND X1, X0, #1
	SUB X0, X0, #2 // subtracting 2 from X0 since we now need to execute n-2 times
	B loop 
	
loop:
	CMP X0, X31
	B.LE exit
	ADD X2, X2, X3
	ADD X3, X2, X3
	SUB XO, X0, #2
	B loop
exit:
	CMP X1, X31	
	B.EQ return_x  // dependency on X21
	B return_y
return_x:
	ADD X0, X2, X31
	BR X30
return_y:
	ADD X0, X3, X31
	BR X30
