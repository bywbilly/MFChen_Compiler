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

____origin____function:
	sub $sp, $sp, 204
	sw $ra, 124($sp)

____origin_10____enter:
	lw $v0, ____global_15____variable
	sw $v0, 140($sp)
	lw $v0, ____global_17____variable
	sw $v0, 188($sp)
	lw $v0, ____global_16____variable
	sw $v0, 192($sp)
	j ____origin_9____entry

____origin_9____entry:
	lw $v0, 200($sp)
	li $v1, 4
	mul $v0, $v0, $v1
	sw $v0, 128($sp)
	lw $v0, 128($sp)
	li $v1, 4
	addu $v0, $v0, $v1
	sw $v0, 128($sp)
	lw $a0, 128($sp)
	li $v0, 9
	syscall
	sw $v0, 176($sp)
	lw $v0, 200($sp)
	lw $v1, 176($sp)
	sw $v0, 0($v1)
	lw $v0, 176($sp)
	li $v1, 4
	addu $v0, $v0, $v1
	sw $v0, 176($sp)
	lw $v0, 176($sp)
	sw $v0, 140($sp)
	li $v0, 0
	sw $v0, 192($sp)
	j ____origin_8____for_condition

____origin_8____for_condition:
	lw $v0, 192($sp)
	lw $v1, 200($sp)
	slt $v0, $v0, $v1
	sw $v0, 160($sp)
	lw $v0, 160($sp)
	beqz $v0, ____origin_7____for_merge
	j ____origin_5____for_body

____origin_5____for_body:
	lw $v0, 192($sp)
	li $v1, 4
	mul $v0, $v0, $v1
	sw $v0, 136($sp)
	lw $v0, 140($sp)
	lw $v1, 136($sp)
	addu $v0, $v0, $v1
	sw $v0, 168($sp)
	lw $v0, 200($sp)
	li $v1, 4
	mul $v0, $v0, $v1
	sw $v0, 180($sp)
	lw $v0, 180($sp)
	li $v1, 4
	addu $v0, $v0, $v1
	sw $v0, 180($sp)
	lw $a0, 180($sp)
	li $v0, 9
	syscall
	sw $v0, 172($sp)
	lw $v0, 200($sp)
	lw $v1, 172($sp)
	sw $v0, 0($v1)
	lw $v0, 172($sp)
	li $v1, 4
	addu $v0, $v0, $v1
	sw $v0, 172($sp)
	lw $v0, 172($sp)
	lw $v1, 168($sp)
	sw $v0, 0($v1)
	li $v0, 0
	sw $v0, 188($sp)
	j ____origin_4____for_condition

____origin_7____for_merge:
	j ____origin_6____exit

____origin_4____for_condition:
	lw $v0, 188($sp)
	lw $v1, 200($sp)
	slt $v0, $v0, $v1
	sw $v0, 164($sp)
	lw $v0, 164($sp)
	beqz $v0, ____origin_3____for_merge
	j ____origin_1____for_body

____origin_1____for_body:
	lw $v0, 192($sp)
	li $v1, 4
	mul $v0, $v0, $v1
	sw $v0, 196($sp)
	lw $v0, 140($sp)
	lw $v1, 196($sp)
	addu $v0, $v0, $v1
	sw $v0, 148($sp)
	lw $v0, 148($sp)
	lw $v1, 0($v0)
	sw $v1, 156($sp)
	lw $v0, 188($sp)
	li $v1, 4
	mul $v0, $v0, $v1
	sw $v0, 132($sp)
	lw $v0, 156($sp)
	lw $v1, 132($sp)
	addu $v0, $v0, $v1
	sw $v0, 144($sp)
	li $v0, 0
	lw $v1, 144($sp)
	sw $v0, 0($v1)
	j ____origin_0____for_loop

____origin_3____for_merge:
	j ____origin_2____for_loop

____origin_0____for_loop:
	lw $v0, 188($sp)
	sw $v0, 184($sp)
	lw $v0, 188($sp)
	li $v1, 1
	addu $v0, $v0, $v1
	sw $v0, 188($sp)
	j ____origin_4____for_condition

