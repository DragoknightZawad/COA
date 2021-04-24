.MODEL SMALL
.STACK 100H
.DATA

;Welcome messages

.CODE
MAIN PROC 
    ;SHOW WELCOME MESSAGES
    ;LOAD DATA SECMENTS ETC 
    XOR BX, BX
    MOV AH,1
    INT 21H 
    
    WHILE_:
    CMP AL, 0DH
    JE EXITTODOS
    AND AL,0FH
    SHL BX,1
    OR BL,AL  
    
    INT 21H;read a character
    JMP WHILE_   
    ;now output the code
    OUTPUTBINARY:
    XOR CX,CX
    nop
    inc cx ;Increment
    cmp cx,16
    JE OUTPUTBINARY
    ROL BX ; BX holds output value,put msb into CF
    COMP CF ,1
           
    
    ;EXIT TO DOC
    EXITTODOS:
    MOV AX ,4CH
    INT 21H
MAIN ENDP   
END MAIN