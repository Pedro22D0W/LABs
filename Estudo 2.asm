.model small
.stack 100h

.data

msg1 db "menaganem de teste$"
matriz dw 31h,32h,33h,34h
       dw 34h,35h,36h,37h
       dw 38h,39h,31h,32h
       dw 38h,39h,31h,32h

matriz2 dw ?,?,?,?
       dw ?,?,?,?
       dw ?,?,?,?
       dw ?,?,?,?


.code

pl macro

mov dl,10            ;macro de pular linha
mov ah,02
int 21h
endm

main proc

mov ax,@data         ;inicializa ds
mov ds,ax

call imp             ;chama rocedimento imrpimir
pl
call invert          ;chama procedimento de imprimir inverso

mov ah,4ch
int 21h

main endp

imp proc             
mov ch,4             ;inicia contador de linha e coluna
mov cl,4
lea si,matriz        ;manda endereço de matratriz para si
imp1:
mov dx,[bx][si]      ;mov elemento da posiçao de matriz bx,si para dx
mov ah,02            ;funçao 02 para imprimir numero
int 21h
add si,2             ;anda uma posiçao na matriz
dec cl               ;decrementa contador de linha

jnz imp1             ;contador de linha diferemte de zero volta para imprimir proximo
pl
mov cl,4             ;restaura contador de linha
sub si,8             ;restaura ponteiro de coluna
add bx,8             ;pula para proxima linha
dec ch               ;se contador de dlinha direrente de zero voltap ara comeco
jnz imp1
ret
imp endp

invert proc
pop di               ;manda endereço de retorno para di
xor bx,bx            ;zera bx
lea si,matriz        ;manda endereço de matroz para si
mov ch,4
mov cl,4
inv:
mov dx,[bx][si]      ;manda para dx o condeudo da posicao bx,si da matriz
push dx              ;manda para pilha
add bx,8             ;pula para proxima linha
dec cl               ;decrementa contador de coluna
jnz inv
pl
mov cl,4             ;restaura contador de coluna
sub bx,32            ;restaura apontador de coluna
add si,2             ;pula para proxima posiçao da linha
dec ch               ;decremente contador de linha
jnz inv

lea si,matriz2       ;manda endereço da matriz2 para si
mov ch,4
mov cl,4
mov bp,sp            ;manda endereço do topo da pilha para bp
add bp,30            ;adiciona em bp 30 para usar na ordem certa
inv2:
mov dx,[bp]          ;manda conteudo de bp para dx
mov [bx][si],dx      ;manda conteudo de bp para matriz
add si,2             ;passa para proxima posiçao da linha
sub bp,2             ;passa para proximo numero na pilha
dec ch               
jnz inv2
mov ch,4
sub si,8
add bx,8
dec cl
jnz inv2

lea si,matriz2       ;faz proceedimento de imprimir com a matriz 2
xor bx,bx
mov ch,4
mov cl,4
invp:
mov dx,[bx][si]
mov ah,02
int 21h
add si,2
dec ch
jnz invp
pl
mov ch,4
add bx,8
sub si,8
dec cl
jnz invp
push di
ret

invert endp


end main