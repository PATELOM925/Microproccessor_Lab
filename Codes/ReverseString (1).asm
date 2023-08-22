data segment
    
    mes1 db "Input String: $"
    mes2 db "The reversed string is: $"
    str_buf db 255,255 dup('$')
    rev_buf db 255,255 dup('$')
    nl db 0dh,0ah,'$'
    size dw 0h    
data ends         

code segment
    Assume CS:code, DS:data
start:
    mov ax,data
    mov ds,ax
    
    mov ah,9
    mov dx,offset mes1
    int 21h
    
    mov ah,0ah
    mov dx,offset str_buf
    int 21h
    
    mov ah,9
    mov dx,offset nl                                    
    int 21h  
    
    mov si,offset str_buf+1
    mov ch,0h    
    mov cl,BYTE PTR[si]
    mov di,si    
    add di,cx
    
    mov si,offset rev_buf+1
         
          
next:  
    inc si       
    mov al,[di]
    mov [si],al
    ;mov bl,al
    dec di
    loop next        
    
    mov ah,9
    mov dx,offset mes2
    int 21h
      
    mov ah,9
    mov dx,offset rev_buf+2
    int 21h

    mov ah,1
    int 21h
     
    mov ah,4ch
    int 21h 

code ends

end start
    