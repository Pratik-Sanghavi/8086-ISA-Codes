.model tiny
.486
.data
ORG 0000h
FNAME DB 'Pratik',0
HANDLE DW ?
UDAT DB 'Pratik Ravikumar Sanghavi',0Dh,0Ah ;27 characters
UID DB '2017AAPS0394G',0Dh,0Ah ;15 characters
HOSNAME DB 'Hostel Name: CH1',0Dh,0Ah ;18 characters
ROOMNO DB 'Room No.: 210',0Dh,0Ah ; 15 characters
USERINFO DB 76 DUP('$')
USERINFOB DB 150 DUP('$')
.code
.startup
MOV AH,3CH
MOV CL,20h
LEA DX,FNAME
INT 21H
MOV HANDLE,AX

MOV BP,02H
Ufill:
MOV BX,HANDLE
MOV CX,42
LEA DX,UDAT
MOV AH,40h
INT 21h

DEC BP
JNE Ufill
;Close File
MOV BX,HANDLE
MOV AH,3Eh
INT 21h 

MOV AH,3Dh
MOV AL,2
LEA DX,FNAME
INT 21h

MOV AH,42h
MOV AL,0
MOV BX,HANDLE
MOV DX,84
MOV CX,0
INT 21h

MOV BX,HANDLE
MOV CX,33
LEA DX,HOSNAME
MOV AH,40h
INT 21h
;Close file
MOV BX,HANDLE
MOV AH,3Eh
INT 21h

MOV AH,3Dh
MOV AL,2
LEA DX,FNAME
INT 21h

MOV AH,42h
MOV AL,0
MOV BX,HANDLE
MOV DX,42
MOV CX,0
INT 21h

MOV AH,3Fh
MOV BX,HANDLE
MOV CX,75
LEA DX,USERINFO
INT 21h

LEA DX,USERINFO
MOV AH,09h
INT 21h

;Close file
MOV BX,HANDLE
MOV AH,3Eh
INT 21h

MOV AH,3Dh
MOV AL,2
LEA DX,FNAME
INT 21h
;reading the file one byte at a time
MOV BP,150
MOV DI,0 
LEA DX,USERINFOB
loopb:
MOV AH,3Fh
MOV BX,HANDLE
MOV CX,1
INT 21h
CMP AX,DI
JE outside
INC DX
DEC BP
JNE loopb

outside:
LEA DX,USERINFOB
MOV AH,09h
INT 21h
;Close file
MOV BX,HANDLE
MOV AH,3Eh
INT 21h
.exit
end