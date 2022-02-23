.model tiny
.386
.data
LOC1 DB 'abcdefg.'
strsiz DW 0 
.code
.startup
LEA DI,LOC1
MOV AL,'.'
MOV CX, 0C9h
CLD
REPNE SCASB
MOV DX, 0C8h 
SUB DX,CX
MOV strsiz,DX
.exit
end