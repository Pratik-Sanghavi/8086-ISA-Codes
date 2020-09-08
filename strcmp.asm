.model tiny
.486
.data
org 0000h
str1 db 'Transistor.'
str2 db 'Transister.'
res1 db ?
.code
.startup
LEA SI,str1
LEA DI,str1
MOV AL,'.'
MOV CX, 0C9h
CLD
REPNE SCASB
MOV DX, 0C8h 
SUB DX,CX
MOV CX,DX
INC CX
LEA DI,st
CLD
REPE CMPSB
JCXZ X1
LEA BX,res1
MOV AL,'N'
MOV [BX],AL
jmp X3

X1:LEA BX,res1
MOV AL,'Y'
MOV [BX],AL

X3:jmp X3
.exit
end