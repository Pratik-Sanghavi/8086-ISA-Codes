.model tiny
.486
.data
VIDMODE DB ?
ROWDAT DB 24
COLDAT DB 79
.code
.startup
mov ah,0Fh
int 10h
mov VIDMODE,al

mov ah,0
mov al,3
int 10h

lea si,COLDAT
loop1:
mov ah,08h
int 21h

cmp al,'#'
je outside

mov ah,02h
mov dh,ROWDAT
mov dl,COLDAT
mov bh,0
int 10h

mov ah,09h
mov bh,0
mov bl,00001011b
mov cx,1
int 10h

dec byte ptr COLDAT
cmp byte ptr COLDAT,0
jne loop1
dec byte ptr ROWDAT
cmp byte ptr ROWDAT,0
je outside
mov al,79
mov [si],al
jmp loop1

outside:
;blocking and exit conditions

mov ah,0
mov al,VIDMODE
int 10h
.exit
end