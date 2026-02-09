RAM[20496] = -1
leer KBD
if KBD=105          //i=105
    RAM[20496]=0
    RAM[20495]=-1
if KBD=100          //d=100
    RAM[20496]=0
    RAM[20497]=-1

//ensamblador

@20496
M=-1
@KBD
D=M
@105
D=D-A
D;JEQ
@KBD
D=M
@100
D=D-A
D;JEQ
@LOOP
0;JMP