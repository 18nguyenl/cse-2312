.global multiply

.text

multiply:
	MOV R2, R0 @ save multiplicand
	MOV R0, #0 @ prep accumulator
	MOV R3, #0 @ initialize counter
	MOV R4, #1

@ TST vs CMP
@ TST does an AND on the 2 and drops result
@ CMP subtracts the 2 and drops result
@ both sets the flags
loop:
	CMP R3, #0 @ if counter greater than zero, shift multiplicand
	MOVNE R2, R2, LSL #1 @ move muliplicand to left
	MOVNE R4, R4, LSL #1
	TST R1, R4
	BEQ iterate
	ADD R0, R0, R2
	
iterate:
	ADD R3, R3, #1
	CMP R3, #31
	BLE loop

exit:
	BX LR

