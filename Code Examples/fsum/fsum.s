.global fsum

.text

@ double fsum(double x[], uint32_t count);
@ R0 = address of arry, R1 = count

fsum:
	MOV R2, #0
	VMOV D0, R2, R2 @ Zero out all 64 bits
	
fsum_loop:
	CMP R1, #0 @ test counter
	BEQ fsum_end @ if counter is zero, jump to exit
	VLDR.F64 D1, [R0] @ Load value at R0 into D1
	VSUM.F64 D0, D0, D1
	SUB R1, R1, #1 @ Decrement conter
	ADD R0, R0, #8 @ Move forward 64-bits
	B fsum_loop

fsum_end:
	VMOV R0, R1, D0 @ Move D0 to R1:R0
	BX LR
