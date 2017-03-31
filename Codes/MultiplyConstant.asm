	.ORIG x3000		; Start program
	AND R1,R1,x0		; Clear R1
	ADD R1,R1,xA		; Store hex data A in R1
	AND R2,R2,x0		; Clear R2
	ADD R2,R2,x5		; Store hex data 5 in R2
	AND R3,R3,x0		; clear R3
Loop	ADD R3,R3,R1		; add R1 to R3 with R3
	ADD R2,R2,x-1		; decrement R2 by 1
	BRp Loop		; Loop till R2 becomes 0
	HALT			; Stop execution
	.END
