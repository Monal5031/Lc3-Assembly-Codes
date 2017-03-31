; Will find occurences of any given numer in the block
; number stored in R1 and occurences in R5

		.ORIG x3000
		AND R4,R4,x0
		ADD R4,R4,xA
		LD R2,start 		; Load start addr

		AND R5,R5,x0 		; Counter for occurences
		AND R1,R1,x0
		ADD R1,R1,x2 		; Number whose occurences is to be counted

LOOP 	LDR R3,R2,x0 		; Next Number
		ADD R2,R2,x1 		; increment addr
		NOT R3,R3
		ADD R3,R3,x1		; twos comp.
		ADD R3,R1,R3		
		BRnp NOPE				; Dont incement if not equal
		ADD R5,R5,x1
NOPE	ADD R4, R4, x-1  	
		BRp LOOP

		LEA R0,MSG
		TRAP x22

HLT 	HALT
MSG		.STRINGZ "Check R5 for occurences"
start 	.FILL x2FF0
		.END