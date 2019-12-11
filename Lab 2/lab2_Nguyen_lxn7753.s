.global sumS32
.global sumS8
.global sumU32_64
.global countNegative
.global countNonNegative
.global countMatches
.global uint8ToBinaryString
.global int16ToBinaryString
.global getParity
.global returnMax
.global returnMin

.text

sumS32:
    MOV R2, R0
    MOV R0, #0
	loopSumS32:
        LDR R3, [R2], #4
		ADD	R0, R0, R3
		SUBS R1, R1, #1
		BNE loopSumS32
	BX LR

sumS8:
    MOV R2, R0
    MOV R0, #0
	loopSumS8:
        LDRSB R3, [R2], #1
		ADD	R0, R0, R3
		SUBS R1, R1, #1
		BNE loopSumS8
	BX LR

sumU32_64:
    MOV R2, R0
    MOV R0, #0
    MOV R4, #0
    MOV R5, #0
	loopSumU32_64:
        LDR R3, [R2], #4
		
        ADDS R4, R4, R3
        ADC R5, R5, #0
		
		SUBS R1, R1, #1
		BNE loopSumU32_64
	MOV R0, R4
	MOV R1, R5
	BX LR

countNegative:
    MOV R2, R0
    MOV R0, #0
	loopCountNegative:
        LDR R3, [R2], #4
		CMP R3, #0
        ADDMI R0, R0, #1
		SUBS R1, R1, #1
		BNE loopCountNegative
	BX LR

countNonNegative:
    MOV R2, R0
    MOV R0, #0
	loopCountNonNegative:
        LDR R3, [R2], #4
		CMP R3, #0
        ADDPL R0, R0, #1
		SUBS R1, R1, #1
		BNE loopCountNonNegative
	BX LR

countMatches:
    MOV R2, R0
    MOV R0, #0
	loopCountMatches:
        LDRB R3, [R2], #1

		CMP R3, R1
        ADDEQ R0, R0, #1

		CMP R3, #0
		BNE loopCountMatches
	CMP R0, #0
	SUBEQ R0, R0, #1
	BX LR

int16ToBinaryString:
    MOV R2, #0x8000
    B toBinaryLoop
uint8ToBinaryString:
	MOV R2, #0x80
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

getParity:
	MOV R1, #0x80000000
	MOV R2, #0
	getParityLoop:
		TST R0, R1
		ADDNE R2, #1
		MOVS R1, R1, LSR #1
		BNE getParityLoop
	AND R0, R2, #1
	BX LR

returnMax:
	MOV R2, R0
	MOV R0, #0

	returnMaxLoop:
		LDR R3, [R2], #4
		CMP R3, R0
		MOVGE R0, R3
		SUBS R1, R1, #1
		BNE returnMaxLoop
	BX LR

returnMin:
	MOV R2, R0
	MOV R0, #0xFFFFFFFF

	returnMinLoop:
		LDR R3, [R2], #4
		CMP R3, R0
		MOVLE R0, R3
		SUBS R1, R1, #1
		BNE returnMinLoop
	BX LR

end:
    BX LR
