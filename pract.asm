.model small
.stack 100h
.data

welcome db "welcome$"


.code

main proc  
    ;show welcome message
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,welcome
    int 21h 
    ;New line (carriage return - line feed)
    MOV AH,2
    MOV DL,0DH ;Carriage return
    INT 21H

;line feed
MOV DL, 0AH
INT 21H
    ;INITIALIZE COUNTER and AH
    MOV CX, 50
    MOV AH, 2
    MOV DL, '*' 
    PRINT_LOOP:
    INT 21H
    LOOP PRINT_LOOP
    
   
    
      
    ;EXIT to DOS
    EXITTODOS:
    MOV AX, 4CH
    INT 21H
    MAIN ENDP ; end of procedure named MAIN
    END MAIN ;end of the program
    
        
  