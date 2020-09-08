.model tiny
.486
.data
ROWDAT DW 70
COLDAT DW 80
.code
.startup
mov ah,0
mov al,12h
int 10h

iloop: mov ah,0Ch
mov al,01001100b
mov cx,COLDAT
mov dx,ROWDAT
int 10h
;Increment rows
inc BYTE PTR COLDAT
cmp BYTE PTR COLDAT,180
jne iloop
inc WORD PTR ROWDAT
cmp WORD PTR ROWDAT,150
je outside
lea SI,COLDAT
mov DI,80
mov [SI],DI 
jmp iloop

outside:
;blocking function
mov ah,07h
x1:int 21h
cmp al,'%'
jne x1

.exit
end