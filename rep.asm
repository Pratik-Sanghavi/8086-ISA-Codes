.model tiny
.386
.data
ARRAY1 DB 01h,02h,03h,04h,05h,06h,07h,08h,09h,0Ah
.code
.startup
LEA BX,ARRAY1
MOV CL,0Ah
X1:MOV AL,[BX]
SUB AL,0Ah
JE X2
INC BX
DEC CL
JNE X1
X2: MOV [BX],'E'
INC BX
DEC CL
JNE X1
.exit
end