____origin_2____for_loop:
	lw $v0, 192($sp)
	sw $v0, 152($sp)
	lw $v0, 192($sp)
	li $v1, 1
	addu $v0, $v0, $v1
	sw $v0, 192($sp)
	j ____origin_8____for_condition

____origin_6____exit:
	lw $v0, 140($sp)
	sw $v0, ____global_15____variable
	lw $v0, 188($sp)
	sw $v0, ____global_17____variable
	lw $v0, 192($sp)
	sw $v0, ____global_16____variable
	lw $ra, 124($sp)
	addu $sp, $sp, 204
	jr $ra

____check____function:
	sub $sp, $sp, 148
	sw $ra, 124($sp)

____check_5____enter:
	lw $v0, ____global_0____variable
	sw $v0, 136($sp)
	j ____check_4____entry

____check_4____entry:
	lw $v0, 144($sp)
	lw $v1, 136($sp)
	slt $v0, $v0, $v1
	sw $v0, 140($sp)
	lw $v0, 140($sp)
	beqz $v0, ____check_3____logical_false
	j ____check_2____logical_true

____check_2____logical_true:
	lw $v0, 144($sp)
	li $v1, 0
	sge $v0, $v0, $v1
	sw $v0, 128($sp)
	lw $v0, 128($sp)
	sw $v0, 132($sp)
	j ____check_1____logical_merge

____check_3____logical_false:
	li $v0, 0
	sw $v0, 132($sp)
	j ____check_1____logical_merge

____check_1____logical_merge:
	lw $v0, 132($sp)
	j ____check_0____exit

____check_0____exit:
	lw $v0, 136($sp)
	sw $v0, ____global_0____variable
	lw $ra, 124($sp)
	addu $sp, $sp, 148
	jr $ra

____addList____function:
	sub $sp, $sp, 236
	sw $ra, 124($sp)

____addList_17____enter:
	j ____addList_16____entry

____addList_16____entry:
	lw $v0, 228($sp)
	sw $v0, -4($sp)
	jal ____check____function
	sw $v0, 192($sp)
	lw $v0, 192($sp)
	beqz $v0, ____addList_15____logical_false
	j ____addList_14____logical_true

____addList_14____logical_true:
	lw $v0, 232($sp)
	sw $v0, -4($sp)
	jal ____check____function
	sw $v0, 220($sp)
	lw $v0, 220($sp)
	sw $v0, 164($sp)
	j ____addList_13____logical_merge

____addList_15____logical_false:
	li $v0, 0
	sw $v0, 164($sp)
	j ____addList_13____logical_merge

____addList_13____logical_merge:
	lw $v0, 164($sp)
	beqz $v0, ____addList_12____logical_false
	j ____addList_11____logical_true

____addList_11____logical_true:
	lw $v0, 228($sp)
	li $v1, 4
	mul $v0, $v0, $v1
	sw $v0, 140($sp)
	lw $v0, ____global_15____variable
	lw $v1, 140($sp)
	addu $v0, $v0, $v1
	sw $v0, 168($sp)
	lw $v0, 168($sp)
	lw $v1, 0($v0)
	sw $v1, 172($sp)
	lw $v0, 232($sp)
	li $v1, 4
	mul $v0, $v0, $v1
	sw $v0, 156($sp)
	lw $v0, 172($sp)
	lw $v1, 156($sp)
	addu $v0, $v0, $v1
	sw $v0, 132($sp)
	lw $v0, 132($sp)
	lw $v1, 0($v0)
	sw $v1, 144($sp)
	lw $v0, 144($sp)
	li $v1, -1
	seq $v0, $v0, $v1
	sw $v0, 148($sp)
	lw $v0, 148($sp)
	sw $v0, 128($sp)
	j ____addList_10____logical_merge

____addList_12____logical_false:
	li $v0, 0
	sw $v0, 128($sp)
	j ____addList_10____logical_merge

____addList_10____logical_merge:
	lw $v0, 128($sp)
	beqz $v0, ____addList_9____if_false
	j ____addList_8____if_true

