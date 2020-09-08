.model tiny
.486
.data
FNAME DB 'draw',0
HANDLE DW ?
SHAPE DB 5 DUP('$')
COLOUR DB ?
HEIGHT DB ?
BREADTH DB ?
.code
.startup
mov ah,3Dh
mov al,2
lea dx,FNAME
int 21h
mov HANDLE,ax

mov ah,42h
mov al,0
mov bx,HANDLE
mov dx,40
int 21h

mov ah,3fh
mov bx,HANDLE
mov cx,4
lea dx,SHAPE
int 21h

mov ah,09h
lea dx,SHAPE
int 21h

mov dl,0Dh
mov ah,02h
int 21h

mov dl,0Ah
mov ah,02h
int 21h

mov ah,42h
mov al,0
mov bx,HANDLE
mov dx,100
int 21h

mov ah,3fh
mov bx,HANDLE
mov cx,1
lea dx,COLOUR
int 21h

mov dl,COLOUR
mov ah,02h
int 21h

mov dl,0Dh
mov ah,02h
int 21h

mov dl,0Ah
mov ah,02h
int 21h

mov ah,42h
mov al,0
mov bx,HANDLE
mov dx,120
int 21h

mov ah,3fh
mov bx,HANDLE
mov cx,1
lea dx,HEIGHT
int 21h

mov dl,HEIGHT
mov ah,02h
int 21h

mov dl,0Dh
mov ah,02h
int 21h

mov dl,0Ah
mov ah,02h
int 21h

mov ah,42h
mov al,0
mov bx,HANDLE
mov dx,140
int 21h

mov ah,3fh
mov bx,HANDLE
mov cx,1
lea dx,BREADTH
int 21h

mov dl,BREADTH
mov ah,02h
int 21h

mov dl,0Dh
mov ah,02h
int 21h

mov dl,0Ah
mov ah,02h
int 21h

mov ah,3Eh
mov bx,HANDLE
int 21h

.exit
end