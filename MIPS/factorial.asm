.data
    prompt: .asciiz "Enter a Number: "
    factMsg: .asciiz "Factorial is "
    num: .word 0

.text

    la $a0,prompt
    li $v0,4
    syscall

    li $v0,5
    syscall
    sw $v0,num

    move $a0,$v0
    li $v0,1
    syscall

    la $a0,factMsg
    li $v0,4
    syscall

    lw $a0,num
    jal fact

    move $a0,$v0
    li $v0,1
    syscall

    li $v0,10
    syscall

fact:
    li $t0,1
    move $t1,$a0
    loop:
        beq $t1,$zero,exit
        mul $t0,$t0,$t1
        addi $t1,$t1,-1
        j loop

exit:
    move $v0,$t0
    jr $ra