____addList_8____if_true:
	lw $v0, ____global_10____variable
	sw $v0, 152($sp)
	lw $v0, ____global_10____variable
	li $v1, 1
	addu $v0, $v0, $v1
	sw $v0, ____global_10____variable
	lw $v0, ____global_10____variable
	li $v1, 4
	mul $v0, $v0, $v1
	sw $v0, 224($sp)
	lw $v0, ____global_8____variable
	lw $v1, 224($sp)
	addu $v0, $v0, $v1
	sw $v0, 184($sp)
	lw $v0, 228($sp)
	lw $v1, 184($sp)
	sw $v0, 0($v1)
	lw $v0, ____global_10____variable
	li $v1, 4
	mul $v0, $v0, $v1
	sw $v0, 188($sp)
	lw $v0, ____global_9____variable
	lw $v1, 188($sp)
	addu $v0, $v0, $v1
	sw $v0, 200($sp)
	lw $v0, 232($sp)
	lw $v1, 200($sp)
	sw $v0, 0($v1)
	lw $v0, 228($sp)
	li $v1, 4
	mul $v0, $v0, $v1
	sw $v0, 160($sp)
	lw $v0, ____global_15____variable
	lw $v1, 160($sp)
	addu $v0, $v0, $v1
	sw $v0, 204($sp)
	lw $v0, 204($sp)
	lw $v1, 0($v0)
	sw $v1, 216($sp)
	lw $v0, 232($sp)
	li $v1, 4
	mul $v0, $v0, $v1
	sw $v0, 180($sp)
	lw $v0, 216($sp)
	lw $v1, 180($sp)
	addu $v0, $v0, $v1
	sw $v0, 176($sp)
	lw $v0, ____global_12____variable
	li $v1, 1
	addu $v0, $v0, $v1
	sw $v0, 196($sp)
	lw $v0, 196($sp)
	lw $v1, 176($sp)
	sw $v0, 0($v1)
	lw $v0, 228($sp)
	lw $v1, ____global_4____variable
	seq $v0, $v0, $v1
	sw $v0, 136($sp)
	lw $v0, 136($sp)
	beqz $v0, ____addList_7____logical_false
	j ____addList_6____logical_true

____addList_9____if_false:
	j ____addList_1____if_merge

____addList_6____logical_true:
	lw $v0, 232($sp)
	lw $v1, ____global_5____variable
	seq $v0, $v0, $v1
	sw $v0, 212($sp)
	lw $v0, 212($sp)
	sw $v0, 208($sp)
	j ____addList_5____logical_merge

____addList_7____logical_false:
	li $v0, 0
	sw $v0, 208($sp)
	j ____addList_5____logical_merge

____addList_1____if_merge:
	j ____addList_0____exit

____addList_5____logical_merge:
	lw $v0, 208($sp)
	beqz $v0, ____addList_4____if_false
	j ____addList_3____if_true

____addList_3____if_true:
	li $v0, 1
	sw $v0, ____global_11____variable
	j ____addList_2____if_merge

____addList_4____if_false:
	j ____addList_2____if_merge

____addList_2____if_merge:
	j ____addList_1____if_merge

____addList_0____exit:
	lw $ra, 124($sp)
	addu $sp, $sp, 236
	jr $ra

main:
	sub $sp, $sp, 464
	sw $ra, 124($sp)

