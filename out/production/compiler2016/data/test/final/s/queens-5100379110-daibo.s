.data
r9:	.space	4
r10:	.space	4
r11:	.space	4
r12:	.space	4
r13:	.space	4
r14:	.space	4
r15:	.space	4
_buffer:	.word 0
NEWLINE:  .asciiz	 "\n" 
s0:	.asciiz	" O"
s0ln:	.asciiz	" O\n"
s1:	.asciiz	" ."
s1ln:	.asciiz	" .\n"
s2:	.asciiz	""
s2ln:	.asciiz	"\n"
.text  
printBoard1: 
sw $0, -8($fp) 
lw $t1, -8($fp) 
lw $t2, r9 
bge $t1, $t2, if_false3 
if_true2: 
sw $0, -12($fp) 
lw $t1, -12($fp) 
lw $t2, r9 
bge $t1, $t2, if_false6 
if_true5: 
lw $t1, r12 
sw $t1, -28($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t8 
sw $t0, -32($fp) 
lw $t0, -28($fp) 
lw $t2, -32($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -28($fp) 
lw $t1, -28($fp) 
lw $t4, ($t1) 
lw $t2, -12($fp) 
seq $t0, $t4, $t2 
sw $t0, -40($fp) 
beq $t0, $zero, if_false9 
if_true8: 
li $v0, 4 
move $t7, $a0 
la $a0, s0 
syscall  
move $a0, $t7 
b jump7 
if_false9: 
li $v0, 4 
move $t7, $a0 
la $a0, s1 
syscall  
move $a0, $t7 
jump7: 
lw $t1, -12($fp) 
sw $t1, -44($fp) 
lw $t0, -12($fp) 
add $t0, $t0, $t9 
sw $t0, -12($fp) 
lw $t1, -12($fp) 
lw $t2, r9 
slt $t0, $t1, $t2 
sw $t0, -48($fp) 
bne $t0, $zero, if_true5 
if_false6: 
li $v0, 4 
move $t7, $a0 
la $a0, s2ln 
syscall  
move $a0, $t7 
jump4: 
lw $t1, -8($fp) 
sw $t1, -52($fp) 
lw $t0, -8($fp) 
add $t0, $t0, $t9 
sw $t0, -8($fp) 
lw $t1, -8($fp) 
lw $t2, r9 
slt $t0, $t1, $t2 
sw $t0, -56($fp) 
bne $t0, $zero, if_true2 
if_false3: 
li $v0, 4 
move $t7, $a0 
la $a0, s2ln 
syscall  
move $a0, $t7 
jr $ra 
search11: 
lw $t2, r9 
seq $t0, $a0, $t2 
sw $t0, -12($fp) 
beq $t0, $zero, if_false13 
if_true12: 
add $sp, $sp, -300 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal printBoard1 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -16($fp) 
b go_on14 
if_false13: 
sw $0, -20($fp) 
lw $t1, -20($fp) 
lw $t2, r9 
bge $t1, $t2, go_on14 
if_true15: 
lw $t1, r10 
sw $t1, -28($fp) 
lw $t1, -20($fp) 
mul $t0, $t1, $t8 
sw $t0, -32($fp) 
lw $t0, -28($fp) 
lw $t2, -32($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -28($fp) 
lw $t1, -28($fp) 
lw $t4, ($t1) 
seq $t0, $t4, $0 
sw $t0, -40($fp) 
beq $t0, $zero, if_false20 
if_true18: 
lw $t1, -20($fp) 
add $t0, $t1, $a0 
sw $t0, -48($fp) 
lw $t1, r14 
sw $t1, -52($fp) 
lw $t0, -52($fp) 
add $t0, $t0, $t8 
sw $t0, -52($fp) 
lw $t1, -52($fp) 
lw $t4, ($t1) 
sw $t4, -52($fp) 
lw $t1, -48($fp) 
mul $t0, $t1, $t8 
sw $t0, -56($fp) 
lw $t0, -52($fp) 
lw $t2, -56($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -52($fp) 
lw $t1, -52($fp) 
lw $t4, ($t1) 
seq $t0, $t4, $0 
sw $t0, -64($fp) 
beq $t0, $zero, if_false20 
if_true21: 
lw $t1, -20($fp) 
lw $t2, r9 
add $t0, $t1, $t2 
sw $t0, -72($fp) 
lw $t1, -72($fp) 
sub $t0, $t1, $t9 
sw $t0, -76($fp) 
lw $t1, -76($fp) 
sub $t0, $t1, $a0 
sw $t0, -80($fp) 
lw $t1, r14 
sw $t1, -84($fp) 
lw $t0, -84($fp) 
add $t0, $t0, $v1 
sw $t0, -84($fp) 
lw $t1, -84($fp) 
lw $t4, ($t1) 
sw $t4, -84($fp) 
lw $t1, -80($fp) 
mul $t0, $t1, $t8 
sw $t0, -88($fp) 
lw $t0, -84($fp) 
lw $t2, -88($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -84($fp) 
lw $t1, -84($fp) 
lw $t4, ($t1) 
seq $t0, $t4, $0 
sw $t0, -96($fp) 
lw $t1, -96($fp) 
sw $t1, -68($fp) 
go22: 
lw $t1, -68($fp) 
sw $t1, -44($fp) 
b go19 
if_false20: 
sw $0, -44($fp) 
go19: 
lw $t0, -44($fp) 
beq $t0, $zero, jump17 
if_true23: 
lw $t1, r10 
sw $t1, -100($fp) 
lw $t1, -20($fp) 
mul $t0, $t1, $t8 
sw $t0, -104($fp) 
lw $t0, -100($fp) 
lw $t2, -104($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -100($fp) 
lw $t1, -20($fp) 
add $t0, $t1, $a0 
sw $t0, -108($fp) 
lw $t1, r14 
sw $t1, -112($fp) 
lw $t0, -112($fp) 
add $t0, $t0, $t8 
sw $t0, -112($fp) 
lw $t1, -112($fp) 
lw $t4, ($t1) 
sw $t4, -112($fp) 
lw $t1, -108($fp) 
mul $t0, $t1, $t8 
sw $t0, -116($fp) 
lw $t0, -112($fp) 
lw $t2, -116($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -112($fp) 
lw $t1, -20($fp) 
lw $t2, r9 
add $t0, $t1, $t2 
sw $t0, -120($fp) 
lw $t1, -120($fp) 
sub $t0, $t1, $t9 
sw $t0, -124($fp) 
lw $t1, -124($fp) 
sub $t0, $t1, $a0 
sw $t0, -128($fp) 
lw $t1, r14 
sw $t1, -132($fp) 
lw $t0, -132($fp) 
add $t0, $t0, $v1 
sw $t0, -132($fp) 
lw $t1, -132($fp) 
lw $t4, ($t1) 
sw $t4, -132($fp) 
lw $t1, -128($fp) 
mul $t0, $t1, $t8 
sw $t0, -136($fp) 
lw $t0, -132($fp) 
lw $t2, -136($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -132($fp) 
sw $t9, ($t0) 
lw $t0, -112($fp) 
lw $t1, -132($fp) 
lw $t4, ($t1) 
sw $t4, ($t0) 
lw $t0, -100($fp) 
lw $t1, -112($fp) 
lw $t4, ($t1) 
sw $t4, ($t0) 
lw $t1, r12 
sw $t1, -152($fp) 
mul $t0, $a0, $t8 
sw $t0, -156($fp) 
lw $t0, -152($fp) 
lw $t2, -156($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -152($fp) 
lw $t1, -20($fp) 
sw $t1, ($t0) 
add $sp, $sp, -300 
sw $a0, 0($sp) 
add $t0, $a0, $t9 
sw $t0, -164($fp) 
lw $t1, -164($fp) 
move $a0, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal search11 
lw $a0, 16($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -172($fp) 
lw $t1, r10 
sw $t1, -176($fp) 
lw $t1, -20($fp) 
mul $t0, $t1, $t8 
sw $t0, -180($fp) 
lw $t0, -176($fp) 
lw $t2, -180($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -176($fp) 
lw $t1, -20($fp) 
add $t0, $t1, $a0 
sw $t0, -184($fp) 
lw $t1, r14 
sw $t1, -188($fp) 
lw $t0, -188($fp) 
add $t0, $t0, $t8 
sw $t0, -188($fp) 
lw $t1, -188($fp) 
lw $t4, ($t1) 
sw $t4, -188($fp) 
lw $t1, -184($fp) 
mul $t0, $t1, $t8 
sw $t0, -192($fp) 
lw $t0, -188($fp) 
lw $t2, -192($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -188($fp) 
lw $t1, -20($fp) 
lw $t2, r9 
add $t0, $t1, $t2 
sw $t0, -196($fp) 
lw $t1, -196($fp) 
sub $t0, $t1, $t9 
sw $t0, -200($fp) 
lw $t1, -200($fp) 
sub $t0, $t1, $a0 
sw $t0, -204($fp) 
lw $t1, r14 
sw $t1, -208($fp) 
lw $t0, -208($fp) 
add $t0, $t0, $v1 
sw $t0, -208($fp) 
lw $t1, -208($fp) 
lw $t4, ($t1) 
sw $t4, -208($fp) 
lw $t1, -204($fp) 
mul $t0, $t1, $t8 
sw $t0, -212($fp) 
lw $t0, -208($fp) 
lw $t2, -212($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -208($fp) 
sw $0, ($t0) 
lw $t0, -188($fp) 
lw $t1, -208($fp) 
lw $t4, ($t1) 
sw $t4, ($t0) 
lw $t0, -176($fp) 
lw $t1, -188($fp) 
lw $t4, ($t1) 
sw $t4, ($t0) 
jump17: 
lw $t1, -20($fp) 
sw $t1, -228($fp) 
lw $t0, -20($fp) 
add $t0, $t0, $t9 
sw $t0, -20($fp) 
lw $t1, -20($fp) 
lw $t2, r9 
slt $t0, $t1, $t2 
sw $t0, -232($fp) 
bne $t0, $zero, if_true15 
beq $t0, $zero, go_on14 
go_on14: 
jr $ra 
main: 
li $s6, 16 
li $t9, 1 
li $t8, 4 
li $t6, 2 
li $v1, 8 
sw $v1, r9 
li $v0, 9 
move $t7, $a0 
li $a0, 36 
syscall  
move $a0, $t7 
sw $v1, 0($v0) 
sw $v0, r11 
lw $t0, r10 
lw $t1, r11 
sw $t1, r10 
li $v0, 9 
move $t7, $a0 
li $a0, 36 
syscall  
move $a0, $t7 
sw $v1, 0($v0) 
sw $v0, r13 
lw $t0, r12 
lw $t1, r13 
sw $t1, r12 
li $v0, 9 
move $t7, $a0 
li $a0, 12 
syscall  
move $a0, $t7 
sw $t6, 0($v0) 
sw $v0, r15 
lw $t0, r14 
lw $t1, r15 
sw $t1, r14 
move $fp, $sp 
sw $0, 0($fp) 
lw $t1, 0($fp) 
bge $t1, $t6, if_false28 
if_true27: 
lw $t1, r14 
sw $t1, -8($fp) 
lw $t1, 0($fp) 
mul $t0, $t1, $t8 
sw $t0, -12($fp) 
lw $t0, -8($fp) 
lw $t2, -12($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -8($fp) 
li $v0, 9 
move $t7, $a0 
li $a0, 64 
syscall  
move $a0, $t7 
li $t1, 15 
sw $t1, 0($v0) 
sw $v0, -16($fp) 
lw $t0, -8($fp) 
lw $t1, -16($fp) 
sw $t1, ($t0) 
jump29: 
lw $t1, 0($fp) 
sw $t1, -24($fp) 
lw $t0, 0($fp) 
add $t0, $t0, $t9 
sw $t0, 0($fp) 
lw $t1, 0($fp) 
slt $t0, $t1, $t6 
sw $t0, -28($fp) 
bne $t0, $zero, if_true27 
if_false28: 
add $sp, $sp, -300 
sw $a0, 0($sp) 
li $a0, 0 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal search11 
lw $a0, 16($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -32($fp) 
li $v0, 0 
jr $ra 
