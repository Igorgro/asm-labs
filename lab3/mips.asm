# Вычислить площадь прямоугольного треугольника
# по углу и прилежащему катету
.data
	a: .float 15.3
	tgalpha: .float 1.557407725 # alpha=1
	half: .float 0.5
	resStr: .asciiz "Result: "
	
.text
	lwc1 $f1, a
	lwc1 $f2, a
	mul.s $f1, $f1, $f2
	lwc1 $f2, tgalpha
	mul.s $f1, $f1, $f2
	lwc1 $f2, half
	mul.s $f1, $f1, $f2
	
	li $v0, 4
	la $a0, resStr
	syscall

	li $v0, 2
	mov.s $f12, $f1
	syscall
