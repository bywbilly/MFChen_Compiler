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
r54:	.space	4
r55:	.space	4
r56:	.space	4
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
s15:	.asciiz	"Total: "
s15ln:	.asciiz	"Total: \n"
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
lw $t0, r56 
lw $t1, -8($fp) 
sw $t1, r56 
sw $0, r44 
lw $t1, r44 
bge $t1, $a0, if_false46 
if_true45: 
lw $t1, r56 
sw $t1, -24($fp) 
lw $t1, r44 
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
sw $0, r45 
lw $t1, r45 
bge $t1, $a0, jump47 
if_true48: 
lw $t1, r56 
sw $t1, -48($fp) 
lw $t1, r44 
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
lw $t1, r45 
mul $t0, $t1, $t8 
sw $t0, -52($fp) 
lw $t0, -48($fp) 
lw $t2, -52($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -48($fp) 
sw $0, ($t0) 
jump50: 
lw $t1, r45 
sw $t1, -60($fp) 
lw $t0, r45 
add $t0, $t0, $t9 
sw $t0, r45 
lw $t1, r45 
slt $t0, $t1, $a0 
sw $t0, -64($fp) 
bne $t0, $zero, if_true48 
beq $t0, $zero, jump47 
jump47: 
lw $t1, r44 
sw $t1, -68($fp) 
lw $t0, r44 
add $t0, $t0, $t9 
sw $t0, r44 
lw $t1, r44 
slt $t0, $t1, $a0 
sw $t0, -72($fp) 
bne $t0, $zero, if_true45 
if_false46: 
jr $ra 
getPrime51: 
sw $t6, -8($fp) 
sw $t6, -12($fp) 
lw $t1, -12($fp) 
bgt $t1, $a0, if_false53 
if_true52: 
lw $t1, r48 
sw $t1, -20($fp) 
lw $t1, -12($fp) 
mul $t0, $t1, $t8 
sw $t0, -24($fp) 
lw $t0, -20($fp) 
lw $t2, -24($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -20($fp) 
lw $t1, -20($fp) 
lw $t4, ($t1) 
seq $t0, $t4, $t9 
sw $t0, -32($fp) 
beq $t0, $zero, if_false56 
if_true55: 
lw $t1, r54 
sw $t1, -36($fp) 
lw $t0, -36($fp) 
add $t0, $t0, $t8 
sw $t0, -36($fp) 
lw $t1, r54 
sw $t1, -44($fp) 
lw $t0, -44($fp) 
add $t0, $t0, $t8 
sw $t0, -44($fp) 
lw $t1, -44($fp) 
lw $t4, ($t1) 
add $t0, $t4, $t9 
sw $t0, -56($fp) 
lw $t0, -36($fp) 
lw $t1, -56($fp) 
sw $t1, ($t0) 
lw $t1, r54 
sw $t1, -64($fp) 
lw $t0, -64($fp) 
add $t0, $t0, $t8 
sw $t0, -64($fp) 
lw $t1, r50 
sw $t1, -76($fp) 
lw $t1, -64($fp) 
lw $t4, ($t1) 
mul $t0, $t4, $t8 
sw $t0, -80($fp) 
lw $t0, -76($fp) 
lw $t2, -80($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -76($fp) 
lw $t1, -12($fp) 
sw $t1, ($t0) 
lw $t1, r52 
sw $t1, -88($fp) 
lw $t1, -12($fp) 
mul $t0, $t1, $t8 
sw $t0, -92($fp) 
lw $t0, -88($fp) 
lw $t2, -92($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -88($fp) 
lw $t1, r54 
sw $t1, -96($fp) 
lw $t0, -96($fp) 
add $t0, $t0, $t8 
sw $t0, -96($fp) 
lw $t0, -88($fp) 
lw $t1, -96($fp) 
lw $t4, ($t1) 
sw $t4, ($t0) 
if_false56: 
lw $t1, -12($fp) 
lw $t2, -8($fp) 
mul $t0, $t1, $t2 
sw $t0, -112($fp) 
lw $t1, -112($fp) 
bgt $t1, $a0, if_false59 
if_true58: 
lw $t1, -12($fp) 
lw $t2, -8($fp) 
mul $t0, $t1, $t2 
sw $t0, -120($fp) 
lw $t1, r48 
sw $t1, -124($fp) 
lw $t1, -120($fp) 
mul $t0, $t1, $t8 
sw $t0, -128($fp) 
lw $t0, -124($fp) 
lw $t2, -128($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -124($fp) 
sw $0, ($t0) 
lw $t1, -8($fp) 
add $t0, $t1, $t9 
sw $t0, -136($fp) 
lw $t1, -136($fp) 
sw $t1, -8($fp) 
jump60: 
lw $t1, -12($fp) 
lw $t2, -8($fp) 
mul $t0, $t1, $t2 
sw $t0, -140($fp) 
lw $t1, -140($fp) 
sle $t0, $t1, $a0 
sw $t0, -144($fp) 
bne $t0, $zero, if_true58 
if_false59: 
sw $t6, -8($fp) 
jump54: 
lw $t1, -12($fp) 
add $t0, $t1, $t9 
sw $t0, -148($fp) 
lw $t1, -148($fp) 
sw $t1, -12($fp) 
sle $t0, $t1, $a0 
sw $t0, -152($fp) 
bne $t0, $zero, if_true52 
if_false53: 
jr $ra 
getResult61: 
lw $t1, r56 
sw $t1, -16($fp) 
mul $t0, $a1, $t8 
sw $t0, -20($fp) 
lw $t0, -16($fp) 
lw $t2, -20($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -16($fp) 
lw $t1, -16($fp) 
lw $t4, ($t1) 
sw $t4, -16($fp) 
mul $t0, $a2, $t8 
sw $t0, -20($fp) 
lw $t0, -16($fp) 
lw $t2, -20($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -16($fp) 
lw $t1, -16($fp) 
lw $t4, ($t1) 
seq $t0, $t4, -1 
sw $t0, -28($fp) 
beq $t0, $zero, if_false63 
if_true62: 
lw $t1, r50 
sw $t1, -32($fp) 
mul $t0, $a2, $t8 
sw $t0, -36($fp) 
lw $t0, -32($fp) 
lw $t2, -36($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -32($fp) 
lw $t1, -32($fp) 
lw $t4, ($t1) 
mul $t0, $t4, $t6 
sw $t0, -44($fp) 
lw $t1, r50 
sw $t1, -48($fp) 
mul $t0, $a1, $t8 
sw $t0, -52($fp) 
lw $t0, -48($fp) 
lw $t2, -52($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -48($fp) 
lw $t1, -44($fp) 
lw $t2, -48($fp) 
lw $t5, ($t2) 
sub $t0, $t1, $t5 
sw $t0, -60($fp) 
lw $t1, -60($fp) 
sle $t0, $t1, $a0 
sw $t0, -64($fp) 
beq $t0, $zero, if_false63 
if_true65: 
lw $t1, r50 
sw $t1, -68($fp) 
mul $t0, $a2, $t8 
sw $t0, -72($fp) 
lw $t0, -68($fp) 
lw $t2, -72($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -68($fp) 
lw $t1, -68($fp) 
lw $t4, ($t1) 
mul $t0, $t4, $t6 
sw $t0, -80($fp) 
lw $t1, r50 
sw $t1, -84($fp) 
mul $t0, $a1, $t8 
sw $t0, -88($fp) 
lw $t0, -84($fp) 
lw $t2, -88($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -84($fp) 
lw $t1, -80($fp) 
lw $t2, -84($fp) 
lw $t5, ($t2) 
sub $t0, $t1, $t5 
sw $t0, -96($fp) 
lw $t1, r48 
sw $t1, -100($fp) 
lw $t1, -96($fp) 
mul $t0, $t1, $t8 
sw $t0, -104($fp) 
lw $t0, -100($fp) 
lw $t2, -104($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -100($fp) 
lw $t1, -100($fp) 
lw $t4, ($t1) 
sne $t0, $t4, $0 
sw $t0, -112($fp) 
beq $t0, $zero, if_false63 
if_true68: 
lw $t1, r56 
sw $t1, -116($fp) 
mul $t0, $a1, $t8 
sw $t0, -120($fp) 
lw $t0, -116($fp) 
lw $t2, -120($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -116($fp) 
lw $t1, -116($fp) 
lw $t4, ($t1) 
sw $t4, -116($fp) 
mul $t0, $a2, $t8 
sw $t0, -120($fp) 
lw $t0, -116($fp) 
lw $t2, -120($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -116($fp) 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
sw $a2, -8($sp) 
lw $t1, r50 
sw $t1, -124($fp) 
mul $t0, $a2, $t8 
sw $t0, -128($fp) 
lw $t0, -124($fp) 
lw $t2, -128($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -124($fp) 
lw $t1, -124($fp) 
lw $t4, ($t1) 
mul $t0, $t4, $t6 
sw $t0, -136($fp) 
lw $t1, r50 
sw $t1, -140($fp) 
mul $t0, $a1, $t8 
sw $t0, -144($fp) 
lw $t0, -140($fp) 
lw $t2, -144($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -140($fp) 
lw $t1, -136($fp) 
lw $t2, -140($fp) 
lw $t5, ($t2) 
sub $t0, $t1, $t5 
sw $t0, -152($fp) 
lw $t1, r52 
sw $t1, -156($fp) 
lw $t1, -152($fp) 
mul $t0, $t1, $t8 
sw $t0, -160($fp) 
lw $t0, -156($fp) 
lw $t2, -160($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -156($fp) 
lw $t0, 0($sp) 
sw $t0, -168($fp) 
lw $t1, -168($fp) 
move $a0, $t1 
lw $t0, -8($sp) 
sw $t0, -172($fp) 
lw $t1, -172($fp) 
move $a1, $t1 
lw $t1, -156($fp) 
lw $t4, ($t1) 
move $a2, $t4 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal getResult61 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $a2, 8($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -180($fp) 
lw $t1, -180($fp) 
add $t0, $t1, $t9 
sw $t0, -184($fp) 
lw $t0, -116($fp) 
lw $t1, -184($fp) 
sw $t1, ($t0) 
if_false63: 
lw $t1, r56 
sw $t1, -192($fp) 
mul $t0, $a1, $t8 
sw $t0, -196($fp) 
lw $t0, -192($fp) 
lw $t2, -196($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -192($fp) 
lw $t1, -192($fp) 
lw $t4, ($t1) 
sw $t4, -192($fp) 
mul $t0, $a2, $t8 
sw $t0, -196($fp) 
lw $t0, -192($fp) 
lw $t2, -196($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -192($fp) 
lw $t1, -192($fp) 
lw $t4, ($t1) 
seq $t0, $t4, -1 
sw $t0, -204($fp) 
beq $t0, $zero, if_false72 
if_true71: 
lw $t1, r56 
sw $t1, -208($fp) 
mul $t0, $a1, $t8 
sw $t0, -212($fp) 
lw $t0, -208($fp) 
lw $t2, -212($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -208($fp) 
lw $t1, -208($fp) 
lw $t4, ($t1) 
sw $t4, -208($fp) 
mul $t0, $a2, $t8 
sw $t0, -212($fp) 
lw $t0, -208($fp) 
lw $t2, -212($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -208($fp) 
sw $t9, ($t0) 
if_false72: 
lw $t1, r56 
sw $t1, -220($fp) 
mul $t0, $a1, $t8 
sw $t0, -224($fp) 
lw $t0, -220($fp) 
lw $t2, -224($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -220($fp) 
lw $t1, -220($fp) 
lw $t4, ($t1) 
sw $t4, -220($fp) 
mul $t0, $a2, $t8 
sw $t0, -224($fp) 
lw $t0, -220($fp) 
lw $t2, -224($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -220($fp) 
lw $t1, -220($fp) 
lw $t4, ($t1) 
move $v0, $t4 
jr $ra 
printF74: 
move $t7, $a0 
move $a0, $a0 
li $v0, 1 
syscall  
move $a0, $t7 
ble $a2, $0, if_false76 
if_true75: 
li $v0, 4 
move $t7, $a0 
la $a0, s13 
syscall  
move $a0, $t7 
move $t7, $a0 
move $a0, $a1 
li $v0, 1 
syscall  
move $a0, $t7 
mul $t0, $a1, $t6 
sw $t0, -12($fp) 
lw $t1, -12($fp) 
sub $t0, $t1, $a0 
sw $t0, -16($fp) 
lw $t1, -16($fp) 
move $a1, $t1 
add $t0, $a0, $a1 
sw $t0, -20($fp) 
lw $t1, -20($fp) 
div $t0, $t1, $t6 
sw $t0, -24($fp) 
lw $t1, -24($fp) 
move $a0, $t1 
sub $t0, $a2, $t9 
sw $t0, -28($fp) 
lw $t1, -28($fp) 
move $a2, $t1 
jump77: 
sgt $t0, $a2, $0 
sw $t0, -32($fp) 
bne $t0, $zero, if_true75 
if_false76: 
li $v0, 4 
move $t7, $a0 
la $a0, s14 
syscall  
move $a0, $t7 
jr $ra 
main: 
li $s6, 16 
li $t9, 1 
li $t8, 4 
li $t6, 2 
li $v1, 8 
li $v0, 9 
move $t7, $a0 
li $a0, 4008 
syscall  
move $a0, $t7 
li $t1, 1001 
sw $t1, 0($v0) 
sw $v0, r49 
lw $t0, r48 
lw $t1, r49 
sw $t1, r48 
li $v0, 9 
move $t7, $a0 
li $a0, 684 
syscall  
move $a0, $t7 
li $t1, 170 
sw $t1, 0($v0) 
sw $v0, r51 
lw $t0, r50 
lw $t1, r51 
sw $t1, r50 
li $v0, 9 
move $t7, $a0 
li $a0, 4008 
syscall  
move $a0, $t7 
li $t1, 1001 
sw $t1, 0($v0) 
sw $v0, r53 
lw $t0, r52 
lw $t1, r53 
sw $t1, r52 
li $v0, 9 
move $t7, $a0 
li $a0, 8 
syscall  
move $a0, $t7 
sw $t9, 0($v0) 
sw $v0, r55 
lw $t0, r54 
lw $t1, r55 
sw $t1, r54 
move $fp, $sp 
add $sp, $sp, -388 
sw $a0, 0($sp) 
li $a0, 170 
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
li $t0, 1000 
sw $t0, r42 
li $v0, 5 
syscall  
sw $v0, -8($fp) 
lw $t0, r43 
lw $t1, -8($fp) 
sw $t1, r43 
sw $0, r46 
sw $0, r47 
lw $t1, r54 
sw $t1, -24($fp) 
lw $t0, -24($fp) 
add $t0, $t0, $t8 
sw $t0, -24($fp) 
sw $0, ($t0) 
sw $0, r44 
lw $t1, r42 
add $t0, $t1, $t9 
sw $t0, -36($fp) 
lw $t1, r44 
lw $t2, -36($fp) 
bge $t1, $t2, if_false80 
if_true79: 
lw $t1, r48 
sw $t1, -44($fp) 
lw $t1, r44 
mul $t0, $t1, $t8 
sw $t0, -48($fp) 
lw $t0, -44($fp) 
lw $t2, -48($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -44($fp) 
sw $t9, ($t0) 
lw $t1, r52 
sw $t1, -56($fp) 
lw $t1, r44 
mul $t0, $t1, $t8 
sw $t0, -60($fp) 
lw $t0, -56($fp) 
lw $t2, -60($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -56($fp) 
sw $0, ($t0) 
jump81: 
lw $t1, r44 
add $t0, $t1, $t9 
sw $t0, -68($fp) 
lw $t0, r44 
lw $t1, -68($fp) 
sw $t1, r44 
lw $t1, r42 
add $t0, $t1, $t9 
sw $t0, -72($fp) 
lw $t1, r44 
lw $t2, -72($fp) 
slt $t0, $t1, $t2 
sw $t0, -76($fp) 
bne $t0, $zero, if_true79 
if_false80: 
sw $0, r44 
lw $t1, r43 
add $t0, $t1, $t9 
sw $t0, -80($fp) 
lw $t1, r44 
lw $t2, -80($fp) 
bge $t1, $t2, if_false83 
if_true82: 
lw $t1, r50 
sw $t1, -88($fp) 
lw $t1, r44 
mul $t0, $t1, $t8 
sw $t0, -92($fp) 
lw $t0, -88($fp) 
lw $t2, -92($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -88($fp) 
sw $0, ($t0) 
jump84: 
lw $t1, r44 
add $t0, $t1, $t9 
sw $t0, -100($fp) 
lw $t0, r44 
lw $t1, -100($fp) 
sw $t1, r44 
lw $t1, r43 
add $t0, $t1, $t9 
sw $t0, -104($fp) 
lw $t1, r44 
lw $t2, -104($fp) 
slt $t0, $t1, $t2 
sw $t0, -108($fp) 
bne $t0, $zero, if_true82 
if_false83: 
sw $0, r44 
lw $t1, r44 
lw $t2, r43 
bgt $t1, $t2, if_false86 
if_true85: 
sw $0, r45 
lw $t1, r45 
lw $t2, r43 
bgt $t1, $t2, jump87 
if_true88: 
lw $t1, r56 
sw $t1, -120($fp) 
lw $t1, r44 
mul $t0, $t1, $t8 
sw $t0, -124($fp) 
lw $t0, -120($fp) 
lw $t2, -124($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -120($fp) 
lw $t1, -120($fp) 
lw $t4, ($t1) 
sw $t4, -120($fp) 
lw $t1, r45 
mul $t0, $t1, $t8 
sw $t0, -124($fp) 
lw $t0, -120($fp) 
lw $t2, -124($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -120($fp) 
li $t7, -1 
sw $t7, ($t0) 
jump90: 
lw $t1, r45 
add $t0, $t1, $t9 
sw $t0, -132($fp) 
lw $t0, r45 
lw $t1, -132($fp) 
sw $t1, r45 
lw $t2, r43 
sle $t0, $t1, $t2 
sw $t0, -136($fp) 
bne $t0, $zero, if_true88 
beq $t0, $zero, jump87 
jump87: 
lw $t1, r44 
add $t0, $t1, $t9 
sw $t0, -140($fp) 
lw $t0, r44 
lw $t1, -140($fp) 
sw $t1, r44 
lw $t2, r43 
sle $t0, $t1, $t2 
sw $t0, -144($fp) 
bne $t0, $zero, if_true85 
if_false86: 
add $sp, $sp, -388 
sw $a0, 0($sp) 
lw $t1, r42 
move $a0, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal getPrime51 
lw $a0, 16($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -152($fp) 
lw $t1, r54 
sw $t1, -156($fp) 
lw $t0, -156($fp) 
add $t0, $t0, $t8 
sw $t0, -156($fp) 
lw $t0, r46 
lw $t1, -156($fp) 
lw $t4, ($t1) 
sw $t4, r46 
sw $t9, r44 
lw $t1, r44 
lw $t2, r46 
bge $t1, $t2, if_false92 
if_true91: 
lw $t1, r44 
add $t0, $t1, $t9 
sw $t0, -172($fp) 
lw $t0, r45 
lw $t1, -172($fp) 
sw $t1, r45 
lw $t2, r46 
bgt $t1, $t2, jump93 
if_true94: 
lw $t1, r56 
sw $t1, -180($fp) 
lw $t1, r44 
mul $t0, $t1, $t8 
sw $t0, -184($fp) 
lw $t0, -180($fp) 
lw $t2, -184($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -180($fp) 
lw $t1, -180($fp) 
lw $t4, ($t1) 
sw $t4, -180($fp) 
lw $t1, r45 
mul $t0, $t1, $t8 
sw $t0, -184($fp) 
lw $t0, -180($fp) 
lw $t2, -184($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -180($fp) 
lw $t1, -180($fp) 
lw $t4, ($t1) 
seq $t0, $t4, -1 
sw $t0, -192($fp) 
beq $t0, $zero, jump96 
if_true97: 
lw $t1, r56 
sw $t1, -196($fp) 
lw $t1, r44 
mul $t0, $t1, $t8 
sw $t0, -200($fp) 
lw $t0, -196($fp) 
lw $t2, -200($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -196($fp) 
lw $t1, -196($fp) 
lw $t4, ($t1) 
sw $t4, -196($fp) 
lw $t1, r45 
mul $t0, $t1, $t8 
sw $t0, -200($fp) 
lw $t0, -196($fp) 
lw $t2, -200($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -196($fp) 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
sw $a2, -8($sp) 
lw $t1, r42 
move $a0, $t1 
lw $t1, r44 
move $a1, $t1 
lw $t1, r45 
move $a2, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal getResult61 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $a2, 8($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -216($fp) 
lw $t0, -196($fp) 
lw $t1, -216($fp) 
sw $t1, ($t0) 
lw $t1, r56 
sw $t1, -224($fp) 
lw $t1, r44 
mul $t0, $t1, $t8 
sw $t0, -228($fp) 
lw $t0, -224($fp) 
lw $t2, -228($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -224($fp) 
lw $t1, -224($fp) 
lw $t4, ($t1) 
sw $t4, -224($fp) 
lw $t1, r45 
mul $t0, $t1, $t8 
sw $t0, -228($fp) 
lw $t0, -224($fp) 
lw $t2, -228($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -224($fp) 
lw $t1, -224($fp) 
lw $t4, ($t1) 
sgt $t0, $t4, $t9 
sw $t0, -236($fp) 
beq $t0, $zero, jump96 
if_true100: 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
sw $a2, -8($sp) 
lw $t1, r50 
sw $t1, -240($fp) 
lw $t1, r44 
mul $t0, $t1, $t8 
sw $t0, -244($fp) 
lw $t0, -240($fp) 
lw $t2, -244($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -240($fp) 
lw $t1, r50 
sw $t1, -252($fp) 
lw $t1, r45 
mul $t0, $t1, $t8 
sw $t0, -256($fp) 
lw $t0, -252($fp) 
lw $t2, -256($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -252($fp) 
lw $t1, r56 
sw $t1, -264($fp) 
lw $t1, r44 
mul $t0, $t1, $t8 
sw $t0, -268($fp) 
lw $t0, -264($fp) 
lw $t2, -268($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -264($fp) 
lw $t1, -264($fp) 
lw $t4, ($t1) 
sw $t4, -264($fp) 
lw $t1, r45 
mul $t0, $t1, $t8 
sw $t0, -268($fp) 
lw $t0, -264($fp) 
lw $t2, -268($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -264($fp) 
lw $t1, -240($fp) 
lw $t4, ($t1) 
move $a0, $t4 
lw $t1, -252($fp) 
lw $t4, ($t1) 
move $a1, $t4 
lw $t1, -264($fp) 
lw $t4, ($t1) 
move $a2, $t4 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal printF74 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $a2, 8($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -288($fp) 
lw $t1, r47 
add $t0, $t1, $t9 
sw $t0, -292($fp) 
lw $t0, r47 
lw $t1, -292($fp) 
sw $t1, r47 
jump96: 
lw $t1, r45 
add $t0, $t1, $t9 
sw $t0, -296($fp) 
lw $t0, r45 
lw $t1, -296($fp) 
sw $t1, r45 
lw $t2, r46 
sle $t0, $t1, $t2 
sw $t0, -300($fp) 
bne $t0, $zero, if_true94 
beq $t0, $zero, jump93 
jump93: 
lw $t1, r44 
add $t0, $t1, $t9 
sw $t0, -304($fp) 
lw $t0, r44 
lw $t1, -304($fp) 
sw $t1, r44 
lw $t2, r46 
slt $t0, $t1, $t2 
sw $t0, -308($fp) 
bne $t0, $zero, if_true91 
if_false92: 
li $v0, 4 
move $t7, $a0 
la $a0, s15 
syscall  
move $a0, $t7 
lw $t0, r47 
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
