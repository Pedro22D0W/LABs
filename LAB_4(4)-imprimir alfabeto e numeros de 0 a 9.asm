.model small
.code


main PROC
    
    mov cl,65       ;move caracter "A" para cl
    volta:
    mov ah,02       ;função 02 para imprimir conteudo de registrador
    mov dl,cl       ;move conteudo de cl para dl afim de imprimir
    int 21h
    mov ah,02       ;funçao 02 para imprimir conteudo de registrador
    mov dl,10       ;move dl,10 para pular linha
    int 21h
    inc cl          ;incrementa cl para virar a proxima letra do alfabeto
    cmp cl,78       ;compara cl com "Z"
    jne volta       ;se cl for igual a "Z" seegue o codigo se nao volta
    
    mov cl,97
    volta2:
    mov ah,02
    mov dl,cl       
    int 21h
     mov ah,02      ;move dl,10 para pular linha
    mov dl,10
    int 21h
    inc cx          ;incrementa cl para virar a proxima letra do alfabeto
    cmp cx,124      ;se cl for igual a "z" seegue o codigo se nao volta
    jne volta2

        mov cl,30h
    volta3:
    mov ah,02
    mov dl,cl
    int 21h
     mov ah,02
    mov dl,10       ;move dl,10 para pular linha
    int 21h
    inc cx
    cmp cx,39h
    jne volta3

    mov ah,4ch
    int 21h
main ENDP
end main