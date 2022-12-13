.model small
.data

vetor db 31h,32h,33h,35h,36h,37h,38h,39h

msg1 db "sim$"
msg2 db "nao$"
msg3 db "posicao:$"

.code

pl MACRO params
    mov dl,10
    mov ah,02
    int 21h
ENDM


main PROC
    mov ax,@data
    mov ds,ax
    mov es,ax
    xor dx,dx
    xor si,si
    lea di,vetor

    mov cx,8
    mov ah,01
    int 21h
    push ax
    pl
    pop ax
    lop:
    scasb 
    jz sim
    inc si
    loop lop

    mov ah,09
    lea dx,msg2
    int 21h
    jmp fim
    sim:
    mov ah,09
    lea dx,msg1
    int 21h
    pl
    mov ah,09
    lea dx,msg3
    int 21h
    mov ah,02
    mov dx,si
    or dx,30h
    int 21h

    fim:
    mov ah,4ch
    int 21h
    


main ENDP
end main

