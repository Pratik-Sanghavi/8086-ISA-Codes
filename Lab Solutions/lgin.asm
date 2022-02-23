; Task2: Write an ALP that does the following
; (1) Display the string “Enter User Name” and goes to the next line
; (2) Takes in the user entered string compares with user name value already stored in memory
; (3) If there is no match it should exit.
; (4) If there is a match it should display the string “Enter Password” and goes to next line
; (5) Takes in password entered by the user and compares with password already stored in memory
; (6) If there is no match it should exit
; (7) If there is a match it should display “Hello Username”

.model tiny
.486
.data
STR1 DB "Enter User Name$"
UNDAT DB "pratik$"
MUN DB 20
ACTUN DB ?
UNENT DB  11 DUP('$')
STR2 DB "Enter Password$"
MP DB 20
ACTP DB ?
PDAT DB "pratik12$"
PENT DB  9 DUP('$')
STR3 DB "*$"
STR4 DB "Hello$"
STR5 DB "Incorrect User Name! Please try Again"
STR6 DB "Incorrect Password! Please try Again"
.code
.startup
X0: LEA DX, STR1
MOV AH,09h
INT 21h
MOV AH,0Dh
INT 21h
MOV AH,0Ah
INT 21h

LEA DX,MUN
MOV AH,0Ah
INT 21h

LEA SI,UNDAT
LEA DI,MUN+2
LEA BP,MUN+1
MOV CX,[BP]
REPE CMPSB
CMP CX,0
JNE X1

X5: LEA DX,STR2
MOV AH,09h
INT 21h
MOV AH,0Dh
INT 21h
MOV AH,0Ah
INT 21h
LEA DX,MP+2
MOV DX,SI
X4:
MOV AH,08h
INT 21h
MOV BX,[SI]
CMP BX,0Dh
JE X2 
LEA DX,STR3
MOV AH,09h
INT 21h 
JMP X4 
X2:
LEA SI,PDAT
LEA DI,MP+2
LEA BP,MP+1
MOV CX,[BP]
REPE CMPSB
CMP CX,0
JNE X3

X1: LEA DX,STR5
MOV AH,09h
INT 21h

JMP X0
X3: LEA DX,STR6
MOV AH,09h
INT 21h
JMP X5
.exit
end