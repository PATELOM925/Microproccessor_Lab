data segment
    n1 dw 03h
    fact dw ?
    data ends

code segment
    assume cs:code, ds:data
    start:
    mov ax, data
    mov ds, ax
    mov ax, 01h
    mov cx, n1
    
    up:
    mul cx
    
    loop up
    mov fact, ax
    
    mov ah, 4ch
    int 21h
    code ends
end start