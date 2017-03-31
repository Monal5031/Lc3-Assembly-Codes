; XOR is define as not (A or B) i.e. not A and not B
; R1 and R2 are numbers  and R4 has result
		.ORIG x3000

		AND R1,R1,x0
		AND R2,R2,x0

		ADD R1,R1,x1	; 1st number
		ADD R2,R2,x0	; 2nd number

		NOT R1,R1		; not A
		NOT R2,R2		; not B

		AND R4,R1,R2	; not A and not B

		HALT
		.END