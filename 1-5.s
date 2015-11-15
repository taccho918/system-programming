test_prime:				# int test_prime(int n = $a0)

	li	$a1,2			# i = 2

loop:
	slt	$v0,$a1,$a0		# if !(i < n)
	beq	$v0,$zero,return1	#   return 1

	div	$a0,$a1			#
	mfhi	$v0			# $v0 = n % i
	beq	$v0,$zero,return0	# if ($v0 == 0) return 0

	addu	$a1,$a1,1		# i++
	j	loop			# goto loop

return0:
	li	$v0,0
	j	$ra
return1:
	li	$v0,1
	j	$ra


	.data
	.align	2
primes:
	.space 400			# int primes[100]
	.align	2
msg0:
	.asciiz	"> "
	.align	2
msg1:
	.asciiz	"\n"
	.align	2

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

	la	$a1,primes		#
	move	$a0,$s0			#
	addu	$a0,$a0,$a0		#
	addu	$a0,$a0,$a0		# $a0 = match * 4
	addu	$a0,$a1,$a0		# $a0 = &primes[match]
	sw	$s1,0($a0)		# primes[match] = n

	addu	$s0,$s0,1		# match++

end_if:
	addu	$s1,$s1,1		# n++
	j	while_loop

while_out:
input_loop:
	li	$v0,4			# 4: print_string
	la	$a0,msg0		#
	syscall				# print_string("> ")

	li	$v0,5			# 5: read_int
	syscall				# $v0 = read_int()

	beq	$v0,$zero,quit		# if ($v0 == 0) exit

	la	$a1,primes		#
	subu	$a0,$v0,1		#
	addu	$a0,$a0,$a0		#
	addu	$a0,$a0,$a0		#
	addu	$a0,$a1,$a0		# $a0 = primes + ($v0 - 1)* 4
	lw	$a0,0($a0)		# $a0 = *($a0)

	li	$v0,1			# 1: print_int
	syscall

	li	$v0,4			#
	la	$a0,msg1		# print_string("\n")
	syscall

	j	input_loop
quit:
	lw	$ra,0($sp)
	lw	$s0,8($sp)
	lw	$s1,16($sp)
	addu	$sp,$sp,24

	j	$ra