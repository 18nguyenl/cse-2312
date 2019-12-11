.global sum

.text

@ uint16_t sum(uint16_t x[], uint16_t count);
sum:
	MOV R2, R0
	MOV R0, #0

sum_loop:
	LDRH R3, [R2], #2
	ADD R0, R0, R3
	SUBS R1, R1, #1
	BNE sum_loop
	BX LR
