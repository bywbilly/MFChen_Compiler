.data
r42:	.space	4
r43:	.space	4
r44:	.space	4
r45:	.space	4
r46:	.space	4
r47:	.space	4
r48:	.space	4
r49:	.space	4
r50:	.space	4
r51:	.space	4
r52:	.space	4
r53:	.space	4
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
origin44: 
sw $a0, -8($fp) 
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
lw $t0, r42 
lw $t1, -8($fp) 
sw $t1, r42 
sw $0, r50 
lw $t1, r50 
bge $t1, $a0, if_false46 
if_true45: 
lw $t1, r42 
sw $t1, -24($fp) 
lw $t1, r50 
mul $t0, $t1, $t8 
sw $t0, -28($fp) 
lw $t0, -24($fp) 
lw $t2, -28($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -24($fp) 
sw $a0, -32($fp) 
lw $t0, -32($fp) 
mul $t0, $t0, $t8 
add $t0, $t0, $t8 
sw $t0, -32($fp) 
li $v0, 9 
move $t7, $a0 
lw $t1, -32($fp) 
move $a0, $t1 
sw $t1, -32($fp) 
syscall  
move $a0, $t7 
lw $t0, -32($fp) 
sub $t0, $t0, $t8 
div $t0, $t0, $t8 
sw $t0, -32($fp) 
sw $t0, 0($v0) 
sw $v0, -32($fp) 
lw $t0, -24($fp) 
lw $t1, -32($fp) 
sw $t1, ($t0) 
sw $0, r51 
lw $t1, r51 
bge $t1, $a0, jump47 
if_true48: 
lw $t1, r42 
sw $t1, -48($fp) 
lw $t1, r50 
mul $t0, $t1, $t8 
sw $t0, -52($fp) 
lw $t0, -48($fp) 
lw $t2, -52($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -48($fp) 
lw $t1, -48($fp) 
lw $t4, ($t1) 
sw $t4, -48($fp) 
lw $t1, r51 
mul $t0, $t1, $t8 
sw $t0, -52($fp) 
lw $t0, -48($fp) 
lw $t2, -52($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -48($fp) 
sw $0, ($t0) 
jump50: 
lw $t1, r51 
sw $t1, -60($fp) 
lw $t0, r51 
add $t0, $t0, $t9 
sw $t0, r51 
lw $t1, r51 
slt $t0, $t1, $a0 
sw $t0, -64($fp) 
bne $t0, $zero, if_true48 
beq $t0, $zero, jump47 
jump47: 
lw $t1, r50 
sw $t1, -68($fp) 
lw $t0, r50 
add $t0, $t0, $t9 
sw $t0, r50 
lw $t1, r50 
slt $t0, $t1, $a0 
sw $t0, -72($fp) 
bne $t0, $zero, if_true45 
if_false46: 
jr $ra 
build51: 
sw $t9, r50 
lw $t1, r50 
bgt $t1, 49, if_false53 
if_true52: 
li $t0, 50 
sw $t0, r51 
li $t0, 98 
sw $t0, -16($fp) 
lw $t1, -16($fp) 
lw $t2, r50 
sub $t0, $t1, $t2 
sw $t0, -12($fp) 
lw $t1, -12($fp) 
add $t0, $t1, $t9 
sw $t0, -20($fp) 
lw $t1, r51 
lw $t2, -20($fp) 
bgt $t1, $t2, jump54 
if_true55: 
lw $t1, r42 
sw $t1, -28($fp) 
lw $t1, r50 
mul $t0, $t1, $t8 
sw $t0, -32($fp) 
lw $t0, -28($fp) 
lw $t2, -32($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -28($fp) 
lw $t1, -28($fp) 
lw $t4, ($t1) 
sw $t4, -28($fp) 
lw $t1, r51 
mul $t0, $t1, $t8 
sw $t0, -32($fp) 
lw $t0, -28($fp) 
lw $t2, -32($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -28($fp) 
sw $t9, ($t0) 
jump57: 
lw $t1, r51 
sw $t1, -40($fp) 
lw $t0, r51 
add $t0, $t0, $t9 
sw $t0, r51 
li $t0, 98 
sw $t0, -48($fp) 
lw $t1, -48($fp) 
lw $t2, r50 
sub $t0, $t1, $t2 
sw $t0, -44($fp) 
lw $t1, -44($fp) 
add $t0, $t1, $t9 
sw $t0, -52($fp) 
lw $t1, r51 
lw $t2, -52($fp) 
sle $t0, $t1, $t2 
sw $t0, -56($fp) 
bne $t0, $zero, if_true55 
beq $t0, $zero, jump54 
jump54: 
lw $t1, r50 
sw $t1, -60($fp) 
lw $t0, r50 
add $t0, $t0, $t9 
sw $t0, r50 
lw $t1, r50 
sle $t0, $t1, 49 
sw $t0, -64($fp) 
bne $t0, $zero, if_true52 
if_false53: 
sw $t9, r50 
lw $t1, r50 
bgt $t1, 49, if_false59 
if_true58: 
lw $t1, r42 
sw $t1, -72($fp) 
mul $t0, $a0, $t8 
sw $t0, -76($fp) 
lw $t0, -72($fp) 
lw $t2, -76($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -72($fp) 
lw $t1, -72($fp) 
lw $t4, ($t1) 
sw $t4, -72($fp) 
lw $t1, r50 
mul $t0, $t1, $t8 
sw $t0, -76($fp) 
lw $t0, -72($fp) 
lw $t2, -76($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -72($fp) 
sw $t9, ($t0) 
jump60: 
lw $t1, r50 
sw $t1, -84($fp) 
lw $t0, r50 
add $t0, $t0, $t9 
sw $t0, r50 
lw $t1, r50 
sle $t0, $t1, 49 
sw $t0, -88($fp) 
bne $t0, $zero, if_true58 
if_false59: 
li $t0, 50 
sw $t0, r50 
lw $t1, r50 
bgt $t1, 98, if_false62 
if_true61: 
lw $t1, r42 
sw $t1, -100($fp) 
lw $t1, r50 
mul $t0, $t1, $t8 
sw $t0, -104($fp) 
lw $t0, -100($fp) 
lw $t2, -104($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -100($fp) 
lw $t1, -100($fp) 
lw $t4, ($t1) 
sw $t4, -100($fp) 
mul $t0, $a1, $t8 
sw $t0, -104($fp) 
lw $t0, -100($fp) 
lw $t2, -104($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -100($fp) 
sw $t9, ($t0) 
jump63: 
lw $t1, r50 
sw $t1, -112($fp) 
lw $t0, r50 
add $t0, $t0, $t9 
sw $t0, r50 
lw $t1, r50 
sle $t0, $t1, 98 
sw $t0, -116($fp) 
bne $t0, $zero, if_true61 
if_false62: 
li $v0, 0 
jr $ra 
find64: 
sw $0, r52 
sw $t9, r53 
sw $t9, r50 
lw $t1, r50 
bgt $t1, $a0, if_false66 
if_true65: 
lw $t1, r44 
sw $t1, -20($fp) 
lw $t1, r50 
mul $t0, $t1, $t8 
sw $t0, -24($fp) 
lw $t0, -20($fp) 
lw $t2, -24($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -20($fp) 
sw $0, ($t0) 
jump67: 
lw $t1, r50 
sw $t1, -32($fp) 
lw $t0, r50 
add $t0, $t0, $t9 
sw $t0, r50 
lw $t1, r50 
sle $t0, $t1, $a0 
sw $t0, -36($fp) 
bne $t0, $zero, if_true65 
if_false66: 
lw $t1, r48 
sw $t1, -40($fp) 
lw $t0, -40($fp) 
add $t0, $t0, $v1 
sw $t0, -40($fp) 
sw $a1, ($t0) 
lw $t1, r44 
sw $t1, -52($fp) 
mul $t0, $a1, $t8 
sw $t0, -56($fp) 
lw $t0, -52($fp) 
lw $t2, -56($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -52($fp) 
sw $t9, ($t0) 
lw $t1, r46 
sw $t1, -64($fp) 
mul $t0, $a1, $t8 
sw $t0, -68($fp) 
lw $t0, -64($fp) 
lw $t2, -68($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -64($fp) 
sw $0, ($t0) 
li $a2, 0 
lw $t1, r52 
lw $t2, r53 
slt $t0, $t1, $t2 
sw $t0, -80($fp) 
beq $t0, $zero, if_false73 
if_true71: 
seq $t0, $a2, $0 
sw $t0, -88($fp) 
lw $t1, -88($fp) 
sw $t1, -84($fp) 
b go72 
if_false73: 
sw $0, -84($fp) 
go72: 
lw $t0, -84($fp) 
beq $t0, $zero, if_false69 
if_true68: 
lw $t1, r52 
sw $t1, -92($fp) 
lw $t0, r52 
add $t0, $t0, $t9 
sw $t0, r52 
lw $t1, r48 
sw $t1, -96($fp) 
lw $t1, r52 
mul $t0, $t1, $t8 
sw $t0, -100($fp) 
lw $t0, -96($fp) 
lw $t2, -100($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -96($fp) 
lw $t0, r50 
lw $t1, -96($fp) 
lw $t4, ($t1) 
sw $t4, r50 
sw $t9, r51 
lw $t1, r51 
bgt $t1, $a0, jump70 
if_true74: 
lw $t1, r42 
sw $t1, -112($fp) 
lw $t1, r50 
mul $t0, $t1, $t8 
sw $t0, -116($fp) 
lw $t0, -112($fp) 
lw $t2, -116($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -112($fp) 
lw $t1, -112($fp) 
lw $t4, ($t1) 
sw $t4, -112($fp) 
lw $t1, r51 
mul $t0, $t1, $t8 
sw $t0, -116($fp) 
lw $t0, -112($fp) 
lw $t2, -116($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -112($fp) 
lw $t1, -112($fp) 
lw $t4, ($t1) 
sgt $t0, $t4, $0 
sw $t0, -124($fp) 
beq $t0, $zero, if_false79 
if_true77: 
lw $t1, r44 
sw $t1, -132($fp) 
lw $t1, r51 
mul $t0, $t1, $t8 
sw $t0, -136($fp) 
lw $t0, -132($fp) 
lw $t2, -136($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -132($fp) 
lw $t1, -132($fp) 
lw $t4, ($t1) 
seq $t0, $t4, $0 
sw $t0, -144($fp) 
lw $t1, -144($fp) 
sw $t1, -128($fp) 
b go78 
if_false79: 
sw $0, -128($fp) 
go78: 
lw $t0, -128($fp) 
beq $t0, $zero, jump76 
if_true80: 
lw $t1, r44 
sw $t1, -148($fp) 
lw $t1, r51 
mul $t0, $t1, $t8 
sw $t0, -152($fp) 
lw $t0, -148($fp) 
lw $t2, -152($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -148($fp) 
sw $t9, ($t0) 
lw $t1, r53 
sw $t1, -160($fp) 
lw $t0, r53 
add $t0, $t0, $t9 
sw $t0, r53 
lw $t1, r48 
sw $t1, -164($fp) 
lw $t1, r53 
mul $t0, $t1, $t8 
sw $t0, -168($fp) 
lw $t0, -164($fp) 
lw $t2, -168($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -164($fp) 
lw $t1, r51 
sw $t1, ($t0) 
lw $t1, r46 
sw $t1, -176($fp) 
lw $t1, r51 
mul $t0, $t1, $t8 
sw $t0, -180($fp) 
lw $t0, -176($fp) 
lw $t2, -180($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -176($fp) 
lw $t1, r50 
sw $t1, ($t0) 
lw $t1, r53 
seq $t0, $t1, $a0 
sw $t0, -188($fp) 
beq $t0, $zero, jump76 
if_true83: 
li $a2, 1 
jump76: 
lw $t1, r51 
sw $t1, -192($fp) 
lw $t0, r51 
add $t0, $t0, $t9 
sw $t0, r51 
lw $t1, r51 
sle $t0, $t1, $a0 
sw $t0, -196($fp) 
bne $t0, $zero, if_true74 
beq $t0, $zero, jump70 
jump70: 
lw $t1, r52 
lw $t2, r53 
slt $t0, $t1, $t2 
sw $t0, -200($fp) 
beq $t0, $zero, if_false88 
if_true86: 
seq $t0, $a2, $0 
sw $t0, -208($fp) 
lw $t1, -208($fp) 
sw $t1, -204($fp) 
b go87 
if_false88: 
sw $0, -204($fp) 
go87: 
lw $t0, -204($fp) 
bne $t0, $zero, if_true68 
if_false69: 
move $v0, $a2 
jr $ra 
improve89: 
sw $a0, r50 
lw $t1, r43 
sw $t1, -8($fp) 
lw $t0, r43 
add $t0, $t0, $t9 
sw $t0, r43 
lw $t1, r46 
sw $t1, -12($fp) 
lw $t1, r50 
mul $t0, $t1, $t8 
sw $t0, -16($fp) 
lw $t0, -12($fp) 
lw $t2, -16($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -12($fp) 
lw $t1, -12($fp) 
lw $t4, ($t1) 
ble $t4, $0, if_false91 
if_true90: 
lw $t1, r46 
sw $t1, -28($fp) 
lw $t1, r50 
mul $t0, $t1, $t8 
sw $t0, -32($fp) 
lw $t0, -28($fp) 
lw $t2, -32($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -28($fp) 
lw $t0, r51 
lw $t1, -28($fp) 
lw $t4, ($t1) 
sw $t4, r51 
lw $t1, r42 
sw $t1, -40($fp) 
lw $t1, r51 
mul $t0, $t1, $t8 
sw $t0, -44($fp) 
lw $t0, -40($fp) 
lw $t2, -44($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -40($fp) 
lw $t1, -40($fp) 
lw $t4, ($t1) 
sw $t4, -40($fp) 
lw $t1, r50 
mul $t0, $t1, $t8 
sw $t0, -44($fp) 
lw $t0, -40($fp) 
lw $t2, -44($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -40($fp) 
lw $t1, -40($fp) 
lw $t4, ($t1) 
sw $t4, -48($fp) 
lw $t0, -40($fp) 
lw $t3, ($t0) 
sub $t3, $t3, $t9 
sw $t3, ($t0) 
lw $t1, r42 
sw $t1, -52($fp) 
lw $t1, r50 
mul $t0, $t1, $t8 
sw $t0, -56($fp) 
lw $t0, -52($fp) 
lw $t2, -56($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -52($fp) 
lw $t1, -52($fp) 
lw $t4, ($t1) 
sw $t4, -52($fp) 
lw $t1, r51 
mul $t0, $t1, $t8 
sw $t0, -56($fp) 
lw $t0, -52($fp) 
lw $t2, -56($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -52($fp) 
lw $t1, -52($fp) 
lw $t4, ($t1) 
sw $t4, -60($fp) 
lw $t0, -52($fp) 
lw $t3, ($t0) 
add $t3, $t3, $t9 
sw $t3, ($t0) 
lw $t0, r50 
lw $t1, r51 
sw $t1, r50 
jump92: 
lw $t1, r46 
sw $t1, -64($fp) 
lw $t1, r50 
mul $t0, $t1, $t8 
sw $t0, -68($fp) 
lw $t0, -64($fp) 
lw $t2, -68($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -64($fp) 
lw $t1, -64($fp) 
lw $t4, ($t1) 
sgt $t0, $t4, $0 
sw $t0, -76($fp) 
bne $t0, $zero, if_true90 
if_false91: 
li $v0, 0 
jr $ra 
main: 
li $s6, 16 
li $t9, 1 
li $t8, 4 
li $t6, 2 
li $v1, 8 
sw $0, r43 
li $v0, 9 
move $t7, $a0 
li $a0, 444 
syscall  
move $a0, $t7 
li $t1, 110 
sw $t1, 0($v0) 
sw $v0, r45 
lw $t0, r44 
lw $t1, r45 
sw $t1, r44 
li $v0, 9 
move $t7, $a0 
li $a0, 444 
syscall  
move $a0, $t7 
li $t1, 110 
sw $t1, 0($v0) 
sw $v0, r47 
lw $t0, r46 
lw $t1, r47 
sw $t1, r46 
li $v0, 9 
move $t7, $a0 
li $a0, 444 
syscall  
move $a0, $t7 
li $t1, 110 
sw $t1, 0($v0) 
sw $v0, r49 
lw $t0, r48 
lw $t1, r49 
sw $t1, r48 
move $fp, $sp 
add $sp, $sp, -388 
sw $a0, 0($sp) 
li $a0, 110 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal origin44 
lw $a0, 16($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, 0($fp) 
sw $0, -4($fp) 
li $t0, 99 
sw $t0, -8($fp) 
li $t0, 100 
sw $t0, -12($fp) 
sw $0, -16($fp) 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
lw $t1, -8($fp) 
move $a0, $t1 
lw $t1, -12($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal build51 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -32($fp) 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
sw $a2, -8($sp) 
lw $t1, -12($fp) 
move $a0, $t1 
lw $t1, -8($fp) 
move $a1, $t1 
lw $t1, -16($fp) 
move $a2, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal find64 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $a2, 8($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -48($fp) 
lw $t1, -48($fp) 
ble $t1, $0, if_false95 
if_true94: 
add $sp, $sp, -388 
sw $a0, 0($sp) 
lw $t1, -12($fp) 
move $a0, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal improve89 
lw $a0, 16($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -60($fp) 
jump96: 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
sw $a2, -8($sp) 
lw $t1, -12($fp) 
move $a0, $t1 
lw $t1, -8($fp) 
move $a1, $t1 
lw $t1, -16($fp) 
move $a2, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal find64 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $a2, 8($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -76($fp) 
lw $t1, -76($fp) 
sgt $t0, $t1, $0 
sw $t0, -80($fp) 
bne $t0, $zero, if_true94 
if_false95: 
lw $t0, r43 
move $t7, $a0 
move $a0, $t0 
li $v0, 1 
syscall  
move $a0, $t7 
li $v0, 4 
move $t7, $a0 
la $a0, s0ln 
syscall  
move $a0, $t7 
li $v0, 0 
jr $ra 
