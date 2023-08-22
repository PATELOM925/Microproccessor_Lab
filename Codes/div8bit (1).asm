data segment
    n1 db 28h
    n2 db 02h
    n3 db 00h
    data ends

code segment
    assume cs: code, ds: data  
    start:
    mov ax, data
    mov ds, ax
    mov ax, 00h
    mov bx, 00h
    mov al, n1
    mov bl, n2
    div n2
    mov n3, al
    code ends
end start


      
      
