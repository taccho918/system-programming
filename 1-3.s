	.text
	.globl main

main:	subu 	$sp, $sp, 32
	sw	$ra, 20($sp)
	sw	$fp, 16($sp)
	addiu	$fp, $sp, 28

	li	$a0, 10
	jal	fact

	la	$a0, $LC
	move	$a1, $v0
	jal 	printf
	move	$a0, $a1
	jal	print_int
	
	lw	$ra, 20($sp)
	lw	$fp, 16($sp)
	addiu	$sp, $sp, 32
	jr	$ra

	.rdata
$LC:
	.ascii	"The factorial of 10 is \n\000"
	.text
	
printf:	li	$v0, 4
	syscall
	j	$ra

print_int:
	li	$v0, 1
	syscall
	j	$ra
	
fact:	subu	$sp, $sp, 32
	sw	$ra, 20($sp)
	sw	$fp, 16($sp)
	addiu	$fp, $sp, 28
	sw	$a0, 0($fp)

	lw	$v0, 0($fp)
	bgtz	$v0, $L2
	li	$v0, 1
	j	$L1

$L2:
	lw	$v1, 0($fp)
	subu	$v0, $v1, 1
	move	$a0, $v0
	jal	fact

	lw	$v1, 0($fp)
	mul	$v0, $v0, $v1

$L1:
	lw	$ra, 20($sp)
	lw	$fp, 16($sp)
	addiu	$sp, $sp, 32
	jr	$ra