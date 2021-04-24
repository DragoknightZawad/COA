.MODEL SMALL
.STACK 100H
.DATA ;u will need this if you have variables
      ;declare all your variables here 
    
    
      MSG1 DB 0AH,0DH, 'THE SUM OF '
      NUM1 DB ?
      MSG2 DB ' AND '
      NUM2 DB ?
      MSG3 DB ' IS ' 
      SUM DB ?
      MSGLAST DB '$'
.CODE
    MAIN PROC 
        ;load the data segment into ds register  - use only for variable
        MOV AX, @DATA  ;address of the data segment
        MOV DS,AX
        ;here write your code   
        ;1st Input
        MOV AH,1
        INT 21H  
        ;Save 1st Input
        MOV NUM1,AL
        ;2nd input
        
        INT 21H 
        
        MOV NUM2,AL
        MOV BL,NUM2
        ;SUM
        ADD BL,NUM1 ;Now BL holds the sum of the numbers
        MOV SUM,BL
        SUB SUM,48  
        ;OUTPUT
        MOV AH,9
        LEA DX,MSG1
        INT 21H
        
        
        
        
        
        ;Exit to DOS
        MOV AX ,4CH
        INT 21H
    MAIN ENDP
    
         ;Declare other procs 
    
    
    
    END MAIN