.MODEL SMALL
.STACK 100H
.DATA
PROMPT DB 'Type a line of text',0DH,0AH, '$'
NOCAP_MSG DB 0DH,0AH,'NO capitals $'
CAP_MSG DB 0DH,0AH ,'First capital = '
FIRST DB ']'
      DB 'Last capital = '
LAST DB '@ $'
.CODE
MAIN PROC
;INITIALIZE DS
MOV AX, @DATA
MOV DS,AX
;DISPLAY OPENING MESSAGE
MOV AH,9
LEA DX,PROMPT
INT 21H
;READ AND PROCESS A LINE OF TEXT
MOV AH,1   ;READ CHAR FUNCTION

INT 21H      ;CHAR IN AL

WHILE_:
;while character is not a carraige return, do

CMP AL,0DH    ;CR ?
JE END_WHILE  ;Yes, Exit  
;if character os a capital letter
 CMP AL,'A' ;Char >='A'?
 JNGE END_IF ;NOT A CAPITAL LETTER
 CMP AL, 'Z' ;Char<= 'Z'?
 JNLE END_IF ;NOT a capital letter 
 
 ;then if character precedes first capital
 
 CMP AL,FIRST ;Char<first capital?
 JNL  CHECK_LAST ;no ,>=
 
 ;then first capital = character
 MOV FIRST,AL ;FIRST = Char 
 
 ;end_if 
 
 CHECK_LAST:  
 
 ;if character follows last capital
 CMP AL,LAST ; Char>lastr capital?
 JNG END_IF ;No ,<=
 
 ;Then last capital= character
 MOV LAST,AL ;LAST =Char 
 ;end_if
 END_IF: 
 
 ;Read a character
 INT 21h
 JMP WHILE_
  
 ;Display results:
 END_WHILE: 
 MOV AH,9 ;Display string function if no capitals were typed  
 
 CMP FIRST, ']' ;First = ']'
 JNE CAPS ;no display results
 
 ;then 
 LEA DX,NOCAP_MSG ;no capitals
 JMP DISPLAY
 CAPS: 
 LEA DX, CAP_MSG ;capitals
 DISPLAY : 
 INT 21H ;display message
 ;end_if
 ;dos exit
 mov ah,4ch
 int 21h
 MAIN ENDP
 END MAIN
 
 