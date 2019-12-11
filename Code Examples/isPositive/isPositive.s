.global isPositive

.text

isPositive:
	CMP R0, #0
	MOV R0, #0
	BMI END
	BEQ END
	MOV R0, #1

END:
	BX LR
