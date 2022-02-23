.model tiny
.486
.data
dstring db 'Enter User Name (10characters)',0Dh,0Ah,'$'
maxu db 12
actu db ?
username db 12 dup ('$')
ustring db 'pratik1234'
dstring2 db 'Enter Password (8 characters)',0Dh,0Ah,'$'
maxp db 10
actp db ?
password db 10 dup ('$')
pstring db 'pratik12' 
dstring3 db 'Hello $'
dstring4 db 'Invalid Username!$'
dstring5 db 'Incorrect Password!$'
.code
.startup
LEA DX,dstring
mov ah,09h
int 21h

lea dx,maxu
mov ah,0ah
int 21h

cld
lea si,ustring
lea di,username
mov cx,11
repe cmpsb
cmp cx,0
jne erru

LEA DX,dstring2
mov ah,09h
int 21h

mov cx,08h
lea di,password
pass:
mov ah,08h
int 21h
mov [di],al
inc di

mov dx,'*'
mov ah,02h
int 21h
loop pass

cld
lea si,pstring
lea di,password
mov cx,9
repe cmpsb
cmp cx,0
jne errp

MOV DL,0Dh
mov ah,02h
int 21h

MOV DL,0Ah
mov ah,02h
int 21h

LEA DX,dstring3
mov ah,09h
int 21h

LEA DX, username
mov ah,09h
int 21h
jmp nerr

erru:
LEA DX, dstring4
mov ah,09h
int 21h
jmp nerr

errp:
LEA DX, dstring5
mov ah,09h
int 21h

nerr:nop
.exit
end