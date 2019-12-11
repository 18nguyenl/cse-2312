.global uint32ToBinary
.global int32ToBinary
.global uint8ToBinaryString
.global int16ToBinaryString

.text

@ R0 = str, R1 = integer to convert
int32ToBinary:
uint32ToBinary:
	MOV R2, #0x80000000

uint32ToBinary_loop:
	TST R1, R2
	MOVNE R3, # '1'
	MOVEQ R3, # '0'
	STRB R3, [R0], #1
	MOVS R2, R2, LSR #1
	BNE uint32ToBinary_loop
	MOV R3, #0
	STRB R3, [R0]
	BX LR

@ R0 = str, R1 = integer to convert
int16ToBinaryString:
    MOV R2, #0x8000
    B toBinaryLoop
uint8ToBinaryString:
	MOV R2, #0x80000000
    B toBinaryLoop

toBinaryLoop:
	TST R1, R2
	MOVNE R3, # '1'
	MOVEQ R3, # '0'
	STRB R3, [R0], #1
	MOVS R2, R2, LSR #1
	BNE toBinaryLoop
	MOV R3, #0
	STRB R3, [R0]
	BX LR
