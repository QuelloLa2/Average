org 256

.data
    dieci dw ?
    somma dw ?
    risultato dw 0
    volte dw ?
    

.code
    MOV dieci, 10
    MOV BX, 00h
invio:
    MOV AX, 00h
    INT 16h
    CMP AH, 1Ch
    JE primo
    MOV AH, 00h
    SUB AL, 30h
    PUSH AX
    ADD CH, 1h
    JMP invio

continua:
    INC BH
    ADD risultato, AX
primo:
    CMP CH, BH
    JE uguali
    POP AX
    MOV CL, 00h                 
    
ciclo:
    CMP CL, BH
    JE continua 
    JMP moltiplicazione

moltiplicazione:
    MUL dieci                      
    INC CL
    JMP ciclo
    
uguali:
    MOV CX, 00h
    MOV BX, 00h
    INC volte
    MOV AX, risultato
    ADD somma, AX
    MOV risultato, 00h 
    MOV AX, 00h
    INT 16h
    CMP AL, 09h
    JE media
    JMP invio

media:
    MOV AX, somma
    DIV volte   
