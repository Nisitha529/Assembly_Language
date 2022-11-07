.data
    prompt1: . asciiz "Enter a number: "
    summsg: .asciiz "Sum = "
    avgmsg: .asciiz "\nAvg = "

.text
    li $t1,5
    li $t0,0
    move 	$s0, $zero		# $s0 =$zero1  

again:
    li $v0,4
    la $a0,prompt1
    syscall

    li $v0,5
    syscall

    add		$s0, $s0, $v0		# $s0 = s01 +v0t2
    
    addi	$t0, $t0, 1		# $t0 = $01 1t2
    bne		$t0, $t1, again	# if $t0 == $t1againtarget

    li		$v0,4 		# $v0 4= 
    la		$a0,summsg		# 
    syscall

    li		$v0,1 		# $v0 1= 
    move 	$a0, $s0		# $a0 = s01
    syscall

    div		$s0, $t1			# $s0 / $t1
        
    li		$v0,4 		# $v0 4= 
    la		$a0, avgmsg		# 
    syscall

    mflo	$a0

    li		$v0,1 		# $v0 1= 
    syscall