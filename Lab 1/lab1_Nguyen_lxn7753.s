.global add64
.global sub64
.global minU8
.global minS8
.global isLessThanU32
.global isLessThanS32
.global shiftLeftU32
.global shiftU32
.global shiftS32
.global isEqualU16
.global isEqualS16
.global stringCopy
.global stringCat

.text

add64:
    ADDS R0, R0, R2
    ADC R1, R1, R3
    BX LR

sub64:
    SUBS R0, R0, R2
    SBC R1, R1, R3
    BX LR

minS8:
minU8:
    CMP R0, R1
    BLE end
    MOV R0, R1
    BX LR

isLessThanU32:
    CMP R0, R1
    MOV R0, #1
    BCC end
    MOV R0, #0
    BX LR

isLessThanS32:
    CMP R0, R1
    MOV R0, #1
    BLT end
    MOV R0, #0
    BX LR

shiftLeftU32:
    PUSH {LR}
    B leftShift

shiftU32:
    PUSH {LR}
    CMP R1, #0
    BMI URightShift
    B leftShift

shiftS32:
    PUSH {LR}
    CMP R1, #0
    BMI rightShift
    B leftShift

endShift:
    POP {LR}
    BX LR

leftShift:
    MOV R0, R0, LSL R1
    B endShift

URightShift:
    CMP R1, #0
    BLMI makeR1Positive
    MOV R0, R0, LSR R1
    B endShift

rightShift:
    CMP R1, #0
    BLMI makeR1Positive
    MOV R0, R0, ASR R1
    B endShift

makeR1Positive:
    MVN R1, R1
    ADD R1, R1, #1
    BX LR

isEqualU16:
isEqualS16:
    CMP R0, R1
    MOV R0, #1
    BEQ end
    MOV R0, #0
    BX LR

stringCopy:
    strcpy_loop:
        LDRB R2, [R1], #1
        STRB R2, [R0], #1
        CMP R2, #0
        BNE strcpy_loop
    BX LR

stringCat:
    MOV R2, R1
    strcat_loop1:
        LDRB R3, [R2], #1
        CMP R3, #0
        BNE strcat_loop1
        SUB R2, R2, #1
    strcat_loop2:
        LDRB R3, [R0], #1
        STRB R3, [R2], #1
        CMP R3, #0
        BNE strcat_loop2
    BX LR

end:
    BX LR
