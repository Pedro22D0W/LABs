.model small
.stack 100h
.data

msg1 db "digite o numero$"
n db 2

.code


main PROC
    mov ax,@data
    mov ds,ax

    mov si,10
    
    mov ah,09
    lea dx,msg1
    int 21h

    mov ah,02
    mov dl,10
    int 21h
    comeco:
    mov ah,01
    int 21h

    xor ah,ah
    push ax
    add bx,2
    cmp al,0dh
    jne comeco
    mov bp,sp
    add bp,bx
    sub bp,2
    lop:
    mov dx,[bp]
    mov ah,02
    sub bp,2
    int 21h
    cmp al,0dh
    jne lop
    



    mov ah,4ch
    int 21h

    


   
    


main ENDP
end main

