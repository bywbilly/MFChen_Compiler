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
s13:	.asciiz	" O"
s13ln:	.asciiz	" O\n"
s14:	.asciiz	" ."
s14ln:	.asciiz	" .\n"
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
printBoard44: 
sw $0, -8($fp) 
lw $t1, -8($fp) 
lw $t2, r42 
bge $t1, $t2, if_false46 
if_true45: 
sw $0, -12($fp) 
lw $t1, -12($fp) 
lw $t2, r42 
bge $t1, $t2, if_false49 
if_true48: 
lw $t1, r45 
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
beq $t0, $zero, if_false52 
if_true51: 
li $v0, 4 
move $t7, $a0 
la $a0, s13 
syscall  
move $a0, $t7 
b jump50 
if_false52: 
li $v0, 4 
move $t7, $a0 
la $a0, s14 
syscall  
move $a0, $t7 
jump50: 
lw $t1, -12($fp) 
sw $t1, -44($fp) 
lw $t0, -12($fp) 
add $t0, $t0, $t9 
sw $t0, -12($fp) 
lw $t1, -12($fp) 
lw $t2, r42 
slt $t0, $t1, $t2 
sw $t0, -48($fp) 
bne $t0, $zero, if_true48 
if_false49: 
li $v0, 4 
move $t7, $a0 
la $a0, s0ln 
syscall  
move $a0, $t7 
jump47: 
lw $t1, -8($fp) 
sw $t1, -52($fp) 
lw $t0, -8($fp) 
add $t0, $t0, $t9 
sw $t0, -8($fp) 
lw $t1, -8($fp) 
lw $t2, r42 
slt $t0, $t1, $t2 
sw $t0, -56($fp) 
bne $t0, $zero, if_true45 
if_false46: 
li $v0, 4 
move $t7, $a0 
la $a0, s0ln 
syscall  
move $a0, $t7 
jr $ra 
search54: 
lw $t2, r42 
seq $t0, $a0, $t2 
sw $t0, -8($fp) 
beq $t0, $zero, if_false56 
if_true55: 
add $sp, $sp, -388 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal printBoard44 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -12($fp) 
b go_on57 
if_false56: 
sw $0, -16($fp) 
lw $t1, -16($fp) 
lw $t2, r42 
bge $t1, $t2, go_on57 
if_true58: 
lw $t1, r43 
sw $t1, -24($fp) 
lw $t1, -16($fp) 
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
beq $t0, $zero, if_false63 
if_true61: 
lw $t1, -16($fp) 
add $t0, $t1, $a0 
sw $t0, -44($fp) 
lw $t1, r47 
sw $t1, -48($fp) 
lw $t0, -48($fp) 
add $t0, $t0, $t8 
sw $t0, -48($fp) 
lw $t1, -48($fp) 
lw $t4, ($t1) 
sw $t4, -48($fp) 
lw $t1, -44($fp) 
mul $t0, $t1, $t8 
sw $t0, -52($fp) 
lw $t0, -48($fp) 
lw $t2, -52($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -48($fp) 
lw $t1, -48($fp) 
lw $t4, ($t1) 
seq $t0, $t4, $0 
sw $t0, -60($fp) 
beq $t0, $zero, if_false63 
if_true64: 
lw $t1, -16($fp) 
lw $t2, r42 
add $t0, $t1, $t2 
sw $t0, -68($fp) 
lw $t1, -68($fp) 
sub $t0, $t1, $t9 
sw $t0, -72($fp) 
lw $t1, -72($fp) 
sub $t0, $t1, $a0 
sw $t0, -76($fp) 
lw $t1, r47 
sw $t1, -80($fp) 
lw $t0, -80($fp) 
add $t0, $t0, $v1 
sw $t0, -80($fp) 
lw $t1, -80($fp) 
lw $t4, ($t1) 
sw $t4, -80($fp) 
lw $t1, -76($fp) 
mul $t0, $t1, $t8 
sw $t0, -84($fp) 
lw $t0, -80($fp) 
lw $t2, -84($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -80($fp) 
lw $t1, -80($fp) 
lw $t4, ($t1) 
seq $t0, $t4, $0 
sw $t0, -92($fp) 
lw $t1, -92($fp) 
sw $t1, -64($fp) 
go65: 
lw $t1, -64($fp) 
sw $t1, -40($fp) 
b go62 
if_false63: 
sw $0, -40($fp) 
go62: 
lw $t0, -40($fp) 
beq $t0, $zero, jump60 
if_true66: 
lw $t1, r43 
sw $t1, -96($fp) 
lw $t1, -16($fp) 
mul $t0, $t1, $t8 
sw $t0, -100($fp) 
lw $t0, -96($fp) 
lw $t2, -100($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -96($fp) 
lw $t1, -16($fp) 
add $t0, $t1, $a0 
sw $t0, -104($fp) 
lw $t1, r47 
sw $t1, -108($fp) 
lw $t0, -108($fp) 
add $t0, $t0, $t8 
sw $t0, -108($fp) 
lw $t1, -108($fp) 
lw $t4, ($t1) 
sw $t4, -108($fp) 
lw $t1, -104($fp) 
mul $t0, $t1, $t8 
sw $t0, -112($fp) 
lw $t0, -108($fp) 
lw $t2, -112($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -108($fp) 
lw $t1, -16($fp) 
lw $t2, r42 
add $t0, $t1, $t2 
sw $t0, -116($fp) 
lw $t1, -116($fp) 
sub $t0, $t1, $t9 
sw $t0, -120($fp) 
lw $t1, -120($fp) 
sub $t0, $t1, $a0 
sw $t0, -124($fp) 
lw $t1, r47 
sw $t1, -128($fp) 
lw $t0, -128($fp) 
add $t0, $t0, $v1 
sw $t0, -128($fp) 
lw $t1, -128($fp) 
lw $t4, ($t1) 
sw $t4, -128($fp) 
lw $t1, -124($fp) 
mul $t0, $t1, $t8 
sw $t0, -132($fp) 
lw $t0, -128($fp) 
lw $t2, -132($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -128($fp) 
sw $t9, ($t0) 
lw $t0, -108($fp) 
lw $t1, -128($fp) 
lw $t4, ($t1) 
sw $t4, ($t0) 
lw $t0, -96($fp) 
lw $t1, -108($fp) 
lw $t4, ($t1) 
sw $t4, ($t0) 
lw $t1, r45 
sw $t1, -148($fp) 
mul $t0, $a0, $t8 
sw $t0, -152($fp) 
lw $t0, -148($fp) 
lw $t2, -152($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -148($fp) 
lw $t1, -16($fp) 
sw $t1, ($t0) 
add $sp, $sp, -388 
sw $a0, 0($sp) 
add $t0, $a0, $t9 
sw $t0, -160($fp) 
lw $t1, -160($fp) 
move $a0, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal search54 
lw $a0, 16($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -168($fp) 
lw $t1, r43 
sw $t1, -172($fp) 
lw $t1, -16($fp) 
mul $t0, $t1, $t8 
sw $t0, -176($fp) 
lw $t0, -172($fp) 
lw $t2, -176($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -172($fp) 
lw $t1, -16($fp) 
add $t0, $t1, $a0 
sw $t0, -180($fp) 
lw $t1, r47 
sw $t1, -184($fp) 
lw $t0, -184($fp) 
add $t0, $t0, $t8 
sw $t0, -184($fp) 
lw $t1, -184($fp) 
lw $t4, ($t1) 
sw $t4, -184($fp) 
lw $t1, -180($fp) 
mul $t0, $t1, $t8 
sw $t0, -188($fp) 
lw $t0, -184($fp) 
lw $t2, -188($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -184($fp) 
lw $t1, -16($fp) 
lw $t2, r42 
add $t0, $t1, $t2 
sw $t0, -192($fp) 
lw $t1, -192($fp) 
sub $t0, $t1, $t9 
sw $t0, -196($fp) 
lw $t1, -196($fp) 
sub $t0, $t1, $a0 
sw $t0, -200($fp) 
lw $t1, r47 
sw $t1, -204($fp) 
lw $t0, -204($fp) 
add $t0, $t0, $v1 
sw $t0, -204($fp) 
lw $t1, -204($fp) 
lw $t4, ($t1) 
sw $t4, -204($fp) 
lw $t1, -200($fp) 
mul $t0, $t1, $t8 
sw $t0, -208($fp) 
lw $t0, -204($fp) 
lw $t2, -208($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -204($fp) 
sw $0, ($t0) 
lw $t0, -184($fp) 
lw $t1, -204($fp) 
lw $t4, ($t1) 
sw $t4, ($t0) 
lw $t0, -172($fp) 
lw $t1, -184($fp) 
lw $t4, ($t1) 
sw $t4, ($t0) 
jump60: 
lw $t1, -16($fp) 
sw $t1, -224($fp) 
lw $t0, -16($fp) 
add $t0, $t0, $t9 
sw $t0, -16($fp) 
lw $t1, -16($fp) 
lw $t2, r42 
slt $t0, $t1, $t2 
sw $t0, -228($fp) 
bne $t0, $zero, if_true58 
beq $t0, $zero, go_on57 
go_on57: 
jr $ra 
main: 
li $s6, 16 
li $t9, 1 
li $t8, 4 
li $t6, 2 
li $v1, 8 
sw $v1, r42 
li $v0, 9 
move $t7, $a0 
li $a0, 36 
syscall  
move $a0, $t7 
sw $v1, 0($v0) 
sw $v0, r44 
lw $t0, r43 
lw $t1, r44 
sw $t1, r43 
li $v0, 9 
move $t7, $a0 
li $a0, 36 
syscall  
move $a0, $t7 
sw $v1, 0($v0) 
sw $v0, r46 
lw $t0, r45 
lw $t1, r46 
sw $t1, r45 
li $v0, 9 
move $t7, $a0 
li $a0, 12 
syscall  
move $a0, $t7 
sw $t6, 0($v0) 
sw $v0, r48 
lw $t0, r47 
lw $t1, r48 
sw $t1, r47 
move $fp, $sp 
sw $0, 0($fp) 
lw $t1, 0($fp) 
bge $t1, $t6, if_false71 
if_true70: 
lw $t1, r47 
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
jump72: 
lw $t1, 0($fp) 
sw $t1, -24($fp) 
lw $t0, 0($fp) 
add $t0, $t0, $t9 
sw $t0, 0($fp) 
lw $t1, 0($fp) 
slt $t0, $t1, $t6 
sw $t0, -28($fp) 
bne $t0, $zero, if_true70 
if_false71: 
add $sp, $sp, -388 
sw $a0, 0($sp) 
li $a0, 0 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal search54 
lw $a0, 16($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -32($fp) 
li $v0, 0 
jr $ra 
