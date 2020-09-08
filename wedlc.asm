.model tiny
.486
.data
VIDMODE DB ?
FNAME DB 'draw.txt',0
HANDLE DW ?
SHAPE DB 5 DUP('$')
COLOUR DB 0
HEIGHT DB 0
BREADTH DB 0
PRESHAPE DB 'rect'
PRESHAPE2 DB 'squr'
ROW DB 0

stack DW 5 DUP(?)
.code
.startup
mov ah,0Fh
int 10h
mov VIDMODE,al

mov ah,0
mov al,3
int 10h

mov ah,3Dh
mov al,0
lea dx,FNAME
int 21h
mov HANDLE,ax

mov ah,42h
mov al,0
mov bx,HANDLE
mov cx,0
mov dx,40
int 21h

mov ah,3fh
mov bx,HANDLE
mov cx,4
lea dx,SHAPE
int 21h

mov ah,42h
mov al,0
mov bx,HANDLE
mov cx,0
mov dx,100
int 21h

mov ah,3fh
mov bx,HANDLE
mov cx,1
lea dx,COLOUR
int 21h

mov ah,42h
mov al,0
mov bx,HANDLE
mov cx,0
mov dx,120
int 21h

mov ah,3fh
mov bx,HANDLE
mov cx,1
lea dx,HEIGHT
int 21h

sub HEIGHT,30h

lea si,SHAPE
lea di,PRESHAPE
mov cx,4
cld
repe cmpsb
je width1

lea si,SHAPE
lea di,PRESHAPE2
mov cx,4
cld
repe cmpsb
je square
jne errcode

width1:mov ah,42h
mov al,0
mov bx,HANDLE
mov cx,0
mov dx,140
int 21h

mov ah,3fh
mov bx,HANDLE
mov cx,1
lea dx,BREADTH
int 21h

sub BREADTH,30h
jmp rectangle

square:
mov ah,3Eh
mov bx,HANDLE
int 21h

mov al,HEIGHT
mov BREADTH,al
jmp colset
errcode:
mov ah,09h
mov al,'E'
mov bh,0;
mov bl,10101111b
mov cx,4
int 10h
jmp outside
rectangle:
mov ah,3Eh
mov bx,HANDLE
int 21h
colset:
cmp byte ptr COLOUR,'g'
jne opt2
mov COLOUR,00100010b
jmp shaper
opt2:cmp byte ptr COLOUR,'b'
jne opt3
mov COLOUR,00010001b
jmp shaper
opt3:mov COLOUR,01000100b
shaper:
mov ah,09h
mov al,' '
mov bh,0;
mov bl,COLOUR
movzx cx,HEIGHT
int 10h

inc byte ptr ROW
mov dl,BREADTH
cmp byte ptr ROW,dl
je  outside

mov ah,02h
mov dh,ROW
mov dl,0
mov bh,0
int 10h

jmp shaper

outside:
mov ah,07h
block:int 21h
cmp al,'='
jne block 

mov ah,0
mov al,VIDMODE
int 10h
.exit
end