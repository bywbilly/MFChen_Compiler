.data

.text

main:
	addu $sp, $sp, -152

____main_0____enter:

#	$12 = move 5
	li $v0, 5
	sw $v0, 108($sp)

#	$13 = move 0
	li $v0, 0
	sw $v0, 88($sp)

#	$16 = sne $13 0
	lw $v0, 88($sp)
	li $v1, 0
	sne $v0, $v0, $v1
	sw $v0, 16($sp)

#	br $16 ____main_1____logical_true ____main_2____logical_false
	lw $v0, 16($sp)
	beq $v0, $0, ____main_2____logical_false
	j ____main_1____logical_true

____main_1____logical_true:

#	$17 = div $12 $13
	lw $v0, 108($sp)
	lw $v1, 88($sp)
	div $v0, $v0, $v1
	sw $v0, 36($sp)

#	$18 = sne $17 1
	lw $v0, 36($sp)
	li $v1, 1
	sne $v0, $v0, $v1
	sw $v0, 44($sp)

#	$15 = move $18
	lw $v0, 44($sp)
	sw $v0, 52($sp)

#	jump ____main_3____logical_merge
	j ____main_3____logical_merge

____main_2____logical_false:

#	$15 = move 0
	li $v0, 0
	sw $v0, 52($sp)

#	jump ____main_3____logical_merge
	j ____main_3____logical_merge

____main_3____logical_merge:

#	br $15 ____main_4____if_true ____main_5____if_false
	lw $v0, 52($sp)
	beq $v0, $0, ____main_5____if_false
	j ____main_4____if_true

____main_4____if_true:

#	$14 = move 10
	li $v0, 10
	sw $v0, 148($sp)

#	jump ____main_6____if_merge
	j ____main_6____if_merge

____main_5____if_false:

#	$14 = move 20
	li $v0, 20
	sw $v0, 148($sp)

#	jump ____main_6____if_merge
	j ____main_6____if_merge

____main_6____if_merge:

#	$20 = seq $14 10
	lw $v0, 148($sp)
	li $v1, 10
	seq $v0, $v0, $v1
	sw $v0, 72($sp)

#	br $20 ____main_7____logical_true ____main_8____logical_false
	lw $v0, 72($sp)
	beq $v0, $0, ____main_8____logical_false
	j ____main_7____logical_true

____main_7____logical_true:

#	$19 = move 1
	li $v0, 1
	sw $v0, 136($sp)

#	jump ____main_12____logical_merge
	j ____main_12____logical_merge

____main_8____logical_false:

#	$22 = div $12 $13
	lw $v0, 108($sp)
	lw $v1, 88($sp)
	div $v0, $v0, $v1
	sw $v0, 96($sp)

#	$23 = seq $22 0
	lw $v0, 96($sp)
	li $v1, 0
	seq $v0, $v0, $v1
	sw $v0, 100($sp)

#	br $23 ____main_9____logical_true ____main_10____logical_false
	lw $v0, 100($sp)
	beq $v0, $0, ____main_10____logical_false
	j ____main_9____logical_true

____main_9____logical_true:

#	$24 = seq $12 5
	lw $v0, 108($sp)
	li $v1, 5
	seq $v0, $v0, $v1
	sw $v0, 116($sp)

#	$21 = move $24
	lw $v0, 116($sp)
	sw $v0, 128($sp)

#	jump ____main_11____logical_merge
	j ____main_11____logical_merge

____main_10____logical_false:

#	$21 = move 0
	li $v0, 0
	sw $v0, 128($sp)

#	jump ____main_11____logical_merge
	j ____main_11____logical_merge

____main_11____logical_merge:

#	$19 = move $21
	lw $v0, 128($sp)
	sw $v0, 136($sp)

#	jump ____main_12____logical_merge
	j ____main_12____logical_merge

____main_12____logical_merge:

#	$25 = not $19
	lw $v0, 136($sp)
	not $v0, $v0
	sw $v0, 140($sp)

#	br $25 ____main_13____if_true ____main_14____if_false
	lw $v0, 140($sp)
	beq $v0, $0, ____main_14____if_false
	j ____main_13____if_true

____main_13____if_true:

#	$14 = move 30
	li $v0, 30
	sw $v0, 148($sp)

#	jump ____main_15____if_merge
	j ____main_15____if_merge

____main_14____if_false:

#	jump ____main_15____if_merge
	j ____main_15____if_merge

____main_15____if_merge:

#	ret $14
	lw $v0, 148($sp)

#	jump ____main_16____exit
	j ____main_16____exit

____main_16____exit:
	move $a0, $v0
	li $v0, 17
	syscall
	addu $sp, $sp, 152
	jr $ra
