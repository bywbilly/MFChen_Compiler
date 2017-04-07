	.text
____builtin____print:
	li $v0, 4
	syscall
	jr $ra

____builtin____print_int:
	li $v0, 1
	syscall
	jr $ra

____builtin____println:
	li $v0, 4
	syscall
	la $a0, ____string_newline
	syscall
	jr $ra

____builtin____get_string:
	la $a0 ____string_buffer
	li $a1 1024
	li $v0 8
	syscall
	move $v1 $a0
	li $a1 0
Label2_Cond:
	lb $v0 ($a0)
	beqz $v0 Label2_StrSpace
	add $a1 $a1 1
	add $a0 $a0 1
	j Label2_Cond
Label2_StrSpace:
	add $a0 $a1 5
	li $v0 9
	syscall
	sw $a1 ($v0)
	add $v0 $v0 4
	move $a0 $v0
	la $a1 ____string_buffer
Label2_CopyCond:
	lb $v1 ($a1)
	beqz $v1 Label2_End
	sb $v1 ($a0)
	add $a0 $a0 1
	add $a1 $a1 1
	j Label2_CopyCond
Label2_End:
	sb $0 ($a0)
	jr $ra

____builtin____get_int:
	li $v0, 5
	syscall
	jr $ra

____builtin____to_string:
Label12_ToString:
	move $a1 $a0
	li $a0 16
	li $v0 9
	syscall
	bnez $a1 Label12_NotZero
	lb $0 5($v0)
	li $a0 48
	sb $a0 4($v0)
	li $a0 1
	sb $a0 ($v0)
	j Label12_EndToString
Label12_NotZero:
	slt $v1 $a1 0
	add $t0 $v0 15
	sb $0 ($t0)
Label12_Cond:
	beqz $a1 Label12_EndLoop
	rem $a0 $a1 10
	div $a1 $a1 10
	beqz $v1 Label12_LoadChar
	ble $a0 0 Label12_ToNeg
	add $a0 $a0 -10
Label12_ToNeg:
	neg $a0 $a0
Label12_LoadChar:
	add $a0 $a0 48
	add $t0 $t0 -1
	sb $a0 ($t0)
	j Label12_Cond
Label12_EndLoop:
	beqz $v1 Label12_Copy
	li $a0 45
	add $t0 $t0 -1
	sb $a0 ($t0)
Label12_Copy:
	sub $v1 $v0 $t0
	add $v1 $v1 16
	sw $v1 ($v0)
	add $v1 $v0 4
Label12_CopyCond:
	lb $a0 ($t0)
	sb $a0 ($v1)
	add $t0 $t0 1
	add $v1 $v1 1
	bnez $a0 Label12_CopyCond
Label12_EndToString:
	add $v0 $v0 4
	jr $ra

____builtin_array____size:
	lw $v0, -4($a0)
	jr $ra

____builtin_string____length:
	lw $v0, -4($a0)
	jr $ra

____builtin_string____ord:
	addu $a0, $a0, $a1
	lb $v0, 0($a0)
	jr $ra

____builtin_string____substring:
	add $a1 $a0 $a1
	add $a2 $a0 $a2
	sub $v1 $a2 $a1
	add $a0 $v1 5
	li $v0 9
	syscall
	lw $v1 ($v0)
	add $v0 $v0 4
	move $a0 $v0
Label1_Loop:
	beq $a1 $a2 Label1_End
	lb $v1 ($a1)
	sb $v1 ($a0)
	add $a0 $a0 1
	add $a1 $a1 1
	j Label1_Loop
Label1_End:
	sb $0 ($a0)
	jr $ra

____builtin_string____parse_int:
	li $v0 0
	lb $t0 ($a0)
	seq $v1 $t0 45
	add $a0 $a0 $v1
Label0_Cond:
	lb $t0 ($a0)
	blt $t0 48 Label0_Next
	bgt $t0 57 Label0_Next
	add $t0 $t0 -48
	beqz $v1 Label0_NotNeg
	neg $t0 $t0
Label0_NotNeg:
	mul $v0 $v0 10
	add $v0 $v0 $t0
	add $a0 $a0 1
	j Label0_Cond
Label0_Next:
	jr $ra

