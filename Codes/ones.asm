data segment 
    n1 db 0AAh
    ones db ?
    zeros db ?
    data ends

code segment 
    assume cs:code, ds:data
    start:
    mov ax, data
    mov ds, ax
    mov ah, n1
    mov bl, 8
    mov cl, 1
    
    up:
    ror ah, cl
    jnc down
    inc ones
    jmp down1
    
    down:
    inc zeros
    
    down1:
    dec bl
    jnz up 
    
    mov ah, 4ch
    int 21h
    code ends
end start

