.model tiny
.486
.data
VIDMODE DB ?
RDAT DB 0
COLDAT DB 0
COLDAT2 DB 40
UDAT DB ?
FNAME DB 'out',0
HANDLE DW ?
.code
.startup
mov ah,0Fh
int 10h
mov VIDMODE,al

mov ah,0
mov al,03h
int 10h

;open file
mov ah,3Dh
mov al,2
lea dx,FNAME
int 21h
mov HANDLE,ax

loop1:
mov ah,02h
mov dh,RDAT
mov dl,COLDAT
mov bh,0
int 10h

mov ah,09h
mov al,' '
mov bh,0
mov bl,01001111b
mov cx,40
int 10h

mov ah,02h
mov dh,RDAT
mov dl,COLDAT2
mov bh,0
int 10h

mov ah,09h
mov al,' '
mov bh,0
mov bl,00011111b
mov cx,40
int 10h

inc byte ptr RDAT
cmp byte ptr RDAT,12
jne loop1

loop2:
mov ah,02h
mov dh,RDAT
mov dl,COLDAT
mov bh,0
int 10h

mov ah,09h
mov al,' '
mov bh,0
mov bl,00011111b
mov cx,40
int 10h

mov ah,02h
mov dh,RDAT
mov dl,COLDAT2
mov bh,0
int 10h

mov ah,09h
mov al,' '
mov bh,0
mov bl,01001111b
mov cx,40
int 10h

inc byte ptr RDAT
cmp byte ptr RDAT,24
jne loop2

; #####################################################################
mov RDAT,12

loop3:
mov ah,02h
mov dh,RDAT
mov dl,COLDAT2
mov bh,0
int 10h

mov ah,08h
int 21h
cmp al,'*'
je outside
mov UDAT,al

mov [si],al
inc si
mov ah,09h
mov bh,0
mov bl,01001111b
mov cx,1
int 10h

mov ah,40h
mov bx,HANDLE
mov cx,1
lea DX,UDAT
int 21h

inc byte ptr COLDAT2
cmp byte ptr COLDAT2,80
jne loop3
inc byte ptr RDAT
mov COLDAT2,40
jmp loop3
;
outside:

mov ah,0
mov al,VIDMODE
int 10h  
.exit
end