____builtin_string____concatenate:
	move $v1 $a0
	lw $v0 -4($a0)
	lw $a0 -4($a1)
	add $a0 $a0 $v0
	move $a2 $a0
	add $a0 $a0 5
	li $v0 9
	syscall
	sw $a2 ($v0)
	add $v0 $v0 4
	move $a0 $v0
Label5_CopyFirst:
	lb $a2 ($v1)
	beqz $a2 Label5_CopySecond
	sb $a2 ($a0)
	add $a0 $a0 1
	add $v1 $v1 1
	j Label5_CopyFirst
Label5_CopySecond:
	lb $v1 ($a1)
	beqz $v1 Label5_End
	sb $v1 ($a0)
	add $a0 $a0 1
	add $a1 $a1 1
	j Label5_CopySecond
Label5_End:
	sb $0 ($a0)
	jr $ra

____builtin_string____equal_to:
Label6_Begin:
	lb $v0 ($a0)
	lb $v1 ($a1)
	beqz $v0 Label6_End
	beqz $v1 Label6_End
	add $a0 $a0 1
	add $a1 $a1 1
	j Label6_Begin
Label6_End:
	seq $v0 $v0 $v1
	jr $ra

____builtin_string____greater_than:
Label7_Begin:
	lb $v0 ($a0)
	lb $v1 ($a1)
	beqz $v0 Label7_End
	beqz $v1 Label7_End
	add $a0 $a0 1
	add $a1 $a1 1
	j Label7_Begin
Label7_End:
	sgt $v0 $v0 $v1
	jr $ra

____builtin_string____greater_than_or_equal_to:
Label8_Begin:
	lb $v0 ($a0)
	lb $v1 ($a1)
	beqz $v0 Label8_End
	beqz $v1 Label8_End
	add $a0 $a0 1
	add $a1 $a1 1
	j Label8_Begin
Label8_End:
	sge $v0 $v0 $v1
	jr $ra

____builtin_string____less_than:
Label9_Begin:
	lb $v0 ($a0)
	lb $v1 ($a1)
	beqz $v0 Label9_End
	beqz $v1 Label9_End
	add $a0 $a0 1
	add $a1 $a1 1
	j Label9_Begin
Label9_End:
	slt $v0 $v0 $v1
	jr $ra

____builtin_string____less_than_or_equal_to:
Label10_Begin:
	lb $v0 ($a0)
	lb $v1 ($a1)
	beqz $v0 Label10_End
	beqz $v1 Label10_End
	add $a0 $a0 1
	add $a1 $a1 1
	j Label10_Begin
Label10_End:
	sle $v0 $v0 $v1
	jr $ra

____builtin_string____not_equal_to:
Label11_Begin:
	lb $v0 ($a0)
	lb $v1 ($a1)
	beqz $v0 Label11_End
	beqz $v1 Label11_End
	add $a0 $a0 1
	add $a1 $a1 1
	j Label11_Begin
Label11_End:
	sne $v0 $v0 $v1
	jr $ra

____random____function:
	sub $sp, $sp, 168
	sw $t2, 40($sp)
	sw $t1, 36($sp)
	sw $t3, 44($sp)

____random_0____enter:
	lw $v0, ____global_8____variable
	move $t3, $v0
	lw $v0, ____global_5____variable
	move $t2, $v0

____random_1____entry:
	lw $v1, ____global_6____variable
	rem $t1, $t3, $v1
	lw $v0, ____global_4____variable
	mul $t1, $v0, $t1
	lw $v1, ____global_6____variable
	div $t3, $t3, $v1
	lw $v0, ____global_7____variable
	mul $t3, $v0, $t3
	sub $t1, $t1, $t3
	move $t3, $t1
	li $v1, 0
	blt $t3, $v1, ____random_3____if_false

____random_2____if_true:

____random_4____if_merge:
	move $v0, $t3
	j ____random_5____exit

____random_3____if_false:
	addu $t1, $t3, $t2
	move $t3, $t1
	j ____random_4____if_merge

____random_5____exit:
	sw $t3, ____global_8____variable
	sw $t2, ____global_5____variable
	lw $t2, 40($sp)
	lw $t1, 36($sp)
	lw $t3, 44($sp)
	addu $sp, $sp, 168
	jr $ra

____initialize____function:
	sub $sp, $sp, 132
	sw $t1, 36($sp)

