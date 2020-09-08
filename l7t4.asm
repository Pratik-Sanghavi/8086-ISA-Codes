.model tiny
.486
.data
VIDMODE DB ?
COLDAT DW 490
ROWDAT DW 0
.code
.startup
mov ah,0Fh
int 10h

mov VIDMODE,al
mov al,12h
mov ah,0
int 10h ;set video mode

iloop: mov ah,0Ch
mov al,1100b
mov cx,COLDAT
mov dx,ROWDAT
int 10h
;Increment columns
inc WORD PTR COLDAT
cmp WORD PTR COLDAT,640
jne iloop
;increment rows
inc WORD PTR ROWDAT
cmp WORD PTR ROWDAT,20
je part2
lea SI,COLDAT
mov DI,490
mov [SI],DI
jmp iloop

part2:
lea SI,COLDAT
mov DI,490
mov WORD PTR COLDAT,DI

iloop2:
mov ah,0Ch
mov al,1100b
mov cx,COLDAT
mov dx,ROWDAT
int 10h
;Increment columns
inc WORD PTR COLDAT
cmp WORD PTR COLDAT,505
jne iloop2

iloop2p2: 
mov ah,0Ch
mov al,1010b
mov cx,COLDAT
mov dx,ROWDAT
int 10h
inc WORD PTR COLDAT
cmp WORD PTR COLDAT,625
jne iloop2p2

iloop2p3: 
mov ah,0Ch
mov al,1100b
mov cx,COLDAT
mov dx,ROWDAT
int 10h
;Increment columns
inc WORD PTR COLDAT
cmp WORD PTR COLDAT,640
jne iloop2p3

inc WORD PTR ROWDAT
cmp WORD PTR ROWDAT,40
jne part2

lea SI,COLDAT
part3:
iloop3:
mov ah,0Ch
mov al,1100b
mov cx,COLDAT
mov dx,ROWDAT
int 10h

;Increment columns
inc WORD PTR COLDAT
cmp WORD PTR COLDAT,505
jne iloop3

iloop3p2: 
mov ah,0Ch
mov al,1010b
mov cx,COLDAT
mov dx,ROWDAT
int 10h
inc WORD PTR COLDAT
cmp WORD PTR COLDAT,520
jne iloop3p2

iloop3p3:
mov ah,0Ch
mov al,1100b
mov cx,COLDAT
mov dx,ROWDAT
int 10h
;Increment columns
inc WORD PTR COLDAT
cmp WORD PTR COLDAT,610
jne iloop2p3

iloop3p4: 
mov ah,0Ch
mov al,1010b
mov cx,COLDAT
mov dx,ROWDAT
int 10h
inc WORD PTR COLDAT
cmp WORD PTR COLDAT,625
jne iloop3p4

iloop3p5:
mov ah,0Ch
mov al,1100b
mov cx,COLDAT
mov dx,ROWDAT
int 10h
;Increment columns
inc WORD PTR COLDAT
cmp WORD PTR COLDAT,640
jne iloop3p5

inc WORD PTR ROWDAT
cmp WORD PTR ROWDAT,60
mov DI,490
mov [SI],DI
jne part3

outside:
;blocking function
mov ah,07h
block:int 21h
cmp al,'%'
jne block

mov ah,0
mov al,VIDMODE
int 10h
.exit
end