.data
r42:	.space	4
r43:	.space	4
r44:	.space	4
r45:	.space	4
r46:	.space	4
r47:	.space	4
r48:	.space	4
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
s13:	.asciiz	" "
s13ln:	.asciiz	" \n"
s14:	.asciiz	"\n"
s14ln:	.asciiz	"\n\n"
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
sw $0, r47 
lw $t1, r47 
bge $t1, $a0, if_false46 
if_true45: 
lw $t1, r42 
sw $t1, -24($fp) 
lw $t1, r47 
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
sw $0, r48 
lw $t1, r48 
bge $t1, $a0, jump47 
if_true48: 
lw $t1, r42 
sw $t1, -48($fp) 
lw $t1, r47 
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
lw $t1, r48 
mul $t0, $t1, $t8 
sw $t0, -52($fp) 
lw $t0, -48($fp) 
lw $t2, -52($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -48($fp) 
sw $0, ($t0) 
jump50: 
lw $t1, r48 
sw $t1, -60($fp) 
lw $t0, r48 
add $t0, $t0, $t9 
sw $t0, r48 
lw $t1, r48 
slt $t0, $t1, $a0 
sw $t0, -64($fp) 
bne $t0, $zero, if_true48 
beq $t0, $zero, jump47 
jump47: 
lw $t1, r47 
sw $t1, -68($fp) 
lw $t0, r47 
add $t0, $t0, $t9 
sw $t0, r47 
lw $t1, r47 
slt $t0, $t1, $a0 
sw $t0, -72($fp) 
bne $t0, $zero, if_true45 
if_false46: 
jr $ra 
search51: 
sgt $t0, $a1, $0 
sw $t0, -24($fp) 
beq $t0, $zero, if_false56 
if_true55: 
sw $t9, -28($fp) 
b go57 
if_false56: 
slt $t0, $a1, $0 
sw $t0, -32($fp) 
lw $t1, -32($fp) 
sw $t1, -28($fp) 
go57: 
lw $t0, -28($fp) 
bne $t0, $zero, if_true54 
if_false52: 
seq $t0, $a0, $0 
sw $t0, -40($fp) 
bne $t0, $zero, if_true54 
if_false58: 
sub $t0, $a0, $t9 
sw $t0, -48($fp) 
lw $t1, r42 
sw $t1, -52($fp) 
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
sw $t4, -52($fp) 
lw $t0, -52($fp) 
add $t0, $t0, $t8 
sw $t0, -52($fp) 
sub $t0, $a0, $t9 
sw $t0, -60($fp) 
lw $t1, r42 
sw $t1, -64($fp) 
lw $t1, -60($fp) 
mul $t0, $t1, $t8 
sw $t0, -68($fp) 
lw $t0, -64($fp) 
lw $t2, -68($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -64($fp) 
lw $t1, -64($fp) 
lw $t4, ($t1) 
sw $t4, -64($fp) 
lw $t0, -64($fp) 
add $t0, $t0, $v1 
sw $t0, -64($fp) 
lw $t1, -52($fp) 
lw $t4, ($t1) 
lw $t2, -64($fp) 
lw $t5, ($t2) 
add $t0, $t4, $t5 
sw $t0, -80($fp) 
sub $t0, $a0, $t9 
sw $t0, -84($fp) 
lw $t1, r42 
sw $t1, -88($fp) 
lw $t1, -84($fp) 
mul $t0, $t1, $t8 
sw $t0, -92($fp) 
lw $t0, -88($fp) 
lw $t2, -92($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -88($fp) 
lw $t1, -88($fp) 
lw $t4, ($t1) 
sw $t4, -88($fp) 
lw $t0, -88($fp) 
add $t0, $t0, 12 
sw $t0, -88($fp) 
lw $t1, -80($fp) 
lw $t2, -88($fp) 
lw $t5, ($t2) 
add $t0, $t1, $t5 
sw $t0, -100($fp) 
lw $t1, -100($fp) 
seq $t0, $t1, 15 
sw $t0, -104($fp) 
lw $t1, -104($fp) 
sw $t1, -44($fp) 
go59: 
lw $t1, -44($fp) 
sw $t1, -36($fp) 
b go53 
if_true54: 
sw $t9, -36($fp) 
go53: 
lw $t0, -36($fp) 
beq $t0, $zero, if_false61 
if_true60: 
seq $t0, $a0, $t6 
sw $t0, -108($fp) 
beq $t0, $zero, if_false65 
if_true63: 
seq $t0, $a1, $t6 
sw $t0, -116($fp) 
lw $t1, -116($fp) 
sw $t1, -112($fp) 
b go64 
if_false65: 
sw $0, -112($fp) 
go64: 
lw $t0, -112($fp) 
beq $t0, $zero, if_false67 
if_true66: 
lw $t1, r42 
sw $t1, -120($fp) 
lw $t0, -120($fp) 
add $t0, $t0, 12 
sw $t0, -120($fp) 
lw $t1, -120($fp) 
lw $t4, ($t1) 
sw $t4, -120($fp) 
lw $t0, -120($fp) 
add $t0, $t0, 12 
sw $t0, -120($fp) 
li $t0, 45 
sw $t0, -136($fp) 
lw $t1, -136($fp) 
sub $t0, $t1, $a2 
sw $t0, -132($fp) 
lw $t0, -120($fp) 
lw $t1, -132($fp) 
sw $t1, ($t0) 
lw $t1, r42 
sw $t1, -144($fp) 
lw $t0, -144($fp) 
add $t0, $t0, $t8 
sw $t0, -144($fp) 
lw $t1, -144($fp) 
lw $t4, ($t1) 
sw $t4, -144($fp) 
lw $t0, -144($fp) 
add $t0, $t0, $t8 
sw $t0, -144($fp) 
lw $t1, r42 
sw $t1, -152($fp) 
lw $t0, -152($fp) 
add $t0, $t0, $t8 
sw $t0, -152($fp) 
lw $t1, -152($fp) 
lw $t4, ($t1) 
sw $t4, -152($fp) 
lw $t0, -152($fp) 
add $t0, $t0, $v1 
sw $t0, -152($fp) 
lw $t1, -144($fp) 
lw $t4, ($t1) 
lw $t2, -152($fp) 
lw $t5, ($t2) 
add $t0, $t4, $t5 
sw $t0, -168($fp) 
lw $t1, r42 
sw $t1, -172($fp) 
lw $t0, -172($fp) 
add $t0, $t0, $t8 
sw $t0, -172($fp) 
lw $t1, -172($fp) 
lw $t4, ($t1) 
sw $t4, -172($fp) 
lw $t0, -172($fp) 
add $t0, $t0, 12 
sw $t0, -172($fp) 
lw $t1, -168($fp) 
lw $t2, -172($fp) 
lw $t5, ($t2) 
add $t0, $t1, $t5 
sw $t0, -184($fp) 
lw $t1, -184($fp) 
sw $t1, -8($fp) 
lw $t1, r42 
sw $t1, -188($fp) 
lw $t0, -188($fp) 
add $t0, $t0, $v1 
sw $t0, -188($fp) 
lw $t1, -188($fp) 
lw $t4, ($t1) 
sw $t4, -188($fp) 
lw $t0, -188($fp) 
add $t0, $t0, $t8 
sw $t0, -188($fp) 
lw $t1, r42 
sw $t1, -196($fp) 
lw $t0, -196($fp) 
add $t0, $t0, $v1 
sw $t0, -196($fp) 
lw $t1, -196($fp) 
lw $t4, ($t1) 
sw $t4, -196($fp) 
lw $t0, -196($fp) 
add $t0, $t0, $v1 
sw $t0, -196($fp) 
lw $t1, -188($fp) 
lw $t4, ($t1) 
lw $t2, -196($fp) 
lw $t5, ($t2) 
add $t0, $t4, $t5 
sw $t0, -212($fp) 
lw $t1, r42 
sw $t1, -216($fp) 
lw $t0, -216($fp) 
add $t0, $t0, $v1 
sw $t0, -216($fp) 
lw $t1, -216($fp) 
lw $t4, ($t1) 
sw $t4, -216($fp) 
lw $t0, -216($fp) 
add $t0, $t0, 12 
sw $t0, -216($fp) 
lw $t1, -212($fp) 
lw $t2, -216($fp) 
lw $t5, ($t2) 
add $t0, $t1, $t5 
sw $t0, -228($fp) 
lw $t1, -228($fp) 
lw $t2, -8($fp) 
seq $t0, $t1, $t2 
sw $t0, -232($fp) 
beq $t0, $zero, if_false71 
if_true69: 
lw $t1, r42 
sw $t1, -240($fp) 
lw $t0, -240($fp) 
add $t0, $t0, 12 
sw $t0, -240($fp) 
lw $t1, -240($fp) 
lw $t4, ($t1) 
sw $t4, -240($fp) 
lw $t0, -240($fp) 
add $t0, $t0, $t8 
sw $t0, -240($fp) 
lw $t1, r42 
sw $t1, -248($fp) 
lw $t0, -248($fp) 
add $t0, $t0, 12 
sw $t0, -248($fp) 
lw $t1, -248($fp) 
lw $t4, ($t1) 
sw $t4, -248($fp) 
lw $t0, -248($fp) 
add $t0, $t0, $v1 
sw $t0, -248($fp) 
lw $t1, -240($fp) 
lw $t4, ($t1) 
lw $t2, -248($fp) 
lw $t5, ($t2) 
add $t0, $t4, $t5 
sw $t0, -264($fp) 
lw $t1, r42 
sw $t1, -268($fp) 
lw $t0, -268($fp) 
add $t0, $t0, 12 
sw $t0, -268($fp) 
lw $t1, -268($fp) 
lw $t4, ($t1) 
sw $t4, -268($fp) 
lw $t0, -268($fp) 
add $t0, $t0, 12 
sw $t0, -268($fp) 
lw $t1, -264($fp) 
lw $t2, -268($fp) 
lw $t5, ($t2) 
add $t0, $t1, $t5 
sw $t0, -280($fp) 
lw $t1, -280($fp) 
lw $t2, -8($fp) 
seq $t0, $t1, $t2 
sw $t0, -284($fp) 
beq $t0, $zero, if_false71 
if_true72: 
lw $t1, r42 
sw $t1, -292($fp) 
lw $t0, -292($fp) 
add $t0, $t0, $t8 
sw $t0, -292($fp) 
lw $t1, -292($fp) 
lw $t4, ($t1) 
sw $t4, -292($fp) 
lw $t0, -292($fp) 
add $t0, $t0, $t8 
sw $t0, -292($fp) 
lw $t1, r42 
sw $t1, -300($fp) 
lw $t0, -300($fp) 
add $t0, $t0, $v1 
sw $t0, -300($fp) 
lw $t1, -300($fp) 
lw $t4, ($t1) 
sw $t4, -300($fp) 
lw $t0, -300($fp) 
add $t0, $t0, $t8 
sw $t0, -300($fp) 
lw $t1, -292($fp) 
lw $t4, ($t1) 
lw $t2, -300($fp) 
lw $t5, ($t2) 
add $t0, $t4, $t5 
sw $t0, -316($fp) 
lw $t1, r42 
sw $t1, -320($fp) 
lw $t0, -320($fp) 
add $t0, $t0, 12 
sw $t0, -320($fp) 
lw $t1, -320($fp) 
lw $t4, ($t1) 
sw $t4, -320($fp) 
lw $t0, -320($fp) 
add $t0, $t0, $t8 
sw $t0, -320($fp) 
lw $t1, -316($fp) 
lw $t2, -320($fp) 
lw $t5, ($t2) 
add $t0, $t1, $t5 
sw $t0, -332($fp) 
lw $t1, -332($fp) 
lw $t2, -8($fp) 
seq $t0, $t1, $t2 
sw $t0, -336($fp) 
beq $t0, $zero, if_false71 
if_true74: 
lw $t1, r42 
sw $t1, -344($fp) 
lw $t0, -344($fp) 
add $t0, $t0, $t8 
sw $t0, -344($fp) 
lw $t1, -344($fp) 
lw $t4, ($t1) 
sw $t4, -344($fp) 
lw $t0, -344($fp) 
add $t0, $t0, $v1 
sw $t0, -344($fp) 
lw $t1, r42 
sw $t1, -352($fp) 
lw $t0, -352($fp) 
add $t0, $t0, $v1 
sw $t0, -352($fp) 
lw $t1, -352($fp) 
lw $t4, ($t1) 
sw $t4, -352($fp) 
lw $t0, -352($fp) 
add $t0, $t0, $v1 
sw $t0, -352($fp) 
lw $t1, -344($fp) 
lw $t4, ($t1) 
lw $t2, -352($fp) 
lw $t5, ($t2) 
add $t0, $t4, $t5 
sw $t0, -368($fp) 
lw $t1, r42 
sw $t1, -372($fp) 
lw $t0, -372($fp) 
add $t0, $t0, 12 
sw $t0, -372($fp) 
lw $t1, -372($fp) 
lw $t4, ($t1) 
sw $t4, -372($fp) 
lw $t0, -372($fp) 
add $t0, $t0, $v1 
sw $t0, -372($fp) 
lw $t1, -368($fp) 
lw $t2, -372($fp) 
lw $t5, ($t2) 
add $t0, $t1, $t5 
sw $t0, -384($fp) 
lw $t1, -384($fp) 
lw $t2, -8($fp) 
seq $t0, $t1, $t2 
sw $t0, -388($fp) 
beq $t0, $zero, if_false71 
if_true76: 
lw $t1, r42 
sw $t1, -396($fp) 
lw $t0, -396($fp) 
add $t0, $t0, $t8 
sw $t0, -396($fp) 
lw $t1, -396($fp) 
lw $t4, ($t1) 
sw $t4, -396($fp) 
lw $t0, -396($fp) 
add $t0, $t0, 12 
sw $t0, -396($fp) 
lw $t1, r42 
sw $t1, -404($fp) 
lw $t0, -404($fp) 
add $t0, $t0, $v1 
sw $t0, -404($fp) 
lw $t1, -404($fp) 
lw $t4, ($t1) 
sw $t4, -404($fp) 
lw $t0, -404($fp) 
add $t0, $t0, 12 
sw $t0, -404($fp) 
lw $t1, -396($fp) 
lw $t4, ($t1) 
lw $t2, -404($fp) 
lw $t5, ($t2) 
add $t0, $t4, $t5 
sw $t0, -420($fp) 
lw $t1, r42 
sw $t1, -424($fp) 
lw $t0, -424($fp) 
add $t0, $t0, 12 
sw $t0, -424($fp) 
lw $t1, -424($fp) 
lw $t4, ($t1) 
sw $t4, -424($fp) 
lw $t0, -424($fp) 
add $t0, $t0, 12 
sw $t0, -424($fp) 
lw $t1, -420($fp) 
lw $t2, -424($fp) 
lw $t5, ($t2) 
add $t0, $t1, $t5 
sw $t0, -436($fp) 
lw $t1, -436($fp) 
lw $t2, -8($fp) 
seq $t0, $t1, $t2 
sw $t0, -440($fp) 
beq $t0, $zero, if_false71 
if_true78: 
lw $t1, r42 
sw $t1, -448($fp) 
lw $t0, -448($fp) 
add $t0, $t0, $t8 
sw $t0, -448($fp) 
lw $t1, -448($fp) 
lw $t4, ($t1) 
sw $t4, -448($fp) 
lw $t0, -448($fp) 
add $t0, $t0, $t8 
sw $t0, -448($fp) 
lw $t1, r42 
sw $t1, -456($fp) 
lw $t0, -456($fp) 
add $t0, $t0, $v1 
sw $t0, -456($fp) 
lw $t1, -456($fp) 
lw $t4, ($t1) 
sw $t4, -456($fp) 
lw $t0, -456($fp) 
add $t0, $t0, $v1 
sw $t0, -456($fp) 
lw $t1, -448($fp) 
lw $t4, ($t1) 
lw $t2, -456($fp) 
lw $t5, ($t2) 
add $t0, $t4, $t5 
sw $t0, -472($fp) 
lw $t1, r42 
sw $t1, -476($fp) 
lw $t0, -476($fp) 
add $t0, $t0, 12 
sw $t0, -476($fp) 
lw $t1, -476($fp) 
lw $t4, ($t1) 
sw $t4, -476($fp) 
lw $t0, -476($fp) 
add $t0, $t0, 12 
sw $t0, -476($fp) 
lw $t1, -472($fp) 
lw $t2, -476($fp) 
lw $t5, ($t2) 
add $t0, $t1, $t5 
sw $t0, -488($fp) 
lw $t1, -488($fp) 
lw $t2, -8($fp) 
seq $t0, $t1, $t2 
sw $t0, -492($fp) 
beq $t0, $zero, if_false71 
if_true80: 
lw $t1, r42 
sw $t1, -500($fp) 
lw $t0, -500($fp) 
add $t0, $t0, 12 
sw $t0, -500($fp) 
lw $t1, -500($fp) 
lw $t4, ($t1) 
sw $t4, -500($fp) 
lw $t0, -500($fp) 
add $t0, $t0, $t8 
sw $t0, -500($fp) 
lw $t1, r42 
sw $t1, -508($fp) 
lw $t0, -508($fp) 
add $t0, $t0, $v1 
sw $t0, -508($fp) 
lw $t1, -508($fp) 
lw $t4, ($t1) 
sw $t4, -508($fp) 
lw $t0, -508($fp) 
add $t0, $t0, $v1 
sw $t0, -508($fp) 
lw $t1, -500($fp) 
lw $t4, ($t1) 
lw $t2, -508($fp) 
lw $t5, ($t2) 
add $t0, $t4, $t5 
sw $t0, -524($fp) 
lw $t1, r42 
sw $t1, -528($fp) 
lw $t0, -528($fp) 
add $t0, $t0, $t8 
sw $t0, -528($fp) 
lw $t1, -528($fp) 
lw $t4, ($t1) 
sw $t4, -528($fp) 
lw $t0, -528($fp) 
add $t0, $t0, 12 
sw $t0, -528($fp) 
lw $t1, -524($fp) 
lw $t2, -528($fp) 
lw $t5, ($t2) 
add $t0, $t1, $t5 
sw $t0, -540($fp) 
lw $t1, -540($fp) 
lw $t2, -8($fp) 
seq $t0, $t1, $t2 
sw $t0, -544($fp) 
lw $t1, -544($fp) 
sw $t1, -496($fp) 
go81: 
lw $t1, -496($fp) 
sw $t1, -444($fp) 
go79: 
lw $t1, -444($fp) 
sw $t1, -392($fp) 
go77: 
lw $t1, -392($fp) 
sw $t1, -340($fp) 
go75: 
lw $t1, -340($fp) 
sw $t1, -288($fp) 
go73: 
lw $t1, -288($fp) 
sw $t1, -236($fp) 
b go70 
if_false71: 
sw $0, -236($fp) 
go70: 
lw $t0, -236($fp) 
beq $t0, $zero, if_false83 
if_true82: 
lw $t1, r45 
sw $t1, -548($fp) 
lw $t0, -548($fp) 
add $t0, $t0, $t8 
sw $t0, -548($fp) 
lw $t1, r45 
sw $t1, -556($fp) 
lw $t0, -556($fp) 
add $t0, $t0, $t8 
sw $t0, -556($fp) 
lw $t1, -556($fp) 
lw $t4, ($t1) 
add $t0, $t4, $t9 
sw $t0, -568($fp) 
lw $t0, -548($fp) 
lw $t1, -568($fp) 
sw $t1, ($t0) 
sw $0, -12($fp) 
lw $t1, -12($fp) 
bgt $t1, $t6, if_false86 
if_true85: 
sw $0, -16($fp) 
lw $t1, -16($fp) 
bgt $t1, $t6, if_false89 
if_true88: 
lw $t1, r42 
sw $t1, -584($fp) 
lw $t1, -12($fp) 
mul $t0, $t1, $t8 
sw $t0, -588($fp) 
lw $t0, -584($fp) 
lw $t2, -588($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -584($fp) 
lw $t1, -584($fp) 
lw $t4, ($t1) 
sw $t4, -584($fp) 
lw $t1, -16($fp) 
mul $t0, $t1, $t8 
sw $t0, -588($fp) 
lw $t0, -584($fp) 
lw $t2, -588($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -584($fp) 
lw $t3, ($t0) 
move $t7, $a0 
move $a0, $t3 
li $v0, 1 
syscall  
move $a0, $t7 
li $v0, 4 
move $t7, $a0 
la $a0, s13 
syscall  
move $a0, $t7 
jump90: 
lw $t1, -16($fp) 
sw $t1, -596($fp) 
lw $t0, -16($fp) 
add $t0, $t0, $t9 
sw $t0, -16($fp) 
lw $t1, -16($fp) 
sle $t0, $t1, $t6 
sw $t0, -600($fp) 
bne $t0, $zero, if_true88 
if_false89: 
li $v0, 4 
move $t7, $a0 
la $a0, s14 
syscall  
move $a0, $t7 
jump87: 
lw $t1, -12($fp) 
sw $t1, -604($fp) 
lw $t0, -12($fp) 
add $t0, $t0, $t9 
sw $t0, -12($fp) 
lw $t1, -12($fp) 
sle $t0, $t1, $t6 
sw $t0, -608($fp) 
bne $t0, $zero, if_true85 
if_false86: 
li $v0, 4 
move $t7, $a0 
la $a0, s14 
syscall  
move $a0, $t7 
if_false83: 
b if_false61 
if_false67: 
seq $t0, $a1, $t6 
sw $t0, -612($fp) 
beq $t0, $zero, if_false92 
if_true91: 
lw $t1, r42 
sw $t1, -616($fp) 
mul $t0, $a0, $t8 
sw $t0, -620($fp) 
lw $t0, -616($fp) 
lw $t2, -620($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -616($fp) 
lw $t1, -616($fp) 
lw $t4, ($t1) 
sw $t4, -616($fp) 
mul $t0, $a1, $t8 
sw $t0, -620($fp) 
lw $t0, -616($fp) 
lw $t2, -620($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -616($fp) 
lw $t1, r42 
sw $t1, -624($fp) 
mul $t0, $a0, $t8 
sw $t0, -628($fp) 
lw $t0, -624($fp) 
lw $t2, -628($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -624($fp) 
lw $t1, -624($fp) 
lw $t4, ($t1) 
sw $t4, -624($fp) 
lw $t0, -624($fp) 
add $t0, $t0, $t8 
sw $t0, -624($fp) 
li $t0, 15 
sw $t0, -640($fp) 
lw $t1, -640($fp) 
lw $t2, -624($fp) 
lw $t5, ($t2) 
sub $t0, $t1, $t5 
sw $t0, -636($fp) 
lw $t1, r42 
sw $t1, -644($fp) 
mul $t0, $a0, $t8 
sw $t0, -648($fp) 
lw $t0, -644($fp) 
lw $t2, -648($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -644($fp) 
lw $t1, -644($fp) 
lw $t4, ($t1) 
sw $t4, -644($fp) 
lw $t0, -644($fp) 
add $t0, $t0, $v1 
sw $t0, -644($fp) 
lw $t1, -636($fp) 
lw $t2, -644($fp) 
lw $t5, ($t2) 
sub $t0, $t1, $t5 
sw $t0, -656($fp) 
lw $t0, -616($fp) 
lw $t1, -656($fp) 
sw $t1, ($t0) 
lw $t1, r42 
sw $t1, -664($fp) 
mul $t0, $a0, $t8 
sw $t0, -668($fp) 
lw $t0, -664($fp) 
lw $t2, -668($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -664($fp) 
lw $t1, -664($fp) 
lw $t4, ($t1) 
sw $t4, -664($fp) 
mul $t0, $a1, $t8 
sw $t0, -668($fp) 
lw $t0, -664($fp) 
lw $t2, -668($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -664($fp) 
lw $t1, -664($fp) 
lw $t4, ($t1) 
sgt $t0, $t4, $0 
sw $t0, -676($fp) 
beq $t0, $zero, if_false96 
if_true94: 
lw $t1, r42 
sw $t1, -684($fp) 
mul $t0, $a0, $t8 
sw $t0, -688($fp) 
lw $t0, -684($fp) 
lw $t2, -688($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -684($fp) 
lw $t1, -684($fp) 
lw $t4, ($t1) 
sw $t4, -684($fp) 
mul $t0, $a1, $t8 
sw $t0, -688($fp) 
lw $t0, -684($fp) 
lw $t2, -688($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -684($fp) 
lw $t1, -684($fp) 
lw $t4, ($t1) 
slt $t0, $t4, 10 
sw $t0, -696($fp) 
beq $t0, $zero, if_false96 
if_true97: 
lw $t1, r42 
sw $t1, -704($fp) 
mul $t0, $a0, $t8 
sw $t0, -708($fp) 
lw $t0, -704($fp) 
lw $t2, -708($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -704($fp) 
lw $t1, -704($fp) 
lw $t4, ($t1) 
sw $t4, -704($fp) 
mul $t0, $a1, $t8 
sw $t0, -708($fp) 
lw $t0, -704($fp) 
lw $t2, -708($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -704($fp) 
lw $t1, r43 
sw $t1, -716($fp) 
lw $t1, -704($fp) 
lw $t4, ($t1) 
mul $t0, $t4, $t8 
sw $t0, -720($fp) 
lw $t0, -716($fp) 
lw $t2, -720($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -716($fp) 
lw $t1, -716($fp) 
lw $t4, ($t1) 
seq $t0, $t4, $0 
sw $t0, -728($fp) 
lw $t1, -728($fp) 
sw $t1, -700($fp) 
go98: 
lw $t1, -700($fp) 
sw $t1, -680($fp) 
b go95 
if_false96: 
sw $0, -680($fp) 
go95: 
lw $t0, -680($fp) 
beq $t0, $zero, if_false100 
if_true99: 
lw $t1, r42 
sw $t1, -732($fp) 
mul $t0, $a0, $t8 
sw $t0, -736($fp) 
lw $t0, -732($fp) 
lw $t2, -736($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -732($fp) 
lw $t1, -732($fp) 
lw $t4, ($t1) 
sw $t4, -732($fp) 
mul $t0, $a1, $t8 
sw $t0, -736($fp) 
lw $t0, -732($fp) 
lw $t2, -736($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -732($fp) 
lw $t1, r43 
sw $t1, -744($fp) 
lw $t1, -732($fp) 
lw $t4, ($t1) 
mul $t0, $t4, $t8 
sw $t0, -748($fp) 
lw $t0, -744($fp) 
lw $t2, -748($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -744($fp) 
sw $t9, ($t0) 
seq $t0, $a1, $t6 
sw $t0, -756($fp) 
beq $t0, $zero, if_false103 
if_true102: 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
sw $a2, -8($sp) 
add $t0, $a0, $t9 
sw $t0, -760($fp) 
lw $t1, r42 
sw $t1, -764($fp) 
mul $t0, $a0, $t8 
sw $t0, -768($fp) 
lw $t0, -764($fp) 
lw $t2, -768($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -764($fp) 
lw $t1, -764($fp) 
lw $t4, ($t1) 
sw $t4, -764($fp) 
mul $t0, $a1, $t8 
sw $t0, -768($fp) 
lw $t0, -764($fp) 
lw $t2, -768($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -764($fp) 
lw $t2, -764($fp) 
lw $t5, ($t2) 
add $t0, $a2, $t5 
sw $t0, -776($fp) 
lw $t1, -760($fp) 
move $a0, $t1 
li $a1, 0 
lw $t1, -776($fp) 
move $a2, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal search51 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $a2, 8($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -788($fp) 
b go_on104 
if_false103: 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
sw $a2, -8($sp) 
add $t0, $a1, $t9 
sw $t0, -792($fp) 
lw $t1, r42 
sw $t1, -796($fp) 
mul $t0, $a0, $t8 
sw $t0, -800($fp) 
lw $t0, -796($fp) 
lw $t2, -800($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -796($fp) 
lw $t1, -796($fp) 
lw $t4, ($t1) 
sw $t4, -796($fp) 
mul $t0, $a1, $t8 
sw $t0, -800($fp) 
lw $t0, -796($fp) 
lw $t2, -800($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -796($fp) 
lw $t2, -796($fp) 
lw $t5, ($t2) 
add $t0, $a2, $t5 
sw $t0, -808($fp) 
lw $t0, 0($sp) 
sw $t0, -812($fp) 
lw $t1, -812($fp) 
move $a0, $t1 
lw $t1, -792($fp) 
move $a1, $t1 
lw $t1, -808($fp) 
move $a2, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal search51 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $a2, 8($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -824($fp) 
go_on104: 
lw $t1, r42 
sw $t1, -828($fp) 
mul $t0, $a0, $t8 
sw $t0, -832($fp) 
lw $t0, -828($fp) 
lw $t2, -832($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -828($fp) 
lw $t1, -828($fp) 
lw $t4, ($t1) 
sw $t4, -828($fp) 
mul $t0, $a1, $t8 
sw $t0, -832($fp) 
lw $t0, -828($fp) 
lw $t2, -832($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -828($fp) 
lw $t1, r43 
sw $t1, -840($fp) 
lw $t1, -828($fp) 
lw $t4, ($t1) 
mul $t0, $t4, $t8 
sw $t0, -844($fp) 
lw $t0, -840($fp) 
lw $t2, -844($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -840($fp) 
sw $0, ($t0) 
if_false100: 
b if_false61 
if_false92: 
sw $t9, -12($fp) 
lw $t1, -12($fp) 
bgt $t1, 9, if_false61 
if_true105: 
lw $t1, r43 
sw $t1, -856($fp) 
lw $t1, -12($fp) 
mul $t0, $t1, $t8 
sw $t0, -860($fp) 
lw $t0, -856($fp) 
lw $t2, -860($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -856($fp) 
lw $t1, -856($fp) 
lw $t4, ($t1) 
seq $t0, $t4, $0 
sw $t0, -868($fp) 
beq $t0, $zero, jump107 
if_true108: 
lw $t1, r43 
sw $t1, -872($fp) 
lw $t1, -12($fp) 
mul $t0, $t1, $t8 
sw $t0, -876($fp) 
lw $t0, -872($fp) 
lw $t2, -876($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -872($fp) 
sw $t9, ($t0) 
lw $t1, r42 
sw $t1, -884($fp) 
mul $t0, $a0, $t8 
sw $t0, -888($fp) 
lw $t0, -884($fp) 
lw $t2, -888($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -884($fp) 
lw $t1, -884($fp) 
lw $t4, ($t1) 
sw $t4, -884($fp) 
mul $t0, $a1, $t8 
sw $t0, -888($fp) 
lw $t0, -884($fp) 
lw $t2, -888($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -884($fp) 
lw $t1, -12($fp) 
sw $t1, ($t0) 
seq $t0, $a1, $t6 
sw $t0, -896($fp) 
beq $t0, $zero, if_false112 
if_true111: 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
sw $a2, -8($sp) 
add $t0, $a0, $t9 
sw $t0, -900($fp) 
lw $t2, -12($fp) 
add $t0, $a2, $t2 
sw $t0, -904($fp) 
lw $t1, -900($fp) 
move $a0, $t1 
li $a1, 0 
lw $t1, -904($fp) 
move $a2, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal search51 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $a2, 8($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -916($fp) 
b go_on113 
if_false112: 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
sw $a2, -8($sp) 
add $t0, $a1, $t9 
sw $t0, -920($fp) 
lw $t2, -12($fp) 
add $t0, $a2, $t2 
sw $t0, -924($fp) 
lw $t0, 0($sp) 
sw $t0, -928($fp) 
lw $t1, -928($fp) 
move $a0, $t1 
lw $t1, -920($fp) 
move $a1, $t1 
lw $t1, -924($fp) 
move $a2, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal search51 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $a2, 8($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -940($fp) 
go_on113: 
lw $t1, r42 
sw $t1, -944($fp) 
mul $t0, $a0, $t8 
sw $t0, -948($fp) 
lw $t0, -944($fp) 
lw $t2, -948($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -944($fp) 
lw $t1, -944($fp) 
lw $t4, ($t1) 
sw $t4, -944($fp) 
mul $t0, $a1, $t8 
sw $t0, -948($fp) 
lw $t0, -944($fp) 
lw $t2, -948($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -944($fp) 
sw $0, ($t0) 
lw $t1, r43 
sw $t1, -956($fp) 
lw $t1, -12($fp) 
mul $t0, $t1, $t8 
sw $t0, -960($fp) 
lw $t0, -956($fp) 
lw $t2, -960($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -956($fp) 
sw $0, ($t0) 
jump107: 
lw $t1, -12($fp) 
sw $t1, -968($fp) 
lw $t0, -12($fp) 
add $t0, $t0, $t9 
sw $t0, -12($fp) 
lw $t1, -12($fp) 
sle $t0, $t1, 9 
sw $t0, -972($fp) 
bne $t0, $zero, if_true105 
beq $t0, $zero, if_false61 
if_false61: 
jr $ra 
main: 
li $s6, 16 
li $t9, 1 
li $t8, 4 
li $t6, 2 
li $v1, 8 
li $v0, 9 
move $t7, $a0 
li $a0, 44 
syscall  
move $a0, $t7 
li $t1, 10 
sw $t1, 0($v0) 
sw $v0, r44 
lw $t0, r43 
lw $t1, r44 
sw $t1, r43 
li $v0, 9 
move $t7, $a0 
li $a0, 8 
syscall  
move $a0, $t7 
sw $t9, 0($v0) 
sw $v0, r46 
lw $t0, r45 
lw $t1, r46 
sw $t1, r45 
move $fp, $sp 
add $sp, $sp, -388 
sw $a0, 0($sp) 
li $a0, 3 
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
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
sw $a2, -8($sp) 
li $a0, 0 
li $a1, 0 
li $a2, 0 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal search51 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $a2, 8($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -4($fp) 
lw $t1, r45 
sw $t1, -8($fp) 
lw $t0, -8($fp) 
add $t0, $t0, $t8 
sw $t0, -8($fp) 
lw $t3, ($t0) 
move $t7, $a0 
move $a0, $t3 
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
