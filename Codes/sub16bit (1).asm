data segment
    n1 dw 2222h
    n2 dw 1111h
    n3 dw 0000h
    data ends  

code segment  
    start:       
    assume cs: code, ds: data
    mov ax, data
    mov ds, ax
    mov ax, n1
    mov bx, n2
    sub ax, bx
    mov n3, ax 
    mov ah, 4ch
    int 21h
    
    code ends
end start



