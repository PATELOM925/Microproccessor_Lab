data segment
    n1 db 03h
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
    mul bl
    mov n3, bl
    code ends
end start