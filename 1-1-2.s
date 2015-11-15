	.data
	.align 2
str:
	.asciiz "Hello World"		# "Hello World"の文字列を定義

	.text
	.align 2
main:								
	li	$v0, 4					# print_stringのシステム・コール・コード	
	la	$a0, str 				# プリントする文字列
	syscall						# strを出力
	