____main_23____enter:
	li $v0, 48000
	sw $v0, 164($sp)
	lw $v0, 164($sp)
	li $v1, 4
	addu $v0, $v0, $v1
	sw $v0, 164($sp)
	lw $a0, 164($sp)
	li $v0, 9
	syscall
	sw $v0, 316($sp)
	li $v0, 12000
	lw $v1, 316($sp)
	sw $v0, 0($v1)
	lw $v0, 316($sp)
	li $v1, 4
	addu $v0, $v0, $v1
	sw $v0, 316($sp)
	lw $v0, 316($sp)
	sw $v0, ____global_8____variable
	li $v0, 48000
	sw $v0, 396($sp)
	lw $v0, 396($sp)
	li $v1, 4
	addu $v0, $v0, $v1
	sw $v0, 396($sp)
	lw $a0, 396($sp)
	li $v0, 9
	syscall
	sw $v0, 308($sp)
	li $v0, 12000
	lw $v1, 308($sp)
	sw $v0, 0($v1)
	lw $v0, 308($sp)
	li $v1, 4
	addu $v0, $v0, $v1
	sw $v0, 308($sp)
	lw $v0, 308($sp)
	sw $v0, ____global_9____variable
	li $v0, 32
	sw $v0, 296($sp)
	lw $v0, 296($sp)
	li $v1, 4
	addu $v0, $v0, $v1
	sw $v0, 296($sp)
	lw $a0, 296($sp)
	li $v0, 9
	syscall
	sw $v0, 364($sp)
	li $v0, 8
	lw $v1, 364($sp)
	sw $v0, 0($v1)
	lw $v0, 364($sp)
	li $v1, 4
	addu $v0, $v0, $v1
	sw $v0, 364($sp)
	lw $v0, 364($sp)
	sw $v0, ____global_13____variable
	li $v0, 36
	sw $v0, 452($sp)
	lw $v0, 452($sp)
	li $v1, 4
	addu $v0, $v0, $v1
	sw $v0, 452($sp)
	lw $a0, 452($sp)
	li $v0, 9
	syscall
	sw $v0, 320($sp)
	li $v0, 9
	lw $v1, 320($sp)
	sw $v0, 0($v1)
	lw $v0, 320($sp)
	li $v1, 4
	addu $v0, $v0, $v1
	sw $v0, 320($sp)
	lw $v0, 320($sp)
	sw $v0, ____global_14____variable
	j ____main_22____entry

____main_22____entry:
	li $v0, 106
	sw $v0, -4($sp)
	jal ____origin____function
	jal ____builtin____get_int
	sw $v0, 428($sp)
	lw $v0, 428($sp)
	sw $v0, ____global_0____variable
	lw $v0, ____global_0____variable
	li $v1, 1
	sub $v0, $v0, $v1
	sw $v0, 256($sp)
	lw $v0, 256($sp)
	sw $v0, ____global_5____variable
	lw $v0, ____global_5____variable
	sw $v0, ____global_4____variable
	li $v0, 0
	sw $v0, ____global_16____variable
	j ____main_21____for_condition

____main_21____for_condition:
	lw $v0, ____global_16____variable
	lw $v1, ____global_0____variable
	slt $v0, $v0, $v1
	sw $v0, 248($sp)
	lw $v0, 248($sp)
	beqz $v0, ____main_20____for_merge
	j ____main_5____for_body

____main_5____for_body:
	li $v0, 0
	sw $v0, ____global_17____variable
	j ____main_4____for_condition

