.model tiny
.486
.data
fname db 'draw.txt',0 
handle dw ?
fig db 'rect'
fill db ?
shape db 4 dup(?)
color db ?
len db ?
wid db ?
cvm db ?

.code
.startup

mov ah,0fh
int 10h
mov cvm,al;0239

	mov ah,0
	mov al,03h
	int 10h

mov ah,3dh
mov al,0
lea dx,fname;0226
int 21h
mov handle,ax;022b

	mov ah,42h
	mov al,0
	mov bx,handle;022b
	mov cx,0
	mov dx,40
	int 21h

	mov ah,3fh
	mov bx,handle
	mov cx,4
	lea dx,shape;0232
	int 21h

mov ah,42h
mov al,0
mov bx,handle;022b
mov cx,0
mov dx,100
int 21h

mov ah,3fh
mov bx,handle
mov cx,1
lea dx,color;0236
int 21h

	mov ah,42h
	mov al,0
	mov bx,handle
	mov cx,0
	mov dx,120
	int 21h

	mov ah,3fh
	mov bx,handle
	mov cx,1
	lea dx,len;0237
	int 21h

mov ah,42h
mov al,0
mov bx,handle
mov cx,0
mov dx,140
int 21h

mov ah,3fh
mov bx,handle
mov cx,1
lea dx,wid;0238
int 21h

;sub len,30h
;sub wid,30h

cmp color,'b';0236
jnz x1
mov fill,00010001b;0231
jmp x3

x1: cmp color,'g'
jnz x2
mov fill,00100010b
jmp x3

x2: cmp color,'r' ;0236
mov fill,01000100b;0231

x3:	lea si,shape;0232
	lea di,fig;022d
	cld
	mov cx,4
	repe cmpsb
	jnz x5

	mov dh,0
x4: mov ah,02h
mov dl,0
mov bh,0
int 10h

mov ah,09h
mov al,' '
mov bh,0
mov bl,fill;0231
movzx cx,len;0237
int 10h

inc dh
cmp dh,wid;0238
jnz x4
jmp x7

	x5:	mov dh,0
	x6: mov ah,02h
	mov dl,0
	mov bh,0
	int 10h

	mov ah,09h
	mov al,' '
	mov bh,0
	mov bl,fill;0231
	movzx cx,len;0237
	int 10h
	
	inc dh
	cmp dh,len
	jnz x6

x7:
	mov ah,07h
x:  int 21h
	cmp al,'=';3d
	jnz x

mov ah,0h
mov al,cvm;0239
int 10h

.exit
end