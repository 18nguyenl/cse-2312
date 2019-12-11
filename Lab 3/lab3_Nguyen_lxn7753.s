.global sortDecendingInPlace
.global sumF32
.global prodF64
.global dotpF64
.global maxF32
.global absSumF64
.global sqrtSumF64
.global geoMean
.global getDirection
.global getAddNo
.global getCity

.text

sortDecendingInPlace:
    SUB R1, R1, #1
    bubbleSort:
        MOV R4, R1
        MOV R5, R0

        innerBubbleSort:
            LDR R2, [R0], #4
            LDR R3, [R0]

            CMP R2, R3
            STRLE R3, [R0, #-4]
            STRLE R2, [R0]
            SUBS R4, R4, #1
            BNE innerBubbleSort

        MOV R0, R5

        SUBS R1, R1, #1
        BNE bubbleSort
    BX LR

sumF32:
    MOV R2, #0
	VMOV S0, R2

    sumF32_loop:
        CMP R1, #0
        BEQ sumF32_end
        VLDR.F32 S1, [R0]
        VADD.F32 S0, S0, S1
        SUB R1, R1, #1
        ADD R0, R0, #4
        B sumF32_loop

    sumF32_end:
        VMOV R0, S0
        BX LR
    BX LR

prodF64:
	MOV R2, #0
	VMOV D0, R2, R2
    VLDR.F64 D0, [R0]
    ADD R0, R0, #8
    SUB R1, R1, #1
	
    prodF64_loop:
        CMP R1, #0
        BEQ prodF64_end
        VLDR.F64 D1, [R0]
        VMUL.F64 D0, D0, D1
        SUB R1, R1, #1
        ADD R0, R0, #8
        B prodF64_loop

    prodF64_end:
        VMOV R0, R1, D0
        BX LR
    BX LR

dotpF64:
	MOV R3, #0
	VMOV D0, R3, R3
	
    dotpF64_loop:
        CMP R2, #0
        BEQ dotpF64_end
        
        VLDR.F64 D1, [R0]
        VLDR.F64 D2, [R1]
        
        VMUL.F64 D1, D1, D2
        VADD.F64 D0, D0, D1
        
        SUB R2, R2, #1

        ADD R0, R0, #8
        ADD R1, R1, #8
        B dotpF64_loop

    dotpF64_end:
        VMOV R0, R1, D0
        BX LR

maxF32:
    MOV R3, #0
	VMOV S0, R3
	
    maxF32_loop:
        CMP R1, #0
        BEQ maxF32_end
        VLDR.F32 S1, [R0]
        VCMP.F32 S1, S0
        VMRS APSR_nzcv, FPSCR
        VMOVGT S0, S1
        SUB R1, R1, #1
        ADD R0, R0, #4
        B maxF32_loop

    maxF32_end:
        VMOV R0, S0
        BX LR
    BX LR

absSumF64:
	MOV R2, #0
	VMOV D0, R2, R2
	
    absSumF64_loop:
        CMP R1, #0
        BEQ absSumF64_end
        VLDR.F64 D1, [R0]
        VADD.F64 D0, D0, D1
        SUB R1, R1, #1
        ADD R0, R0, #8
        B absSumF64_loop

    absSumF64_end:
        VABS.F64 D0, D0
        VMOV R0, R1, D0
        BX LR

sqrtSumF64:
    MOV R2, #0
	VMOV D0, R2, R2
	
    sqrtSumF64_loop:
        CMP R1, #0
        BEQ sqrtSumF64_end
        VLDR.F64 D1, [R0]
        VADD.F64 D0, D0, D1
        SUB R1, R1, #1
        ADD R0, R0, #8
        B sqrtSumF64_loop

    sqrtSumF64_end:
        VSQRT.F64 D0, D0
        VMOV R0, R1, D0
        BX LR

geoMean:
    MOV R0, #0
    MOV R1, #0

    BX LR

getDirection:
    PUSH {LR}
    MOV R2, #-120
    ADD R1, R1, #1
    BL gotoIndex
    POP {LR}

    ADD R2, R2, #44
    
	LDR R0, [R0, R2] 
	BX LR

getAddNo:
    PUSH {LR}
    MOV R2, #-120
    ADD R1, R1, #1
    BL gotoIndex
    POP {LR}

    ADD R2, R2, #40
    
	LDR R0, [R0, R2] 
	BX LR

getCity:
    PUSH {LR}
    MOV R2, #-120
    ADD R1, R1, #1
    BL gotoIndex
    POP {LR}

    ADD R2, R2, #78
    
	ADD R0, R0, R2
    
	BX LR

gotoIndex:
    ADD R2, R2, #120
    SUBS R1, R1, #1
    BGT gotoIndex
    BX LR

end:
    BX LR
