# Вычислить сумму элементов массива
# больше заданной переменной
.data
	mas: .word 16 52 31 44 6 12
	size: .word 6
	var: .word 12
	resMsg: .asciiz "Result: "
	noResMsg: .asciiz "No numbers greater than var"
.text
	la $t0, mas
	la $t1, size
	lw $t1, 0($t1)
	la $t2, var
	lw $t2, 0($t2)
	li $5, 0
loop:
	lw $t3, 0($t0)
	ble $t3, $t2 nextiter
	add $t4, $t4, $t3 # $t3 stores sum
	li $5 1
nextiter:
	addi $t1, $t1, -1 # decrease counter
	addi $t0, $t0, 4
	bgtz $t1, loop
	beq $5 0 noresult
	la $a0, resMsg
	li $v0, 4
	syscall
	move $a0, $t4
	li $v0, 1
	syscall
	b end
noresult:
	la $a0, noResMsg
	li $v0, 4
	syscall
end:
