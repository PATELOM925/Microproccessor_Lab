data segment
    n1 dw 2222h
    n2 dw 3333h
    n3 dw 0000h
    data ends

code segment
    start:
    assume cs: code, ds: data
    mov ax, data
    mov ds, ax
    mov ax, n1
    mov bx, n2
    mul bx
    mov n3, bx
    code ends
end start



