(LOOP)
    // Comprobar condición: i <= 100
    @i
    D=M         // D = i
    @100
    D=D-A       // D = i - 100
    @END
    D;JGT       // Si i > 100, saltar a END
    
    // sum += i
    @i
    D=M         // D = i
    @sum
    M=D+M       // sum = sum + i
    
    // i++
    @i
    M=M+1       // i = i + 1
    
    // Volver al inicio del loop
    @LOOP
    0;JMP

(END)
    // Loop infinito para terminar el programa
    @END
    0;JMP
