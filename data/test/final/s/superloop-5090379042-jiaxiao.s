.data
r42:	.space	4
r43:	.space	4
r44:	.space	4
r45:	.space	4
r46:	.space	4
r47:	.space	4
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
main: 
li $s6, 16 
li $t9, 1 
li $t8, 4 
li $t6, 2 
li $v1, 8 
lw $t0, r43 
li $t0, 99 
sw $t0, r43 
lw $t0, r44 
li $t0, 100 
sw $t0, r44 
lw $t0, r45 
li $t0, 101 
sw $t0, r45 
lw $t0, r46 
li $t0, 102 
sw $t0, r46 
sw $0, r47 
move $fp, $sp 
li $v0, 5 
syscall  
sw $v0, -24($fp) 
lw $t0, r42 
lw $t1, -24($fp) 
sw $t1, r42 
sw $t9, 0($fp) 
lw $t1, 0($fp) 
lw $t2, r42 
bgt $t1, $t2, if_false46 
if_true45: 
sw $t9, -4($fp) 
lw $t1, -4($fp) 
lw $t2, r42 
bgt $t1, $t2, jump47 
if_true48: 
sw $t9, -8($fp) 
lw $t1, -8($fp) 
lw $t2, r42 
bgt $t1, $t2, jump50 
if_true51: 
sw $t9, -12($fp) 
lw $t1, -12($fp) 
lw $t2, r42 
bgt $t1, $t2, jump53 
if_true54: 
sw $t9, -16($fp) 
lw $t1, -16($fp) 
lw $t2, r42 
bgt $t1, $t2, jump56 
if_true57: 
sw $t9, -20($fp) 
lw $t1, -20($fp) 
lw $t2, r42 
bgt $t1, $t2, jump59 
if_true60: 
lw $t1, 0($fp) 
lw $t2, -4($fp) 
sne $t0, $t1, $t2 
sw $t0, -56($fp) 
beq $t0, $zero, if_false65 
if_true63: 
lw $t1, 0($fp) 
lw $t2, -8($fp) 
sne $t0, $t1, $t2 
sw $t0, -64($fp) 
beq $t0, $zero, if_false65 
if_true66: 
lw $t1, 0($fp) 
lw $t2, -12($fp) 
sne $t0, $t1, $t2 
sw $t0, -72($fp) 
beq $t0, $zero, if_false65 
if_true68: 
lw $t1, 0($fp) 
lw $t2, -16($fp) 
sne $t0, $t1, $t2 
sw $t0, -80($fp) 
beq $t0, $zero, if_false65 
if_true70: 
lw $t1, 0($fp) 
lw $t2, -20($fp) 
sne $t0, $t1, $t2 
sw $t0, -88($fp) 
beq $t0, $zero, if_false65 
if_true72: 
lw $t1, 0($fp) 
lw $t2, r43 
sne $t0, $t1, $t2 
sw $t0, -100($fp) 
beq $t0, $zero, if_false65 
if_true74: 
lw $t1, 0($fp) 
lw $t2, r44 
sne $t0, $t1, $t2 
sw $t0, -112($fp) 
beq $t0, $zero, if_false65 
if_true76: 
lw $t1, 0($fp) 
lw $t2, r45 
sne $t0, $t1, $t2 
sw $t0, -124($fp) 
beq $t0, $zero, if_false65 
if_true78: 
lw $t1, 0($fp) 
lw $t2, r46 
sne $t0, $t1, $t2 
sw $t0, -136($fp) 
beq $t0, $zero, if_false65 
if_true80: 
lw $t1, -4($fp) 
lw $t2, -8($fp) 
sne $t0, $t1, $t2 
sw $t0, -144($fp) 
beq $t0, $zero, if_false65 
if_true82: 
lw $t1, -4($fp) 
lw $t2, -12($fp) 
sne $t0, $t1, $t2 
sw $t0, -152($fp) 
beq $t0, $zero, if_false65 
if_true84: 
lw $t1, -4($fp) 
lw $t2, -16($fp) 
sne $t0, $t1, $t2 
sw $t0, -160($fp) 
beq $t0, $zero, if_false65 
if_true86: 
lw $t1, -4($fp) 
lw $t2, -20($fp) 
sne $t0, $t1, $t2 
sw $t0, -168($fp) 
beq $t0, $zero, if_false65 
if_true88: 
lw $t1, -4($fp) 
lw $t2, r43 
sne $t0, $t1, $t2 
sw $t0, -176($fp) 
beq $t0, $zero, if_false65 
if_true90: 
lw $t1, -4($fp) 
lw $t2, r44 
sne $t0, $t1, $t2 
sw $t0, -184($fp) 
beq $t0, $zero, if_false65 
if_true92: 
lw $t1, -4($fp) 
lw $t2, r45 
sne $t0, $t1, $t2 
sw $t0, -192($fp) 
beq $t0, $zero, if_false65 
if_true94: 
lw $t1, -4($fp) 
lw $t2, r46 
sne $t0, $t1, $t2 
sw $t0, -200($fp) 
beq $t0, $zero, if_false65 
if_true96: 
lw $t1, -8($fp) 
lw $t2, -12($fp) 
sne $t0, $t1, $t2 
sw $t0, -208($fp) 
beq $t0, $zero, if_false65 
if_true98: 
lw $t1, -8($fp) 
lw $t2, -16($fp) 
sne $t0, $t1, $t2 
sw $t0, -216($fp) 
beq $t0, $zero, if_false65 
if_true100: 
lw $t1, -8($fp) 
lw $t2, -20($fp) 
sne $t0, $t1, $t2 
sw $t0, -224($fp) 
beq $t0, $zero, if_false65 
if_true102: 
lw $t1, -8($fp) 
lw $t2, r43 
sne $t0, $t1, $t2 
sw $t0, -232($fp) 
beq $t0, $zero, if_false65 
if_true104: 
lw $t1, -8($fp) 
lw $t2, r44 
sne $t0, $t1, $t2 
sw $t0, -240($fp) 
beq $t0, $zero, if_false65 
if_true106: 
lw $t1, -8($fp) 
lw $t2, r45 
sne $t0, $t1, $t2 
sw $t0, -248($fp) 
beq $t0, $zero, if_false65 
if_true108: 
lw $t1, -8($fp) 
lw $t2, r46 
sne $t0, $t1, $t2 
sw $t0, -256($fp) 
beq $t0, $zero, if_false65 
if_true110: 
lw $t1, -12($fp) 
lw $t2, -16($fp) 
sne $t0, $t1, $t2 
sw $t0, -264($fp) 
beq $t0, $zero, if_false65 
if_true112: 
lw $t1, -12($fp) 
lw $t2, -20($fp) 
sne $t0, $t1, $t2 
sw $t0, -272($fp) 
beq $t0, $zero, if_false65 
if_true114: 
lw $t1, -12($fp) 
lw $t2, r43 
sne $t0, $t1, $t2 
sw $t0, -280($fp) 
beq $t0, $zero, if_false65 
if_true116: 
lw $t1, -12($fp) 
lw $t2, r44 
sne $t0, $t1, $t2 
sw $t0, -288($fp) 
beq $t0, $zero, if_false65 
if_true118: 
lw $t1, -12($fp) 
lw $t2, r45 
sne $t0, $t1, $t2 
sw $t0, -296($fp) 
beq $t0, $zero, if_false65 
if_true120: 
lw $t1, -12($fp) 
lw $t2, r46 
sne $t0, $t1, $t2 
sw $t0, -304($fp) 
beq $t0, $zero, if_false65 
if_true122: 
lw $t1, -16($fp) 
lw $t2, -20($fp) 
sne $t0, $t1, $t2 
sw $t0, -312($fp) 
beq $t0, $zero, if_false65 
if_true124: 
lw $t1, -16($fp) 
lw $t2, r43 
sne $t0, $t1, $t2 
sw $t0, -320($fp) 
beq $t0, $zero, if_false65 
if_true126: 
lw $t1, -16($fp) 
lw $t2, r44 
sne $t0, $t1, $t2 
sw $t0, -328($fp) 
beq $t0, $zero, if_false65 
if_true128: 
lw $t1, -16($fp) 
lw $t2, r45 
sne $t0, $t1, $t2 
sw $t0, -336($fp) 
beq $t0, $zero, if_false65 
if_true130: 
lw $t1, -16($fp) 
lw $t2, r46 
sne $t0, $t1, $t2 
sw $t0, -344($fp) 
beq $t0, $zero, if_false65 
if_true132: 
lw $t1, -20($fp) 
lw $t2, r43 
sne $t0, $t1, $t2 
sw $t0, -352($fp) 
beq $t0, $zero, if_false65 
if_true134: 
lw $t1, -20($fp) 
lw $t2, r44 
sne $t0, $t1, $t2 
sw $t0, -360($fp) 
beq $t0, $zero, if_false65 
if_true136: 
lw $t1, -20($fp) 
lw $t2, r45 
sne $t0, $t1, $t2 
sw $t0, -368($fp) 
beq $t0, $zero, if_false65 
if_true138: 
lw $t1, -20($fp) 
lw $t2, r46 
sne $t0, $t1, $t2 
sw $t0, -376($fp) 
beq $t0, $zero, if_false65 
if_true140: 
lw $t1, r44 
lw $t2, r45 
sne $t0, $t1, $t2 
sw $t0, -384($fp) 
beq $t0, $zero, if_false65 
if_true142: 
lw $t1, r43 
lw $t2, r46 
sne $t0, $t1, $t2 
sw $t0, -392($fp) 
lw $t1, -392($fp) 
sw $t1, -388($fp) 
go143: 
lw $t1, -388($fp) 
sw $t1, -380($fp) 
go141: 
lw $t1, -380($fp) 
sw $t1, -372($fp) 
go139: 
lw $t1, -372($fp) 
sw $t1, -364($fp) 
go137: 
lw $t1, -364($fp) 
sw $t1, -356($fp) 
go135: 
lw $t1, -356($fp) 
sw $t1, -348($fp) 
go133: 
lw $t1, -348($fp) 
sw $t1, -340($fp) 
go131: 
lw $t1, -340($fp) 
sw $t1, -332($fp) 
go129: 
lw $t1, -332($fp) 
sw $t1, -324($fp) 
go127: 
lw $t1, -324($fp) 
sw $t1, -316($fp) 
go125: 
lw $t1, -316($fp) 
sw $t1, -308($fp) 
go123: 
lw $t1, -308($fp) 
sw $t1, -300($fp) 
go121: 
lw $t1, -300($fp) 
sw $t1, -292($fp) 
go119: 
lw $t1, -292($fp) 
sw $t1, -284($fp) 
go117: 
lw $t1, -284($fp) 
sw $t1, -276($fp) 
go115: 
lw $t1, -276($fp) 
sw $t1, -268($fp) 
go113: 
lw $t1, -268($fp) 
sw $t1, -260($fp) 
go111: 
lw $t1, -260($fp) 
sw $t1, -252($fp) 
go109: 
lw $t1, -252($fp) 
sw $t1, -244($fp) 
go107: 
lw $t1, -244($fp) 
sw $t1, -236($fp) 
go105: 
lw $t1, -236($fp) 
sw $t1, -228($fp) 
go103: 
lw $t1, -228($fp) 
sw $t1, -220($fp) 
go101: 
lw $t1, -220($fp) 
sw $t1, -212($fp) 
go99: 
lw $t1, -212($fp) 
sw $t1, -204($fp) 
go97: 
lw $t1, -204($fp) 
sw $t1, -196($fp) 
go95: 
lw $t1, -196($fp) 
sw $t1, -188($fp) 
go93: 
lw $t1, -188($fp) 
sw $t1, -180($fp) 
go91: 
lw $t1, -180($fp) 
sw $t1, -172($fp) 
go89: 
lw $t1, -172($fp) 
sw $t1, -164($fp) 
go87: 
lw $t1, -164($fp) 
sw $t1, -156($fp) 
go85: 
lw $t1, -156($fp) 
sw $t1, -148($fp) 
go83: 
lw $t1, -148($fp) 
sw $t1, -140($fp) 
go81: 
lw $t1, -140($fp) 
sw $t1, -128($fp) 
go79: 
lw $t1, -128($fp) 
sw $t1, -116($fp) 
go77: 
lw $t1, -116($fp) 
sw $t1, -104($fp) 
go75: 
lw $t1, -104($fp) 
sw $t1, -92($fp) 
go73: 
lw $t1, -92($fp) 
sw $t1, -84($fp) 
go71: 
lw $t1, -84($fp) 
sw $t1, -76($fp) 
go69: 
lw $t1, -76($fp) 
sw $t1, -68($fp) 
go67: 
lw $t1, -68($fp) 
sw $t1, -60($fp) 
b go64 
if_false65: 
sw $0, -60($fp) 
go64: 
lw $t0, -60($fp) 
beq $t0, $zero, jump62 
if_true144: 
lw $t1, r47 
sw $t1, -396($fp) 
lw $t0, r47 
add $t0, $t0, $t9 
sw $t0, r47 
jump62: 
lw $t1, -20($fp) 
sw $t1, -400($fp) 
lw $t0, -20($fp) 
add $t0, $t0, $t9 
sw $t0, -20($fp) 
lw $t1, -20($fp) 
lw $t2, r42 
sle $t0, $t1, $t2 
sw $t0, -404($fp) 
bne $t0, $zero, if_true60 
beq $t0, $zero, jump59 
jump59: 
lw $t1, -16($fp) 
sw $t1, -408($fp) 
lw $t0, -16($fp) 
add $t0, $t0, $t9 
sw $t0, -16($fp) 
lw $t1, -16($fp) 
lw $t2, r42 
sle $t0, $t1, $t2 
sw $t0, -412($fp) 
bne $t0, $zero, if_true57 
beq $t0, $zero, jump56 
jump56: 
lw $t1, -12($fp) 
sw $t1, -416($fp) 
lw $t0, -12($fp) 
add $t0, $t0, $t9 
sw $t0, -12($fp) 
lw $t1, -12($fp) 
lw $t2, r42 
sle $t0, $t1, $t2 
sw $t0, -420($fp) 
bne $t0, $zero, if_true54 
beq $t0, $zero, jump53 
jump53: 
lw $t1, -8($fp) 
sw $t1, -424($fp) 
lw $t0, -8($fp) 
add $t0, $t0, $t9 
sw $t0, -8($fp) 
lw $t1, -8($fp) 
lw $t2, r42 
sle $t0, $t1, $t2 
sw $t0, -428($fp) 
bne $t0, $zero, if_true51 
beq $t0, $zero, jump50 
jump50: 
lw $t1, -4($fp) 
sw $t1, -432($fp) 
lw $t0, -4($fp) 
add $t0, $t0, $t9 
sw $t0, -4($fp) 
lw $t1, -4($fp) 
lw $t2, r42 
sle $t0, $t1, $t2 
sw $t0, -436($fp) 
bne $t0, $zero, if_true48 
beq $t0, $zero, jump47 
jump47: 
lw $t1, 0($fp) 
sw $t1, -440($fp) 
lw $t0, 0($fp) 
add $t0, $t0, $t9 
sw $t0, 0($fp) 
lw $t1, 0($fp) 
lw $t2, r42 
sle $t0, $t1, $t2 
sw $t0, -444($fp) 
bne $t0, $zero, if_true45 
if_false46: 
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