____main_20____for_merge:
	li $v0, 0
	sw $v0, 152($sp)
	lw $v0, ____global_13____variable
	lw $v1, 152($sp)
	addu $v0, $v0, $v1
	sw $v0, 280($sp)
	li $v0, -2
	lw $v1, 280($sp)
	sw $v0, 0($v1)
	li $v0, 0
	sw $v0, 304($sp)
	lw $v0, ____global_14____variable
	lw $v1, 304($sp)
	addu $v0, $v0, $v1
	sw $v0, 420($sp)
	li $v0, -1
	lw $v1, 420($sp)
	sw $v0, 0($v1)
	li $v0, 4
	sw $v0, 336($sp)
	lw $v0, ____global_13____variable
	lw $v1, 336($sp)
	addu $v0, $v0, $v1
	sw $v0, 140($sp)
	li $v0, -2
	lw $v1, 140($sp)
	sw $v0, 0($v1)
	li $v0, 4
	sw $v0, 132($sp)
	lw $v0, ____global_14____variable
	lw $v1, 132($sp)
	addu $v0, $v0, $v1
	sw $v0, 180($sp)
	li $v0, 1
	lw $v1, 180($sp)
	sw $v0, 0($v1)
	li $v0, 8
	sw $v0, 332($sp)
	lw $v0, ____global_13____variable
	lw $v1, 332($sp)
	addu $v0, $v0, $v1
	sw $v0, 168($sp)
	li $v0, 2
	lw $v1, 168($sp)
	sw $v0, 0($v1)
	li $v0, 8
	sw $v0, 416($sp)
	lw $v0, ____global_14____variable
	lw $v1, 416($sp)
	addu $v0, $v0, $v1
	sw $v0, 268($sp)
	li $v0, -1
	lw $v1, 268($sp)
	sw $v0, 0($v1)
	li $v0, 12
	sw $v0, 424($sp)
	lw $v0, ____global_13____variable
	lw $v1, 424($sp)
	addu $v0, $v0, $v1
	sw $v0, 220($sp)
	li $v0, 2
	lw $v1, 220($sp)
	sw $v0, 0($v1)
	li $v0, 12
	sw $v0, 380($sp)
	lw $v0, ____global_14____variable
	lw $v1, 380($sp)
	addu $v0, $v0, $v1
	sw $v0, 432($sp)
	li $v0, 1
	lw $v1, 432($sp)
	sw $v0, 0($v1)
	li $v0, 16
	sw $v0, 284($sp)
	lw $v0, ____global_13____variable
	lw $v1, 284($sp)
	addu $v0, $v0, $v1
	sw $v0, 292($sp)
	li $v0, -1
	lw $v1, 292($sp)
	sw $v0, 0($v1)
	li $v0, 16
	sw $v0, 228($sp)
	lw $v0, ____global_14____variable
	lw $v1, 228($sp)
	addu $v0, $v0, $v1
	sw $v0, 172($sp)
	li $v0, -2
	lw $v1, 172($sp)
	sw $v0, 0($v1)
	li $v0, 20
	sw $v0, 264($sp)
	lw $v0, ____global_13____variable
	lw $v1, 264($sp)
	addu $v0, $v0, $v1
	sw $v0, 352($sp)
	li $v0, -1
	lw $v1, 352($sp)
	sw $v0, 0($v1)
	li $v0, 20
	sw $v0, 372($sp)
	lw $v0, ____global_14____variable
	lw $v1, 372($sp)
	addu $v0, $v0, $v1
	sw $v0, 204($sp)
	li $v0, 2
	lw $v1, 204($sp)
	sw $v0, 0($v1)
	li $v0, 24
	sw $v0, 208($sp)
	lw $v0, ____global_13____variable
	lw $v1, 208($sp)
	addu $v0, $v0, $v1
	sw $v0, 388($sp)
	li $v0, 1
	lw $v1, 388($sp)
	sw $v0, 0($v1)
	li $v0, 24
	sw $v0, 136($sp)
	lw $v0, ____global_14____variable
	lw $v1, 136($sp)
	addu $v0, $v0, $v1
	sw $v0, 384($sp)
	li $v0, -2
	lw $v1, 384($sp)
	sw $v0, 0($v1)
	li $v0, 28
	sw $v0, 340($sp)
	lw $v0, ____global_13____variable
	lw $v1, 340($sp)
	addu $v0, $v0, $v1
	sw $v0, 224($sp)
	li $v0, 1
	lw $v1, 224($sp)
	sw $v0, 0($v1)
	li $v0, 28
	sw $v0, 144($sp)
	lw $v0, ____global_14____variable
	lw $v1, 144($sp)
	addu $v0, $v0, $v1
	sw $v0, 448($sp)
	li $v0, 2
	lw $v1, 448($sp)
	sw $v0, 0($v1)
	j ____main_19____while_loop

____main_4____for_condition:
	lw $v0, ____global_17____variable
	lw $v1, ____global_0____variable
	slt $v0, $v0, $v1
	sw $v0, 192($sp)
	lw $v0, 192($sp)
	beqz $v0, ____main_3____for_merge
	j ____main_1____for_body

____main_19____while_loop:
	lw $v0, ____global_1____variable
	lw $v1, ____global_10____variable
	sle $v0, $v0, $v1
	sw $v0, 436($sp)
	lw $v0, 436($sp)
	beqz $v0, ____main_12____while_merge
	j ____main_18____while_body