____initialize_0____enter:

____initialize_1____entry:
	lw $v0, 128($sp)
	sw $v0, ____global_8____variable

____initialize_2____exit:
	lw $t1, 36($sp)
	addu $sp, $sp, 132
	jr $ra

____swap____function:
	sub $sp, $sp, 180
	sw $t2, 40($sp)
	sw $t1, 36($sp)
	sw $t3, 44($sp)

____swap_0____enter:

____swap_1____entry:
	lw $v0, 172($sp)
	mul $t1, $v0, 4
	lw $v0, ____global_3____variable
	addu $t1, $v0, $t1
	lw $t1, 0($t1)
	lw $v0, 172($sp)
	mul $t2, $v0, 4
	lw $v0, ____global_3____variable
	addu $t2, $v0, $t2
	lw $v0, 176($sp)
	mul $t3, $v0, 4
	lw $v0, ____global_3____variable
	addu $t3, $v0, $t3
	lw $t3, 0($t3)
	sw $t3, 0($t2)
	lw $v0, 176($sp)
	mul $t2, $v0, 4
	lw $v0, ____global_3____variable
	addu $t2, $v0, $t2
	sw $t1, 0($t2)

____swap_2____exit:
	lw $t2, 40($sp)
	lw $t1, 36($sp)
	lw $t3, 44($sp)
	addu $sp, $sp, 180
	jr $ra

____pd____function:
	sub $sp, $sp, 160
	sw $t2, 40($sp)
	sw $t1, 36($sp)
	sw $t3, 44($sp)

____pd_0____enter:
	lw $v0, ____global_1____variable
	move $t2, $v0
	lw $v0, 156($sp)
	move $t3, $v0

____pd_1____entry:

____pd_2____for_condition:
	bgt $t2, $t3, ____pd_8____for_merge

____pd_3____for_body:
	addu $t1, $t2, 1
	mul $t1, $t2, $t1
	div $t1, $t1, 2
	bne $t3, $t1, ____pd_7____for_loop

____pd_4____if_true:
	li $v0, 1
	j ____pd_9____exit

____pd_7____for_loop:
	addu $t2, $t2, 1
	j ____pd_2____for_condition

____pd_8____for_merge:
	li $v0, 0

____pd_9____exit:
	sw $t2, ____global_1____variable
	sw $t3, 156($sp)
	lw $t2, 40($sp)
	lw $t1, 36($sp)
	lw $t3, 44($sp)
	addu $sp, $sp, 160
	jr $ra

____show____function:
	sub $sp, $sp, 164
	sw $ra, 124($sp)
	sw $t2, 40($sp)
	sw $t1, 36($sp)
	sw $t4, 48($sp)
	sw $t3, 44($sp)

____show_0____enter:
	lw $v0, ____global_2____variable
	move $t3, $v0
	lw $v0, ____global_3____variable
	move $t2, $v0

____show_1____entry:
	li $t4 0

____show_2____for_condition:
	bge $t4, $t3, ____show_5____for_merge

____show_4____for_loop:
	mul $t1, $t4, 4
	addu $t1, $t2, $t1
	lw $t1, 0($t1)
	move $a0, $t1
	jal ____builtin____to_string
	move $t1, $v0
	move $a0, $t1
	la $a1, ____global_57____string
	jal ____builtin_string____concatenate
	move $t1, $v0
	move $a0, $t1
	jal ____builtin____print
	addu $t4, $t4, 1
	j ____show_2____for_condition

____show_5____for_merge:
	la $a0, ____global_59____string
	jal ____builtin____println

____show_6____exit:
	sw $t3, ____global_2____variable
	sw $t2, ____global_3____variable
	lw $t2, 40($sp)
	lw $t1, 36($sp)
	lw $t4, 48($sp)
	lw $t3, 44($sp)
	lw $ra, 124($sp)
	addu $sp, $sp, 164
	jr $ra

____win____function:
	sub $sp, $sp, 296
	sw $t5, 52($sp)
	sw $t2, 40($sp)
	sw $t7, 60($sp)
	sw $t6, 56($sp)
	sw $s0, 64($sp)
	sw $t1, 36($sp)
	sw $t4, 48($sp)
	sw $t3, 44($sp)

