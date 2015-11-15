
	.data
	.align	2
msg0:
	.asciiz	" "
	.align	2
msg1:
	.asciiz	"\n"

	.text
	.align	2
main:
	subu	$sp,$sp,24		# make stack frame.
	sw	$ra,0($sp)		# preserve return address.

	sw	$s0,8($sp)		# s0 should be preserved.
	li	$s0,0			# match = 0

	sw	$s1,16($sp)		# s1 should be preserved.
	li	$s1,2			# n = 2

while_loop:
	slti	$v0,$s0,100		# if !(match < 100) goto while_out
	beq	$v0,$zero,while_out	#

	move	$a0,$s1
	jal	test_prime		# $v0 = test_prime(n)
	beq	$v0,$zero,end_if	# if ($v0 == 0) goto end_if

	li	$v0,1			# 1: print_int
	move	$a0,$s1			#
	syscall				# print_int(n)

	li	$v0,4			# 4: print_string
	la	$a0,msg0		#
	syscall				# print_string(" ")

	addu	$s0,$s0,1		# match++

	li	$a0,10			#
	div	$s0,$a0			# if (match % 10 == 0)
	mfhi	$v0			#    print_string("\n")
	bne	$v0,$zero,end_if	#
	li	$v0,4			#
	la	$a0,msg1		#
	syscall				#

end_if:
	addu	$s1,$s1,1		# n++
	j	while_loop

while_out:
	li	$v0,4			# 4: print_string
	la	$a0,msg1		#
	syscall				# print_string("\n")

	lw	$ra,0($sp)
	lw	$s0,4($sp)
	lw	$s1,8($sp)
	addu	$sp,$sp,12

	j	$ra