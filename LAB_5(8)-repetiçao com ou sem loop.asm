.model small
.data

msg1 db "sem loop - 1$"
msg3 db "com loop - 2$"
msg2 db "*$"

.stack 100h
.code 


main PROC
    mov ax,@data
    mov ds,ax

    mov ah,09
    lea dx,msg1
    int 21h

    mov ah,02
    mov dl,10
    int 21h

    mov ah,09
    lea dx,msg3
    int 21h

    mov ah,02
    mov dl,10
    int 21h


    mov ah,01
    int 21h

     mov ah,02
    mov dl,10
    int 21h

    cmp al,32h
    je SL
    call LOOOP
    jmp fim
    SL:
    call sem_looop
    fim:
    mov ah,4ch
    int 21h
    
main ENDP

LOOOP PROC
    mov cx,50       ;inicia cintador com 50
    lop2:
    mov ah,09       ;funçao 09,printar conteudo de memoria
    lea dx,msg2     ;manda pra dx conteudo que ira printar
    int 21h         
    inc bl          ;incrementa bl para saber ahora de pular linha
    cmp bl,10       ;compara bl com 10 para pular linha
    jne lop         ;se bl diferente de 10 nao pula linha
    mov ah,02       ;pula linha
    mov dl,10       
    int 21h
    xor bx,bx       ;zera bx para iniciar contagem novamente
    lop:
    loop lop2       ;volta para lop 2 ate cx ser igual a zero
    ret
LOOOP ENDP

sem_looop  PROC
    mov cx,50
    lop3:
    mov ah,09
    lea dx,msg2
    int 21h
    inc bl
    cmp bl,10
    jne lop4
    mov dl,10
    int 21h
    xor bx,bx
    lop4:
    dec cx
    jnz lop3
    ret
sem_looop  ENDP
end main