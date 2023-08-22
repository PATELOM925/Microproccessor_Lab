data segment
    num db 07h
    pr db 0h
    npr db 0h
    msg1 db "it is a prime number$"
    msg2 db "it is not a prime number$"
    data ends
code segment 
    assume cs:code ds:data 
    start:
    
    mov ax, data
    mov ds, ax
    
    mov al, num
    mov bl, 02h
    
    mov dx, 0000h
    mov ah, 00h
    
    up:
    div bl
    cmp al, 00h
    jne next 
    inc bh
    
    next:
    cmp bh, 02h
    je false
    inc bl
    mov ax, 0000h
    mov dx, 0000h
    mov al, num
    cmp bl, num
    jne up
    
    true:
    lea dx, msg1
    mov ah, 09h
    int 21h
    jmp exit
    
    false:
    lea dx, msg2
    mov ah, 09h
    int 21h
    
    exit: 
    mov ah, 4ch
    int 21h
    
    code ends
end start