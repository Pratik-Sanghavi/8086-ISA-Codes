.model tiny
.486
.data
max1 db 32
act1 db ?
inp1 db 32dup(0)
.code
.startup
LEA DX,max1
MOV AH,0Ah
INT 21h
.exit
end