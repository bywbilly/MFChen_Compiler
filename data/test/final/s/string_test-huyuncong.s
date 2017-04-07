.data
r42:	.space	4
r43:	.space	4
r44:	.space	4
r45:	.space	4
_buffer:	.word 0
NEWLINE:  .asciiz	 "\n" 
s0:	.asciiz	""
s0ln:	.asciiz	"\n"
s1:	.asciiz	"0"
s1ln:	.asciiz	"0\n"
s3:	.asciiz	"1"
s3ln:	.asciiz	"1\n"
s4:	.asciiz	"2"
s4ln:	.asciiz	"2\n"
s5:	.asciiz	"3"
s5ln:	.asciiz	"3\n"
s6:	.asciiz	"4"
s6ln:	.asciiz	"4\n"
s7:	.asciiz	"5"
s7ln:	.asciiz	"5\n"
s8:	.asciiz	"6"
s8ln:	.asciiz	"6\n"
s9:	.asciiz	"7"
s9ln:	.asciiz	"7\n"
s10:	.asciiz	"8"
s10ln:	.asciiz	"8\n"
s11:	.asciiz	"9"
s11ln:	.asciiz	"9\n"
s12:	.asciiz	"-"
s12ln:	.asciiz	"-\n"
s13:	.asciiz	"Never Ever!"
s13ln:	.asciiz	"Never Ever!\n"
s14:	.asciiz	"length error!"
s14ln:	.asciiz	"length error!\n"
.text  
toString1: 
li $v0, 9 
move $t7, $a0 
li $a0, 5 
syscall  
move $a0, $t7 
sw $v0, -8($fp) 
sw $0, 0($v0) 
sw $0, -12($fp) 
sb $t0, 4($v0) 
sw $0, -16($fp) 
seq $t0, $a0, $0 
sw $t0, -24($fp) 
beq $t0, $zero, if_false3 
if_true2: 
li $v0, 9 
move $t7, $a0 
li $a0, 5 
syscall  
move $a0, $t7 
sw $v0, -8($fp) 
sw $t9, 0($v0) 
li $t0, 48 
sw $t0, -28($fp) 
sb $t0, 4($v0) 
lw $t1, -8($fp) 
move $v0, $t1 
jr $ra 
if_false3: 
slt $t0, $a0, $0 
sw $t0, -32($fp) 
beq $t0, $zero, if_false6 
if_true5: 
sw $t9, -16($fp) 
lw $t0, -40($fp) 
neg $t0, $a0 
sw $t0, -40($fp) 
lw $t1, -40($fp) 
move $a0, $t1 
if_false6: 
ble $a0, $0, if_false9 
if_true8: 
rem $t0, $a0, 10 
sw $t0, -52($fp) 
lw $t1, -52($fp) 
sw $t1, -48($fp) 
seq $t0, $t1, $0 
sw $t0, -56($fp) 
beq $t0, $zero, if_false12 
if_true11: 
la $t1, s1 
lw $t2, -8($fp) 
li $s1, 1 
lw $s2, ($t2) 
add $s0, $s1, $s2 
add $s0, $s0, $t9 
li $v0, 9 
move $t7, $a0 
move $a0, $s0 
add $a0, $a0, $t8 
syscall  
move $a0, $t7 
sub $s0, $s0, $t9 
sw $s0, ($v0) 
sw $v0, -60($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $t1 
sub $s5, $s5, $t9 
li $s3, 0 
bge $s3, $s1, false_for_stringplus11 
true_for_stringplus11: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s1, true_for_stringplus11 
false_for_stringplus11: 
move $s5, $t2 
add $s5, 3 
li $s3, 0 
bgt $s3, $s2, false_for_stringplus12 
true_for_stringplus12: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s2, true_for_stringplus12 
false_for_stringplus12: 
add $s4, $s4, $t9 
sb $0, ($s4) 
lw $t1, -60($fp) 
sw $t1, -8($fp) 
b go_on13 
if_false12: 
lw $t1, -48($fp) 
seq $t0, $t1, $t9 
sw $t0, -64($fp) 
beq $t0, $zero, if_false15 
if_true14: 
la $t1, s3 
lw $t2, -8($fp) 
li $s1, 1 
lw $s2, ($t2) 
add $s0, $s1, $s2 
add $s0, $s0, $t9 
li $v0, 9 
move $t7, $a0 
move $a0, $s0 
add $a0, $a0, $t8 
syscall  
move $a0, $t7 
sub $s0, $s0, $t9 
sw $s0, ($v0) 
sw $v0, -68($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $t1 
sub $s5, $s5, $t9 
li $s3, 0 
bge $s3, $s1, false_for_stringplus13 
true_for_stringplus13: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s1, true_for_stringplus13 
false_for_stringplus13: 
move $s5, $t2 
add $s5, 3 
li $s3, 0 
bgt $s3, $s2, false_for_stringplus14 
true_for_stringplus14: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s2, true_for_stringplus14 
false_for_stringplus14: 
add $s4, $s4, $t9 
sb $0, ($s4) 
lw $t1, -68($fp) 
sw $t1, -8($fp) 
b go_on13 
if_false15: 
lw $t1, -48($fp) 
seq $t0, $t1, $t6 
sw $t0, -72($fp) 
beq $t0, $zero, if_false18 
if_true17: 
la $t1, s4 
lw $t2, -8($fp) 
li $s1, 1 
lw $s2, ($t2) 
add $s0, $s1, $s2 
add $s0, $s0, $t9 
li $v0, 9 
move $t7, $a0 
move $a0, $s0 
add $a0, $a0, $t8 
syscall  
move $a0, $t7 
sub $s0, $s0, $t9 
sw $s0, ($v0) 
sw $v0, -76($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $t1 
sub $s5, $s5, $t9 
li $s3, 0 
bge $s3, $s1, false_for_stringplus15 
true_for_stringplus15: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s1, true_for_stringplus15 
false_for_stringplus15: 
move $s5, $t2 
add $s5, 3 
li $s3, 0 
bgt $s3, $s2, false_for_stringplus16 
true_for_stringplus16: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s2, true_for_stringplus16 
false_for_stringplus16: 
add $s4, $s4, $t9 
sb $0, ($s4) 
lw $t1, -76($fp) 
sw $t1, -8($fp) 
b go_on13 
if_false18: 
lw $t1, -48($fp) 
seq $t0, $t1, 3 
sw $t0, -80($fp) 
beq $t0, $zero, if_false21 
if_true20: 
la $t1, s5 
lw $t2, -8($fp) 
li $s1, 1 
lw $s2, ($t2) 
add $s0, $s1, $s2 
add $s0, $s0, $t9 
li $v0, 9 
move $t7, $a0 
move $a0, $s0 
add $a0, $a0, $t8 
syscall  
move $a0, $t7 
sub $s0, $s0, $t9 
sw $s0, ($v0) 
sw $v0, -84($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $t1 
sub $s5, $s5, $t9 
li $s3, 0 
bge $s3, $s1, false_for_stringplus17 
true_for_stringplus17: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s1, true_for_stringplus17 
false_for_stringplus17: 
move $s5, $t2 
add $s5, 3 
li $s3, 0 
bgt $s3, $s2, false_for_stringplus18 
true_for_stringplus18: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s2, true_for_stringplus18 
false_for_stringplus18: 
add $s4, $s4, $t9 
sb $0, ($s4) 
lw $t1, -84($fp) 
sw $t1, -8($fp) 
b go_on13 
if_false21: 
lw $t1, -48($fp) 
seq $t0, $t1, $t8 
sw $t0, -88($fp) 
beq $t0, $zero, if_false24 
if_true23: 
la $t1, s6 
lw $t2, -8($fp) 
li $s1, 1 
lw $s2, ($t2) 
add $s0, $s1, $s2 
add $s0, $s0, $t9 
li $v0, 9 
move $t7, $a0 
move $a0, $s0 
add $a0, $a0, $t8 
syscall  
move $a0, $t7 
sub $s0, $s0, $t9 
sw $s0, ($v0) 
sw $v0, -92($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $t1 
sub $s5, $s5, $t9 
li $s3, 0 
bge $s3, $s1, false_for_stringplus19 
true_for_stringplus19: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s1, true_for_stringplus19 
false_for_stringplus19: 
move $s5, $t2 
add $s5, 3 
li $s3, 0 
bgt $s3, $s2, false_for_stringplus110 
true_for_stringplus110: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s2, true_for_stringplus110 
false_for_stringplus110: 
add $s4, $s4, $t9 
sb $0, ($s4) 
lw $t1, -92($fp) 
sw $t1, -8($fp) 
b go_on13 
if_false24: 
lw $t1, -48($fp) 
seq $t0, $t1, 5 
sw $t0, -96($fp) 
beq $t0, $zero, if_false27 
if_true26: 
la $t1, s7 
lw $t2, -8($fp) 
li $s1, 1 
lw $s2, ($t2) 
add $s0, $s1, $s2 
add $s0, $s0, $t9 
li $v0, 9 
move $t7, $a0 
move $a0, $s0 
add $a0, $a0, $t8 
syscall  
move $a0, $t7 
sub $s0, $s0, $t9 
sw $s0, ($v0) 
sw $v0, -100($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $t1 
sub $s5, $s5, $t9 
li $s3, 0 
bge $s3, $s1, false_for_stringplus111 
true_for_stringplus111: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s1, true_for_stringplus111 
false_for_stringplus111: 
move $s5, $t2 
add $s5, 3 
li $s3, 0 
bgt $s3, $s2, false_for_stringplus112 
true_for_stringplus112: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s2, true_for_stringplus112 
false_for_stringplus112: 
add $s4, $s4, $t9 
sb $0, ($s4) 
lw $t1, -100($fp) 
sw $t1, -8($fp) 
b go_on13 
if_false27: 
lw $t1, -48($fp) 
seq $t0, $t1, 6 
sw $t0, -104($fp) 
beq $t0, $zero, if_false30 
if_true29: 
la $t1, s8 
lw $t2, -8($fp) 
li $s1, 1 
lw $s2, ($t2) 
add $s0, $s1, $s2 
add $s0, $s0, $t9 
li $v0, 9 
move $t7, $a0 
move $a0, $s0 
add $a0, $a0, $t8 
syscall  
move $a0, $t7 
sub $s0, $s0, $t9 
sw $s0, ($v0) 
sw $v0, -108($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $t1 
sub $s5, $s5, $t9 
li $s3, 0 
bge $s3, $s1, false_for_stringplus113 
true_for_stringplus113: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s1, true_for_stringplus113 
false_for_stringplus113: 
move $s5, $t2 
add $s5, 3 
li $s3, 0 
bgt $s3, $s2, false_for_stringplus114 
true_for_stringplus114: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s2, true_for_stringplus114 
false_for_stringplus114: 
add $s4, $s4, $t9 
sb $0, ($s4) 
lw $t1, -108($fp) 
sw $t1, -8($fp) 
b go_on13 
if_false30: 
lw $t1, -48($fp) 
seq $t0, $t1, 7 
sw $t0, -112($fp) 
beq $t0, $zero, if_false33 
if_true32: 
la $t1, s9 
lw $t2, -8($fp) 
li $s1, 1 
lw $s2, ($t2) 
add $s0, $s1, $s2 
add $s0, $s0, $t9 
li $v0, 9 
move $t7, $a0 
move $a0, $s0 
add $a0, $a0, $t8 
syscall  
move $a0, $t7 
sub $s0, $s0, $t9 
sw $s0, ($v0) 
sw $v0, -116($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $t1 
sub $s5, $s5, $t9 
li $s3, 0 
bge $s3, $s1, false_for_stringplus115 
true_for_stringplus115: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s1, true_for_stringplus115 
false_for_stringplus115: 
move $s5, $t2 
add $s5, 3 
li $s3, 0 
bgt $s3, $s2, false_for_stringplus116 
true_for_stringplus116: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s2, true_for_stringplus116 
false_for_stringplus116: 
add $s4, $s4, $t9 
sb $0, ($s4) 
lw $t1, -116($fp) 
sw $t1, -8($fp) 
b go_on13 
if_false33: 
lw $t1, -48($fp) 
seq $t0, $t1, $v1 
sw $t0, -120($fp) 
beq $t0, $zero, if_false36 
if_true35: 
la $t1, s10 
lw $t2, -8($fp) 
li $s1, 1 
lw $s2, ($t2) 
add $s0, $s1, $s2 
add $s0, $s0, $t9 
li $v0, 9 
move $t7, $a0 
move $a0, $s0 
add $a0, $a0, $t8 
syscall  
move $a0, $t7 
sub $s0, $s0, $t9 
sw $s0, ($v0) 
sw $v0, -124($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $t1 
sub $s5, $s5, $t9 
li $s3, 0 
bge $s3, $s1, false_for_stringplus117 
true_for_stringplus117: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s1, true_for_stringplus117 
false_for_stringplus117: 
move $s5, $t2 
add $s5, 3 
li $s3, 0 
bgt $s3, $s2, false_for_stringplus118 
true_for_stringplus118: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s2, true_for_stringplus118 
false_for_stringplus118: 
add $s4, $s4, $t9 
sb $0, ($s4) 
lw $t1, -124($fp) 
sw $t1, -8($fp) 
b go_on13 
if_false36: 
lw $t1, -48($fp) 
seq $t0, $t1, 9 
sw $t0, -128($fp) 
beq $t0, $zero, go_on13 
if_true38: 
la $t1, s11 
lw $t2, -8($fp) 
li $s1, 1 
lw $s2, ($t2) 
add $s0, $s1, $s2 
add $s0, $s0, $t9 
li $v0, 9 
move $t7, $a0 
move $a0, $s0 
add $a0, $a0, $t8 
syscall  
move $a0, $t7 
sub $s0, $s0, $t9 
sw $s0, ($v0) 
sw $v0, -132($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $t1 
sub $s5, $s5, $t9 
li $s3, 0 
bge $s3, $s1, false_for_stringplus119 
true_for_stringplus119: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s1, true_for_stringplus119 
false_for_stringplus119: 
move $s5, $t2 
add $s5, 3 
li $s3, 0 
bgt $s3, $s2, false_for_stringplus120 
true_for_stringplus120: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s2, true_for_stringplus120 
false_for_stringplus120: 
add $s4, $s4, $t9 
sb $0, ($s4) 
lw $t1, -132($fp) 
sw $t1, -8($fp) 
go_on13: 
div $t0, $a0, 10 
sw $t0, -136($fp) 
lw $t1, -136($fp) 
move $a0, $t1 
jump10: 
sgt $t0, $a0, $0 
sw $t0, -140($fp) 
bne $t0, $zero, if_true8 
if_false9: 
lw $t0, -16($fp) 
beq $t0, $zero, if_false42 
if_true41: 
la $t1, s12 
lw $t2, -8($fp) 
li $s1, 1 
lw $s2, ($t2) 
add $s0, $s1, $s2 
add $s0, $s0, $t9 
li $v0, 9 
move $t7, $a0 
move $a0, $s0 
add $a0, $a0, $t8 
syscall  
move $a0, $t7 
sub $s0, $s0, $t9 
sw $s0, ($v0) 
sw $v0, -144($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $t1 
sub $s5, $s5, $t9 
li $s3, 0 
bge $s3, $s1, false_for_stringplus121 
true_for_stringplus121: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s1, true_for_stringplus121 
false_for_stringplus121: 
move $s5, $t2 
add $s5, 3 
li $s3, 0 
bgt $s3, $s2, false_for_stringplus122 
true_for_stringplus122: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s2, true_for_stringplus122 
false_for_stringplus122: 
add $s4, $s4, $t9 
sb $0, ($s4) 
lw $t1, -144($fp) 
sw $t1, -8($fp) 
if_false42: 
lw $t1, -8($fp) 
move $v0, $t1 
jr $ra 
calc44: 
sw $a0, -16($fp) 
lw $t0, -12($fp) 
lw $t1, -16($fp) 
lw $t1, ($t1) 
move $t0, $t1 
sw $t0, -12($fp) 
lw $t1, -12($fp) 
sw $t1, -8($fp) 
seq $t0, $t1, $t9 
sw $t0, -20($fp) 
beq $t0, $zero, if_false46 
if_true45: 
move $v0, $a0 
jr $ra 
if_false46: 
lw $t1, -8($fp) 
div $t0, $t1, $t6 
sw $t0, -24($fp) 
add $sp, $sp, -388 
sw $a0, 0($sp) 
lw $t1, -24($fp) 
sub $t0, $t1, $t9 
sw $t0, -40($fp) 
sw $a0, -44($fp) 
move $s0, $a0 
lw $t1, -44($fp) 
lw $t2, -40($fp) 
move $s0, $a0 
li $v0, 9 
sub $a0, $t2, $0 
move $s1, $a0 
add $s1, $s1, $t9 
add $a0, $a0, 6 
syscall  
sw $s1, ($v0) 
move $s4, $v0 
add $v0, $v0, $t8 
add $t1, $t1, $t8 
add $t1, $t1, $0 
li $s5, 0 
begin_substring1: 
lb $s2, ($t1) 
sb $s2, ($v0) 
add $t1, $t1, $t9 
add $v0, $v0, $t9 
add $s5, $s5, $t9 
slt $s3, $s5, $s1 
beqz $s3, end_substring1 
b begin_substring1 
end_substring1: 
sb $0, ($v0) 
sw $s4, -36($fp) 
move $a0, $s0 
lw $t1, -36($fp) 
move $a0, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal calc44 
lw $a0, 16($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -52($fp) 
lw $t1, -52($fp) 
sw $t1, -32($fp) 
add $sp, $sp, -388 
sw $a0, 0($sp) 
lw $t1, -8($fp) 
sub $t0, $t1, $t9 
sw $t0, -64($fp) 
sw $a0, -68($fp) 
move $s0, $a0 
lw $t1, -68($fp) 
lw $t0, -24($fp) 
lw $t2, -64($fp) 
move $s0, $a0 
li $v0, 9 
sub $a0, $t2, $t0 
move $s1, $a0 
add $s1, $s1, $t9 
add $a0, $a0, 6 
syscall  
sw $s1, ($v0) 
move $s4, $v0 
add $v0, $v0, $t8 
add $t1, $t1, $t8 
add $t1, $t1, $t0 
li $s5, 0 
begin_substring2: 
lb $s2, ($t1) 
sb $s2, ($v0) 
add $t1, $t1, $t9 
add $v0, $v0, $t9 
add $s5, $s5, $t9 
slt $s3, $s5, $s1 
beqz $s3, end_substring2 
b begin_substring2 
end_substring2: 
sb $0, ($v0) 
sw $s4, -60($fp) 
move $a0, $s0 
lw $t1, -60($fp) 
move $a0, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal calc44 
lw $a0, 16($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -76($fp) 
lw $t1, -76($fp) 
sw $t1, -56($fp) 
lw $t1, -32($fp) 
lw $t2, -56($fp) 
lw $s1, ($t1) 
lw $s2, ($t2) 
slt $s7, $s1, $s2 
string_less11: 
beqz $s7, string_less21 
move $s0, $s1 
li $s4, 0 
b go_string_less1 
string_less21: 
move $s0, $s2 
li $s4, 1 
go_string_less1: 
add $t1, $t1, $t8 
add $t2, $t2, $t8 
li $s3, 0 
string_less31: 
lb $s1, ($t1) 
lb $s2, ($t2) 
add $t1, $t1, $t9 
add $t2, $t2, $t9 
add $s3, $s3, $t9 
seq $s7, $s1, $s2 
slt $t3, $s3, $s0 
and $s5, $s7, $t3 
bnez $s5, string_less31 
beqz $t3, shit1 
slt $s7, $s1, $s2 
bnez $s7, string_true1 
beqz $s7, string_false1 
shit1: 
bnez $s4, string_false1 
string_true1: 
li $t7, 1 
b save_string_less1 
string_false1: 
li $t7, 0 
save_string_less1: 
sw $t7, -80($fp) 
lw $t0, -80($fp) 
beq $t0, $zero, if_false49 
if_true48: 
lw $t1, -32($fp) 
lw $t2, -56($fp) 
lw $s1, ($t1) 
lw $s2, ($t2) 
add $s0, $s1, $s2 
add $s0, $s0, $t9 
li $v0, 9 
move $t7, $a0 
move $a0, $s0 
add $a0, $a0, $t8 
syscall  
move $a0, $t7 
sub $s0, $s0, $t9 
sw $s0, ($v0) 
sw $v0, -84($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $t1 
add $s5, $s5, 3 
li $s3, 0 
bge $s3, $s1, false_for_stringplus123 
true_for_stringplus123: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s1, true_for_stringplus123 
false_for_stringplus123: 
move $s5, $t2 
add $s5, 3 
li $s3, 0 
bgt $s3, $s2, false_for_stringplus124 
true_for_stringplus124: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s2, true_for_stringplus124 
false_for_stringplus124: 
add $s4, $s4, $t9 
sb $0, ($s4) 
lw $t1, -84($fp) 
move $v0, $t1 
jr $ra 
b go_on50 
if_false49: 
lw $t1, -32($fp) 
lw $t2, -56($fp) 
lw $s1, ($t1) 
lw $s2, ($t2) 
slt $s7, $s1, $s2 
string_less12: 
beqz $s7, string_less22 
move $s0, $s1 
li $s4, 0 
b go_string_less2 
string_less22: 
move $s0, $s2 
li $s4, 1 
go_string_less2: 
add $t1, $t1, $t8 
add $t2, $t2, $t8 
li $s3, 0 
string_less32: 
lb $s1, ($t1) 
lb $s2, ($t2) 
add $t1, $t1, $t9 
add $t2, $t2, $t9 
add $s3, $s3, $t9 
seq $s7, $s1, $s2 
slt $t3, $s3, $s0 
and $s5, $s7, $t3 
bnez $s5, string_less32 
beqz $t3, shit2 
slt $s7, $s1, $s2 
bnez $s7, string_true2 
beqz $s7, string_false2 
shit2: 
bnez $s4, string_false2 
string_true2: 
li $t7, 1 
b save_string_less2 
string_false2: 
li $t7, 0 
save_string_less2: 
sw $t7, -92($fp) 
lw $t1, -56($fp) 
lw $t2, -32($fp) 
lw $s1, ($t1) 
lw $s2, ($t2) 
slt $s7, $s1, $s2 
string_less13: 
beqz $s7, string_less23 
move $s0, $s1 
li $s4, 0 
b go_string_less3 
string_less23: 
move $s0, $s2 
li $s4, 1 
go_string_less3: 
add $t1, $t1, $t8 
add $t2, $t2, $t8 
li $s3, 0 
string_less33: 
lb $s1, ($t1) 
lb $s2, ($t2) 
add $t1, $t1, $t9 
add $t2, $t2, $t9 
add $s3, $s3, $t9 
seq $s7, $s1, $s2 
slt $t3, $s3, $s0 
and $s5, $s7, $t3 
bnez $s5, string_less33 
beqz $t3, shit3 
slt $s7, $s1, $s2 
bnez $s7, string_true3 
beqz $s7, string_false3 
shit3: 
bnez $s4, string_false3 
string_true3: 
li $t7, 1 
b save_string_less3 
string_false3: 
li $t7, 0 
save_string_less3: 
sw $t7, -88($fp) 
lw $t1, -92($fp) 
lw $t2, -88($fp) 
or $t0, $t1, $t2 
sw $t0, -88($fp) 
lw $t1, -88($fp) 
seq $t0, $t1, $zero 
sw $t0, -88($fp) 
beq $t0, $zero, if_false52 
if_true51: 
lw $t1, -32($fp) 
sw $t1, -104($fp) 
lw $t0, -100($fp) 
lw $t1, -104($fp) 
add $t1, $t1, $t8 
add $t1, $t1, $0 
lb $t0, ($t1) 
sw $t0, -100($fp) 
lw $t1, -100($fp) 
sw $t1, -96($fp) 
lw $t1, -56($fp) 
sw $t1, -116($fp) 
lw $t0, -112($fp) 
lw $t1, -116($fp) 
add $t1, $t1, $t8 
add $t1, $t1, $0 
lb $t0, ($t1) 
sw $t0, -112($fp) 
lw $t1, -112($fp) 
sw $t1, -108($fp) 
lw $t1, -96($fp) 
lw $t2, -108($fp) 
slt $t0, $t1, $t2 
sw $t0, -120($fp) 
beq $t0, $zero, if_false55 
if_true54: 
lw $t1, -32($fp) 
lw $t2, -56($fp) 
lw $s1, ($t1) 
lw $s2, ($t2) 
add $s0, $s1, $s2 
add $s0, $s0, $t9 
li $v0, 9 
move $t7, $a0 
move $a0, $s0 
add $a0, $a0, $t8 
syscall  
move $a0, $t7 
sub $s0, $s0, $t9 
sw $s0, ($v0) 
sw $v0, -124($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $t1 
add $s5, $s5, 3 
li $s3, 0 
bge $s3, $s1, false_for_stringplus125 
true_for_stringplus125: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s1, true_for_stringplus125 
false_for_stringplus125: 
move $s5, $t2 
add $s5, 3 
li $s3, 0 
bgt $s3, $s2, false_for_stringplus126 
true_for_stringplus126: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s2, true_for_stringplus126 
false_for_stringplus126: 
add $s4, $s4, $t9 
sb $0, ($s4) 
lw $t1, -124($fp) 
move $v0, $t1 
jr $ra 
if_false55: 
lw $t1, -56($fp) 
lw $t2, -32($fp) 
lw $s1, ($t1) 
lw $s2, ($t2) 
add $s0, $s1, $s2 
add $s0, $s0, $t9 
li $v0, 9 
move $t7, $a0 
move $a0, $s0 
add $a0, $a0, $t8 
syscall  
move $a0, $t7 
sub $s0, $s0, $t9 
sw $s0, ($v0) 
sw $v0, -128($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $t1 
add $s5, $s5, 3 
li $s3, 0 
bge $s3, $s1, false_for_stringplus127 
true_for_stringplus127: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s1, true_for_stringplus127 
false_for_stringplus127: 
move $s5, $t2 
add $s5, 3 
li $s3, 0 
bgt $s3, $s2, false_for_stringplus128 
true_for_stringplus128: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s2, true_for_stringplus128 
false_for_stringplus128: 
add $s4, $s4, $t9 
sb $0, ($s4) 
lw $t1, -128($fp) 
move $v0, $t1 
jr $ra 
b go_on50 
if_false52: 
lw $t1, -56($fp) 
lw $t2, -32($fp) 
lw $s1, ($t1) 
lw $s2, ($t2) 
slt $s7, $s1, $s2 
string_less14: 
beqz $s7, string_less24 
move $s0, $s1 
li $s4, 0 
b go_string_less4 
string_less24: 
move $s0, $s2 
li $s4, 1 
go_string_less4: 
add $t1, $t1, $t8 
add $t2, $t2, $t8 
li $s3, 0 
string_less34: 
lb $s1, ($t1) 
lb $s2, ($t2) 
add $t1, $t1, $t9 
add $t2, $t2, $t9 
add $s3, $s3, $t9 
seq $s7, $s1, $s2 
slt $t3, $s3, $s0 
and $s5, $s7, $t3 
bnez $s5, string_less34 
beqz $t3, shit4 
slt $s7, $s1, $s2 
bnez $s7, string_true4 
beqz $s7, string_false4 
shit4: 
bnez $s4, string_false4 
string_true4: 
li $t7, 1 
b save_string_less4 
string_false4: 
li $t7, 0 
save_string_less4: 
sw $t7, -132($fp) 
lw $t0, -132($fp) 
beq $t0, $zero, go_on50 
if_true57: 
lw $t1, -56($fp) 
lw $t2, -32($fp) 
lw $s1, ($t1) 
lw $s2, ($t2) 
add $s0, $s1, $s2 
add $s0, $s0, $t9 
li $v0, 9 
move $t7, $a0 
move $a0, $s0 
add $a0, $a0, $t8 
syscall  
move $a0, $t7 
sub $s0, $s0, $t9 
sw $s0, ($v0) 
sw $v0, -136($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $t1 
add $s5, $s5, 3 
li $s3, 0 
bge $s3, $s1, false_for_stringplus129 
true_for_stringplus129: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s1, true_for_stringplus129 
false_for_stringplus129: 
move $s5, $t2 
add $s5, 3 
li $s3, 0 
bgt $s3, $s2, false_for_stringplus130 
true_for_stringplus130: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s2, true_for_stringplus130 
false_for_stringplus130: 
add $s4, $s4, $t9 
sb $0, ($s4) 
lw $t1, -136($fp) 
move $v0, $t1 
jr $ra 
go_on50: 
li $v0, 4 
move $t7, $a0 
la $a0, s13ln 
syscall  
move $a0, $t7 
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
sw $t0, 0($fp) 
move $a0, $s0 
move $a1, $s1 
lw $t0, r42 
lw $t1, 0($fp) 
sw $t1, r42 
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
begin_count2: 
lb $t3, ($t1) 
beqz $t3, end_count2 
add $t1, $t1, $t9 
add $t2, $t2, $t9 
b begin_count2 
end_count2: 
sub $t0, $t0, $t8 
sw $t2, ($t0) 
sw $t0, -8($fp) 
move $a0, $s0 
move $a1, $s1 
lw $t0, r43 
lw $t1, -8($fp) 
sw $t1, r43 
sw $t1, -20($fp) 
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
sw $s1, -16($fp) 
lw $t0, r45 
lw $t1, -16($fp) 
sw $t1, r45 
lw $t1, r42 
sw $t1, -32($fp) 
lw $t0, -28($fp) 
lw $t1, -32($fp) 
lw $t1, ($t1) 
move $t0, $t1 
sw $t0, -28($fp) 
lw $t1, -28($fp) 
lw $t2, r45 
slt $t0, $t1, $t2 
sw $t0, -36($fp) 
beq $t0, $zero, if_false62 
if_true61: 
li $v0, 4 
move $t7, $a0 
la $a0, s14ln 
syscall  
move $a0, $t7 
li $v0, 0 
jr $ra 
if_false62: 
add $sp, $sp, -388 
sw $a0, 0($sp) 
lw $t1, r45 
sub $t0, $t1, $t9 
sw $t0, -44($fp) 
lw $t1, r42 
sw $t1, -48($fp) 
move $s0, $a0 
lw $t1, -48($fp) 
lw $t2, -44($fp) 
move $s0, $a0 
li $v0, 9 
sub $a0, $t2, $0 
move $s1, $a0 
add $s1, $s1, $t9 
add $a0, $a0, 6 
syscall  
sw $s1, ($v0) 
move $s4, $v0 
add $v0, $v0, $t8 
add $t1, $t1, $t8 
add $t1, $t1, $0 
li $s5, 0 
begin_substring3: 
lb $s2, ($t1) 
sb $s2, ($v0) 
add $t1, $t1, $t9 
add $v0, $v0, $t9 
add $s5, $s5, $t9 
slt $s3, $s5, $s1 
beqz $s3, end_substring3 
b begin_substring3 
end_substring3: 
sb $0, ($v0) 
sw $s4, -40($fp) 
move $a0, $s0 
lw $t1, -40($fp) 
move $a0, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal calc44 
lw $a0, 16($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -56($fp) 
lw $t0, r44 
lw $t1, -56($fp) 
sw $t1, r44 
lw $t0, r44 
move $s0, $t0 
add $s0, $s0, $t8 
li $v0, 4 
move $t7, $a0 
move $a0, $s0 
syscall  
li $v0, 4 
la $a0, NEWLINE 
syscall  
move $a0, $t7 
li $v0, 0 
jr $ra 
