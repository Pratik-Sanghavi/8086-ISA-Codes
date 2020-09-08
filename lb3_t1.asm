.model tiny
.486
.data
ORG 0000h
ent db 0Dh,0Ah
;dstring db 'Please enter string',0Dh,0Ah,'$'
maxe db 22 ; max characters
acte db ? ;actual entries
uent db 22 dup('$') ;reserve locations for entries
.code
.startup

;LEA DX,dstring
;mov ah,09h
;int 21h

LEA DX, maxe
MOV AH,0Ah
INT 21h

MOV DL,0Dh
mov ah,02h
int 21h

MOV DL,0Ah
mov ah,02h
int 21h

LEA DX,uent
mov AH,09h
int 21h
.exit
end