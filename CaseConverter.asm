.MODEL SMALL
.STACK 100H
.DATA ;if you need variables in your program
UP DB 'Please enter a Upper character to convert!$' ;Upper promopt 
LOW DB 'Please enter a lower character to convert!$' ;Lower promopt
Lower DB 'Lower case:!$' ;lower case
Upper DB 'Upper case:!$' ;Upper case
 

 

 

.CODE
MAIN PROC ;this is the main function

 

 

 

;you must load the memory location address where your variables are kept

 

 

 

MOV AX, @DATA; address of the zone/segment where our variables are kept
MOV DS,AX
;now do your stuffs


 


;Ask for input and convert to lower case  
MOV AH,9 ;string output instruction to DOS
LEA DX,UP ;Upper case statement prompt
INT 21H ;CALL DOS to action  
;INPUT
MOV AH,1 
INT 21H   ;read Upper character into AL
ADD AL,20H ;Convert to upper case
MOV CH,AL
;collect input
MOV BL,AL 
;New line (carriage return - line feed)
MOV AH,2
MOV DL,0DH ;Carriage return
INT 21H

;line feed
MOV DL, 0AH
INT 21H
 
 
;Upper case out put
MOV AH,9 ;string output instruction to DOS
LEA DX,Lower ;Lower case conversion statement
INT 21H ;CALL DOS to action  
;upper case to lower case output
MOV AH,2
MOV DL,BL
INT 21H

;New line (carriage return - line feed)
MOV AH,2
MOV DL,0DH ;Carriage return
INT 21H

;line feed
MOV DL, 0AH
INT 21H  

;Ask for input and convert to Upper case  
MOV AH,9 ;string output instruction to DOS
LEA DX,LOW ;Upper case statement prompt
INT 21H ;CALL DOS to action 
;INPUT
MOV AH,1 
INT 21H   ;read Upper character into AL
SUB AL,20H ;Convert to upper case
MOV CH,AL 
;collect input
MOV BL,AL 
;New line (carriage return - line feed)
MOV AH,2
MOV DL,0DH ;Carriage return
INT 21H

;line feed
MOV DL, 0AH
INT 21H
 
 
;Lower case out put
MOV AH,9 ;string output instruction to DOS
LEA DX,Upper ;Lower case conversion statement
INT 21H ;CALL DOS to action  
;upper case to Upper case output
MOV AH,2
MOV DL,BL
INT 21H


 

 

 

;exit to DOS - hand over power to operating system
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN