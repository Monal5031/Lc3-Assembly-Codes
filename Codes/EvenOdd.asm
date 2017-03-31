	.ORIG X300
	
	LD R6, ASCII
	LD R5, NEGASCII	
	
	TRAP x23
	AND R1,R1,x0
	ADD R1,R1,R0
	ADD R1,R1,R5
	
LOOP	ADD R1,R1,x-2
	BRz EVEN	
	BRp LOOP	
	
	LEA R0,MESGO
	JSR OUTPUT

EVEN	LEA R0,MESGE ;load the address of the message string
	JSR OUTPUT

OUTPUT	TRAP x22 ;"PUTS" outputs a string
	

HLT	HALT

ASCII .FILL x30 	;the mask to add to a digit to convert it to ASCII

NEGASCII .FILL xFFD0	 ;the negative version of the ASCII mask

MESGE .STRINGZ "The numbers is EVEN"
MESGO .STRINGZ "THE NUMBER IS ODD"
	.END
