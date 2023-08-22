data segment
    
    mes1 db "Input String: $"
    mes2 db "It is a Palindrome!$"
    mes3 db "It is not a Palindrome!$"       
    str_buf db 255,255 dup('$')
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
    ;mov size,si
    add di,cx    
          
next:  
    inc si   
    mov al,[si]
    mov bl,[di]
    cmp al,bl
    jne not_palindrome
    dec di
    loop next   
    
    mov ah,9
    mov dx,offset mes2
    int 21h
    jmp stop   
    
not_palindrome:

    mov ah,9
    mov dx,offset mes3
    
    int 21h    
        
stop:

    mov ah,1
    int 21h
     
    mov ah,4ch
    int 21h 

code ends

end start
    