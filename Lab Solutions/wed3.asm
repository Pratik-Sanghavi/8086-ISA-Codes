.model tiny
.486
.data
VIDMODE DB ?
ROWDAT DB 6
COLDAT DB 39
COUNT DB 10
.code
.startup
mov ah,0Fh
int 10h
mov VIDMODE,al;get and store video mode in a memory location

mov ah,00h
mov al,3
int 10h;set video mode

mov cx,1
loop1:

mov ah,02h
mov dh,ROWDAT
mov dl,COLDAT
mov bh,0
int 10h

mov ah,09h
mov al,' '
mov bh,0
mov bl,00101010b
int 10h

inc BYTE PTR ROWDAT
dec BYTE PTR COLDAT
inc CX
inc CX
dec BYTE PTR COUNT
JNE loop1

mov ah,07h
block:int 21h
cmp al,'?'
jne block;keep screen until ? is pressed

mov ah,0
mov al,VIDMODE
int 10h;return to previous video mode
.exit
end