.model small
.stack 

.data

msg1 db "sim$"
msg2 db "nao$"
msg3 db "iguais$"
msg4 db "diferentes$"

vetor1 db 31h,32h,33h,34h

vetor2 db 35h,36h,37h,38h

vetor3 db 31h,32h,33h,34h

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

    call movsbb
    pl
    ;call stosbb
    pl
    call lodsbb
    pl
    call scasbb
    pl
    call cmpsbb

    mov ah,4ch
    int 21h
    
main ENDP


movsbb PROC
    mov bx,3
    mov cx,4
    lea si,vetor1 + bx
    lea di,vetor2
    cld
    movsblop:
    lea si,vetor1 + bx
    movsb
    dec bx
    loop movsblop
    mov cx,4
    lea si,vetor2
    movsbimp:
    mov dx,[si]
    mov ah,02
    int 21h
    inc si
    loop movsbimp
    ret


 
movsbb ENDP

;description
stosbb PROC
    cld
    lea si,vetor1 +2
    mov al,35h
    stosb
    mov dx,[si]
    mov ah,02
    int 21h
    ret

stosbb ENDP

;description
lodsbb PROC
    cld
    mov cx,4
    inc bx
    lodsblop:
    lea si,vetor1 + bx
    lodsb
    mov dl,al
    mov ah,02
    int 21h
    inc bx
    loop lodsblop
    ret
lodsbb ENDP

scasbb PROC
    mov cx,4
    mov ah,01
    int 21h
    lea di,vetor1
    scasbblop:
    scasb
    jz sim
    loop scasbblop
    mov ah,09
    lea dx,msg2
    int 21h
    ret
    sim:
    mov ah,02
    mov dx,di
    int 21h
    ret


    
scasbb ENDP


cmpsbb PROC

    lea si,vetor1
    lea di,vetor2
    mov cx,4
    cmpsbblop:
    cmpsb 
    jnz diferente
    mov ah,09
    lea dx,msg3
    int 21h
    ret
    diferente:
    mov ah,09
    lea dx,msg4
    int 21h
    ret

cmpsbb ENDP
end main
