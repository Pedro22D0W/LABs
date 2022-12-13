.model small
.data

msg1 db "primeiro numero:$"
msg2 db "segundo numero:$"
msg3 db "paridade par$"
msg4 db "paridade impar$"

.code


main PROC
    mov ax,@data
    mov ds,ax

    mov ah,09
    lea dx,msg1
    int 21h

    mov ah,01
    int 21h
    mov bl,al
    and bl,0fh

    mov ah,02
    mov dl,10
    int 21h

    mov ah,09
    lea dx,msg2
    int 21h


    mov ah,01
    int 21h
    mov bh,al
    and bh,0fh

    mov ah,02
    mov dl,10
    int 21h

    

    cmp bl,bh
    jng ntroca

    xchg bl,bh

    ntroca:

    add bh,30h
    mov ah,02
    mov dl,bh
    int 21h
    and bh,0fh
    sub bh,0
    jp par

    mov ah,09
    lea dx,msg3
    int 21h

    jmp n2

    par:

    mov ah,09
    lea dx,msg4
    int 21h

    n2:

    mov ah,02
    mov dl,10
    int 21h

    add bl,30h
    mov ah,02
    mov dl,bl
    int 21h
    and bl,0fh
    sub bl,0
    jp par2

    mov ah,09
    lea dx,msg3
    int 21h
    jmp fim

    par2:

    mov ah,09
    lea dx,msg4
    int 21h


    fim:

    mov ah,4ch
    int 21h

    


main ENDP
end main