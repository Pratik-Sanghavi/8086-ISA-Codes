.model tiny
.386
.data
DAT1 DW 0000h,0001h,0002h,0003h,0004h,0005h,0006h,0007h,0008h,0009h
.code
.startup
LEA SI,DAT1
MOV BX,12h
MOV DL,02h
 
.exit
end