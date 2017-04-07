.data

.text

main:
	addu $sp, $sp, -44

____main_0____enter:

#	$12 = move 5
	li $v0, 5
	sw $v0, 12($sp)

#	$13 = move 0
	li $v0, 0
	sw $v0, 16($sp)

#	$15 = div $12 $13
	lw $v0, 12($sp)
	lw $v1, 16($sp)
	div $v0, $v0, $v1
	sw $v0, 24($sp)

#	$16 = sne $15 1
	lw $v0, 24($sp)
	li $v1, 1
	sne $v0, $v0, $v1
	sw $v0, 28($sp)

#	br $16 ____main_1____if_true ____main_2____if_false
	lw $v0, 28($sp)
	beq $v0, $0, ____main_2____if_false
	j ____main_1____if_true

____main_1____if_true:

#	$14 = move 10
	li $v0, 10
	sw $v0, 40($sp)

#	jump ____main_3____if_merge
	j ____main_3____if_merge

____main_2____if_false:

#	$14 = move 20
	li $v0, 20
	sw $v0, 40($sp)

#	jump ____main_3____if_merge
	j ____main_3____if_merge

____main_3____if_merge:

#	ret $14
	lw $v0, 40($sp)

#	jump ____main_4____exit
	j ____main_4____exit

____main_4____exit:
	move $a0, $v0
	li $v0, 17
	syscall
	addu $sp, $sp, 44
	jr $ra
