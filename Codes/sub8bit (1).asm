data segment
    n1 db 09h
    n2 db 02h
    n3 db 00h
    data ends

code segment  
    start:    
    assume cs: code, ds: data
    mov ax, data
    mov ds, ax
    mov al, n1
    mov bl, n2
    sub al, bl
    mov n3, al
    mov ah, 4ch
    int 21h
    code ends
end start
