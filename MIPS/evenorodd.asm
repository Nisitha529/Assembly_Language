.data
    prompt1: .asciiz "Enter the number: "
    evenmsg: .asciiz "Number is even"
    oddmsg:  .asciiz "Number is odd"

    num1: .word 0

.text
    li $v0,4
    la $a0,prompt1
    syscall

    li $v0,5
    syscall
    sw $v0,num1

    li $t0,2
    div $v0,$t0

    mfhi $t1
    beq		$t1, $zero, Even	# if $t1 ==zerot1ventarget

    li $v0,4
    la $a0,oddmsg
    syscall
    j endl

Even: 
    li $v0,4
    la $a0,evenmsg
    syscall
endl:

    