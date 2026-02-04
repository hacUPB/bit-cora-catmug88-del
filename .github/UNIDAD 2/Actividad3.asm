@20496
M=-1

    @KBD
    D=M

    @LOOP
    D;JEQ

    @R0
    M=D
    
    @105
    D=D-A
    @TECLA_I
    D;JEQ
    
    @R0
    D=M
    

    @100
    D=D-A
    @TECLA_D
    D;JEQ

    @LOOP
    0;JMP

    @20496
    M=0
    @20495
    M=-1

        @KBD
        D=M
        @WAIT_I
        D;JNE
    
    @LOOP
    0;JMP


    @20496
    M=0
    @20497
    M=-1
    

        @KBD
        D=M
        @WAIT_D
        D;JNE
    
    @LOOP
    0;JMP