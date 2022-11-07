.eqv Array_size 5
.data
    Array: .word 1,2,3,4,5

.text 
    la $a0, Array
    li $a1,Array_size
    jal reverse
    li $v0,10
    syscall

reverse:
    addu $t3,$zero,$a0  #t3 = array_address
    sll $t0,$a1,2       #t0 = 4*array_size
    addu $t3,$t3,$t0    #t3 = array_address + 4*array_size
    addiu $t3,$t3,-4    #t3 = array_address + 4*array_size - 4
    srl $t2,$a1,1       #t2 = array_size/2

reverse_loop:
    beqz $t2,reverse_loop_done
    lw $t0,($a0)        #a0 is the pointer from the start of the array
    lw $t1,($t3)        #t3 is the pointer from the end of the array

    #swapping t0 & t1

    sw $t1,($a0)
    sw $t0,($t3)
    addiu $t3,$t3,-4    #update $t3
    addiu $a0,$a0,4     #go to next item
    addi $t2,$t2,-1     #i--
    j reverse_loop

reverse_loop_done:
    jr $ra


