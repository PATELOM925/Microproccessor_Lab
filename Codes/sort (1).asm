data segment
    n1 db 05h
    n2 db 23h, 12h,45h,56h,36h
    data ends

code segment
    assume cs:code ds:data
    start:
    mov ax, data
    mov ds, ax
    mov ch, n1
    
    L4:
    mov si, offset n2
    mov cl, n1
    dec cl
    mov al, [si]
    
    L3:
    inc si
    mov bl
    cmp al, bl
    jnc L1
    dec si
    mov [si],al
    inc si
    mov al,bl
    jmp L2
     
    L1:
    dec si
    mov [si],bl
    inc si
    
    L2:
    dec cl
    jnz L3
    mov [si],al
    dec ch
    jnz L4
    mov ax,4cooh
    int 21h
    code ends
end start