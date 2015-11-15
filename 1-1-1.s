	.text
	.align 2
	
main:
	move	$s0, $ra		# mainを呼んだ戻り先のアドレスが入っている
					# $raを$s0に保存しておく
	
	li	$a0, 72					# 'H' = 72, $a0 = H 
	jal	putc					# jamp and link to putc
	li	$a0, 101		# 'a' = 101, $a0 = e
	jal	putc			# 
	li	$a0, 108		# 'l' = 108, $a0 = l
	jal	putc			#
	li	$a0, 108		# 'l' = 108, $a0 = l
	jal	putc			#
	li	$a0, 111		# 'o' = 111, $a0 = o
	jal	putc			# 
	la	$a0, 32
	jal	putc			# print " "
	li	$a0, 87			# 'W' = 87, $a0 = W
	jal	putc			#
	li	$a0, 111		# 'o' = 111, $a0 = o
	jal	putc			#
	li	$a0, 114		# 'r' = 114, $a0 = r
	jal	putc			#
	li	$a0, 108		# 'l' = 108, $a0 = l
	jal	putc			#
	li	$a0, 100		# 'd' = 100, $a0 = d
	jal	putc			#

	move	$ra, $s0		# $s0に保存しておいた戻り先を$raに入れる
	j	$ra			# mainを呼んだ戻り先に飛ぶ
putc:
	lw	$t0, 0xffff0008		# $t0 = *(oxffff0008)
	li	$t1, 1			# $t1 = 1
	and 	$t0, $t0, $t1		# $t0 =& $t1
	beqz	$t0, putc		# if( $t0==c ) goto putc
	sw	$a0, 0xffff000c		# *(0xffff000c) = $a0
	j	$ra
