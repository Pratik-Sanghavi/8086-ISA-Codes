.model tiny
.486
.data
VIDMODE DB ?
ROWDAT DB 0
COLDAT DB 0
.code
.startup
mov ah,0Fh
int 10h
mov VIDMODE,al;get and store video mode in a memory location

mov ah,00h
mov al,3
int 10h

lea SI,COLDAT
lea DI,ROWDAT

loop1:
mov ah,02h
mov dl,COLDAT
mov dh,ROWDAT
mov bh,0
int 10h;set cursor position

mov ah,09h
mov al,' '
mov bh,0
mov bl,01001100b
mov cx,1;print red
int 10h

INC BYTE PTR COLDAT
cmp BYTE PTR COLDAT,80
jne seg2
INC BYTE PTR ROWDAT
cmp BYTE PTR ROWDAT,25

je outside
MOV AL,0
MOV [SI],AL 

seg2:
mov ah,02h
mov dl,COLDAT
mov dh,ROWDAT 
mov bh,0
int 10h;set cursor position

mov ah,09h
mov al,' '
mov bh,0
mov bl,00011001b
mov cx,1;print blue
int 10h

INC BYTE PTR COLDAT
cmp BYTE PTR COLDAT,80
jne loop1
INC BYTE PTR ROWDAT
cmp BYTE PTR ROWDAT,25
je outside
MOV AL,0
MOV [SI],AL
jmp loop1 

outside:
mov ah,07h
block:int 21h
cmp al,'?'
jne block;keep screen until ? is pressed

mov ah,0
mov al,VIDMODE
int 10h;return to previous video mode
.exit
end