.model small
.data

msg1 db "=$"
msg2 db "+$"

.code 

main PROC
    mov ax,@data
    mov ds,ax

    mov ah,01
    int 21h
    add bl,al
    or bl,bl

    mov ah,02
    mov dl,al
    int 21h

    mov ah,09
    lea dl,msg2
    int 21h


    mov ah,01
    int 21h
    mov ah,02
    mov dl,al
    int 21h

    or dl,dl
    add bl,dl
     
    mov ah,09
    lea dl,msg1
    int 21h

    and bl,bl

    mov ah,02
    mov dl,bl
    int 21h

    mov ah,4ch
    int 21h


main ENDP
end main