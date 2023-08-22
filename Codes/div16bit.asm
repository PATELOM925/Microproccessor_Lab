data segment
    n1 dw 6666h
    n2 dw 2222h
    n3 dw 0000h
    data ends

code segment
    assume cs: code, ds: data 
    start:
    mov ax, data
    mov ds, ax 
    mov ax, 00h
    mov bx, 00h
    mov ax, n1  
    mov bx, n2
    div n2
    mov n3, ax
    code ends
end start

                  
                  



      
      

