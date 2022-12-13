.MODEL SMALL
.DATA
STRI DB 100,"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
.CODE

MAIN PROC

MOV AX,@DATA            ;incia ds
MOV DS,AX


MOV AH,0AH              ;chama função 0ah para o usuario digitar uma string,ela vai pra memoria
mov DX,offset STRI      ;define endereço onde a string sera armazenada(primeiro endereço tem o numero de caracteres possivel digitar)
INT 21H 

MOV AH,02               ;função 02 para imprimir um caracter dx
MOV DL,10 
INT 21H



MOV AH,9                ;chama funçao 09 para imprimir conteudo de endereço de memoria
mov DX,offset STRI      ;move o endereço que sera usado para dx
add dx,2                ;adiciona 2 ao endereço de memoria para não printar o numero 
INT 21H

MOV AH,4CH              ;função 4ch para sair do programa
INT 21H
main endp
end main