.data
    prompt1: .asciiz "Enter a character: "
    capital: .asciiz "\nUppercase"
    lowercase: .asciiz "\nLowercase"
    other: .asciiz "\nOther Character"

.text

    li $v0,4
    la $a0,prompt1
    syscall

    li $v0,12
    syscall

    bltu $v0,'A',next1
    bgtu $v0,'Z',next1
    li $v0,4
    la $a0,capital
    syscall 
    j endx

next1:
    bltu $v0,'a',next2
    bgtu $v0,'z',next2
    li $v0,4
    la $a0,lowercase
    syscall
    j endx
next2:
    li $v0,4
    la $a0,other
    syscall
endx: 
