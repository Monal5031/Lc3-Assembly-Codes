	.ORIG x3000		; Start program
	LD R6, ASCII		; set positive ascii
	LD R5, NASCII		; set negative ascii
	
	AND R1,R1,x0		; Clear R1
	AND R2,R2,x0		; Clear R2
	AND R3,R3,x0		; Clear R3
	AND R4,R4,x0		; Clear R4
	
	TRAP x23		;INPUT 1st Number
	ADD R1,R0,x0		; !st num in R1
	ADD R1,R1,R5		; CORRECTING ASCII
	
	TRAP x23		;INPUT 1st Number
	ADD R2,R0,x0		; !st num in R2
	ADD R2,R2,R5		; CORRECTING ASCII

	NOT R3,R1		; R3=~R1
	NOT R4,R2		; R4=~R2

	AND R1,R1,R4		; AB'
	AND R2,R2,R3		; BA'
	
	NOT R1,R1
	NOT R2,R2
	AND R1,R2,R1		
	NOT R1,R1		
	
	
	HALT			; Stop execution
ASCII .FILL x30 		;the mask to add to a digit to convert it to ASCII
NASCII .FILL xFFD0 		;the negative version of the ASCII mask

	.END

