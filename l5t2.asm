.model tiny
.486
.data
DAT1 DW ?
MISC DB 1
MISC2 DB 41
MISC3 DW 1
.code
.startup
mov ah,00h
mov al,3
int 10h

mov ah,02h
mov dh,1
mov dl,1
mov bh,0
int 10h
mov si,1
mov dat1,si
lea di,dat1
loop1:
mov ah,09h
mov al,' '
mov bh,0
mov bl,00011110b
mov cx,40
int 10h
inc si
cmp si,25
mov dat1,si
je outside

mov ah,02h
mov dl,1
mov dh,[di]
mov bh,0
int 10h
jmp loop1
outside:

mov ah,02h
mov dl,41
mov dh,1
mov bh,0
int 10h

mov si,1
mov dat1,si
loop2:
mov ah,09h
mov al,' '
mov bh,0
mov bl,01111010b
mov cx,40
int 10h
inc si
cmp si,25
je outside2
mov dat1,si
mov ah,02h
mov dl,41
mov dh,[di]
mov bh,0
int 10h
jmp loop2
outside2:

mov ah,02h
mov dh,1
mov dl,1
mov bh,0
int 10h

mov dx,0
mov si,1
loop3:
mov ah,08h
int 21h

cmp al,'$'
jne x15 
je x13  ;checks occurance of '$'

x15:
cmp al,'#'
jne x11 ;checks occurance of '#'

cmp dx,1
jne x11 ;checks if $ has come before #

x13: 
inc dx
cmp dx,2
je outside3
x11:
mov ah,09h
mov bh,0
mov bl,00011110b
mov cx,1
int 10h

mov ah,02h
mov dh,MISC
mov dl,MISC2
mov bh,0
int 10h

mov ah,09h
mov bh,0
mov bl,01111010b
mov cx,1
int 10h
inc si
cmp si,41
jb x12
mov si,1
lea bp,MISC2
mov di,41
mov [bp],di 
inc byte ptr MISC
x12:
mov MISC3,si
lea di,MISC3

mov ah,02h
mov dh,MISC
mov dl,[di]
mov bh,0
int 10h

inc byte ptr MISC2
jmp loop3

outside3:

mov ah,07h
x5:int 21h
cmp al,'%'
jne x5
.exit
end