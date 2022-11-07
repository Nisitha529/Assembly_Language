.data
    prompt1: .asciiz "Enter an integer: "
    result: .asciiz "The number of 0's: "

.text

main:
    la $a0,prompt1
    li $v0,4
    syscall

    li $v0,5
    syscall
    move $t0,$v0

    li $t1,0

loop1:
    beq	$t0,1,end
    and $t2,$t0,1
    beq $t2,1,loop2
    add $t1,$t1,1

loop2:
    srl $t0,$t0,1
    j loop1

end: 
    la $a0 result
    li $v0,4
    syscall

    move $a0,$t1
    li $v0,1
    syscall