.global add64

.text

add64:
	@ 64 bits so a and b will be on 2 registers
	@ a on R0 and R1
	@ b on R2 and R3

	@ we're actually manipulating bits on 4 registers
	@ split the operation into 2 32-bit operation
	@ when we add, we start from the lower bits first
	@  1011
	@ +0010
	@ if we split this problem in 2, we'd do
	@  11
	@ +10
	@ ---
	@  01
	@ first
	@ Then, with the carried 1 from the last operation, we do the other half
	@  10
	@  00
	@ +01 (the carry from the last operation)
	@ ---
	@  11
	@ Since the configuration of the first operation didn't change, the answer should be
	@ 1101
	@ If we did it without splitting, the answer would be the same
	@ The same concept applies to adding 64 bit numbers. Split in half, carry, then combine
	@ Combine not needed since the arrangement of bits done for you
	ADDS R0, R0, R2
	ADC R1, R1, R3
	BX LR
