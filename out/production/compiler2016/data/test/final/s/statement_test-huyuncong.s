.data
r9:	.space	4
r10:	.space	4
r11:	.space	4
_buffer:	.word 0
NEWLINE:  .asciiz	 "\n" 
.text  
main: 
li $s6, 16 
li $t9, 1 
li $t8, 4 
li $t6, 2 
li $v1, 8 
sw $0, r10 
move $fp, $sp 
li $v0, 5 
syscall  
sw $v0, 0($fp) 
lw $t0, r9 
lw $t1, 0($fp) 
sw $t1, r9 
add $t0, $t1, 5 
sw $t0, -8($fp) 
lw $t1, -8($fp) 
sw $t1, -12($fp) 
lw $t0, -12($fp) 
mul $t0, $t0, $t8 
add $t0, $t0, $t8 
sw $t0, -12($fp) 
li $v0, 9 
move $t7, $a0 
lw $t1, -12($fp) 
move $a0, $t1 
sw $t1, -12($fp) 
syscall  
move $a0, $t7 
lw $t0, -12($fp) 
sub $t0, $t0, $t8 
div $t0, $t0, $t8 
sw $t0, -12($fp) 
sw $t0, 0($v0) 
sw $v0, -12($fp) 
lw $t0, r11 
lw $t1, -12($fp) 
sw $t1, r11 
sw $0, -20($fp) 
lw $t1, -20($fp) 
lw $t2, r9 
bgt $t1, $t2, if_false3 
if_true2: 
lw $t1, -20($fp) 
sw $t1, -28($fp) 
lw $t0, -20($fp) 
add $t0, $t0, $t9 
sw $t0, -20($fp) 
lw $t1, r11 
sw $t1, -32($fp) 
lw $t1, -28($fp) 
mul $t0, $t1, $t8 
sw $t0, -36($fp) 
lw $t0, -32($fp) 
lw $t2, -36($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -32($fp) 
sw $t9, ($t0) 
jump4: 
lw $t1, -20($fp) 
lw $t2, r9 
sle $t0, $t1, $t2 
sw $t0, -48($fp) 
bne $t0, $zero, if_true2 
if_false3: 
lw $t1, r9 
add $t0, $t1, 5 
sw $t0, -56($fp) 
lw $t1, -56($fp) 
sw $t1, -60($fp) 
lw $t0, -60($fp) 
mul $t0, $t0, $t8 
add $t0, $t0, $t8 
sw $t0, -60($fp) 
li $v0, 9 
move $t7, $a0 
lw $t1, -60($fp) 
move $a0, $t1 
sw $t1, -60($fp) 
syscall  
move $a0, $t7 
lw $t0, -60($fp) 
sub $t0, $t0, $t8 
div $t0, $t0, $t8 
sw $t0, -60($fp) 
sw $t0, 0($v0) 
sw $v0, -60($fp) 
lw $t1, -60($fp) 
sw $t1, -52($fp) 
lw $t1, r9 
add $t0, $t1, 5 
sw $t0, -68($fp) 
lw $t1, -68($fp) 
sw $t1, -72($fp) 
lw $t0, -72($fp) 
mul $t0, $t0, $t8 
add $t0, $t0, $t8 
sw $t0, -72($fp) 
li $v0, 9 
move $t7, $a0 
lw $t1, -72($fp) 
move $a0, $t1 
sw $t1, -72($fp) 
syscall  
move $a0, $t7 
lw $t0, -72($fp) 
sub $t0, $t0, $t8 
div $t0, $t0, $t8 
sw $t0, -72($fp) 
sw $t0, 0($v0) 
sw $v0, -72($fp) 
lw $t1, -72($fp) 
sw $t1, -64($fp) 
lw $t1, -52($fp) 
sw $t1, -76($fp) 
lw $t0, -76($fp) 
add $t0, $t0, $v1 
sw $t0, -76($fp) 
sw $t9, ($t0) 
sw $t6, -20($fp) 
if_true5: 
lw $t1, -20($fp) 
lw $t2, r9 
ble $t1, $t2, if_false9 
if_true8: 
b if_false6 
if_false9: 
lw $t1, r11 
sw $t1, -92($fp) 
lw $t1, -20($fp) 
mul $t0, $t1, $t8 
sw $t0, -96($fp) 
lw $t0, -92($fp) 
lw $t2, -96($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -92($fp) 
lw $t3, ($t0) 
beq $t3, $zero, if_false12 
if_true11: 
lw $t0, r10 
add $t0, $t0, $t9 
sw $t0, r10 
lw $t1, -64($fp) 
sw $t1, -108($fp) 
lw $t1, r10 
mul $t0, $t1, $t8 
sw $t0, -112($fp) 
lw $t0, -108($fp) 
lw $t2, -112($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -108($fp) 
lw $t1, -20($fp) 
sw $t1, ($t0) 
lw $t1, -52($fp) 
sw $t1, -120($fp) 
lw $t1, -20($fp) 
mul $t0, $t1, $t8 
sw $t0, -124($fp) 
lw $t0, -120($fp) 
lw $t2, -124($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -120($fp) 
lw $t1, -20($fp) 
sub $t0, $t1, $t9 
sw $t0, -128($fp) 
lw $t0, -120($fp) 
lw $t1, -128($fp) 
sw $t1, ($t0) 
if_false12: 
lw $t1, -20($fp) 
sw $t1, -136($fp) 
sw $t9, -140($fp) 
lw $t1, -140($fp) 
lw $t2, r10 
sle $t0, $t1, $t2 
sw $t0, -144($fp) 
beq $t0, $zero, if_false19 
if_true17: 
lw $t1, -64($fp) 
sw $t1, -152($fp) 
lw $t1, -140($fp) 
mul $t0, $t1, $t8 
sw $t0, -156($fp) 
lw $t0, -152($fp) 
lw $t2, -156($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -152($fp) 
lw $t1, -136($fp) 
lw $t2, -152($fp) 
lw $t5, ($t2) 
mul $t0, $t1, $t5 
sw $t0, -164($fp) 
lw $t1, -164($fp) 
lw $t2, r9 
sle $t0, $t1, $t2 
sw $t0, -168($fp) 
lw $t1, -168($fp) 
sw $t1, -148($fp) 
b go18 
if_false19: 
sw $0, -148($fp) 
go18: 
lw $t0, -148($fp) 
beq $t0, $zero, if_false15 
if_true14: 
lw $t1, -64($fp) 
sw $t1, -176($fp) 
lw $t1, -140($fp) 
mul $t0, $t1, $t8 
sw $t0, -180($fp) 
lw $t0, -176($fp) 
lw $t2, -180($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -176($fp) 
lw $t1, -136($fp) 
lw $t2, -176($fp) 
lw $t5, ($t2) 
mul $t0, $t1, $t5 
sw $t0, -188($fp) 
lw $t1, -188($fp) 
sw $t1, -172($fp) 
lw $t2, r9 
sgt $t0, $t1, $t2 
sw $t0, -192($fp) 
beq $t0, $zero, if_false21 
if_true20: 
b jump16 
if_false21: 
lw $t1, r11 
sw $t1, -196($fp) 
lw $t1, -172($fp) 
mul $t0, $t1, $t8 
sw $t0, -200($fp) 
lw $t0, -196($fp) 
lw $t2, -200($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -196($fp) 
sw $0, ($t0) 
lw $t1, -64($fp) 
sw $t1, -208($fp) 
lw $t1, -140($fp) 
mul $t0, $t1, $t8 
sw $t0, -212($fp) 
lw $t0, -208($fp) 
lw $t2, -212($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -208($fp) 
lw $t1, -136($fp) 
lw $t2, -208($fp) 
lw $t5, ($t2) 
rem $t0, $t1, $t5 
sw $t0, -220($fp) 
lw $t1, -220($fp) 
seq $t0, $t1, $0 
sw $t0, -224($fp) 
beq $t0, $zero, if_false24 
if_true23: 
lw $t1, -52($fp) 
sw $t1, -228($fp) 
lw $t1, -172($fp) 
mul $t0, $t1, $t8 
sw $t0, -232($fp) 
lw $t0, -228($fp) 
lw $t2, -232($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -228($fp) 
lw $t1, -52($fp) 
sw $t1, -236($fp) 
lw $t1, -136($fp) 
mul $t0, $t1, $t8 
sw $t0, -240($fp) 
lw $t0, -236($fp) 
lw $t2, -240($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -236($fp) 
lw $t1, -64($fp) 
sw $t1, -244($fp) 
lw $t1, -140($fp) 
mul $t0, $t1, $t8 
sw $t0, -248($fp) 
lw $t0, -244($fp) 
lw $t2, -248($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -244($fp) 
lw $t1, -236($fp) 
lw $t4, ($t1) 
lw $t2, -244($fp) 
lw $t5, ($t2) 
mul $t0, $t4, $t5 
sw $t0, -260($fp) 
lw $t0, -228($fp) 
lw $t1, -260($fp) 
sw $t1, ($t0) 
b if_false15 
b jump16 
if_false24: 
lw $t1, -64($fp) 
sw $t1, -268($fp) 
lw $t1, -140($fp) 
mul $t0, $t1, $t8 
sw $t0, -272($fp) 
lw $t0, -268($fp) 
lw $t2, -272($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -268($fp) 
lw $t1, -136($fp) 
lw $t2, -268($fp) 
lw $t5, ($t2) 
mul $t0, $t1, $t5 
sw $t0, -280($fp) 
lw $t1, -52($fp) 
sw $t1, -284($fp) 
lw $t1, -280($fp) 
mul $t0, $t1, $t8 
sw $t0, -288($fp) 
lw $t0, -284($fp) 
lw $t2, -288($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -284($fp) 
lw $t1, -52($fp) 
sw $t1, -292($fp) 
lw $t1, -136($fp) 
mul $t0, $t1, $t8 
sw $t0, -296($fp) 
lw $t0, -292($fp) 
lw $t2, -296($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -292($fp) 
lw $t1, -64($fp) 
sw $t1, -300($fp) 
lw $t1, -140($fp) 
mul $t0, $t1, $t8 
sw $t0, -304($fp) 
lw $t0, -300($fp) 
lw $t2, -304($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -300($fp) 
lw $t1, -300($fp) 
lw $t4, ($t1) 
sub $t0, $t4, $t9 
sw $t0, -312($fp) 
lw $t1, -292($fp) 
lw $t4, ($t1) 
lw $t2, -312($fp) 
mul $t0, $t4, $t2 
sw $t0, -320($fp) 
lw $t0, -284($fp) 
lw $t1, -320($fp) 
sw $t1, ($t0) 
jump16: 
lw $t1, -140($fp) 
sw $t1, -328($fp) 
lw $t0, -140($fp) 
add $t0, $t0, $t9 
sw $t0, -140($fp) 
lw $t1, -140($fp) 
lw $t2, r10 
sle $t0, $t1, $t2 
sw $t0, -332($fp) 
beq $t0, $zero, if_false28 
if_true26: 
lw $t1, -64($fp) 
sw $t1, -340($fp) 
lw $t1, -140($fp) 
mul $t0, $t1, $t8 
sw $t0, -344($fp) 
lw $t0, -340($fp) 
lw $t2, -344($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -340($fp) 
lw $t1, -136($fp) 
lw $t2, -340($fp) 
lw $t5, ($t2) 
mul $t0, $t1, $t5 
sw $t0, -352($fp) 
lw $t1, -352($fp) 
lw $t2, r9 
sle $t0, $t1, $t2 
sw $t0, -356($fp) 
lw $t1, -356($fp) 
sw $t1, -336($fp) 
b go27 
if_false28: 
sw $0, -336($fp) 
go27: 
lw $t0, -336($fp) 
bne $t0, $zero, if_true14 
if_false15: 
lw $t1, -52($fp) 
sw $t1, -360($fp) 
lw $t1, -136($fp) 
mul $t0, $t1, $t8 
sw $t0, -364($fp) 
lw $t0, -360($fp) 
lw $t2, -364($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -360($fp) 
lw $t3, ($t0) 
move $t7, $a0 
move $a0, $t3 
li $v0, 1 
syscall  
move $a0, $t7 
li $v0, 4 
move $t7, $a0 
la $a0, snullln 
syscall  
move $a0, $t7 
jump7: 
lw $t0, -20($fp) 
add $t0, $t0, $t9 
sw $t0, -20($fp) 
b if_true5 
if_false6: 
li $v0, 0 
jr $ra 
