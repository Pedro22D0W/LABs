.model small
.stack 100h

.DATA
STR1 DB ‘OSC 2S21’
STR2 DB 8 DUP(?)
QTDE EQU 8
.CODE
MOV AX,@DATA
MOV DS,AX ; inicializa DS
MOV ES,AX ; inicializa ES
STD
LEA SI,STR1+8 ; origem do string
LEA DI,STR2 ; destino do string
STD ; seta DF
MOV CX,QTDE
MOVE:
MOVSB
ADD DI,2
LOOP MOVE
mov 