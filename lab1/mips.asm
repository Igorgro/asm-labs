# Сравнить заданное число из ОП с некоторой констатной и вывести сообщение (равно, больше или меньше)
.data
VAR: .word 121 # first number
MSG1: .asciiz "Var is less than const\n"
MSG2: .asciiz "Var is equal to const\n"
MSG3: .asciiz "Var is greater than const\n"
.text
	lw $t1 VAR
	li $t2 121 # put const
	sub $t3, $t1, $t2
	bltz $t3 lezero
	beqz $t3 eqzero
	j grzero
lezero:
	la $a0, MSG1
	j print
eqzero:
	la $a0, MSG2
	j print
grzero:
	la $a0, MSG3
	j print
print:
	li $v0, 4 # specify Print String service
	syscall # print heading