____main_1____for_body:
	lw $v0, ____global_16____variable
	li $v1, 4
	mul $v0, $v0, $v1
	sw $v0, 404($sp)
	lw $v0, ____global_15____variable
	lw $v1, 404($sp)
	addu $v0, $v0, $v1
	sw $v0, 148($sp)
	lw $v0, 148($sp)
	lw $v1, 0($v0)
	sw $v1, 128($sp)
	lw $v0, ____global_17____variable
	li $v1, 4
	mul $v0, $v0, $v1
	sw $v0, 456($sp)
	lw $v0, 128($sp)
	lw $v1, 456($sp)
	addu $v0, $v0, $v1
	sw $v0, 376($sp)
	li $v0, -1
	lw $v1, 376($sp)
	sw $v0, 0($v1)
	j ____main_0____for_loop

____main_3____for_merge:
	j ____main_2____for_loop

____main_18____while_body:
	lw $v0, ____global_1____variable
	li $v1, 4
	mul $v0, $v0, $v1
	sw $v0, 368($sp)
	lw $v0, ____global_8____variable
	lw $v1, 368($sp)
	addu $v0, $v0, $v1
	sw $v0, 392($sp)
	lw $v0, 392($sp)
	lw $v1, 0($v0)
	sw $v1, 196($sp)
	lw $v0, 196($sp)
	sw $v0, ____global_6____variable
	lw $v0, ____global_1____variable
	li $v1, 4
	mul $v0, $v0, $v1
	sw $v0, 184($sp)
	lw $v0, ____global_9____variable
	lw $v1, 184($sp)
	addu $v0, $v0, $v1
	sw $v0, 356($sp)
	lw $v0, 356($sp)
	lw $v1, 0($v0)
	sw $v1, 276($sp)
	lw $v0, 276($sp)
	sw $v0, ____global_7____variable
	lw $v0, ____global_6____variable
	li $v1, 4
	mul $v0, $v0, $v1
	sw $v0, 272($sp)
	lw $v0, ____global_15____variable
	lw $v1, 272($sp)
	addu $v0, $v0, $v1
	sw $v0, 160($sp)
	lw $v0, 160($sp)
	lw $v1, 0($v0)
	sw $v1, 212($sp)
	lw $v0, ____global_7____variable
	li $v1, 4
	mul $v0, $v0, $v1
	sw $v0, 440($sp)
	lw $v0, 212($sp)
	lw $v1, 440($sp)
	addu $v0, $v0, $v1
	sw $v0, 360($sp)
	lw $v0, 360($sp)
	lw $v1, 0($v0)
	sw $v1, 408($sp)
	lw $v0, 408($sp)
	sw $v0, ____global_12____variable
	li $v0, 0
	sw $v0, ____global_17____variable
	j ____main_17____for_condition

____main_12____while_merge:
	lw $v0, ____global_11____variable
	li $v1, 1
	seq $v0, $v0, $v1
	sw $v0, 200($sp)
	lw $v0, 200($sp)
	beqz $v0, ____main_11____if_false
	j ____main_10____if_true

____main_0____for_loop:
	lw $v0, ____global_17____variable
	sw $v0, 260($sp)
	lw $v0, ____global_17____variable
	li $v1, 1
	addu $v0, $v0, $v1
	sw $v0, ____global_17____variable
	j ____main_4____for_condition

____main_2____for_loop:
	lw $v0, ____global_16____variable
	sw $v0, 412($sp)
	lw $v0, ____global_16____variable
	li $v1, 1
	addu $v0, $v0, $v1
	sw $v0, ____global_16____variable
	j ____main_21____for_condition

____main_17____for_condition:
	lw $v0, ____global_17____variable
	li $v1, 8
	slt $v0, $v0, $v1
	sw $v0, 240($sp)
	lw $v0, 240($sp)
	beqz $v0, ____main_16____for_merge
	j ____main_7____for_body

____main_10____if_true:
	lw $v0, ____global_4____variable
	li $v1, 4
	mul $v0, $v0, $v1
	sw $v0, 400($sp)
	lw $v0, ____global_15____variable
	lw $v1, 400($sp)
	addu $v0, $v0, $v1
	sw $v0, 348($sp)
	lw $v0, 348($sp)
	lw $v1, 0($v0)
	sw $v1, 328($sp)
	lw $v0, ____global_5____variable
	li $v1, 4
	mul $v0, $v0, $v1
	sw $v0, 344($sp)
	lw $v0, 328($sp)
	lw $v1, 344($sp)
	addu $v0, $v0, $v1
	sw $v0, 252($sp)
	lw $v0, 252($sp)
	lw $v1, 0($v0)
	sw $v1, 188($sp)
	lw $a0, 188($sp)
	jal ____builtin____to_string
	sw $v0, 300($sp)
	lw $a0, 300($sp)
	jal ____builtin____println
	j ____main_9____if_merge

____main_11____if_false:
	la $a0, ____global_153____string
	jal ____builtin____print
	j ____main_9____if_merge

____main_7____for_body:
	lw $v0, ____global_17____variable
	li $v1, 4
	mul $v0, $v0, $v1
	sw $v0, 460($sp)
	lw $v0, ____global_13____variable
	lw $v1, 460($sp)
	addu $v0, $v0, $v1
	sw $v0, 312($sp)
	lw $v0, 312($sp)
	lw $v1, 0($v0)
	sw $v1, 176($sp)
	lw $v0, ____global_6____variable
	lw $v1, 176($sp)
	addu $v0, $v0, $v1
	sw $v0, 288($sp)
	lw $v0, ____global_17____variable
	li $v1, 4
	mul $v0, $v0, $v1
	sw $v0, 444($sp)
	lw $v0, ____global_14____variable
	lw $v1, 444($sp)
	addu $v0, $v0, $v1
	sw $v0, 216($sp)
	lw $v0, 216($sp)
	lw $v1, 0($v0)
	sw $v1, 236($sp)
	lw $v0, ____global_7____variable
	lw $v1, 236($sp)
	addu $v0, $v0, $v1
	sw $v0, 232($sp)
	lw $v0, 288($sp)
	sw $v0, -8($sp)
	lw $v0, 232($sp)
	sw $v0, -4($sp)
	jal ____addList____function
	j ____main_6____for_loop

____main_16____for_merge:
	lw $v0, ____global_11____variable
	li $v1, 1
	seq $v0, $v0, $v1
	sw $v0, 324($sp)
	lw $v0, 324($sp)
	beqz $v0, ____main_15____if_false
	j ____main_13____if_true

____main_9____if_merge:
	li $v0, 0
	j ____main_8____exit

____main_6____for_loop:
	lw $v0, ____global_17____variable
	sw $v0, 156($sp)
	lw $v0, ____global_17____variable
	li $v1, 1
	addu $v0, $v0, $v1
	sw $v0, ____global_17____variable
	j ____main_17____for_condition

____main_13____if_true:
	j ____main_12____while_merge

____main_15____if_false:
	j ____main_14____if_merge

____main_14____if_merge:
	lw $v0, ____global_1____variable
	sw $v0, 244($sp)
	lw $v0, ____global_1____variable
	li $v1, 1
	addu $v0, $v0, $v1
	sw $v0, ____global_1____variable
	j ____main_19____while_loop

____main_8____exit:
	move $a0, $v0
	li $v0, 17
	syscall
	lw $ra, 124($sp)
	addu $sp, $sp, 464
	jr $ra

	.data
____string_buffer:
	.space 1024
	.align 2
____string_newline:
	.asciiz "\n"
	.align 2
____global_0____variable:
	.space 4
	.align 2
____global_17____variable:
	.space 4
	.align 2
____global_5____variable:
	.space 4
	.align 2
____global_2____variable:
	.space 4
	.align 2
	.word 14
____global_153____string:
	.asciiz "no solution!\n"
	.align 2
____global_7____variable:
	.space 4
	.align 2
____global_1____variable:
	.space 4
	.align 2
____global_16____variable:
	.space 4
	.align 2
____global_14____variable:
	.space 4
	.align 2
____global_8____variable:
	.space 4
	.align 2
____global_15____variable:
	.space 4
	.align 2
____global_6____variable:
	.space 4
	.align 2
____global_9____variable:
	.space 4
	.align 2
____global_4____variable:
	.space 4
	.align 2
____global_10____variable:
	.space 4
	.align 2
____global_12____variable:
	.space 4
	.align 2
____global_3____variable:
	.space 4
	.align 2
____global_11____variable:
	.space 4
	.align 2
____global_13____variable:
	.space 4
	.align 2
