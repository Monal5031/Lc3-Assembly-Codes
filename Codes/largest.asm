; Numbers are to be filled from x2FF0 ourselves and largest will be in R0
; Number to filled ourselves from x2FF0 to x2FFA
		.ORIG x3000
		AND R4,R4,x0
		ADD R4,R4,xA
		LD R2,start 		; Load start addr

		LDR R1,R2,x0 		; Assuming 1st number as largest
		ADD R2,R2,x1
		ADD R4,R4,x-1



LOOP 	LDR R3,R2,x0 		; Next Number
		ADD R2,R2,x1 		; increment addr
		ADD R0,R3,x0 		; make copy of R3
		NOT R3,R3
		ADD R3,R3,x1		; twos comp.
		ADD R3,R1,R3		
		BRzp SKIP			; if R0<R3 swap them
		ADD R1,R0,x0
SKIP	ADD R4,R4,x-1  	
		BRp LOOP

		LEA R0,MSG
		TRAP x22

HLT 	HALT
MSG		.STRINGZ "Check R1"
start 	.FILL x2FF0
		.END