.model tiny
.386
.data
.code
.startup
MOV BX,0400h
MOV DI,0500h
MOV SI,14h
X1: MOV AL,[BX+SI]
MOV [DI],AL
INC DI
DEC SI
JNZ X1
JMP X2
X2:JMP X2
.exit
end