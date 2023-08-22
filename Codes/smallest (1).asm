data segment
    str db 08h, 14h, 05h, 09h, 0Fh    
    res db ?                           
    data ends

code segment
    assume cs:code, ds:data
    start:
    mov ax, data
    mov ds, ax
    mov cx, 04h
    
    mov bl, 00h
    lea si, str
    
    up:
    mov al, [si]
    cmp al, bl
    jg nxt
    mov bl, al
    
    nxt:
    inc si
    dec cx
    jnz up
    
    mov res, al
    mov ax, 4c00h 
    int 21h
    code ends
end start
