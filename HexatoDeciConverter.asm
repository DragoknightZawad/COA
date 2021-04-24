.MODEL SMALL
.STACK 100H
.DATA ;if you have variables
  INPUTMSG DB 'Enter a hex degit: $'
  OUTPUTMSG DB 'In Decimal it is $'
.CODE
   MAIN PROC
    ;Load data segment into DS register if you have variables  
    MOV AX, @DATA
    MOV DS,AX
    ;Now show input msg
    
    ;wait for single character input
    
    ;now show the decimal value of hex digiy
    
    ;Exit to DS
        MOV AX, 4CH
        INT 21H
    MAIN ENDP
    END MAIN