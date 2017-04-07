.data
r9:	.space	4
r10:	.space	4
_buffer:	.word 0
NEWLINE:  .asciiz	 "\n" 
s0:	.asciiz	""
s0ln:	.asciiz	"\n"
.text  
main: 
li $s6, 16 
li $t9, 1 
li $t8, 4 
li $t6, 2 
li $v1, 8 
li $v0, 9 
move $t7, $a0 
li $a0, 20 
syscall  
move $a0, $t7 
sw $t8, 0($v0) 
sw $v0, r10 
lw $t0, r9 
lw $t1, r10 
sw $t1, r9 
move $fp, $sp 
lw $t1, r9 
lw $t0, ($t1) 
sw $t0, -4($fp) 
lw $t1, -4($fp) 
sw $t1, -8($fp) 
lw $t0, -8($fp) 
mul $t0, $t0, $t8 
add $t0, $t0, $t8 
sw $t0, -8($fp) 
li $v0, 9 
move $t7, $a0 
lw $t1, -8($fp) 
move $a0, $t1 
sw $t1, -8($fp) 
syscall  
move $a0, $t7 
lw $t0, -8($fp) 
sub $t0, $t0, $t8 
div $t0, $t0, $t8 
sw $t0, -8($fp) 
sw $t0, 0($v0) 
sw $v0, -8($fp) 
lw $t1, -8($fp) 
sw $t1, 0($fp) 
sw $0, -12($fp) 
lw $t1, r9 
lw $t0, ($t1) 
sw $t0, -16($fp) 
lw $t1, -12($fp) 
lw $t2, -16($fp) 
bge $t1, $t2, if_false3 
if_true2: 
lw $t1, r9 
sw $t1, -24($fp) 
lw $t1, -12($fp) 
mul $t0, $t1, $t8 
sw $t0, -28($fp) 
lw $t0, -24($fp) 
lw $t2, -28($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -24($fp) 
sw $0, ($t0) 
lw $t1, 0($fp) 
sw $t1, -36($fp) 
lw $t1, -12($fp) 
mul $t0, $t1, $t8 
sw $t0, -40($fp) 
lw $t0, -36($fp) 
lw $t2, -40($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -36($fp) 
li $v0, 5 
syscall  
sw $v0, -44($fp) 
lw $t0, -36($fp) 
lw $t1, -44($fp) 
sw $t1, ($t0) 
jump4: 
lw $t1, -12($fp) 
sw $t1, -52($fp) 
lw $t0, -12($fp) 
add $t0, $t0, $t9 
sw $t0, -12($fp) 
lw $t1, r9 
lw $t0, ($t1) 
sw $t0, -56($fp) 
lw $t1, -12($fp) 
lw $t2, -56($fp) 
slt $t0, $t1, $t2 
sw $t0, -60($fp) 
bne $t0, $zero, if_true2 
if_false3: 
sw $0, -12($fp) 
lw $t1, r9 
lw $t0, ($t1) 
sw $t0, -64($fp) 
lw $t1, -12($fp) 
lw $t2, -64($fp) 
bge $t1, $t2, if_false6 
if_true5: 
lw $t1, r9 
sw $t1, -72($fp) 
lw $t1, -12($fp) 
mul $t0, $t1, $t8 
sw $t0, -76($fp) 
lw $t0, -72($fp) 
lw $t2, -76($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -72($fp) 
lw $t3, ($t0) 
move $t7, $a0 
move $a0, $t3 
li $v0, 1 
syscall  
move $a0, $t7 
jump7: 
lw $t1, -12($fp) 
sw $t1, -84($fp) 
lw $t0, -12($fp) 
add $t0, $t0, $t9 
sw $t0, -12($fp) 
lw $t1, r9 
lw $t0, ($t1) 
sw $t0, -88($fp) 
lw $t1, -12($fp) 
lw $t2, -88($fp) 
slt $t0, $t1, $t2 
sw $t0, -92($fp) 
bne $t0, $zero, if_true5 
if_false6: 
li $v0, 4 
move $t7, $a0 
la $a0, s0ln 
syscall  
move $a0, $t7 
lw $t0, r9 
lw $t1, 0($fp) 
sw $t1, r9 
sw $0, -12($fp) 
lw $t1, r9 
lw $t0, ($t1) 
sw $t0, -100($fp) 
lw $t1, -12($fp) 
lw $t2, -100($fp) 
bge $t1, $t2, if_false9 
if_true8: 
lw $t1, r9 
sw $t1, -108($fp) 
lw $t1, -12($fp) 
mul $t0, $t1, $t8 
sw $t0, -112($fp) 
lw $t0, -108($fp) 
lw $t2, -112($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -108($fp) 
lw $t3, ($t0) 
move $t7, $a0 
move $a0, $t3 
li $v0, 1 
syscall  
move $a0, $t7 
jump10: 
lw $t1, -12($fp) 
sw $t1, -120($fp) 
lw $t0, -12($fp) 
add $t0, $t0, $t9 
sw $t0, -12($fp) 
lw $t1, r9 
lw $t0, ($t1) 
sw $t0, -124($fp) 
lw $t1, -12($fp) 
lw $t2, -124($fp) 
slt $t0, $t1, $t2 
sw $t0, -128($fp) 
bne $t0, $zero, if_true8 
if_false9: 
jr $ra 
