newline macro   
    
    lea dx, nl
    mov ah, 9
    int 21h
    
endm

print macro msg
    
    lea dx, msg
    mov ah, 9
    int 21h
    
endm

data segment
    msg db 'Enter a number : $'
    msg1 db 'number is even','$'
    msg2 db 'number is odd', '$'
    nl db 0dh, 0ah,          '$'  
    data ends

code segment
    assume cs:code, ds:data
    start:
    mov ax, data
    mov ds, ax
    
    print msg
    
    mov ah,1 
    int 21h
    
    mov bl, 2
    div bl
    
    mov al, ah
    
    cmp al, 0
    
    jg odd
    
    even:
    newline
    
    print msg1 
    jmp exit
    
    odd:
    newline
    
    print msg2  
    
    exit:
    code ends
end start


