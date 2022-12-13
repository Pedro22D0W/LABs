.model small
.data
.stack 100h
msg1 DB "1$"
msg2 DB "0$"
msg3 DB 10,"SELECIONE A OPERACAO:$"
msg4 DB 10,"binario:1$"
msg5 DB 10, "hexa:2$"
msg6 DB 10,"----------------------$"
msg7 DB 10,"digite o numero:$"
msg8 DB 10, "octal:3$"

vetor DB ?,?,?,?,?,?,?,?

.code

pl MACRO 
    mov ah,02
    mov dl,10
    int 21h
ENDM




main PROC

    mov ax,@data
    mov ds,ax

    mov ah,09
    lea dx,msg3
    int 21h
    pl
     mov ah,09
    lea dx,msg4
    int 21h
    pl
    mov ah,09
    lea dx,msg5
    int 21h
    pl
    mov ah,09
    lea dx,msg8
    int 21h
    pl
    
    mov ah,01
    int 21h


    cmp al,32h
    je h
    cmp al,33h
    je o



    call binario
    jmp fim

    h:
    pl
    call hexa
    jmp fim
    o:
    call octal
    
    fim:

    mov ah,4ch
    int 21h

    
main ENDP


binario PROC
    pl

    mov cx,8                ;incia contador com 8
   
    lea si,vetor            ;inicia apontador
    xor bx,bx               ;zera bx para apontar "coluna"
     volta:
    mov ah,01               ;digitar numero
    int 21h

    mov vetor[si][bx],al    ;move conteudo digitado para a posição de memoria equivalente ao numero em bx
    inc bx                  ;incrementa bx para proxima posição de memoria
    loop volta              ;repete até cx 0

    mov cx,8                ;inicia contador com 8
    xor bx,bx               ;zera bx para ser apontador de coluna
    pl
    volta2:
  
    mov al,vetor[si][bx]    ;move conteudo da posiçao si + bx para al
    and al,0fh              ;transforma em numero
    shr al,1                ;desloca bits uma casa para direita 
    jc c1                   ;se carry igual a 1 pula para c1
    mov ah,09               ;cf igual a zero printa zero
    lea dx,msg2
    int 21h
    inc bx
    loop volta2
    ret
    c1:
    mov ah,09               ;cf igual a 1 printa 1
    lea dx,msg1
    int 21h
    inc bx
    loop volta2
    ret

   
    
binario ENDP


hexa PROC
    mov cl,4            ;incia contador com 4
    volta3:
    mov ah,01           ;digitar numero
    int 21h
    cmp al,39h          ;compara para ver se é letra ou numero
    jg letra            ;se for letra pula para letra
    and al,0fh          ;tranforma caracter em numero
    jmp convert
    letra:
    sub al,37h          ;transforma letra caracter em letra numero
    convert:
    shl bx,4            ;descloca os bits de bx 4 vezes para esquerda para colocar o numero hexa no lugar certo
    or bl,al            ;move os bits de al para bl
    loop volta3

    mov cl,4
    pl
    saida:
    xor ax,ax           ;zera ax para usar como armazenador
    or ah,bh            ;manda primeiro numero diditado para ah
    rol ax,4            ;rola os 4 primeiros digitos de ah para al
    rol bx,4            ;rola bx para adicionar o segundo numero digitado em ah
    cmp al,9            ;checa se é letra ou numero
    jg letra2
    add al,30h          ;transforma numero em caracter
    mov ah,02           ;printa numero
    mov dl,al
    int 21h
    loop saida
    ret
    cmp ah,0            ;checa se ainda tem algum numero em ax
    jne saida           ;se tiver repete o processo mais uma vez
    letra2:
    add al,37h          ;transforma letra numero em letra caracter
    mov ah,02           ;printa
    mov dl,al
    int 21h
    loop saida
    cmp ah,0            ;checa se ainda tem algum numero em ax
    jne saida           ;se tiver repete o processo mais uma vez
    ret

 
hexa ENDP


octal PROC

    pl

    mov cl,4        ;faz o mesmo processo que hexa mas "deleta o 4º bit"
    volta4:
    mov ah,01
    int 21h
    and al,0fh
    shl al,5        ;desloca al 5 bits para esquerda para jogar o 4º bit fora
    shr al,5        ;retorna valor original sem o 4º bit
    shl bx,4
    or bl,al
    loop volta4

    mov cl,4
    pl
    saida1:
    xor ax,ax
    or ah,bh
    rol ax,4
    rol bx,4
    add al,30h
    mov ah,02
    mov dl,al
    int 21h
    loop saida1
    ret

    
octal ENDP
end main