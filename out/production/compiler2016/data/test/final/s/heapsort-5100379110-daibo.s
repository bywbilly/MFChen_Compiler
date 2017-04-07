.data
r9:	.space	4
r10:	.space	4
_buffer:	.word 0
NEWLINE:  .asciiz	 "\n" 
s0:	.asciiz	" "
s0ln:	.asciiz	" \n"
s1:	.asciiz	"\n"
s1ln:	.asciiz	"\n\n"
.text  
exchange1: 
lw $t1, r10 
sw $t1, -16($fp) 
mul $t0, $a0, $t8 
sw $t0, -20($fp) 
lw $t0, -16($fp) 
lw $t2, -20($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -16($fp) 
lw $t1, -16($fp) 
lw $t4, ($t1) 
sw $t4, -8($fp) 
lw $t1, r10 
sw $t1, -28($fp) 
mul $t0, $a0, $t8 
sw $t0, -32($fp) 
lw $t0, -28($fp) 
lw $t2, -32($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -28($fp) 
lw $t1, r10 
sw $t1, -40($fp) 
mul $t0, $a1, $t8 
sw $t0, -44($fp) 
lw $t0, -40($fp) 
lw $t2, -44($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -40($fp) 
lw $t0, -28($fp) 
lw $t1, -40($fp) 
lw $t4, ($t1) 
sw $t4, ($t0) 
lw $t1, r10 
sw $t1, -56($fp) 
mul $t0, $a1, $t8 
sw $t0, -60($fp) 
lw $t0, -56($fp) 
lw $t2, -60($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -56($fp) 
lw $t1, -8($fp) 
sw $t1, ($t0) 
jr $ra 
makeHeap2: 
lw $t1, r9 
sub $t0, $t1, $t9 
sw $t0, -24($fp) 
lw $t1, -24($fp) 
div $t0, $t1, $t6 
sw $t0, -8($fp) 
sw $0, -16($fp) 
lw $t1, -16($fp) 
sw $t1, -12($fp) 
lw $t1, -8($fp) 
blt $t1, $0, if_false4 
if_true3: 
lw $t1, -8($fp) 
mul $t0, $t1, $t6 
sw $t0, -16($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t6 
sw $t0, -40($fp) 
lw $t1, -40($fp) 
add $t0, $t1, $t9 
sw $t0, -44($fp) 
lw $t1, -44($fp) 
lw $t2, r9 
slt $t0, $t1, $t2 
sw $t0, -48($fp) 
beq $t0, $zero, if_false8 
if_true6: 
lw $t1, -8($fp) 
mul $t0, $t1, $t6 
sw $t0, -56($fp) 
lw $t1, -56($fp) 
add $t0, $t1, $t9 
sw $t0, -60($fp) 
lw $t1, r10 
sw $t1, -64($fp) 
lw $t1, -60($fp) 
mul $t0, $t1, $t8 
sw $t0, -68($fp) 
lw $t0, -64($fp) 
lw $t2, -68($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -64($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t6 
sw $t0, -72($fp) 
lw $t1, r10 
sw $t1, -76($fp) 
lw $t1, -72($fp) 
mul $t0, $t1, $t8 
sw $t0, -80($fp) 
lw $t0, -76($fp) 
lw $t2, -80($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -76($fp) 
lw $t1, -64($fp) 
lw $t4, ($t1) 
lw $t2, -76($fp) 
lw $t5, ($t2) 
slt $t0, $t4, $t5 
sw $t0, -92($fp) 
lw $t1, -92($fp) 
sw $t1, -52($fp) 
b go7 
if_false8: 
sw $0, -52($fp) 
go7: 
lw $t0, -52($fp) 
beq $t0, $zero, if_false10 
if_true9: 
lw $t1, -8($fp) 
mul $t0, $t1, $t6 
sw $t0, -96($fp) 
lw $t1, -96($fp) 
add $t0, $t1, $t9 
sw $t0, -100($fp) 
lw $t1, -100($fp) 
sw $t1, -16($fp) 
if_false10: 
lw $t1, r10 
sw $t1, -104($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t8 
sw $t0, -108($fp) 
lw $t0, -104($fp) 
lw $t2, -108($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -104($fp) 
lw $t1, r10 
sw $t1, -112($fp) 
lw $t1, -16($fp) 
mul $t0, $t1, $t8 
sw $t0, -116($fp) 
lw $t0, -112($fp) 
lw $t2, -116($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -112($fp) 
lw $t1, -104($fp) 
lw $t4, ($t1) 
lw $t2, -112($fp) 
lw $t5, ($t2) 
sgt $t0, $t4, $t5 
sw $t0, -128($fp) 
beq $t0, $zero, if_false13 
if_true12: 
add $sp, $sp, -308 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
lw $t1, -8($fp) 
move $a0, $t1 
lw $t1, -16($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal exchange1 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -140($fp) 
if_false13: 
lw $t1, -8($fp) 
sub $t0, $t1, $t9 
sw $t0, -144($fp) 
lw $t1, -144($fp) 
sw $t1, -8($fp) 
jump5: 
lw $t1, -8($fp) 
sge $t0, $t1, $0 
sw $t0, -148($fp) 
bne $t0, $zero, if_true3 
if_false4: 
li $v0, 0 
jr $ra 
adjustHeap15: 
sw $0, -16($fp) 
lw $t1, -16($fp) 
sw $t1, -12($fp) 
sw $t1, -8($fp) 
mul $t0, $t1, $t6 
sw $t0, -20($fp) 
lw $t1, -20($fp) 
bge $t1, $a0, if_false17 
if_true16: 
lw $t1, -8($fp) 
mul $t0, $t1, $t6 
sw $t0, -12($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t6 
sw $t0, -32($fp) 
lw $t1, -32($fp) 
add $t0, $t1, $t9 
sw $t0, -36($fp) 
lw $t1, -36($fp) 
slt $t0, $t1, $a0 
sw $t0, -40($fp) 
beq $t0, $zero, if_false21 
if_true19: 
lw $t1, -8($fp) 
mul $t0, $t1, $t6 
sw $t0, -48($fp) 
lw $t1, -48($fp) 
add $t0, $t1, $t9 
sw $t0, -52($fp) 
lw $t1, r10 
sw $t1, -56($fp) 
lw $t1, -52($fp) 
mul $t0, $t1, $t8 
sw $t0, -60($fp) 
lw $t0, -56($fp) 
lw $t2, -60($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -56($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t6 
sw $t0, -64($fp) 
lw $t1, r10 
sw $t1, -68($fp) 
lw $t1, -64($fp) 
mul $t0, $t1, $t8 
sw $t0, -72($fp) 
lw $t0, -68($fp) 
lw $t2, -72($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -68($fp) 
lw $t1, -56($fp) 
lw $t4, ($t1) 
lw $t2, -68($fp) 
lw $t5, ($t2) 
slt $t0, $t4, $t5 
sw $t0, -84($fp) 
lw $t1, -84($fp) 
sw $t1, -44($fp) 
b go20 
if_false21: 
sw $0, -44($fp) 
go20: 
lw $t0, -44($fp) 
beq $t0, $zero, if_false23 
if_true22: 
lw $t1, -8($fp) 
mul $t0, $t1, $t6 
sw $t0, -88($fp) 
lw $t1, -88($fp) 
add $t0, $t1, $t9 
sw $t0, -92($fp) 
lw $t1, -92($fp) 
sw $t1, -12($fp) 
if_false23: 
lw $t1, r10 
sw $t1, -96($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t8 
sw $t0, -100($fp) 
lw $t0, -96($fp) 
lw $t2, -100($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -96($fp) 
lw $t1, r10 
sw $t1, -104($fp) 
lw $t1, -12($fp) 
mul $t0, $t1, $t8 
sw $t0, -108($fp) 
lw $t0, -104($fp) 
lw $t2, -108($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -104($fp) 
lw $t1, -96($fp) 
lw $t4, ($t1) 
lw $t2, -104($fp) 
lw $t5, ($t2) 
sgt $t0, $t4, $t5 
sw $t0, -120($fp) 
beq $t0, $zero, if_false26 
if_true25: 
lw $t1, r10 
sw $t1, -128($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t8 
sw $t0, -132($fp) 
lw $t0, -128($fp) 
lw $t2, -132($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -128($fp) 
lw $t1, -128($fp) 
lw $t4, ($t1) 
sw $t4, -124($fp) 
lw $t1, r10 
sw $t1, -140($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t8 
sw $t0, -144($fp) 
lw $t0, -140($fp) 
lw $t2, -144($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -140($fp) 
lw $t1, r10 
sw $t1, -148($fp) 
lw $t1, -12($fp) 
mul $t0, $t1, $t8 
sw $t0, -152($fp) 
lw $t0, -148($fp) 
lw $t2, -152($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -148($fp) 
lw $t0, -140($fp) 
lw $t1, -148($fp) 
lw $t4, ($t1) 
sw $t4, ($t0) 
lw $t1, r10 
sw $t1, -164($fp) 
lw $t1, -12($fp) 
mul $t0, $t1, $t8 
sw $t0, -168($fp) 
lw $t0, -164($fp) 
lw $t2, -168($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -164($fp) 
lw $t1, -124($fp) 
sw $t1, ($t0) 
lw $t1, -12($fp) 
sw $t1, -8($fp) 
b jump18 
if_false26: 
b if_false17 
jump18: 
lw $t1, -8($fp) 
mul $t0, $t1, $t6 
sw $t0, -176($fp) 
lw $t1, -176($fp) 
slt $t0, $t1, $a0 
sw $t0, -180($fp) 
bne $t0, $zero, if_true16 
if_false17: 
li $v0, 0 
jr $ra 
heapSort28: 
sw $0, -8($fp) 
sw $0, -12($fp) 
lw $t1, -12($fp) 
lw $t2, r9 
bge $t1, $t2, if_false30 
if_true29: 
lw $t1, r10 
sw $t1, -20($fp) 
lw $t0, -20($fp) 
add $t0, $t0, $t8 
sw $t0, -20($fp) 
lw $t1, -20($fp) 
lw $t4, ($t1) 
sw $t4, -8($fp) 
lw $t1, r10 
sw $t1, -32($fp) 
lw $t0, -32($fp) 
add $t0, $t0, $t8 
sw $t0, -32($fp) 
lw $t1, r9 
lw $t2, -12($fp) 
sub $t0, $t1, $t2 
sw $t0, -40($fp) 
lw $t1, -40($fp) 
sub $t0, $t1, $t9 
sw $t0, -44($fp) 
lw $t1, r10 
sw $t1, -48($fp) 
lw $t1, -44($fp) 
mul $t0, $t1, $t8 
sw $t0, -52($fp) 
lw $t0, -48($fp) 
lw $t2, -52($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -48($fp) 
lw $t0, -32($fp) 
lw $t1, -48($fp) 
lw $t4, ($t1) 
sw $t4, ($t0) 
lw $t1, r9 
lw $t2, -12($fp) 
sub $t0, $t1, $t2 
sw $t0, -64($fp) 
lw $t1, -64($fp) 
sub $t0, $t1, $t9 
sw $t0, -68($fp) 
lw $t1, r10 
sw $t1, -72($fp) 
lw $t1, -68($fp) 
mul $t0, $t1, $t8 
sw $t0, -76($fp) 
lw $t0, -72($fp) 
lw $t2, -76($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -72($fp) 
lw $t1, -8($fp) 
sw $t1, ($t0) 
add $sp, $sp, -308 
sw $a0, 0($sp) 
lw $t1, r9 
lw $t2, -12($fp) 
sub $t0, $t1, $t2 
sw $t0, -84($fp) 
lw $t1, -84($fp) 
sub $t0, $t1, $t9 
sw $t0, -88($fp) 
lw $t1, -88($fp) 
move $a0, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal adjustHeap15 
lw $a0, 16($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -96($fp) 
jump31: 
lw $t1, -12($fp) 
add $t0, $t1, $t9 
sw $t0, -100($fp) 
lw $t1, -100($fp) 
sw $t1, -12($fp) 
lw $t2, r9 
slt $t0, $t1, $t2 
sw $t0, -104($fp) 
bne $t0, $zero, if_true29 
if_false30: 
li $v0, 0 
jr $ra 
main: 
li $s6, 16 
li $t9, 1 
li $t8, 4 
li $t6, 2 
li $v1, 8 
move $fp, $sp 
move $s0, $a0 
move $s1, $a1 
li $v0, 9 
li $a0, 260 
syscall  
add $v0, $v0, $t8 
sb $0, ($v0) 
move $t0, $v0 
li $v0, 8 
move $a0, $t0 
li $a1, 255 
syscall  
move $t1, $t0 
li $t2, 0 
begin_count1: 
lb $t3, ($t1) 
beqz $t3, end_count1 
add $t1, $t1, $t9 
add $t2, $t2, $t9 
b begin_count1 
end_count1: 
sub $t0, $t0, $t8 
sw $t2, ($t0) 
sw $t0, -4($fp) 
move $a0, $s0 
move $a1, $s1 
lw $t1, -4($fp) 
sw $t1, -12($fp) 
li $s2, 1 
li $s1, 0 
add $t1, $t1, $t8 
move $t2, $t1 
_count_num1: 
lb $s0, ($t1) 
bgt $s0, 57, _begin_parseInt1 
blt $s0, 48, _begin_parseInt1 
add $t1, $t1, $t9 
b _count_num1 
_begin_parseInt1: 
sub $t1, $t1, $t9 
_parseInt1: 
blt $t1, $t2, _finish_parseInt1 
lb $s0, ($t1) 
sub $s0, $s0, 48 
mul $s0, $s0, $s2 
add $s1, $s1, $s0 
mul $s2, $s2, 10 
sub $t1, $t1, $t9 
b _parseInt1 
_finish_parseInt1: 
sw $s1, -8($fp) 
lw $t0, r9 
lw $t1, -8($fp) 
sw $t1, r9 
sw $t1, -16($fp) 
lw $t0, -16($fp) 
mul $t0, $t0, $t8 
add $t0, $t0, $t8 
sw $t0, -16($fp) 
li $v0, 9 
move $t7, $a0 
lw $t1, -16($fp) 
move $a0, $t1 
sw $t1, -16($fp) 
syscall  
move $a0, $t7 
lw $t0, -16($fp) 
sub $t0, $t0, $t8 
div $t0, $t0, $t8 
sw $t0, -16($fp) 
sw $t0, 0($v0) 
sw $v0, -16($fp) 
lw $t0, r10 
lw $t1, -16($fp) 
sw $t1, r10 
sw $0, 0($fp) 
lw $t1, r10 
lw $t0, ($t1) 
sw $t0, -24($fp) 
lw $t1, 0($fp) 
lw $t2, -24($fp) 
bge $t1, $t2, if_false34 
if_true33: 
lw $t1, r10 
sw $t1, -32($fp) 
lw $t1, 0($fp) 
mul $t0, $t1, $t8 
sw $t0, -36($fp) 
lw $t0, -32($fp) 
lw $t2, -36($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -32($fp) 
lw $t1, 0($fp) 
sw $t1, ($t0) 
jump35: 
lw $t1, 0($fp) 
add $t0, $t1, $t9 
sw $t0, -44($fp) 
lw $t1, -44($fp) 
sw $t1, 0($fp) 
lw $t1, r10 
lw $t0, ($t1) 
sw $t0, -48($fp) 
lw $t1, 0($fp) 
lw $t2, -48($fp) 
slt $t0, $t1, $t2 
sw $t0, -52($fp) 
bne $t0, $zero, if_true33 
if_false34: 
add $sp, $sp, -308 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal makeHeap2 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -56($fp) 
add $sp, $sp, -308 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal heapSort28 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -60($fp) 
sw $0, 0($fp) 
lw $t1, r10 
lw $t0, ($t1) 
sw $t0, -64($fp) 
lw $t1, 0($fp) 
lw $t2, -64($fp) 
bge $t1, $t2, if_false37 
if_true36: 
lw $t1, r10 
sw $t1, -72($fp) 
lw $t1, 0($fp) 
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
li $v0, 4 
move $t7, $a0 
la $a0, s0 
syscall  
move $a0, $t7 
jump38: 
lw $t1, 0($fp) 
add $t0, $t1, $t9 
sw $t0, -84($fp) 
lw $t1, -84($fp) 
sw $t1, 0($fp) 
lw $t1, r10 
lw $t0, ($t1) 
sw $t0, -88($fp) 
lw $t1, 0($fp) 
lw $t2, -88($fp) 
slt $t0, $t1, $t2 
sw $t0, -92($fp) 
bne $t0, $zero, if_true36 
if_false37: 
li $v0, 4 
move $t7, $a0 
la $a0, s1 
syscall  
move $a0, $t7 
li $v0, 0 
jr $ra 
