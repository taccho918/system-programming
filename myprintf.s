	.file	1 "report2-5.c"

 # -G value = 0, Cpu = r2000, ISA = 1
 # GNU C version 2.96-mips3264-000710 (mipsel-linux) compiled 
 # by GNU C version 2.96 20000731 (Red Hat Linux 7.2 2.96-112.7.2).
 # [AL 1.1, MM 40] BSD Mips
 # options passed:  -mno-abicalls -mrnames -mmips-as
 # -mno-check-zero-division -mcpu=r2000 -O0 -fleading-underscore
 # -finhibit-size-directive -fverbose-asm
 # options enabled:  -fpeephole -fkeep-static-consts -fpcc-struct-return
 # -fsched-interblock -fsched-spec -fnew-exceptions -fcommon
 # -finhibit-size-directive -fverbose-asm -fgnu-linker -flive-range-gdb
 # -fargument-alias -fleading-underscore -fdelay-postincrement -fident
 # -fmath-errno -msplit-addresses -mrnames -mno-check-zero-division
 # -mdebugf -mdebugi -mno-div-checks -mcpu=r2000


	.text
	.align	2
	.set	nomips16
_print_char:
	subu	$sp,$sp,40
	sw	$ra,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	move	$v0,$a0
	sb	$v0,16($fp)
	lbu	$v0,16($fp)
	sb	$v0,24($fp)
	sb	$zero,25($fp)
	addu	$v0,$fp,24
	move	$a0,$v0
	jal	_print_string
	move	$sp,$fp
	lw	$ra,36($sp)
	lw	$fp,32($sp)
	addu	$sp,$sp,40
	j	$ra
	.rdata
	.align	0
	.align	2
$LC0:
	.asciiz	"0123456789ABCDEF"
	.text
	.align	2
	.set	nomips16
_hexadecimal_print:
	subu	$sp,$sp,48
	sw	$ra,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	addu	$v0,$fp,16
	addu	$v1,$fp,16
	la	$v0,$LC0
	lwl	$a0,3($v0)
	lwr	$a0,0($v0)
	lwl	$a1,7($v0)
	lwr	$a1,4($v0)
	lwl	$a2,11($v0)
	lwr	$a2,8($v0)
	lwl	$a3,15($v0)
	lwr	$a3,12($v0)
	swl	$a0,3($v1)
	swr	$a0,0($v1)
	swl	$a1,7($v1)
	swr	$a1,4($v1)
	swl	$a2,11($v1)
	swr	$a2,8($v1)
	swl	$a3,15($v1)
	swr	$a3,12($v1)
	lb	$a0,16($v0)
	sb	$a0,16($v1)
	lw	$v0,48($fp)
	srl	$v0,$v0,4
	beq	$v0,$zero,$L4
	lw	$v0,48($fp)
	srl	$v0,$v0,4
	move	$a0,$v0
	jal	_hexadecimal_print
$L4:
	lw	$v0,48($fp)
	andi	$v1,$v0,0xf
	addu	$v0,$fp,16
	addu	$v0,$v0,$v1
	lb	$v0,0($v0)
	move	$a0,$v0
	jal	_print_char
	move	$sp,$fp
	lw	$ra,44($sp)
	lw	$fp,40($sp)
	addu	$sp,$sp,48
	j	$ra
	.rdata
	.align	0
	.align	2
$LC1:
	.asciiz	"01234567"
	.text
	.align	2
	.set	nomips16
_octal_print:
	subu	$sp,$sp,40
	sw	$ra,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	addu	$v0,$fp,16
	addu	$v1,$fp,16
	la	$v0,$LC1
	lwl	$a0,3($v0)
	lwr	$a0,0($v0)
	lwl	$a1,7($v0)
	lwr	$a1,4($v0)
	lb	$a2,8($v0)
	swl	$a0,3($v1)
	swr	$a0,0($v1)
	swl	$a1,7($v1)
	swr	$a1,4($v1)
	sb	$a2,8($v1)
	lw	$v0,40($fp)
	srl	$v0,$v0,3
	beq	$v0,$zero,$L6
	lw	$v0,40($fp)
	srl	$v0,$v0,3
	move	$a0,$v0
	jal	_octal_print
$L6:
	lw	$v0,40($fp)
	andi	$v1,$v0,0x7
	addu	$v0,$fp,16
	addu	$v0,$v0,$v1
	lb	$v0,0($v0)
	move	$a0,$v0
	jal	_print_char
	move	$sp,$fp
	lw	$ra,36($sp)
	lw	$fp,32($sp)
	addu	$sp,$sp,40
	j	$ra
	.align	2
	.set	nomips16
