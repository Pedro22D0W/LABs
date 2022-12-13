
.model small
.data

mensagem db 'mensagem$' 

.code

;description
main PROC
    mov ax,@data   ;inicializa segmento de dados DS
    mov ds,ax
    mov ah,9        ;chama função 09 da int21
    lea dl,mensagem ;le o endereço "mensagem" no seguimento de dados
    int 21h
    
    mov ah,4ch      ;chama função 4c da int 21 para sair dp programa
    int 21h

main ENDP
end main