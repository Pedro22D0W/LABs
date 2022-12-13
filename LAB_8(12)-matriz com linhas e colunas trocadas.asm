.model small
.stack 100h
.data

msg1 db "entrada de matriz:$"
msg2 db "saida de matriz:$"


matriz dw ?,?,?,?
       dw ?,?,?,?
       dw ?,?,?,?
       dw ?,?,?,?

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
    lea dx,msg1
    int 21h
    pl
    call entrada
    pl
    mov ah,09
    lea dx,msg2
    int 21h
    pl
    call saida
    pl
    mov ah,09
    lea dx,msg2
    int 21h
    pl
    call saida_inversa
    mov ah,4ch
    int 21h

main ENDP


entrada PROC

    mov cl,4
    mov ch,4
    lea si,matriz
    
    volta:
    mov ah,01
    int 21h

    xor ah,ah
    mov [bx][si],ax
    add si,2
    dec ch
    jnz volta
    pl
    sub si,8
    add bx,8
    mov ch,4
    dec cl
    jnz volta
    ret

    
entrada ENDP


saida PROC

    mov ch,4
    mov cl,4
    xor bx,bx
    lea si,matriz
    volta2:
    mov ah,02
    mov dx,[bx][si]
    int 21h
    add si,2
    dec ch
    jnz volta2
    pl
    sub si,8
    add bx,8
    mov ch,4
    dec cl
    jnz volta2
    ret
    
saida ENDP



    


saida_inversa PROC
   mov cl,4  ;<-----coluna
   mov ch,4  ;<-----linha
   xor dx,dx
   xor bx,bx
   lea si,matriz
   
   tvolta:
   mov ah,02
   mov dx,[bx][si]
   int 21h
   add bx,8
   dec cl
   jnz tvolta
   pl
   add si,2
   sub bx,32
   mov cl,4
   dec ch
   jnz tvolta
   ret



    


    


    
saida_inversa ENDP
end main