_myprintf:
	sw	$a0,0($sp)
	sw	$a1,4($sp)
	sw	$a2,8($sp)
	sw	$a3,12($sp)
	subu	$sp,$sp,32
	sw	$ra,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	sw	$a0,32($fp)
	addu	$v0,$fp,32
	sw	$v0,16($fp)
$L8:
	lw	$v0,32($fp)
	lb	$v0,0($v0)
	bne	$v0,$zero,$L10
	b	$L9
$L10:
	lw	$v0,32($fp)
	lb	$v1,0($v0)
	li	$v0,37			# 0x25
	bne	$v1,$v0,$L11
	lw	$v0,32($fp)
	addu	$v0,$v0,1
	sw	$v0,32($fp)
	lw	$v0,32($fp)
	lbu	$v0,0($v0)
	addu	$v0,$v0,-99
	sll	$v0,$v0,24
	sra	$v0,$v0,24
	sw	$v0,20($fp)
	lw	$v1,20($fp)
	sltu	$v0,$v1,22
	beq	$v0,$zero,$L20
	lw	$v0,20($fp)
	sll	$v1,$v0,2
	la	$v0,$L18
	addu	$v0,$v1,$v0
	lw	$v0,0($v0)
	j	$v0
	.rdata
	.align	0
	.align	3
$L18:
	.word	$L15
	.word	$L13
	.word	$L20
	.word	$L20
	.word	$L20
	.word	$L20
	.word	$L20
	.word	$L20
	.word	$L20
	.word	$L20
	.word	$L20
	.word	$L20
	.word	$L17
	.word	$L20
	.word	$L20
	.word	$L20
	.word	$L14
	.word	$L20
	.word	$L20
	.word	$L20
	.word	$L20
	.word	$L16
	.text
$L13:
	lw	$v0,16($fp)
	addu	$v0,$v0,4
	sw	$v0,16($fp)
	lw	$v0,16($fp)
	lw	$a0,0($v0)
	jal	_print_int
	b	$L20
$L14:
	lw	$v0,16($fp)
	addu	$v0,$v0,4
	sw	$v0,16($fp)
	lw	$v0,16($fp)
	lw	$a0,0($v0)
	jal	_print_string
	b	$L20
$L15:
	lw	$v0,16($fp)
	addu	$v0,$v0,4
	sw	$v0,16($fp)
	lw	$v0,16($fp)
	lb	$v0,0($v0)
	move	$a0,$v0
	jal	_print_char
	b	$L20
$L16:
	lw	$v0,16($fp)
	addu	$v0,$v0,4
	sw	$v0,16($fp)
	lw	$v0,16($fp)
	lw	$a0,0($v0)
	jal	_hexadecimal_print
	b	$L20
$L17:
	lw	$v0,16($fp)
	addu	$v0,$v0,4
	sw	$v0,16($fp)
	lw	$v0,16($fp)
	lw	$a0,0($v0)
	jal	_octal_print
	b	$L20
$L11:
	lw	$v0,32($fp)
	lb	$v0,0($v0)
	move	$a0,$v0
	jal	_print_char
$L20:
	lw	$v0,32($fp)
	addu	$v0,$v0,1
	sw	$v0,32($fp)
	b	$L8
$L9:
	move	$sp,$fp
	lw	$ra,28($sp)
	lw	$fp,24($sp)
	addu	$sp,$sp,32
	j	$ra
	.rdata
	.align	0
	.align	2
$LC2:
	.asciiz	"ABC"
	.align	2
$LC3:
	.asciiz	"test: %d, %s, %c, %x, %o\n"
	.align	2
$LC4:
	.asciiz	"Done.\n"
	.text
	.align	2
	.set	nomips16
main:
	subu	$sp,$sp,40
	sw	$ra,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	addu	$v0,$fp,24
	addu	$v0,$fp,24
	la	$v0,$LC2
	la	$v1,$LC2
	lbu	$v0,0($v1)
	sb	$v0,24($fp)
	lbu	$v0,1($v1)
	sb	$v0,25($fp)
	lbu	$v0,2($v1)
	sb	$v0,26($fp)
	lbu	$v0,3($v1)
	sb	$v0,27($fp)
	li	$v0,19			# 0x13
	sw	$v0,16($sp)
	li	$v0,10			# 0xa
	sw	$v0,20($sp)
	la	$a0,$LC3
	li	$a1,10			# 0xa
	addu	$a2,$fp,24
	li	$a3,97			# 0x61
	jal	_myprintf
	la	$a0,$LC4
	jal	_print_string
	move	$v0,$zero
	move	$sp,$fp
	lw	$ra,36($sp)
	lw	$fp,32($sp)
	addu	$sp,$sp,40
	j	$ra

