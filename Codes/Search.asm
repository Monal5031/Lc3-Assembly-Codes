; Numbers are to be filled from x2FF0 ourselves and number to search in R1
; Number to filled ourselves from x2FF0 to x2FFA
		.ORIG x3000
		AND R4,R4,x0
		ADD R4,R4,xA
		LD R2,start 		; Load start addr

		AND R1,R1,x0
		ADD R1,R1,x2 		; Number to be searched

LOOP 	LDR R3,R2,x0 		; Next Number
		ADD R2,R2,x1 		; increment addr
		NOT R3,R3
		ADD R3,R3,x1		; twos comp.
		ADD R3,R1,R3		
		BRz YES				; Jump to yes if found
		ADD R4, R4, x-1  	
		BRp LOOP
		BRz NO 				; Number not found

YES 	LEA R0,MSGY
		TRAP x22
		JSR HLT

NO 		LEA R0,MSGN
		TRAP x22
		JSR HLT

HLT 	HALT
MSGY	.STRINGZ "Number is found"
MSGN	.STRINGZ "Number not found"
start 	.FILL x2FF0
		.END