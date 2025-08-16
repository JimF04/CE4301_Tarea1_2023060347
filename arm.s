.global _start
_start:
    LDR     R0, =string // R0 = base del arreglo
    MOV     R1, #0 // i = 0
    MOV     R2, #11 // j = [longitud dell string]-1

loop:
    CMP     R1, R2
    BHS     end // si i >= j -> fin

    ADD     R3, R0, R1 // &string[i]
    LDRB    R4, [R3] // R4 = string[i]
    ADD     R5, R0, R2 // &string[j]
    LDRB    R6, [R5] // R6 = string[j]

    STRB    R6, [R3] // string[i] = last string[j]
    STRB    R4, [R5] // string[j] = last string[i]

    ADD     R1, R1, #1 // i++
    SUB     R2, R2, #1 // j--
    B       loop

end:
    B       end     
	
.data
string:
    .ascii  "Hola mundo!"  // 12 caracteres