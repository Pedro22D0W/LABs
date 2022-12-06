.model small
.data

n equ 7

.code



main PROC
    
    mov ax,@data   ;inicializa ds
    mov ds,ax
    mov cx,n       ;move constante pare cx (contador)
    comeco:
    mov ah,01       ;chama função 01 para digitar no terminal
    int 21h
    mov bl,al       ;move numero digitado para al,afim de conservar o numero para poder pular linha
    
    mov ah,2        ;função 02 para pular linha
    mov dl,10
    int 21h


    mov ah,02       ; ;função 02 de printar conteudo de um registrador(numero digitado)
    mov dl,bl
    int 21h

    mov ah,2        ;;função 02 para pular linha
    mov dl,10
    int 21h

    loop comeco     ;repete o até o contador ser 0

    mov ah,4ch
    int 21h
    
main ENDP
end main