____win_0____enter:
	lw $v0, ____global_2____variable
	move $t3, $v0
	lw $v0, ____global_3____variable
	move $t6, $v0

____win_1____entry:
	li $t1 400
	addu $t1, $t1, 4
	move $a0, $t1
	li $v0, 9
	syscall
	move $t1, $v0
	li $v1, 100
	sw $v1, 0($t1)
	addu $t1, $t1, 4
	move $t7, $t1
	lw $v1, ____global_1____variable
	beq $t3, $v1, ____win_4____if_merge

____win_2____if_true:
	li $v0, 0
	j ____win_27____exit

____win_4____if_merge:
	li $t5 0

____win_5____for_condition:
	bge $t5, $t3, ____win_8____for_merge

____win_7____for_loop:
	mul $t1, $t5, 4
	addu $t1, $t7, $t1
	mul $t2, $t5, 4
	addu $t2, $t6, $t2
	lw $t2, 0($t2)
	sw $t2, 0($t1)
	addu $t5, $t5, 1
	j ____win_5____for_condition

____win_8____for_merge:
	li $s0 0

____win_9____for_condition:
	sub $t1, $t3, 1
	bge $s0, $t1, ____win_19____for_merge

____win_10____for_body:
	addu $t1, $s0, 1
	move $t5, $t1

____win_11____for_condition:
	bge $t5, $t3, ____win_18____for_loop

____win_12____for_body:
	mul $t1, $s0, 4
	addu $t1, $t7, $t1
	lw $t2, 0($t1)
	mul $t1, $t5, 4
	addu $t1, $t7, $t1
	lw $t1, 0($t1)
	ble $t2, $t1, ____win_16____for_loop

____win_15____if_merge:
	mul $t1, $s0, 4
	addu $t1, $t7, $t1
	lw $t1, 0($t1)
	mul $t2, $s0, 4
	addu $t4, $t7, $t2
	mul $t2, $t5, 4
	addu $t2, $t7, $t2
	lw $t2, 0($t2)
	sw $t2, 0($t4)
	mul $t2, $t5, 4
	addu $t2, $t7, $t2
	sw $t1, 0($t2)

____win_16____for_loop:
	addu $t5, $t5, 1
	j ____win_11____for_condition

____win_18____for_loop:
	addu $s0, $s0, 1
	j ____win_9____for_condition

____win_19____for_merge:
	li $s0 0

____win_20____for_condition:
	bge $s0, $t3, ____win_26____for_merge

____win_21____for_body:
	mul $t1, $s0, 4
	addu $t1, $t7, $t1
	lw $t2, 0($t1)
	addu $t1, $s0, 1
	beq $t2, $t1, ____win_25____for_loop

____win_22____if_true:
	li $v0, 0
	j ____win_27____exit

____win_25____for_loop:
	addu $s0, $s0, 1
	j ____win_20____for_condition

____win_26____for_merge:
	li $v0, 1

____win_27____exit:
	sw $t3, ____global_2____variable
	sw $t6, ____global_3____variable
	lw $t5, 52($sp)
	lw $t2, 40($sp)
	lw $t7, 60($sp)
	lw $t6, 56($sp)
	lw $s0, 64($sp)
	lw $t1, 36($sp)
	lw $t4, 48($sp)
	lw $t3, 44($sp)
	addu $sp, $sp, 296
	jr $ra

____merge____function:
	sub $sp, $sp, 200
	sw $ra, 124($sp)
	sw $t2, 40($sp)
	sw $t1, 36($sp)
	sw $t3, 44($sp)

____merge_0____enter:

____merge_1____entry:
	li $t3 0

____merge_2____for_condition:
	lw $v1, ____global_2____variable
	bge $t3, $v1, ____merge_15____for_merge

____merge_3____for_body:
	mul $t1, $t3, 4
	lw $v0, ____global_3____variable
	addu $t1, $v0, $t1
	lw $t1, 0($t1)
	li $v1, 0
	beq $t1, $v1, ____merge_14____for_loop

____merge_4____if_true:
	addu $t1, $t3, 1
	move $t2, $t1

____merge_5____for_condition:
	lw $v1, ____global_2____variable
	bge $t2, $v1, ____merge_14____for_loop

