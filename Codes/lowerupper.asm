data segment 
    mes1 db "Enter a lower case string : $"
    str_buf db 255,255 dup('$')
    n1 db 0Dh, 0Ah, '$'
    mes2 db "Uppercase string is: $"
    table db "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    data ends

code segment
    assume cs:code ds:data
    start:
    mov ax, data
    mov ds, ax
    
    mov ah, 9
    mov dx, offset mes1
    int 21h
    
    mov ah, 0ah
    mov dx, offset str_buf
    int 21h
    
    mov ah,09h
    mov dx, offset n1
    int 21h
    
    mov ah, 09h
    mov dx, offset str_buf+2  
    int 21h
    
    mov ah, 09h
    mov dx, offset n1
    int 21h
    
    mov bx, offset table
    
    mov si, offset str_buf+1
    mov ch, 0
    mov cl, BYTE PTR[SI]
    
    next:
    inc si
    mov al, byte ptr[si]
    sub al,'a'
    xlat 
    mov byte ptr[si], al
    loop next
    
    mov ah, 09h
    mov dx, offset n1
    int 21h
    
    mov ah, 09h
    mov dx, offset mes2
    int 21h
                      
    mov ah, 09h
    mov dx, offset str_buf+2
    int 21h
    
    mov ah, 09h
    int 21h
    
    mov ah, 4ch
    int 21h
    code ends

end start
    