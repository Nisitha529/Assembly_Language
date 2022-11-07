.data
prompt1: .asciiz "Enter the first number: "
prompt2: .asciiz "Enter the second number: "
prompt3: .asciiz "Results: "

num1: .word 0
num2: .word 0
sum: .word 0

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
    add $t3,$t1,$t2
    sw $t3,sum

    li $v0,4
    la $a0,prompt3
    syscall

    lw $a0,$t3
    li $v0,1
    syscall

