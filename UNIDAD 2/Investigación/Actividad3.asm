@16
D=A
@pos
M=D

(MAIN)
@SCREEN
D=A
@4096
D=D+A
@pos
D=D+M
@addr
M=D

@addr
A=M
M=-1
A=A+1
M=-1

(INPUT)
@KBD
D=M
@INPUT
D;JEQ

@105
D=D-A
@LEFT
D;JEQ

@KBD
D=M
@100
D=D-A
@RIGHT
D;JEQ

@INPUT
0;JMP

(LEFT)
@pos
D=M
@INPUT
D;JLE

@addr
A=M
M=0
A=A+1
M=0

@pos
M=M-1

@WAIT_L
0;JMP

(RIGHT)
@pos
D=M
@30
D=D-A
@INPUT
D;JGE

@addr
A=M
M=0
A=A+1
M=0

@pos
M=M+1

(WAIT_L)
@KBD
D=M
@WAIT_L
D;JNE

@MAIN
0;JMP
