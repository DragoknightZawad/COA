.model small
.stack 100h
.data



.code

main proc
    mov ax,@data
    mov ds,ax
    

    
    mov ah,2
    mov dl,0dh
    int 21h
    
    mov dl,0dh
    int 21h
    
    mov cx,26
    mov dl,61h
    
L1:

   int 21h
   add dl,1h
   loop L1
   
   mov dl,0ah
   int 21h 
   
   mov dl,0dh
   int 21h
   
   mov cx,26 
   mov dl,5Ah
   
L2:

  int 21h
  sub dl,1h
  Loop L2