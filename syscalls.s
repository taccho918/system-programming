	.text
	.align 2
	
# print_string
_print_string:
	subu	$sp, $sp, 24		# スタックを24バイト確保
	sw	$ra, 20($sp)		# 戻りレジスタ$ra保存
	
	li	$v0, 4			# 4: print_string
	syscall

	lw	$ra, 20($sp)		# $raを復元
	addu	$sp, $sp, 24		# スタックを元に戻すためにpop
	j	$ra			# 呼び出し元に戻る

# print_int
_print_int:
	subu	$sp, $sp, 24
	sw	$ra, 20($sp)

	li	$v0, 1			# 1: print_int
	syscall

	lw	$ra, 20($sp)
	addu	$sp, $sp, 24
	j	$ra

# read_int
_read_int:
	subu	$sp, $sp, 24
	sw	$ra, 20($sp)

	li	$v0, 5			# 5: read_int
	syscall

	lw	$ra, 20($sp)
	addu	$sp, $sp, 24
	j	$ra

# print_char
_print_char:
	subu    $sp, $sp, 24
	sw 	$ra, 20($sp)

	li	$v0, 11			# 11: print_char
	syscall

	lw 	$ra, 20($sp)
	addu	$sp, $sp, 24
	j	$ra