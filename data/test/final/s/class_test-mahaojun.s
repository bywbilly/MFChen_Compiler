.data
r42:	.space	4
r43:	.space	4
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
s13:	.asciiz	", "
s13ln:	.asciiz	", \n"
s14:	.asciiz	" enjoys this work. XD"
s14ln:	.asciiz	" enjoys this work. XD\n"
s16:	.asciiz	" wants to give up!!!!!"
s16ln:	.asciiz	" wants to give up!!!!!\n"
s17:	.asciiz	"the leading TA"
s17ln:	.asciiz	"the leading TA\n"
s18:	.asciiz	"the striking TA"
s18ln:	.asciiz	"the striking TA\n"
s19:	.asciiz	"MR"
s19ln:	.asciiz	"MR\n"
s20:	.asciiz	"Mars"
s20ln:	.asciiz	"Mars\n"
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
work44: 
add $t0, $a1, $t8 
sw $t0, -8($fp) 
lw $t1, -8($fp) 
lw $t4, ($t1) 
sle $t0, $t4, 100 
sw $t0, -16($fp) 
beq $t0, $zero, if_false46 
if_true45: 
la $t2, s13 
lw $s1, ($a0) 
li $s2, 2 
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
sw $v0, -20($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $a0 
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
sub $s5, 1 
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
add $t0, $a1, $0 
sw $t0, -24($fp) 
lw $t1, -20($fp) 
lw $t2, -24($fp) 
lw $t5, ($t2) 
lw $s1, ($t1) 
lw $s2, ($t5) 
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
sw $v0, -32($fp) 
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
move $s5, $t5 
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
lw $t1, -32($fp) 
la $t2, s14 
lw $s1, ($t1) 
li $s2, 21 
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
sw $v0, -40($fp) 
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
sub $s5, 1 
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
lw $t0, -40($fp) 
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
b go_on47 
if_false46: 
la $t2, s13 
lw $s1, ($a0) 
li $s2, 2 
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
sw $v0, -44($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $a0 
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
sub $s5, 1 
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
add $t0, $a1, $0 
sw $t0, -48($fp) 
lw $t1, -44($fp) 
lw $t2, -48($fp) 
lw $t5, ($t2) 
lw $s1, ($t1) 
lw $s2, ($t5) 
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
sw $v0, -56($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $t1 
add $s5, $s5, 3 
li $s3, 0 
bge $s3, $s1, false_for_stringplus131 
true_for_stringplus131: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s1, true_for_stringplus131 
false_for_stringplus131: 
move $s5, $t5 
add $s5, 3 
li $s3, 0 
bgt $s3, $s2, false_for_stringplus132 
true_for_stringplus132: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s2, true_for_stringplus132 
false_for_stringplus132: 
add $s4, $s4, $t9 
sb $0, ($s4) 
lw $t1, -56($fp) 
la $t2, s16 
lw $s1, ($t1) 
li $s2, 22 
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
add $s5, $s5, 3 
li $s3, 0 
bge $s3, $s1, false_for_stringplus133 
true_for_stringplus133: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s1, true_for_stringplus133 
false_for_stringplus133: 
move $s5, $t2 
sub $s5, 1 
li $s3, 0 
bgt $s3, $s2, false_for_stringplus134 
true_for_stringplus134: 
add $s4, $s4, $t9 
add $s5, $s5, $t9 
lb $s7, ($s5) 
sb $s7, ($s4) 
add $s3, $s3, $t9 
blt $s3, $s2, true_for_stringplus134 
false_for_stringplus134: 
add $s4, $s4, $t9 
sb $0, ($s4) 
lw $t0, -60($fp) 
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
go_on47: 
add $t0, $a1, $t8 
sw $t0, -64($fp) 
add $t0, $a1, $t8 
sw $t0, -68($fp) 
lw $t1, -68($fp) 
lw $t4, ($t1) 
lw $t2, r43 
add $t0, $t4, $t2 
sw $t0, -80($fp) 
lw $t0, -64($fp) 
lw $t1, -80($fp) 
sw $t1, ($t0) 
jr $ra 
main: 
li $s6, 16 
li $t9, 1 
li $t8, 4 
li $t6, 2 
li $v1, 8 
lw $t0, r42 
li $t0, 100 
sw $t0, r42 
lw $t0, r43 
li $t0, 10 
sw $t0, r43 
move $fp, $sp 
li $v0, 9 
move $t7, $a0 
li $a0, 8 
syscall  
move $a0, $t7 
sw $v0, -8($fp) 
lw $t1, -8($fp) 
sw $t1, 0($fp) 
add $t0, $t1, $0 
sw $t0, -12($fp) 
li $v0, 9 
move $t7, $a0 
li $a0, 18 
syscall  
move $a0, $t7 
lw $t0, -12($fp) 
sw $v0, ($t0) 
li $t1, 14 
sw $t1, 0($v0) 
li $t0, 116 
sw $t0, -20($fp) 
sb $t0, 4($v0) 
li $t0, 104 
sw $t0, -20($fp) 
sb $t0, 5($v0) 
li $t0, 101 
sw $t0, -20($fp) 
sb $t0, 6($v0) 
li $t0, 32 
sw $t0, -20($fp) 
sb $t0, 7($v0) 
li $t0, 108 
sw $t0, -20($fp) 
sb $t0, 8($v0) 
li $t0, 101 
sw $t0, -20($fp) 
sb $t0, 9($v0) 
li $t0, 97 
sw $t0, -20($fp) 
sb $t0, 10($v0) 
li $t0, 100 
sw $t0, -20($fp) 
sb $t0, 11($v0) 
li $t0, 105 
sw $t0, -20($fp) 
sb $t0, 12($v0) 
li $t0, 110 
sw $t0, -20($fp) 
sb $t0, 13($v0) 
li $t0, 103 
sw $t0, -20($fp) 
sb $t0, 14($v0) 
li $t0, 32 
sw $t0, -20($fp) 
sb $t0, 15($v0) 
li $t0, 84 
sw $t0, -20($fp) 
sb $t0, 16($v0) 
li $t0, 65 
sw $t0, -20($fp) 
sb $t0, 17($v0) 
lw $t1, 0($fp) 
add $t0, $t1, $t8 
sw $t0, -24($fp) 
sw $0, ($t0) 
li $v0, 9 
move $t7, $a0 
li $a0, 8 
syscall  
move $a0, $t7 
sw $v0, -32($fp) 
lw $t1, -32($fp) 
sw $t1, -4($fp) 
add $t0, $t1, $0 
sw $t0, -36($fp) 
li $v0, 9 
move $t7, $a0 
li $a0, 19 
syscall  
move $a0, $t7 
lw $t0, -36($fp) 
sw $v0, ($t0) 
li $t1, 15 
sw $t1, 0($v0) 
li $t0, 116 
sw $t0, -48($fp) 
sb $t0, 4($v0) 
li $t0, 104 
sw $t0, -48($fp) 
sb $t0, 5($v0) 
li $t0, 101 
sw $t0, -48($fp) 
sb $t0, 6($v0) 
li $t0, 32 
sw $t0, -48($fp) 
sb $t0, 7($v0) 
li $t0, 115 
sw $t0, -48($fp) 
sb $t0, 8($v0) 
li $t0, 116 
sw $t0, -48($fp) 
sb $t0, 9($v0) 
li $t0, 114 
sw $t0, -48($fp) 
sb $t0, 10($v0) 
li $t0, 105 
sw $t0, -48($fp) 
sb $t0, 11($v0) 
li $t0, 107 
sw $t0, -48($fp) 
sb $t0, 12($v0) 
li $t0, 105 
sw $t0, -48($fp) 
sb $t0, 13($v0) 
li $t0, 110 
sw $t0, -48($fp) 
sb $t0, 14($v0) 
li $t0, 103 
sw $t0, -48($fp) 
sb $t0, 15($v0) 
li $t0, 32 
sw $t0, -48($fp) 
sb $t0, 16($v0) 
li $t0, 84 
sw $t0, -48($fp) 
sb $t0, 17($v0) 
li $t0, 65 
sw $t0, -48($fp) 
sb $t0, 18($v0) 
lw $t1, -4($fp) 
add $t0, $t1, $t8 
sw $t0, -52($fp) 
lw $t1, r42 
sw $t1, ($t0) 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
li $v0, 9 
move $t7, $a0 
li $a0, 7 
syscall  
move $a0, $t7 
move $a0, $v0 
sw $t6, 0($v0) 
li $t0, 77 
sw $t0, -64($fp) 
sb $t0, 4($v0) 
li $t0, 82 
sw $t0, -64($fp) 
sb $t0, 5($v0) 
sw $0, -64($fp) 
sb $t0, 6($v0) 
lw $t1, 0($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal work44 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -72($fp) 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
li $v0, 9 
move $t7, $a0 
li $a0, 9 
syscall  
move $a0, $t7 
move $a0, $v0 
sw $t8, 0($v0) 
li $t0, 77 
sw $t0, -76($fp) 
sb $t0, 4($v0) 
li $t0, 97 
sw $t0, -76($fp) 
sb $t0, 5($v0) 
li $t0, 114 
sw $t0, -76($fp) 
sb $t0, 6($v0) 
li $t0, 115 
sw $t0, -76($fp) 
sb $t0, 7($v0) 
sw $0, -76($fp) 
sb $t0, 8($v0) 
lw $t1, -4($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal work44 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -84($fp) 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
li $v0, 9 
move $t7, $a0 
li $a0, 9 
syscall  
move $a0, $t7 
move $a0, $v0 
sw $t8, 0($v0) 
li $t0, 77 
sw $t0, -88($fp) 
sb $t0, 4($v0) 
li $t0, 97 
sw $t0, -88($fp) 
sb $t0, 5($v0) 
li $t0, 114 
sw $t0, -88($fp) 
sb $t0, 6($v0) 
li $t0, 115 
sw $t0, -88($fp) 
sb $t0, 7($v0) 
sw $0, -88($fp) 
sb $t0, 8($v0) 
lw $t1, -4($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal work44 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -96($fp) 
jr $ra 
