data segment
    pass db "tithi"
    flag db 1    
    len db 0          
    s1 db "Enter the Password: $"
    correct db "Correct Password!$"
    incorrect db "Incorrect Password!$"
    
data ends

code segment   
    start:
    Assume CS:code, DS:data
    mov ax,data
    mov ds,ax
    
    ;offset: stack index increase according to the string length
    mov si,offset pass 
        
    ;msg print
    mov ah,9
    mov dx,offset s1
    int 21h
    
 next:
    mov ah,7
    int 21h
    
    cmp al,13            
    je over
    
    cmp al,[si]
    je star
    
    mov flag,0
    
   star:
    mov ah,2
    mov dx,'*'
    int 21h
    
    inc si
    add len,1                         
 loop next
   
   over: 
   
    mov ah,2
    mov dx,10
    int 21h
    mov ah,2
    mov dx,13
    int 21h
    
   
    cmp flag,1
    je corr 
    
   incorr:
    mov ah,9
    mov dx, offset incorrect
    int 21h
    jmp exit
    
   corr:
    cmp len,5
    jne incorr
    mov ah,9
    mov dx, offset correct
    int 21h
    
   exit:
    mov ah,4ch
    int 21h
    
code ends
end start