____merge_6____for_body:
	mul $t1, $t2, 4
	lw $v0, ____global_3____variable
	addu $t1, $v0, $t1
	lw $t1, 0($t1)
	li $v1, 0
	beq $t1, $v1, ____merge_10____for_loop

____merge_13____if_merge:
	sw $t3, -8($sp)
	sw $t2, -4($sp)
	jal ____swap____function

____merge_14____for_loop:
	addu $t3, $t3, 1
	j ____merge_2____for_condition

____merge_10____for_loop:
	addu $t2, $t2, 1
	j ____merge_5____for_condition

____merge_15____for_merge:
	li $t3 0

____merge_16____for_condition:
	lw $v1, ____global_2____variable
	bge $t3, $v1, ____merge_23____exit

____merge_17____for_body:
	mul $t1, $t3, 4
	lw $v0, ____global_3____variable
	addu $t1, $v0, $t1
	lw $t1, 0($t1)
	li $v1, 0
	beq $t1, $v1, ____merge_21____for_loop

____merge_22____for_merge:
	sw $t3, ____global_2____variable
	j ____merge_23____exit

____merge_21____for_loop:
	addu $t3, $t3, 1
	j ____merge_16____for_condition

____merge_23____exit:
	lw $t2, 40($sp)
	lw $t1, 36($sp)
	lw $t3, 44($sp)
	lw $ra, 124($sp)
	addu $sp, $sp, 200
	jr $ra

____move____function:
	sub $sp, $sp, 164
	sw $t5, 52($sp)
	sw $t2, 40($sp)
	sw $t1, 36($sp)
	sw $t4, 48($sp)
	sw $t3, 44($sp)

____move_0____enter:
	lw $v0, ____global_2____variable
	move $t3, $v0
	lw $v0, ____global_3____variable
	move $t4, $v0

____move_1____entry:
	li $t2 0

____move_2____for_condition:
	bge $t2, $t3, ____move_5____for_merge

____move_4____for_loop:
	mul $t1, $t2, 4
	addu $t5, $t4, $t1
	lw $t1, 0($t5)
	sub $t1, $t1, 1
	sw $t1, 0($t5)
	addu $t2, $t2, 1
	j ____move_2____for_condition

____move_5____for_merge:
	mul $t1, $t3, 4
	addu $t1, $t4, $t1
	sw $t3, 0($t1)
	addu $t3, $t3, 1

____move_6____exit:
	sw $t3, ____global_2____variable
	sw $t4, ____global_3____variable
	lw $t5, 52($sp)
	lw $t2, 40($sp)
	lw $t1, 36($sp)
	lw $t4, 48($sp)
	lw $t3, 44($sp)
	addu $sp, $sp, 164
	jr $ra

main:
	sub $sp, $sp, 312
	sw $ra, 124($sp)

____main_0____enter:
	li $v0 48271
	sw $v0, ____global_4____variable
	li $v0 2147483647
	sw $v0, ____global_5____variable
	li $v0 1
	sw $v0, ____global_8____variable

____main_1____entry:
	li $t4 0
	li $t3 0
	jal ____builtin____get_int
	move $t1, $v0
	sw $t1, ____global_0____variable
	li $t1 400
	addu $t1, $t1, 4
	move $a0, $t1
	li $v0, 9
	syscall
	move $t1, $v0
	li $v1, 100
	sw $v1, 0($t1)
	addu $t1, $t1, 4
	sw $t1, ____global_3____variable
	lw $v0, ____global_5____variable
	lw $v1, ____global_4____variable
	div $t1, $v0, $v1
	sw $t1, ____global_6____variable
	lw $v0, ____global_5____variable
	lw $v1, ____global_4____variable
	rem $t1, $v0, $v1
	sw $t1, ____global_7____variable
	lw $v0, ____global_0____variable
	sw $v0, -4($sp)
	jal ____pd____function
	move $t1, $v0
	bnez $t1, ____main_4____if_merge

____main_2____if_true:
	la $a0, ____global_132____string
	jal ____builtin____println
	li $v0, 1
	j ____main_15____exit

____main_4____if_merge:
	la $a0, ____global_133____string
	jal ____builtin____println
	li $v0, 3654898
	sw $v0, -4($sp)
	jal ____initialize____function
	jal ____random____function
	move $t1, $v0
	rem $t1, $t1, 10
	addu $t1, $t1, 1
	sw $t1, ____global_2____variable
	lw $a0, ____global_2____variable
	jal ____builtin____to_string
	move $t1, $v0
	move $a0, $t1
	jal ____builtin____println
	li $t5 0

