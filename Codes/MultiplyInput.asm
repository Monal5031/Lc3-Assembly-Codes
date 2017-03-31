	.ORIG x3000		; Start program
	LD R6, ASCII		; set positive ascii
	LD R5, NASCII		; set negative ascii
	AND R1,R1,x0		; Clear R1
	TRAP x23		; Input a number
	ADD R1,R1,R0		; number in R1
	ADD R1,R1,R5		; Convert the wrong value of number to actual value
	AND R2,R2,x0		; Clear R2
	ADD R2,R2,x5		; Store hex data 5 in R2
	AND R3,R3,x0		; clear R3
Loop	ADD R3,R3,R1		; add R1 to R3 with R3
	ADD R2,R2,x-1		; decrement R2 by 1
	BRp Loop		; Loop till R2 becomes 0
	HALT			; Stop execution
ASCII .FILL x30 		;the mask to add to a digit to convert it to ASCII
NASCII .FILL xFFD0 		;the negative version of the ASCII mask

	.END

