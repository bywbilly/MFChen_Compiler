.data
r9:	.space	4
r10:	.space	4
r11:	.space	4
_buffer:	.word 0
NEWLINE:  .asciiz	 "\n" 
s0:	.asciiz	" "
s0ln:	.asciiz	" \n"
s1:	.asciiz	"\n"
s1ln:	.asciiz	"\n\n"
.text  
qsrt1: 
sw $a0, -8($fp) 
sw $a1, -16($fp) 
add $t0, $a0, $a1 
sw $t0, -28($fp) 
lw $t1, -28($fp) 
div $t0, $t1, $t6 
sw $t0, -32($fp) 
lw $t1, r9 
sw $t1, -36($fp) 
lw $t1, -32($fp) 
mul $t0, $t1, $t8 
sw $t0, -40($fp) 
lw $t0, -36($fp) 
lw $t2, -40($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -36($fp) 
lw $t1, -36($fp) 
lw $t4, ($t1) 
sw $t4, -24($fp) 
lw $t1, -8($fp) 
lw $t2, -16($fp) 
bgt $t1, $t2, if_false3 
if_true2: 
lw $t1, r9 
sw $t1, -52($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t8 
sw $t0, -56($fp) 
lw $t0, -52($fp) 
lw $t2, -56($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -52($fp) 
lw $t1, -52($fp) 
lw $t4, ($t1) 
lw $t2, -24($fp) 
bge $t4, $t2, if_false6 
if_true5: 
lw $t1, -8($fp) 
sw $t1, -68($fp) 
lw $t0, -8($fp) 
add $t0, $t0, $t9 
sw $t0, -8($fp) 
jump7: 
lw $t1, r9 
sw $t1, -72($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t8 
sw $t0, -76($fp) 
lw $t0, -72($fp) 
lw $t2, -76($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -72($fp) 
lw $t1, -72($fp) 
lw $t4, ($t1) 
lw $t2, -24($fp) 
slt $t0, $t4, $t2 
sw $t0, -84($fp) 
bne $t0, $zero, if_true5 
if_false6: 
lw $t1, r9 
sw $t1, -88($fp) 
lw $t1, -16($fp) 
mul $t0, $t1, $t8 
sw $t0, -92($fp) 
lw $t0, -88($fp) 
lw $t2, -92($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -88($fp) 
lw $t1, -88($fp) 
lw $t4, ($t1) 
lw $t2, -24($fp) 
ble $t4, $t2, if_false9 
if_true8: 
lw $t1, -16($fp) 
sw $t1, -104($fp) 
lw $t0, -16($fp) 
sub $t0, $t0, $t9 
sw $t0, -16($fp) 
jump10: 
lw $t1, r9 
sw $t1, -108($fp) 
lw $t1, -16($fp) 
mul $t0, $t1, $t8 
sw $t0, -112($fp) 
lw $t0, -108($fp) 
lw $t2, -112($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -108($fp) 
lw $t1, -108($fp) 
lw $t4, ($t1) 
lw $t2, -24($fp) 
sgt $t0, $t4, $t2 
sw $t0, -120($fp) 
bne $t0, $zero, if_true8 
if_false9: 
lw $t1, -8($fp) 
lw $t2, -16($fp) 
sle $t0, $t1, $t2 
sw $t0, -124($fp) 
beq $t0, $zero, jump4 
if_true11: 
lw $t1, r9 
sw $t1, -132($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t8 
sw $t0, -136($fp) 
lw $t0, -132($fp) 
lw $t2, -136($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -132($fp) 
lw $t1, -132($fp) 
lw $t4, ($t1) 
sw $t4, -128($fp) 
lw $t1, r9 
sw $t1, -144($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t8 
sw $t0, -148($fp) 
lw $t0, -144($fp) 
lw $t2, -148($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -144($fp) 
lw $t1, r9 
sw $t1, -152($fp) 
lw $t1, -16($fp) 
mul $t0, $t1, $t8 
sw $t0, -156($fp) 
lw $t0, -152($fp) 
lw $t2, -156($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -152($fp) 
lw $t0, -144($fp) 
lw $t1, -152($fp) 
lw $t4, ($t1) 
sw $t4, ($t0) 
lw $t1, r9 
sw $t1, -168($fp) 
lw $t1, -16($fp) 
mul $t0, $t1, $t8 
sw $t0, -172($fp) 
lw $t0, -168($fp) 
lw $t2, -172($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -168($fp) 
lw $t1, -128($fp) 
sw $t1, ($t0) 
lw $t1, -8($fp) 
sw $t1, -180($fp) 
lw $t0, -8($fp) 
add $t0, $t0, $t9 
sw $t0, -8($fp) 
lw $t1, -16($fp) 
sw $t1, -184($fp) 
lw $t0, -16($fp) 
sub $t0, $t0, $t9 
sw $t0, -16($fp) 
jump4: 
lw $t1, -8($fp) 
lw $t2, -16($fp) 
sle $t0, $t1, $t2 
sw $t0, -188($fp) 
bne $t0, $zero, if_true2 
if_false3: 
lw $t2, -16($fp) 
slt $t0, $a0, $t2 
sw $t0, -192($fp) 
beq $t0, $zero, if_false15 
if_true14: 
add $sp, $sp, -464 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
lw $t0, 0($sp) 
sw $t0, -196($fp) 
lw $t1, -196($fp) 
move $a0, $t1 
lw $t1, -16($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal qsrt1 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -204($fp) 
if_false15: 
lw $t1, -8($fp) 
slt $t0, $t1, $a1 
sw $t0, -208($fp) 
beq $t0, $zero, if_false18 
if_true17: 
add $sp, $sp, -464 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
lw $t1, -8($fp) 
move $a0, $t1 
lw $t0, -4($sp) 
sw $t0, -216($fp) 
lw $t1, -216($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal qsrt1 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -220($fp) 
if_false18: 
li $v0, 0 
jr $ra 
main: 
li $s6, 16 
li $t9, 1 
li $t8, 4 
li $t6, 2 
li $v1, 8 
li $v0, 9 
move $t7, $a0 
li $a0, 40404 
syscall  
move $a0, $t7 
li $t1, 10100 
sw $t1, 0($v0) 
sw $v0, r10 
lw $t0, r9 
lw $t1, r10 
sw $t1, r9 
lw $t0, r11 
li $t0, 10000 
sw $t0, r11 
move $fp, $sp 
sw $t9, 0($fp) 
lw $t1, 0($fp) 
lw $t2, r11 
bgt $t1, $t2, if_false22 
if_true21: 
lw $t1, r9 
sw $t1, -12($fp) 
lw $t1, 0($fp) 
mul $t0, $t1, $t8 
sw $t0, -16($fp) 
lw $t0, -12($fp) 
lw $t2, -16($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -12($fp) 
lw $t1, r11 
add $t0, $t1, $t9 
sw $t0, -20($fp) 
lw $t1, -20($fp) 
lw $t2, 0($fp) 
sub $t0, $t1, $t2 
sw $t0, -24($fp) 
lw $t0, -12($fp) 
lw $t1, -24($fp) 
sw $t1, ($t0) 
jump23: 
lw $t1, 0($fp) 
sw $t1, -32($fp) 
lw $t0, 0($fp) 
add $t0, $t0, $t9 
sw $t0, 0($fp) 
lw $t1, 0($fp) 
lw $t2, r11 
sle $t0, $t1, $t2 
sw $t0, -36($fp) 
bne $t0, $zero, if_true21 
if_false22: 
add $sp, $sp, -464 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
li $a0, 1 
lw $t1, r11 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal qsrt1 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -44($fp) 
sw $t9, 0($fp) 
lw $t1, 0($fp) 
lw $t2, r11 
bgt $t1, $t2, if_false25 
if_true24: 
lw $t1, r9 
sw $t1, -52($fp) 
lw $t1, 0($fp) 
mul $t0, $t1, $t8 
sw $t0, -56($fp) 
lw $t0, -52($fp) 
lw $t2, -56($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -52($fp) 
lw $t3, ($t0) 
move $t7, $a0 
move $a0, $t3 
li $v0, 1 
syscall  
move $a0, $t7 
li $v0, 4 
move $t7, $a0 
la $a0, s0 
syscall  
move $a0, $t7 
jump26: 
lw $t1, 0($fp) 
sw $t1, -64($fp) 
lw $t0, 0($fp) 
add $t0, $t0, $t9 
sw $t0, 0($fp) 
lw $t1, 0($fp) 
lw $t2, r11 
sle $t0, $t1, $t2 
sw $t0, -68($fp) 
bne $t0, $zero, if_true24 
if_false25: 
li $v0, 4 
move $t7, $a0 
la $a0, s1 
syscall  
move $a0, $t7 
li $v0, 0 
jr $ra 