____main_5____for_condition:
	lw $v0, ____global_2____variable
	sub $t1, $v0, 1
	bge $t5, $t1, ____main_11____for_merge

____main_6____for_body:
	mul $t1, $t5, 4
	lw $v0, ____global_3____variable
	addu $t2, $v0, $t1
	jal ____random____function
	move $t1, $v0
	rem $t1, $t1, 10
	addu $t1, $t1, 1
	sw $t1, 0($t2)

____main_7____while_loop:
	mul $t1, $t5, 4
	lw $v0, ____global_3____variable
	addu $t1, $v0, $t1
	lw $t1, 0($t1)
	addu $t1, $t1, $t4
	lw $v1, ____global_0____variable
	ble $t1, $v1, ____main_10____for_loop

____main_8____while_body:
	mul $t1, $t5, 4
	lw $v0, ____global_3____variable
	addu $t2, $v0, $t1
	jal ____random____function
	move $t1, $v0
	rem $t1, $t1, 10
	addu $t1, $t1, 1
	sw $t1, 0($t2)
	j ____main_7____while_loop

____main_10____for_loop:
	mul $t1, $t5, 4
	lw $v0, ____global_3____variable
	addu $t1, $v0, $t1
	lw $t1, 0($t1)
	addu $t1, $t4, $t1
	move $t4, $t1
	addu $t5, $t5, 1
	j ____main_5____for_condition

____main_11____for_merge:
	lw $v0, ____global_2____variable
	sub $t1, $v0, 1
	mul $t1, $t1, 4
	lw $v0, ____global_3____variable
	addu $t1, $v0, $t1
	lw $v0, ____global_0____variable
	sub $t2, $v0, $t4
	sw $t2, 0($t1)
	jal ____show____function
	jal ____merge____function

____main_12____while_loop:
	jal ____win____function
	move $t1, $v0
	bnez $t1, ____main_14____while_merge

____main_13____while_body:
	addu $t3, $t3, 1
	move $a0, $t3
	jal ____builtin____to_string
	move $t1, $v0
	la $a0, ____global_165____string
	move $a1, $t1
	jal ____builtin_string____concatenate
	move $t1, $v0
	move $a0, $t1
	jal ____builtin____println
	jal ____move____function
	jal ____merge____function
	jal ____show____function
	j ____main_12____while_loop

____main_14____while_merge:
	move $a0, $t3
	jal ____builtin____to_string
	move $t1, $v0
	la $a0, ____global_168____string
	move $a1, $t1
	jal ____builtin_string____concatenate
	move $t1, $v0
	move $a0, $t1
	la $a1, ____global_171____string
	jal ____builtin_string____concatenate
	move $t1, $v0
	move $a0, $t1
	jal ____builtin____println
	li $v0, 0

____main_15____exit:
	lw $ra, 124($sp)
	addu $sp, $sp, 312
	jr $ra

	.data
____string_buffer:
	.space 1024
	.align 2
____string_newline:
	.asciiz "\n"
	.align 2
	.word 12
____global_133____string:
	.asciiz "Let's start!"
	.align 2
	.word 79
____global_132____string:
	.asciiz "Sorry, the number n must be a number s.t. there exists i satisfying n=1+2+...+i"
	.align 2
____global_4____variable:
	.space 4
	.align 2
	.word 1
____global_57____string:
	.asciiz " "
	.align 2
____global_5____variable:
	.space 4
	.align 2
____global_7____variable:
	.space 4
	.align 2
____global_2____variable:
	.space 4
	.align 2
____global_0____variable:
	.space 4
	.align 2
	.word 7
____global_168____string:
	.asciiz "Total: "
	.align 2
____global_8____variable:
	.space 4
	.align 2
____global_6____variable:
	.space 4
	.align 2
____global_3____variable:
	.space 4
	.align 2
	.word 8
____global_171____string:
	.asciiz " step(s)"
	.align 2
____global_1____variable:
	.space 4
	.align 2
	.word 6
____global_165____string:
	.asciiz "step :"
	.align 2
	.word 0
____global_59____string:
	.asciiz ""
	.align 2
