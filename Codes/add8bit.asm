data segment
    n1 db 09h
    n2 db 02h
    n3 db 00h
    data ends

code segment 
    assume cs: code, ds: data 
    start:
    mov ax, data
    mov ds, ax    ;setup of ds register
    
    mov al, n1
    mov bl, n2 
    
    add al, bl 
    
    mov n3, al 
    
    mov ah, 4ch
    int 21h     ;interrupt
    code ends
end start
