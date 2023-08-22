data segment 
    arr dw 0001h, 0002h, 0003h, 0004h, 0005h, 0006h
    len equ ($-arr)/2
    sum dw ?
    data ends

code segment
    assume cs:code ds:data
    start:
    mov ax, data
    mov ds, ax
    
    lea si, arr
    clc
    
    xor ax, ax
    mov cx, len
    
    up:
    adc ax, [si]
    inc si
    inc si
    dec cx
    jnz up
    mov sum, ax
    mov ah, 4ch
    int 21h
    
    code ends
end start