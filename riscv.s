.global _start
_start:
    la      t0, string # t0 = base del arreglo
    li      t1, 0 # i = 0
    li      t2, 11 # j = [longitud dell string]-1

loop:
    bge     t1, t2, end # si i >= j -> fin

    add     t3, t0, t1 # &string[i]
    lbu     t4, 0(t3) # t4 = string[i] (byte unsigned)
    add     t5, t0, t2 # &string[j]
    lbu     t6, 0(t5) # t6 = string[j]

    sb      t6, 0(t3) # string[i] = antiguo string[j]
    sb      t4, 0(t5) # string[j] = antiguo string[i]

    addi    t1, t1, 1 # i++
    addi    t2, t2, -1 # j--
    j       loop

end:
    j       end                 
	
.data
string:
    .ascii  "Hola mundo!" # 12 caracteres