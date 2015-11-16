	.text
	.align 2
print_message:
	la	$a0, msg
	li	$v0, 4
	.data
	.align 2
msg:
	.asciiz "Hello!!\n"
	.text
	syscall
	j	$ra
main:
	subu	$sp, $sp, 24