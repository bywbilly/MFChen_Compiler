.data
_buffer:	.word 0
NEWLINE:  .asciiz	 "\n" 
.text  
f1: 
add $t0, $a0, $a1 
sw $t0, -20($fp) 
lw $t1, -20($fp) 
add $t0, $t1, $t9 
sw $t0, -24($fp) 
lw $t1, -24($fp) 
sw $t1, -8($fp) 
lw $t1, -28($fp) 
move $v0, $t1 
jr $ra 
main: 
li $s6, 16 
li $t9, 1 
li $t8, 4 
li $t6, 2 
li $v1, 8 
move $fp, $sp 
sw $t6, -12($fp) 
sw $0, -16($fp) 
lw $t1, -16($fp) 
bge $t1, 10, if_false4 
if_true3: 
lw $t1, -20($fp) 
lw $t2, -16($fp) 
add $t0, $t1, $t2 
sw $t0, -28($fp) 
lw $t1, -28($fp) 
lw $t2, -12($fp) 
add $t0, $t1, $t2 
sw $t0, -32($fp) 
lw $t1, -32($fp) 
sw $t1, -20($fp) 
jump5: 
lw $t1, -16($fp) 
sw $t1, -36($fp) 
lw $t0, -16($fp) 
add $t0, $t0, $t9 
sw $t0, -16($fp) 
lw $t1, -16($fp) 
slt $t0, $t1, 10 
sw $t0, -40($fp) 
bne $t0, $zero, if_true3 
if_false4: 
lw $t1, -20($fp) 
bgt $t1, 10, if_false7 
if_true6: 
lw $t1, -20($fp) 
sw $t1, -48($fp) 
lw $t0, -20($fp) 
add $t0, $t0, $t9 
sw $t0, -20($fp) 
jump8: 
lw $t1, -20($fp) 
sle $t0, $t1, 10 
sw $t0, -52($fp) 
bne $t0, $zero, if_true6 
if_false7: 
lw $t1, -20($fp) 
sgt $t0, $t1, 9 
sw $t0, -56($fp) 
beq $t0, $zero, if_false10 
if_true9: 
lw $t1, -20($fp) 
rem $t0, $t1, 10 
sw $t0, -60($fp) 
lw $t1, -60($fp) 
sw $t1, -20($fp) 
b go_on11 
if_false10: 
lw $t1, -20($fp) 
mul $t0, $t1, 10 
sw $t0, -64($fp) 
lw $t1, -64($fp) 
sw $t1, -20($fp) 
go_on11: 
add $sp, $sp, -272 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
lw $t1, -20($fp) 
add $t0, $t1, $t9 
sw $t0, -68($fp) 
lw $t1, -20($fp) 
move $a0, $t1 
lw $t1, -68($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal f1 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -80($fp) 
lw $t1, -80($fp) 
move $v0, $t1 
jr $ra 
