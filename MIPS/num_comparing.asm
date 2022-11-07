.data

    prompt1: .asciiz "Enter the first number: "
    prompt2: .asciiz "Enter the second number: "
    result1: .asciiz "Number 1 is greater than Number 2"
    result2: .asciiz "Number 2 is greater than Number 1"
    result3: .asciiz "Two numbers are equal"

    num1: .word 0
    num2: .word 0

.text
    li $v0,4
    la $a0,prompt1
    syscall

    li $v0,5
    syscall
    sw $v0,num1

    li $v0,4
    la $a0,prompt2
    syscall

    li $v0,5
    syscall
    sw $v0,num2

    lw $t1,num1
    lw $t2,num2

    bgt $t1,$t2,yes
    beq $t1,$t2,eql
    li $v0,4
    la $a0,result2
    syscall
    j endl

yes:    li $v0,4
        la $a0,result1
        syscall
        j endl
eql:    li $v0,4
        la $a0,result3
        syscall
        
endl:
