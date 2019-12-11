.global strlen
.global strcat

.text

strlen:
    MOV R1, R0
    MOV R0, #0
strlen_loop:
    LDRB R2, [R1], #1 @ post-index; increment R1 after using
    @LDRB R2, [R1, R0] @ Use counter to offset from initial address
    /*LDRB R2, [R1] @ Incrementing address directly
    ADD R1, R1, #1*/
    CMP R2, #0
    BEQ strlen_end
    ADD R0, R0, #1
    B strlen_loop
strlen_end:
    BX LR 

strcat:
    MOV R2, R0 @ save address of first string
strcat_loop1:
    LDRB R3, [R2], #1 @ Retrieve byte from memory and check for null terminator
    CMP R3, #0
    BNE strcat_loop1    
    SUB R2, R2, #1 @ Move pointer back one position to over write null terminator
strcat_loop2:
    LDRB R3, [R1], #1
    STRB R3, [R2], #1 @ Advance pointer one address to save next byte
    CMP R3, #0
    BNE strcat_loop2
    BX LR
