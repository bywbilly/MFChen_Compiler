.data
r9:	.space	4
r10:	.space	4
_buffer:	.word 0
NEWLINE:  .asciiz	 "\n" 
s0:	.asciiz	" "
s0ln:	.asciiz	" \n"
.text  
getHash1: 
mul $t0, $a0, 237 
sw $t0, -12($fp) 
lw $t1, -12($fp) 
lw $t2, r9 
rem $t0, $t1, $t2 
sw $t0, -20($fp) 
lw $t1, -20($fp) 
move $v0, $t1 
jr $ra 
put2: 
sw $0, -12($fp) 
add $sp, $sp, -264 
sw $a0, 0($sp) 
lw $t0, 0($sp) 
sw $t0, -16($fp) 
lw $t1, -16($fp) 
move $a0, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal getHash1 
lw $a0, 16($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -20($fp) 
lw $t1, -20($fp) 
sw $t1, -8($fp) 
lw $t1, r10 
sw $t1, -24($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t8 
sw $t0, -28($fp) 
lw $t0, -24($fp) 
lw $t2, -28($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -24($fp) 
lw $t1, -24($fp) 
lw $t4, ($t1) 
seq $t0, $t4, $0 
sw $t0, -36($fp) 
beq $t0, $zero, if_false4 
if_true3: 
lw $t1, r10 
sw $t1, -40($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t8 
sw $t0, -44($fp) 
lw $t0, -40($fp) 
lw $t2, -44($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -40($fp) 
li $v0, 9 
move $t7, $a0 
li $a0, 12 
syscall  
move $a0, $t7 
sw $v0, -48($fp) 
lw $t0, -40($fp) 
lw $t1, -48($fp) 
sw $t1, ($t0) 
lw $t1, r10 
sw $t1, -56($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t8 
sw $t0, -60($fp) 
lw $t0, -56($fp) 
lw $t2, -60($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -56($fp) 
lw $t1, -56($fp) 
lw $t4, ($t1) 
add $t0, $t4, $v1 
sw $t0, -64($fp) 
sw $a0, ($t0) 
lw $t1, r10 
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
add $t0, $t4, $t8 
sw $t0, -80($fp) 
sw $a1, ($t0) 
lw $t1, r10 
sw $t1, -92($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t8 
sw $t0, -96($fp) 
lw $t0, -92($fp) 
lw $t2, -96($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -92($fp) 
lw $t1, -92($fp) 
lw $t4, ($t1) 
add $t0, $t4, $0 
sw $t0, -100($fp) 
sw $0, ($t0) 
jr $ra 
if_false4: 
lw $t1, r10 
sw $t1, -108($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t8 
sw $t0, -112($fp) 
lw $t0, -108($fp) 
lw $t2, -112($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -108($fp) 
lw $t1, -108($fp) 
lw $t4, ($t1) 
sw $t4, -12($fp) 
lw $t1, -12($fp) 
add $t0, $t1, $v1 
sw $t0, -120($fp) 
lw $t1, -120($fp) 
lw $t4, ($t1) 
beq $t4, $a0, if_false7 
if_true6: 
lw $t1, -12($fp) 
add $t0, $t1, $0 
sw $t0, -132($fp) 
lw $t1, -132($fp) 
lw $t4, ($t1) 
seq $t0, $t4, $0 
sw $t0, -140($fp) 
beq $t0, $zero, if_false10 
if_true9: 
lw $t1, -12($fp) 
add $t0, $t1, $0 
sw $t0, -144($fp) 
li $v0, 9 
move $t7, $a0 
li $a0, 12 
syscall  
move $a0, $t7 
sw $v0, -148($fp) 
lw $t0, -144($fp) 
lw $t1, -148($fp) 
sw $t1, ($t0) 
lw $t1, -12($fp) 
add $t0, $t1, $0 
sw $t0, -156($fp) 
lw $t1, -156($fp) 
lw $t4, ($t1) 
add $t0, $t4, $v1 
sw $t0, -160($fp) 
sw $a0, ($t0) 
lw $t1, -12($fp) 
add $t0, $t1, $0 
sw $t0, -168($fp) 
lw $t1, -168($fp) 
lw $t4, ($t1) 
add $t0, $t4, $0 
sw $t0, -172($fp) 
sw $0, ($t0) 
if_false10: 
lw $t1, -12($fp) 
add $t0, $t1, $0 
sw $t0, -180($fp) 
lw $t1, -180($fp) 
lw $t4, ($t1) 
sw $t4, -12($fp) 
jump8: 
lw $t1, -12($fp) 
add $t0, $t1, $v1 
sw $t0, -188($fp) 
lw $t1, -188($fp) 
lw $t4, ($t1) 
sne $t0, $t4, $a0 
sw $t0, -196($fp) 
bne $t0, $zero, if_true6 
if_false7: 
lw $t1, -12($fp) 
add $t0, $t1, $t8 
sw $t0, -200($fp) 
sw $a1, ($t0) 
jr $ra 
get12: 
sw $0, -8($fp) 
add $sp, $sp, -264 
sw $a0, 0($sp) 
lw $t0, 0($sp) 
sw $t0, -12($fp) 
lw $t1, -12($fp) 
move $a0, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal getHash1 
lw $a0, 16($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -16($fp) 
lw $t1, r10 
sw $t1, -20($fp) 
lw $t1, -16($fp) 
mul $t0, $t1, $t8 
sw $t0, -24($fp) 
lw $t0, -20($fp) 
lw $t2, -24($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -20($fp) 
lw $t1, -20($fp) 
lw $t4, ($t1) 
sw $t4, -8($fp) 
lw $t1, -8($fp) 
add $t0, $t1, $v1 
sw $t0, -32($fp) 
lw $t1, -32($fp) 
lw $t4, ($t1) 
beq $t4, $a0, if_false14 
if_true13: 
lw $t1, -8($fp) 
add $t0, $t1, $0 
sw $t0, -44($fp) 
lw $t1, -44($fp) 
lw $t4, ($t1) 
sw $t4, -8($fp) 
jump15: 
lw $t1, -8($fp) 
add $t0, $t1, $v1 
sw $t0, -52($fp) 
lw $t1, -52($fp) 
lw $t4, ($t1) 
sne $t0, $t4, $a0 
sw $t0, -60($fp) 
bne $t0, $zero, if_true13 
if_false14: 
lw $t1, -8($fp) 
add $t0, $t1, $t8 
sw $t0, -64($fp) 
lw $t1, -64($fp) 
lw $t4, ($t1) 
move $v0, $t4 
jr $ra 
main: 
li $s6, 16 
li $t9, 1 
li $t8, 4 
li $t6, 2 
li $v1, 8 
lw $t0, r9 
li $t0, 100 
sw $t0, r9 
move $fp, $sp 
li $v0, 9 
move $t7, $a0 
li $a0, 404 
syscall  
move $a0, $t7 
li $t1, 100 
sw $t1, 0($v0) 
sw $v0, -4($fp) 
lw $t0, r10 
lw $t1, -4($fp) 
sw $t1, r10 
sw $0, 0($fp) 
lw $t1, 0($fp) 
lw $t2, r9 
bge $t1, $t2, if_false18 
if_true17: 
lw $t1, r10 
sw $t1, -16($fp) 
lw $t1, 0($fp) 
mul $t0, $t1, $t8 
sw $t0, -20($fp) 
lw $t0, -16($fp) 
lw $t2, -20($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -16($fp) 
sw $0, ($t0) 
jump19: 
lw $t1, 0($fp) 
sw $t1, -28($fp) 
lw $t0, 0($fp) 
add $t0, $t0, $t9 
sw $t0, 0($fp) 
lw $t1, 0($fp) 
lw $t2, r9 
slt $t0, $t1, $t2 
sw $t0, -32($fp) 
bne $t0, $zero, if_true17 
if_false18: 
sw $0, 0($fp) 
lw $t1, 0($fp) 
bge $t1, 1000, if_false21 
if_true20: 
add $sp, $sp, -264 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
lw $t1, 0($fp) 
move $a0, $t1 
lw $t1, 0($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal put2 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -48($fp) 
jump22: 
lw $t1, 0($fp) 
sw $t1, -52($fp) 
lw $t0, 0($fp) 
add $t0, $t0, $t9 
sw $t0, 0($fp) 
lw $t1, 0($fp) 
slt $t0, $t1, 1000 
sw $t0, -56($fp) 
bne $t0, $zero, if_true20 
if_false21: 
sw $0, 0($fp) 
lw $t1, 0($fp) 
bge $t1, 1000, if_false24 
if_true23: 
add $sp, $sp, -264 
sw $a0, 0($sp) 
lw $t1, 0($fp) 
move $a0, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal get12 
lw $a0, 16($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -68($fp) 
lw $t0, 0($fp) 
move $t7, $a0 
move $a0, $t0 
li $v0, 1 
syscall  
move $a0, $t7 
li $v0, 4 
move $t7, $a0 
la $a0, s0 
syscall  
move $a0, $t7 
lw $t0, -68($fp) 
move $t7, $a0 
move $a0, $t0 
li $v0, 1 
syscall  
move $a0, $t7 
li $v0, 4 
move $t7, $a0 
la $a0, snullln 
syscall  
move $a0, $t7 
jump25: 
lw $t1, 0($fp) 
sw $t1, -72($fp) 
lw $t0, 0($fp) 
add $t0, $t0, $t9 
sw $t0, 0($fp) 
lw $t1, 0($fp) 
slt $t0, $t1, 1000 
sw $t0, -76($fp) 
bne $t0, $zero, if_true23 
if_false24: 
li $v0, 0 
jr $ra 
