.data 
    age: .word 123
.text
    li $v0, 1
    lw $a0, age
    syscall
