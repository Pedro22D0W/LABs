.model small
.data

msg1 db "=$"
msg2 db "+$"

.code 

main PROC
    mov ax,@data      ;inicializa ds
    mov ds,ax

    mov ah,01         ;chama funçao 01 para o usuario digitar algo e 
    int 21h
    mov bl,al         ;move al para bl para pode digitar o proximo numero
    and bl,0fh        ;transforma caracter em numero

   
    mov ah,09         ;função 09 para imprimir mensagem "msg2 (+)"
    lea dx,msg2
    int 21h


    mov ah,01         ;chama funçao 01 para o usuario digitar algo e 
    int 21h
   

    and al,0fh        ;transforma caracter em numero
    add bl,al         ;soma os 2 numeros digitados
     
    mov ah,09         ;função 09 para imprimir mensagem "msg1 (=)"
    lea dx,msg1
    int 21h

    add bl,30h       ;tranforma numero em caracter

    mov ah,02        ;imprime caracter do resultado da soma
    mov dl,bl
    int 21h

    mov ah,4ch
    int 21h


main ENDP
end main