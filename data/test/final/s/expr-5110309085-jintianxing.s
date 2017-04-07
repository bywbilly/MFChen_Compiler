.data
r42:	.space	4
r43:	.space	4
r44:	.space	4
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
sw $t9, r42 
sw $t9, r43 
sw $t9, r44 
move $fp, $sp 
lw $t1, r44 
slt $t0, $t1, 536870912 
sw $t0, 0($fp) 
beq $t0, $zero, if_false50 
if_true48: 
lw $t1, r44 
sgt $t0, $t1, -536870912 
sw $t0, -12($fp) 
lw $t1, -12($fp) 
sw $t1, -8($fp) 
b go49 
if_false50: 
sw $0, -8($fp) 
go49: 
lw $t0, -8($fp) 
beq $t0, $zero, if_false46 
if_true45: 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -20($fp) 
lw $t1, -20($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -28($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -32($fp) 
lw $t1, -28($fp) 
lw $t2, -32($fp) 
sub $t0, $t1, $t2 
sw $t0, -36($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -40($fp) 
lw $t1, -40($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -44($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -48($fp) 
lw $t1, -44($fp) 
lw $t2, -48($fp) 
sub $t0, $t1, $t2 
sw $t0, -52($fp) 
lw $t1, -36($fp) 
lw $t2, -52($fp) 
add $t0, $t1, $t2 
sw $t0, -56($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -60($fp) 
lw $t1, -60($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -64($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -68($fp) 
lw $t1, -64($fp) 
lw $t2, -68($fp) 
sub $t0, $t1, $t2 
sw $t0, -72($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -76($fp) 
lw $t1, -76($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -80($fp) 
lw $t1, -72($fp) 
lw $t2, -80($fp) 
add $t0, $t1, $t2 
sw $t0, -84($fp) 
lw $t1, -56($fp) 
lw $t2, -84($fp) 
add $t0, $t1, $t2 
sw $t0, -88($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -92($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -96($fp) 
lw $t1, -96($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -100($fp) 
lw $t1, -92($fp) 
lw $t2, -100($fp) 
add $t0, $t1, $t2 
sw $t0, -104($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -108($fp) 
lw $t1, -104($fp) 
lw $t2, -108($fp) 
sub $t0, $t1, $t2 
sw $t0, -112($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -116($fp) 
lw $t1, -116($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -120($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -124($fp) 
lw $t1, -120($fp) 
lw $t2, -124($fp) 
sub $t0, $t1, $t2 
sw $t0, -128($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -132($fp) 
lw $t1, -132($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -136($fp) 
lw $t1, -128($fp) 
lw $t2, -136($fp) 
add $t0, $t1, $t2 
sw $t0, -140($fp) 
lw $t1, -112($fp) 
lw $t2, -140($fp) 
add $t0, $t1, $t2 
sw $t0, -144($fp) 
lw $t1, -88($fp) 
lw $t2, -144($fp) 
sub $t0, $t1, $t2 
sw $t0, -148($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -152($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -156($fp) 
lw $t1, -156($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -160($fp) 
lw $t1, -152($fp) 
lw $t2, -160($fp) 
add $t0, $t1, $t2 
sw $t0, -164($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -168($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -172($fp) 
lw $t1, -172($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -176($fp) 
lw $t1, -168($fp) 
lw $t2, -176($fp) 
add $t0, $t1, $t2 
sw $t0, -180($fp) 
lw $t1, -164($fp) 
lw $t2, -180($fp) 
sub $t0, $t1, $t2 
sw $t0, -184($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -188($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -192($fp) 
lw $t1, -192($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -196($fp) 
lw $t1, -188($fp) 
lw $t2, -196($fp) 
add $t0, $t1, $t2 
sw $t0, -200($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -204($fp) 
lw $t1, -200($fp) 
lw $t2, -204($fp) 
sub $t0, $t1, $t2 
sw $t0, -208($fp) 
lw $t1, -184($fp) 
lw $t2, -208($fp) 
sub $t0, $t1, $t2 
sw $t0, -212($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -216($fp) 
lw $t1, -216($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -220($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -224($fp) 
lw $t1, -220($fp) 
lw $t2, -224($fp) 
sub $t0, $t1, $t2 
sw $t0, -228($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -232($fp) 
lw $t1, -232($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -236($fp) 
lw $t1, -228($fp) 
lw $t2, -236($fp) 
add $t0, $t1, $t2 
sw $t0, -240($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -244($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -248($fp) 
lw $t1, -248($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -252($fp) 
lw $t1, -244($fp) 
lw $t2, -252($fp) 
add $t0, $t1, $t2 
sw $t0, -256($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -260($fp) 
lw $t1, -256($fp) 
lw $t2, -260($fp) 
sub $t0, $t1, $t2 
sw $t0, -264($fp) 
lw $t1, -240($fp) 
lw $t2, -264($fp) 
sub $t0, $t1, $t2 
sw $t0, -268($fp) 
lw $t1, -212($fp) 
lw $t2, -268($fp) 
add $t0, $t1, $t2 
sw $t0, -272($fp) 
lw $t1, -148($fp) 
lw $t2, -272($fp) 
sub $t0, $t1, $t2 
sw $t0, -276($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -280($fp) 
lw $t1, -280($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -284($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -288($fp) 
lw $t1, -284($fp) 
lw $t2, -288($fp) 
sub $t0, $t1, $t2 
sw $t0, -292($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -296($fp) 
lw $t1, -296($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -300($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -304($fp) 
lw $t1, -300($fp) 
lw $t2, -304($fp) 
sub $t0, $t1, $t2 
sw $t0, -308($fp) 
lw $t1, -292($fp) 
lw $t2, -308($fp) 
add $t0, $t1, $t2 
sw $t0, -312($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -316($fp) 
lw $t1, -316($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -320($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -324($fp) 
lw $t1, -320($fp) 
lw $t2, -324($fp) 
sub $t0, $t1, $t2 
sw $t0, -328($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -332($fp) 
lw $t1, -332($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -336($fp) 
lw $t1, -328($fp) 
lw $t2, -336($fp) 
add $t0, $t1, $t2 
sw $t0, -340($fp) 
lw $t1, -312($fp) 
lw $t2, -340($fp) 
add $t0, $t1, $t2 
sw $t0, -344($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -348($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -352($fp) 
lw $t1, -352($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -356($fp) 
lw $t1, -348($fp) 
lw $t2, -356($fp) 
add $t0, $t1, $t2 
sw $t0, -360($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -364($fp) 
lw $t1, -360($fp) 
lw $t2, -364($fp) 
sub $t0, $t1, $t2 
sw $t0, -368($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -372($fp) 
lw $t1, -372($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -376($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -380($fp) 
lw $t1, -376($fp) 
lw $t2, -380($fp) 
sub $t0, $t1, $t2 
sw $t0, -384($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -388($fp) 
lw $t1, -388($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -392($fp) 
lw $t1, -384($fp) 
lw $t2, -392($fp) 
add $t0, $t1, $t2 
sw $t0, -396($fp) 
lw $t1, -368($fp) 
lw $t2, -396($fp) 
add $t0, $t1, $t2 
sw $t0, -400($fp) 
lw $t1, -344($fp) 
lw $t2, -400($fp) 
sub $t0, $t1, $t2 
sw $t0, -404($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -408($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -412($fp) 
lw $t1, -412($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -416($fp) 
lw $t1, -408($fp) 
lw $t2, -416($fp) 
add $t0, $t1, $t2 
sw $t0, -420($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -424($fp) 
lw $t1, -420($fp) 
lw $t2, -424($fp) 
sub $t0, $t1, $t2 
sw $t0, -428($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -432($fp) 
lw $t1, -432($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -436($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -440($fp) 
lw $t1, -436($fp) 
lw $t2, -440($fp) 
sub $t0, $t1, $t2 
sw $t0, -444($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -448($fp) 
lw $t1, -448($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -452($fp) 
lw $t1, -444($fp) 
lw $t2, -452($fp) 
add $t0, $t1, $t2 
sw $t0, -456($fp) 
lw $t1, -428($fp) 
lw $t2, -456($fp) 
add $t0, $t1, $t2 
sw $t0, -460($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -464($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -468($fp) 
lw $t1, -468($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -472($fp) 
lw $t1, -464($fp) 
lw $t2, -472($fp) 
add $t0, $t1, $t2 
sw $t0, -476($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -480($fp) 
lw $t1, -476($fp) 
lw $t2, -480($fp) 
sub $t0, $t1, $t2 
sw $t0, -484($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -488($fp) 
lw $t1, -488($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -492($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -496($fp) 
lw $t1, -492($fp) 
lw $t2, -496($fp) 
sub $t0, $t1, $t2 
sw $t0, -500($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -504($fp) 
lw $t1, -504($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -508($fp) 
lw $t1, -500($fp) 
lw $t2, -508($fp) 
add $t0, $t1, $t2 
sw $t0, -512($fp) 
lw $t1, -484($fp) 
lw $t2, -512($fp) 
add $t0, $t1, $t2 
sw $t0, -516($fp) 
lw $t1, -460($fp) 
lw $t2, -516($fp) 
sub $t0, $t1, $t2 
sw $t0, -520($fp) 
lw $t1, -404($fp) 
lw $t2, -520($fp) 
sub $t0, $t1, $t2 
sw $t0, -524($fp) 
lw $t1, -276($fp) 
lw $t2, -524($fp) 
add $t0, $t1, $t2 
sw $t0, -528($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -532($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -536($fp) 
lw $t1, -536($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -540($fp) 
lw $t1, -532($fp) 
lw $t2, -540($fp) 
add $t0, $t1, $t2 
sw $t0, -544($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -548($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -552($fp) 
lw $t1, -552($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -556($fp) 
lw $t1, -548($fp) 
lw $t2, -556($fp) 
add $t0, $t1, $t2 
sw $t0, -560($fp) 
lw $t1, -544($fp) 
lw $t2, -560($fp) 
sub $t0, $t1, $t2 
sw $t0, -564($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -568($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -572($fp) 
lw $t1, -572($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -576($fp) 
lw $t1, -568($fp) 
lw $t2, -576($fp) 
add $t0, $t1, $t2 
sw $t0, -580($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -584($fp) 
lw $t1, -580($fp) 
lw $t2, -584($fp) 
sub $t0, $t1, $t2 
sw $t0, -588($fp) 
lw $t1, -564($fp) 
lw $t2, -588($fp) 
sub $t0, $t1, $t2 
sw $t0, -592($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -596($fp) 
lw $t1, -596($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -600($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -604($fp) 
lw $t1, -600($fp) 
lw $t2, -604($fp) 
sub $t0, $t1, $t2 
sw $t0, -608($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -612($fp) 
lw $t1, -612($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -616($fp) 
lw $t1, -608($fp) 
lw $t2, -616($fp) 
add $t0, $t1, $t2 
sw $t0, -620($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -624($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -628($fp) 
lw $t1, -628($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -632($fp) 
lw $t1, -624($fp) 
lw $t2, -632($fp) 
add $t0, $t1, $t2 
sw $t0, -636($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -640($fp) 
lw $t1, -636($fp) 
lw $t2, -640($fp) 
sub $t0, $t1, $t2 
sw $t0, -644($fp) 
lw $t1, -620($fp) 
lw $t2, -644($fp) 
sub $t0, $t1, $t2 
sw $t0, -648($fp) 
lw $t1, -592($fp) 
lw $t2, -648($fp) 
add $t0, $t1, $t2 
sw $t0, -652($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -656($fp) 
lw $t1, -656($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -660($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -664($fp) 
lw $t1, -660($fp) 
lw $t2, -664($fp) 
sub $t0, $t1, $t2 
sw $t0, -668($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -672($fp) 
lw $t1, -672($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -676($fp) 
lw $t1, -668($fp) 
lw $t2, -676($fp) 
add $t0, $t1, $t2 
sw $t0, -680($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -684($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -688($fp) 
lw $t1, -688($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -692($fp) 
lw $t1, -684($fp) 
lw $t2, -692($fp) 
add $t0, $t1, $t2 
sw $t0, -696($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -700($fp) 
lw $t1, -696($fp) 
lw $t2, -700($fp) 
sub $t0, $t1, $t2 
sw $t0, -704($fp) 
lw $t1, -680($fp) 
lw $t2, -704($fp) 
sub $t0, $t1, $t2 
sw $t0, -708($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -712($fp) 
lw $t1, -712($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -716($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -720($fp) 
lw $t1, -716($fp) 
lw $t2, -720($fp) 
sub $t0, $t1, $t2 
sw $t0, -724($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -728($fp) 
lw $t1, -728($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -732($fp) 
lw $t1, -724($fp) 
lw $t2, -732($fp) 
add $t0, $t1, $t2 
sw $t0, -736($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -740($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -744($fp) 
lw $t1, -744($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -748($fp) 
lw $t1, -740($fp) 
lw $t2, -748($fp) 
add $t0, $t1, $t2 
sw $t0, -752($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -756($fp) 
lw $t1, -752($fp) 
lw $t2, -756($fp) 
sub $t0, $t1, $t2 
sw $t0, -760($fp) 
lw $t1, -736($fp) 
lw $t2, -760($fp) 
sub $t0, $t1, $t2 
sw $t0, -764($fp) 
lw $t1, -708($fp) 
lw $t2, -764($fp) 
add $t0, $t1, $t2 
sw $t0, -768($fp) 
lw $t1, -652($fp) 
lw $t2, -768($fp) 
add $t0, $t1, $t2 
sw $t0, -772($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -776($fp) 
lw $t1, -776($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -780($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -784($fp) 
lw $t1, -780($fp) 
lw $t2, -784($fp) 
sub $t0, $t1, $t2 
sw $t0, -788($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -792($fp) 
lw $t1, -792($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -796($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -800($fp) 
lw $t1, -796($fp) 
lw $t2, -800($fp) 
sub $t0, $t1, $t2 
sw $t0, -804($fp) 
lw $t1, -788($fp) 
lw $t2, -804($fp) 
add $t0, $t1, $t2 
sw $t0, -808($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -812($fp) 
lw $t1, -812($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -816($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -820($fp) 
lw $t1, -816($fp) 
lw $t2, -820($fp) 
sub $t0, $t1, $t2 
sw $t0, -824($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -828($fp) 
lw $t1, -828($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -832($fp) 
lw $t1, -824($fp) 
lw $t2, -832($fp) 
add $t0, $t1, $t2 
sw $t0, -836($fp) 
lw $t1, -808($fp) 
lw $t2, -836($fp) 
add $t0, $t1, $t2 
sw $t0, -840($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -844($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -848($fp) 
lw $t1, -848($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -852($fp) 
lw $t1, -844($fp) 
lw $t2, -852($fp) 
add $t0, $t1, $t2 
sw $t0, -856($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -860($fp) 
lw $t1, -856($fp) 
lw $t2, -860($fp) 
sub $t0, $t1, $t2 
sw $t0, -864($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -868($fp) 
lw $t1, -868($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -872($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -876($fp) 
lw $t1, -872($fp) 
lw $t2, -876($fp) 
sub $t0, $t1, $t2 
sw $t0, -880($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -884($fp) 
lw $t1, -884($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -888($fp) 
lw $t1, -880($fp) 
lw $t2, -888($fp) 
add $t0, $t1, $t2 
sw $t0, -892($fp) 
lw $t1, -864($fp) 
lw $t2, -892($fp) 
add $t0, $t1, $t2 
sw $t0, -896($fp) 
lw $t1, -840($fp) 
lw $t2, -896($fp) 
sub $t0, $t1, $t2 
sw $t0, -900($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -904($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -908($fp) 
lw $t1, -908($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -912($fp) 
lw $t1, -904($fp) 
lw $t2, -912($fp) 
add $t0, $t1, $t2 
sw $t0, -916($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -920($fp) 
lw $t1, -916($fp) 
lw $t2, -920($fp) 
sub $t0, $t1, $t2 
sw $t0, -924($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -928($fp) 
lw $t1, -928($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -932($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -936($fp) 
lw $t1, -932($fp) 
lw $t2, -936($fp) 
sub $t0, $t1, $t2 
sw $t0, -940($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -944($fp) 
lw $t1, -944($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -948($fp) 
lw $t1, -940($fp) 
lw $t2, -948($fp) 
add $t0, $t1, $t2 
sw $t0, -952($fp) 
lw $t1, -924($fp) 
lw $t2, -952($fp) 
add $t0, $t1, $t2 
sw $t0, -956($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -960($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -964($fp) 
lw $t1, -964($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -968($fp) 
lw $t1, -960($fp) 
lw $t2, -968($fp) 
add $t0, $t1, $t2 
sw $t0, -972($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -976($fp) 
lw $t1, -972($fp) 
lw $t2, -976($fp) 
sub $t0, $t1, $t2 
sw $t0, -980($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -984($fp) 
lw $t1, -984($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -988($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -992($fp) 
lw $t1, -988($fp) 
lw $t2, -992($fp) 
sub $t0, $t1, $t2 
sw $t0, -996($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1000($fp) 
lw $t1, -1000($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1004($fp) 
lw $t1, -996($fp) 
lw $t2, -1004($fp) 
add $t0, $t1, $t2 
sw $t0, -1008($fp) 
lw $t1, -980($fp) 
lw $t2, -1008($fp) 
add $t0, $t1, $t2 
sw $t0, -1012($fp) 
lw $t1, -956($fp) 
lw $t2, -1012($fp) 
sub $t0, $t1, $t2 
sw $t0, -1016($fp) 
lw $t1, -900($fp) 
lw $t2, -1016($fp) 
sub $t0, $t1, $t2 
sw $t0, -1020($fp) 
lw $t1, -772($fp) 
lw $t2, -1020($fp) 
add $t0, $t1, $t2 
sw $t0, -1024($fp) 
lw $t1, -528($fp) 
lw $t2, -1024($fp) 
sub $t0, $t1, $t2 
sw $t0, -1028($fp) 
lw $t0, r42 
lw $t1, -1028($fp) 
sw $t1, r42 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1032($fp) 
lw $t1, -1032($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1036($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1040($fp) 
lw $t1, -1036($fp) 
lw $t2, -1040($fp) 
sub $t0, $t1, $t2 
sw $t0, -1044($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1048($fp) 
lw $t1, -1048($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1052($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1056($fp) 
lw $t1, -1052($fp) 
lw $t2, -1056($fp) 
sub $t0, $t1, $t2 
sw $t0, -1060($fp) 
lw $t1, -1044($fp) 
lw $t2, -1060($fp) 
add $t0, $t1, $t2 
sw $t0, -1064($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1068($fp) 
lw $t1, -1068($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1072($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1076($fp) 
lw $t1, -1072($fp) 
lw $t2, -1076($fp) 
sub $t0, $t1, $t2 
sw $t0, -1080($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1084($fp) 
lw $t1, -1084($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1088($fp) 
lw $t1, -1080($fp) 
lw $t2, -1088($fp) 
add $t0, $t1, $t2 
sw $t0, -1092($fp) 
lw $t1, -1064($fp) 
lw $t2, -1092($fp) 
add $t0, $t1, $t2 
sw $t0, -1096($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1100($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1104($fp) 
lw $t1, -1104($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1108($fp) 
lw $t1, -1100($fp) 
lw $t2, -1108($fp) 
add $t0, $t1, $t2 
sw $t0, -1112($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1116($fp) 
lw $t1, -1112($fp) 
lw $t2, -1116($fp) 
sub $t0, $t1, $t2 
sw $t0, -1120($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1124($fp) 
lw $t1, -1124($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1128($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1132($fp) 
lw $t1, -1128($fp) 
lw $t2, -1132($fp) 
sub $t0, $t1, $t2 
sw $t0, -1136($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1140($fp) 
lw $t1, -1140($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1144($fp) 
lw $t1, -1136($fp) 
lw $t2, -1144($fp) 
add $t0, $t1, $t2 
sw $t0, -1148($fp) 
lw $t1, -1120($fp) 
lw $t2, -1148($fp) 
add $t0, $t1, $t2 
sw $t0, -1152($fp) 
lw $t1, -1096($fp) 
lw $t2, -1152($fp) 
sub $t0, $t1, $t2 
sw $t0, -1156($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1160($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1164($fp) 
lw $t1, -1164($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1168($fp) 
lw $t1, -1160($fp) 
lw $t2, -1168($fp) 
add $t0, $t1, $t2 
sw $t0, -1172($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1176($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1180($fp) 
lw $t1, -1180($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1184($fp) 
lw $t1, -1176($fp) 
lw $t2, -1184($fp) 
add $t0, $t1, $t2 
sw $t0, -1188($fp) 
lw $t1, -1172($fp) 
lw $t2, -1188($fp) 
sub $t0, $t1, $t2 
sw $t0, -1192($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1196($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1200($fp) 
lw $t1, -1200($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1204($fp) 
lw $t1, -1196($fp) 
lw $t2, -1204($fp) 
add $t0, $t1, $t2 
sw $t0, -1208($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1212($fp) 
lw $t1, -1208($fp) 
lw $t2, -1212($fp) 
sub $t0, $t1, $t2 
sw $t0, -1216($fp) 
lw $t1, -1192($fp) 
lw $t2, -1216($fp) 
sub $t0, $t1, $t2 
sw $t0, -1220($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1224($fp) 
lw $t1, -1224($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1228($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1232($fp) 
lw $t1, -1228($fp) 
lw $t2, -1232($fp) 
sub $t0, $t1, $t2 
sw $t0, -1236($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1240($fp) 
lw $t1, -1240($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1244($fp) 
lw $t1, -1236($fp) 
lw $t2, -1244($fp) 
add $t0, $t1, $t2 
sw $t0, -1248($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1252($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1256($fp) 
lw $t1, -1256($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1260($fp) 
lw $t1, -1252($fp) 
lw $t2, -1260($fp) 
add $t0, $t1, $t2 
sw $t0, -1264($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1268($fp) 
lw $t1, -1264($fp) 
lw $t2, -1268($fp) 
sub $t0, $t1, $t2 
sw $t0, -1272($fp) 
lw $t1, -1248($fp) 
lw $t2, -1272($fp) 
sub $t0, $t1, $t2 
sw $t0, -1276($fp) 
lw $t1, -1220($fp) 
lw $t2, -1276($fp) 
add $t0, $t1, $t2 
sw $t0, -1280($fp) 
lw $t1, -1156($fp) 
lw $t2, -1280($fp) 
sub $t0, $t1, $t2 
sw $t0, -1284($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1288($fp) 
lw $t1, -1288($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1292($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1296($fp) 
lw $t1, -1292($fp) 
lw $t2, -1296($fp) 
sub $t0, $t1, $t2 
sw $t0, -1300($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1304($fp) 
lw $t1, -1304($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1308($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1312($fp) 
lw $t1, -1308($fp) 
lw $t2, -1312($fp) 
sub $t0, $t1, $t2 
sw $t0, -1316($fp) 
lw $t1, -1300($fp) 
lw $t2, -1316($fp) 
add $t0, $t1, $t2 
sw $t0, -1320($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1324($fp) 
lw $t1, -1324($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1328($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1332($fp) 
lw $t1, -1328($fp) 
lw $t2, -1332($fp) 
sub $t0, $t1, $t2 
sw $t0, -1336($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1340($fp) 
lw $t1, -1340($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1344($fp) 
lw $t1, -1336($fp) 
lw $t2, -1344($fp) 
add $t0, $t1, $t2 
sw $t0, -1348($fp) 
lw $t1, -1320($fp) 
lw $t2, -1348($fp) 
add $t0, $t1, $t2 
sw $t0, -1352($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1356($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1360($fp) 
lw $t1, -1360($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1364($fp) 
lw $t1, -1356($fp) 
lw $t2, -1364($fp) 
add $t0, $t1, $t2 
sw $t0, -1368($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1372($fp) 
lw $t1, -1368($fp) 
lw $t2, -1372($fp) 
sub $t0, $t1, $t2 
sw $t0, -1376($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1380($fp) 
lw $t1, -1380($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1384($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1388($fp) 
lw $t1, -1384($fp) 
lw $t2, -1388($fp) 
sub $t0, $t1, $t2 
sw $t0, -1392($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1396($fp) 
lw $t1, -1396($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1400($fp) 
lw $t1, -1392($fp) 
lw $t2, -1400($fp) 
add $t0, $t1, $t2 
sw $t0, -1404($fp) 
lw $t1, -1376($fp) 
lw $t2, -1404($fp) 
add $t0, $t1, $t2 
sw $t0, -1408($fp) 
lw $t1, -1352($fp) 
lw $t2, -1408($fp) 
sub $t0, $t1, $t2 
sw $t0, -1412($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1416($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1420($fp) 
lw $t1, -1420($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1424($fp) 
lw $t1, -1416($fp) 
lw $t2, -1424($fp) 
add $t0, $t1, $t2 
sw $t0, -1428($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1432($fp) 
lw $t1, -1428($fp) 
lw $t2, -1432($fp) 
sub $t0, $t1, $t2 
sw $t0, -1436($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1440($fp) 
lw $t1, -1440($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1444($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1448($fp) 
lw $t1, -1444($fp) 
lw $t2, -1448($fp) 
sub $t0, $t1, $t2 
sw $t0, -1452($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1456($fp) 
lw $t1, -1456($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1460($fp) 
lw $t1, -1452($fp) 
lw $t2, -1460($fp) 
add $t0, $t1, $t2 
sw $t0, -1464($fp) 
lw $t1, -1436($fp) 
lw $t2, -1464($fp) 
add $t0, $t1, $t2 
sw $t0, -1468($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1472($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1476($fp) 
lw $t1, -1476($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1480($fp) 
lw $t1, -1472($fp) 
lw $t2, -1480($fp) 
add $t0, $t1, $t2 
sw $t0, -1484($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1488($fp) 
lw $t1, -1484($fp) 
lw $t2, -1488($fp) 
sub $t0, $t1, $t2 
sw $t0, -1492($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1496($fp) 
lw $t1, -1496($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1500($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1504($fp) 
lw $t1, -1500($fp) 
lw $t2, -1504($fp) 
sub $t0, $t1, $t2 
sw $t0, -1508($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1512($fp) 
lw $t1, -1512($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1516($fp) 
lw $t1, -1508($fp) 
lw $t2, -1516($fp) 
add $t0, $t1, $t2 
sw $t0, -1520($fp) 
lw $t1, -1492($fp) 
lw $t2, -1520($fp) 
add $t0, $t1, $t2 
sw $t0, -1524($fp) 
lw $t1, -1468($fp) 
lw $t2, -1524($fp) 
sub $t0, $t1, $t2 
sw $t0, -1528($fp) 
lw $t1, -1412($fp) 
lw $t2, -1528($fp) 
sub $t0, $t1, $t2 
sw $t0, -1532($fp) 
lw $t1, -1284($fp) 
lw $t2, -1532($fp) 
add $t0, $t1, $t2 
sw $t0, -1536($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1540($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1544($fp) 
lw $t1, -1544($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1548($fp) 
lw $t1, -1540($fp) 
lw $t2, -1548($fp) 
add $t0, $t1, $t2 
sw $t0, -1552($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1556($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1560($fp) 
lw $t1, -1560($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1564($fp) 
lw $t1, -1556($fp) 
lw $t2, -1564($fp) 
add $t0, $t1, $t2 
sw $t0, -1568($fp) 
lw $t1, -1552($fp) 
lw $t2, -1568($fp) 
sub $t0, $t1, $t2 
sw $t0, -1572($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1576($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1580($fp) 
lw $t1, -1580($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1584($fp) 
lw $t1, -1576($fp) 
lw $t2, -1584($fp) 
add $t0, $t1, $t2 
sw $t0, -1588($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1592($fp) 
lw $t1, -1588($fp) 
lw $t2, -1592($fp) 
sub $t0, $t1, $t2 
sw $t0, -1596($fp) 
lw $t1, -1572($fp) 
lw $t2, -1596($fp) 
sub $t0, $t1, $t2 
sw $t0, -1600($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1604($fp) 
lw $t1, -1604($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1608($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1612($fp) 
lw $t1, -1608($fp) 
lw $t2, -1612($fp) 
sub $t0, $t1, $t2 
sw $t0, -1616($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1620($fp) 
lw $t1, -1620($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1624($fp) 
lw $t1, -1616($fp) 
lw $t2, -1624($fp) 
add $t0, $t1, $t2 
sw $t0, -1628($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1632($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1636($fp) 
lw $t1, -1636($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1640($fp) 
lw $t1, -1632($fp) 
lw $t2, -1640($fp) 
add $t0, $t1, $t2 
sw $t0, -1644($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1648($fp) 
lw $t1, -1644($fp) 
lw $t2, -1648($fp) 
sub $t0, $t1, $t2 
sw $t0, -1652($fp) 
lw $t1, -1628($fp) 
lw $t2, -1652($fp) 
sub $t0, $t1, $t2 
sw $t0, -1656($fp) 
lw $t1, -1600($fp) 
lw $t2, -1656($fp) 
add $t0, $t1, $t2 
sw $t0, -1660($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1664($fp) 
lw $t1, -1664($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1668($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1672($fp) 
lw $t1, -1668($fp) 
lw $t2, -1672($fp) 
sub $t0, $t1, $t2 
sw $t0, -1676($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1680($fp) 
lw $t1, -1680($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1684($fp) 
lw $t1, -1676($fp) 
lw $t2, -1684($fp) 
add $t0, $t1, $t2 
sw $t0, -1688($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1692($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1696($fp) 
lw $t1, -1696($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1700($fp) 
lw $t1, -1692($fp) 
lw $t2, -1700($fp) 
add $t0, $t1, $t2 
sw $t0, -1704($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1708($fp) 
lw $t1, -1704($fp) 
lw $t2, -1708($fp) 
sub $t0, $t1, $t2 
sw $t0, -1712($fp) 
lw $t1, -1688($fp) 
lw $t2, -1712($fp) 
sub $t0, $t1, $t2 
sw $t0, -1716($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1720($fp) 
lw $t1, -1720($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1724($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1728($fp) 
lw $t1, -1724($fp) 
lw $t2, -1728($fp) 
sub $t0, $t1, $t2 
sw $t0, -1732($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1736($fp) 
lw $t1, -1736($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1740($fp) 
lw $t1, -1732($fp) 
lw $t2, -1740($fp) 
add $t0, $t1, $t2 
sw $t0, -1744($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1748($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1752($fp) 
lw $t1, -1752($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1756($fp) 
lw $t1, -1748($fp) 
lw $t2, -1756($fp) 
add $t0, $t1, $t2 
sw $t0, -1760($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1764($fp) 
lw $t1, -1760($fp) 
lw $t2, -1764($fp) 
sub $t0, $t1, $t2 
sw $t0, -1768($fp) 
lw $t1, -1744($fp) 
lw $t2, -1768($fp) 
sub $t0, $t1, $t2 
sw $t0, -1772($fp) 
lw $t1, -1716($fp) 
lw $t2, -1772($fp) 
add $t0, $t1, $t2 
sw $t0, -1776($fp) 
lw $t1, -1660($fp) 
lw $t2, -1776($fp) 
add $t0, $t1, $t2 
sw $t0, -1780($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1784($fp) 
lw $t1, -1784($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1788($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1792($fp) 
lw $t1, -1788($fp) 
lw $t2, -1792($fp) 
sub $t0, $t1, $t2 
sw $t0, -1796($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1800($fp) 
lw $t1, -1800($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1804($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1808($fp) 
lw $t1, -1804($fp) 
lw $t2, -1808($fp) 
sub $t0, $t1, $t2 
sw $t0, -1812($fp) 
lw $t1, -1796($fp) 
lw $t2, -1812($fp) 
add $t0, $t1, $t2 
sw $t0, -1816($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1820($fp) 
lw $t1, -1820($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1824($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1828($fp) 
lw $t1, -1824($fp) 
lw $t2, -1828($fp) 
sub $t0, $t1, $t2 
sw $t0, -1832($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1836($fp) 
lw $t1, -1836($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1840($fp) 
lw $t1, -1832($fp) 
lw $t2, -1840($fp) 
add $t0, $t1, $t2 
sw $t0, -1844($fp) 
lw $t1, -1816($fp) 
lw $t2, -1844($fp) 
add $t0, $t1, $t2 
sw $t0, -1848($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1852($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1856($fp) 
lw $t1, -1856($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1860($fp) 
lw $t1, -1852($fp) 
lw $t2, -1860($fp) 
add $t0, $t1, $t2 
sw $t0, -1864($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1868($fp) 
lw $t1, -1864($fp) 
lw $t2, -1868($fp) 
sub $t0, $t1, $t2 
sw $t0, -1872($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1876($fp) 
lw $t1, -1876($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1880($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1884($fp) 
lw $t1, -1880($fp) 
lw $t2, -1884($fp) 
sub $t0, $t1, $t2 
sw $t0, -1888($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1892($fp) 
lw $t1, -1892($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1896($fp) 
lw $t1, -1888($fp) 
lw $t2, -1896($fp) 
add $t0, $t1, $t2 
sw $t0, -1900($fp) 
lw $t1, -1872($fp) 
lw $t2, -1900($fp) 
add $t0, $t1, $t2 
sw $t0, -1904($fp) 
lw $t1, -1848($fp) 
lw $t2, -1904($fp) 
sub $t0, $t1, $t2 
sw $t0, -1908($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1912($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1916($fp) 
lw $t1, -1916($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1920($fp) 
lw $t1, -1912($fp) 
lw $t2, -1920($fp) 
add $t0, $t1, $t2 
sw $t0, -1924($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1928($fp) 
lw $t1, -1924($fp) 
lw $t2, -1928($fp) 
sub $t0, $t1, $t2 
sw $t0, -1932($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1936($fp) 
lw $t1, -1936($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1940($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1944($fp) 
lw $t1, -1940($fp) 
lw $t2, -1944($fp) 
sub $t0, $t1, $t2 
sw $t0, -1948($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1952($fp) 
lw $t1, -1952($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1956($fp) 
lw $t1, -1948($fp) 
lw $t2, -1956($fp) 
add $t0, $t1, $t2 
sw $t0, -1960($fp) 
lw $t1, -1932($fp) 
lw $t2, -1960($fp) 
add $t0, $t1, $t2 
sw $t0, -1964($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1968($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1972($fp) 
lw $t1, -1972($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1976($fp) 
lw $t1, -1968($fp) 
lw $t2, -1976($fp) 
add $t0, $t1, $t2 
sw $t0, -1980($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1984($fp) 
lw $t1, -1980($fp) 
lw $t2, -1984($fp) 
sub $t0, $t1, $t2 
sw $t0, -1988($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -1992($fp) 
lw $t1, -1992($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -1996($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2000($fp) 
lw $t1, -1996($fp) 
lw $t2, -2000($fp) 
sub $t0, $t1, $t2 
sw $t0, -2004($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2008($fp) 
lw $t1, -2008($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2012($fp) 
lw $t1, -2004($fp) 
lw $t2, -2012($fp) 
add $t0, $t1, $t2 
sw $t0, -2016($fp) 
lw $t1, -1988($fp) 
lw $t2, -2016($fp) 
add $t0, $t1, $t2 
sw $t0, -2020($fp) 
lw $t1, -1964($fp) 
lw $t2, -2020($fp) 
sub $t0, $t1, $t2 
sw $t0, -2024($fp) 
lw $t1, -1908($fp) 
lw $t2, -2024($fp) 
sub $t0, $t1, $t2 
sw $t0, -2028($fp) 
lw $t1, -1780($fp) 
lw $t2, -2028($fp) 
add $t0, $t1, $t2 
sw $t0, -2032($fp) 
lw $t1, -1536($fp) 
lw $t2, -2032($fp) 
sub $t0, $t1, $t2 
sw $t0, -2036($fp) 
lw $t0, r43 
lw $t1, -2036($fp) 
sw $t1, r43 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2040($fp) 
lw $t1, -2040($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2044($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2048($fp) 
lw $t1, -2044($fp) 
lw $t2, -2048($fp) 
sub $t0, $t1, $t2 
sw $t0, -2052($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2056($fp) 
lw $t1, -2056($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2060($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2064($fp) 
lw $t1, -2060($fp) 
lw $t2, -2064($fp) 
sub $t0, $t1, $t2 
sw $t0, -2068($fp) 
lw $t1, -2052($fp) 
lw $t2, -2068($fp) 
add $t0, $t1, $t2 
sw $t0, -2072($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2076($fp) 
lw $t1, -2076($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2080($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2084($fp) 
lw $t1, -2080($fp) 
lw $t2, -2084($fp) 
sub $t0, $t1, $t2 
sw $t0, -2088($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2092($fp) 
lw $t1, -2092($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2096($fp) 
lw $t1, -2088($fp) 
lw $t2, -2096($fp) 
add $t0, $t1, $t2 
sw $t0, -2100($fp) 
lw $t1, -2072($fp) 
lw $t2, -2100($fp) 
add $t0, $t1, $t2 
sw $t0, -2104($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2108($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2112($fp) 
lw $t1, -2112($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2116($fp) 
lw $t1, -2108($fp) 
lw $t2, -2116($fp) 
add $t0, $t1, $t2 
sw $t0, -2120($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2124($fp) 
lw $t1, -2120($fp) 
lw $t2, -2124($fp) 
sub $t0, $t1, $t2 
sw $t0, -2128($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2132($fp) 
lw $t1, -2132($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2136($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2140($fp) 
lw $t1, -2136($fp) 
lw $t2, -2140($fp) 
sub $t0, $t1, $t2 
sw $t0, -2144($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2148($fp) 
lw $t1, -2148($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2152($fp) 
lw $t1, -2144($fp) 
lw $t2, -2152($fp) 
add $t0, $t1, $t2 
sw $t0, -2156($fp) 
lw $t1, -2128($fp) 
lw $t2, -2156($fp) 
add $t0, $t1, $t2 
sw $t0, -2160($fp) 
lw $t1, -2104($fp) 
lw $t2, -2160($fp) 
sub $t0, $t1, $t2 
sw $t0, -2164($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2168($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2172($fp) 
lw $t1, -2172($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2176($fp) 
lw $t1, -2168($fp) 
lw $t2, -2176($fp) 
add $t0, $t1, $t2 
sw $t0, -2180($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2184($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2188($fp) 
lw $t1, -2188($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2192($fp) 
lw $t1, -2184($fp) 
lw $t2, -2192($fp) 
add $t0, $t1, $t2 
sw $t0, -2196($fp) 
lw $t1, -2180($fp) 
lw $t2, -2196($fp) 
sub $t0, $t1, $t2 
sw $t0, -2200($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2204($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2208($fp) 
lw $t1, -2208($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2212($fp) 
lw $t1, -2204($fp) 
lw $t2, -2212($fp) 
add $t0, $t1, $t2 
sw $t0, -2216($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2220($fp) 
lw $t1, -2216($fp) 
lw $t2, -2220($fp) 
sub $t0, $t1, $t2 
sw $t0, -2224($fp) 
lw $t1, -2200($fp) 
lw $t2, -2224($fp) 
sub $t0, $t1, $t2 
sw $t0, -2228($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2232($fp) 
lw $t1, -2232($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2236($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2240($fp) 
lw $t1, -2236($fp) 
lw $t2, -2240($fp) 
sub $t0, $t1, $t2 
sw $t0, -2244($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2248($fp) 
lw $t1, -2248($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2252($fp) 
lw $t1, -2244($fp) 
lw $t2, -2252($fp) 
add $t0, $t1, $t2 
sw $t0, -2256($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2260($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2264($fp) 
lw $t1, -2264($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2268($fp) 
lw $t1, -2260($fp) 
lw $t2, -2268($fp) 
add $t0, $t1, $t2 
sw $t0, -2272($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2276($fp) 
lw $t1, -2272($fp) 
lw $t2, -2276($fp) 
sub $t0, $t1, $t2 
sw $t0, -2280($fp) 
lw $t1, -2256($fp) 
lw $t2, -2280($fp) 
sub $t0, $t1, $t2 
sw $t0, -2284($fp) 
lw $t1, -2228($fp) 
lw $t2, -2284($fp) 
add $t0, $t1, $t2 
sw $t0, -2288($fp) 
lw $t1, -2164($fp) 
lw $t2, -2288($fp) 
sub $t0, $t1, $t2 
sw $t0, -2292($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2296($fp) 
lw $t1, -2296($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2300($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2304($fp) 
lw $t1, -2300($fp) 
lw $t2, -2304($fp) 
sub $t0, $t1, $t2 
sw $t0, -2308($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2312($fp) 
lw $t1, -2312($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2316($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2320($fp) 
lw $t1, -2316($fp) 
lw $t2, -2320($fp) 
sub $t0, $t1, $t2 
sw $t0, -2324($fp) 
lw $t1, -2308($fp) 
lw $t2, -2324($fp) 
add $t0, $t1, $t2 
sw $t0, -2328($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2332($fp) 
lw $t1, -2332($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2336($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2340($fp) 
lw $t1, -2336($fp) 
lw $t2, -2340($fp) 
sub $t0, $t1, $t2 
sw $t0, -2344($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2348($fp) 
lw $t1, -2348($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2352($fp) 
lw $t1, -2344($fp) 
lw $t2, -2352($fp) 
add $t0, $t1, $t2 
sw $t0, -2356($fp) 
lw $t1, -2328($fp) 
lw $t2, -2356($fp) 
add $t0, $t1, $t2 
sw $t0, -2360($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2364($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2368($fp) 
lw $t1, -2368($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2372($fp) 
lw $t1, -2364($fp) 
lw $t2, -2372($fp) 
add $t0, $t1, $t2 
sw $t0, -2376($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2380($fp) 
lw $t1, -2376($fp) 
lw $t2, -2380($fp) 
sub $t0, $t1, $t2 
sw $t0, -2384($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2388($fp) 
lw $t1, -2388($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2392($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2396($fp) 
lw $t1, -2392($fp) 
lw $t2, -2396($fp) 
sub $t0, $t1, $t2 
sw $t0, -2400($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2404($fp) 
lw $t1, -2404($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2408($fp) 
lw $t1, -2400($fp) 
lw $t2, -2408($fp) 
add $t0, $t1, $t2 
sw $t0, -2412($fp) 
lw $t1, -2384($fp) 
lw $t2, -2412($fp) 
add $t0, $t1, $t2 
sw $t0, -2416($fp) 
lw $t1, -2360($fp) 
lw $t2, -2416($fp) 
sub $t0, $t1, $t2 
sw $t0, -2420($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2424($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2428($fp) 
lw $t1, -2428($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2432($fp) 
lw $t1, -2424($fp) 
lw $t2, -2432($fp) 
add $t0, $t1, $t2 
sw $t0, -2436($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2440($fp) 
lw $t1, -2436($fp) 
lw $t2, -2440($fp) 
sub $t0, $t1, $t2 
sw $t0, -2444($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2448($fp) 
lw $t1, -2448($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2452($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2456($fp) 
lw $t1, -2452($fp) 
lw $t2, -2456($fp) 
sub $t0, $t1, $t2 
sw $t0, -2460($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2464($fp) 
lw $t1, -2464($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2468($fp) 
lw $t1, -2460($fp) 
lw $t2, -2468($fp) 
add $t0, $t1, $t2 
sw $t0, -2472($fp) 
lw $t1, -2444($fp) 
lw $t2, -2472($fp) 
add $t0, $t1, $t2 
sw $t0, -2476($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2480($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2484($fp) 
lw $t1, -2484($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2488($fp) 
lw $t1, -2480($fp) 
lw $t2, -2488($fp) 
add $t0, $t1, $t2 
sw $t0, -2492($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2496($fp) 
lw $t1, -2492($fp) 
lw $t2, -2496($fp) 
sub $t0, $t1, $t2 
sw $t0, -2500($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2504($fp) 
lw $t1, -2504($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2508($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2512($fp) 
lw $t1, -2508($fp) 
lw $t2, -2512($fp) 
sub $t0, $t1, $t2 
sw $t0, -2516($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2520($fp) 
lw $t1, -2520($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2524($fp) 
lw $t1, -2516($fp) 
lw $t2, -2524($fp) 
add $t0, $t1, $t2 
sw $t0, -2528($fp) 
lw $t1, -2500($fp) 
lw $t2, -2528($fp) 
add $t0, $t1, $t2 
sw $t0, -2532($fp) 
lw $t1, -2476($fp) 
lw $t2, -2532($fp) 
sub $t0, $t1, $t2 
sw $t0, -2536($fp) 
lw $t1, -2420($fp) 
lw $t2, -2536($fp) 
sub $t0, $t1, $t2 
sw $t0, -2540($fp) 
lw $t1, -2292($fp) 
lw $t2, -2540($fp) 
add $t0, $t1, $t2 
sw $t0, -2544($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2548($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2552($fp) 
lw $t1, -2552($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2556($fp) 
lw $t1, -2548($fp) 
lw $t2, -2556($fp) 
add $t0, $t1, $t2 
sw $t0, -2560($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2564($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2568($fp) 
lw $t1, -2568($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2572($fp) 
lw $t1, -2564($fp) 
lw $t2, -2572($fp) 
add $t0, $t1, $t2 
sw $t0, -2576($fp) 
lw $t1, -2560($fp) 
lw $t2, -2576($fp) 
sub $t0, $t1, $t2 
sw $t0, -2580($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2584($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2588($fp) 
lw $t1, -2588($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2592($fp) 
lw $t1, -2584($fp) 
lw $t2, -2592($fp) 
add $t0, $t1, $t2 
sw $t0, -2596($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2600($fp) 
lw $t1, -2596($fp) 
lw $t2, -2600($fp) 
sub $t0, $t1, $t2 
sw $t0, -2604($fp) 
lw $t1, -2580($fp) 
lw $t2, -2604($fp) 
sub $t0, $t1, $t2 
sw $t0, -2608($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2612($fp) 
lw $t1, -2612($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2616($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2620($fp) 
lw $t1, -2616($fp) 
lw $t2, -2620($fp) 
sub $t0, $t1, $t2 
sw $t0, -2624($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2628($fp) 
lw $t1, -2628($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2632($fp) 
lw $t1, -2624($fp) 
lw $t2, -2632($fp) 
add $t0, $t1, $t2 
sw $t0, -2636($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2640($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2644($fp) 
lw $t1, -2644($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2648($fp) 
lw $t1, -2640($fp) 
lw $t2, -2648($fp) 
add $t0, $t1, $t2 
sw $t0, -2652($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2656($fp) 
lw $t1, -2652($fp) 
lw $t2, -2656($fp) 
sub $t0, $t1, $t2 
sw $t0, -2660($fp) 
lw $t1, -2636($fp) 
lw $t2, -2660($fp) 
sub $t0, $t1, $t2 
sw $t0, -2664($fp) 
lw $t1, -2608($fp) 
lw $t2, -2664($fp) 
add $t0, $t1, $t2 
sw $t0, -2668($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2672($fp) 
lw $t1, -2672($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2676($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2680($fp) 
lw $t1, -2676($fp) 
lw $t2, -2680($fp) 
sub $t0, $t1, $t2 
sw $t0, -2684($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2688($fp) 
lw $t1, -2688($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2692($fp) 
lw $t1, -2684($fp) 
lw $t2, -2692($fp) 
add $t0, $t1, $t2 
sw $t0, -2696($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2700($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2704($fp) 
lw $t1, -2704($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2708($fp) 
lw $t1, -2700($fp) 
lw $t2, -2708($fp) 
add $t0, $t1, $t2 
sw $t0, -2712($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2716($fp) 
lw $t1, -2712($fp) 
lw $t2, -2716($fp) 
sub $t0, $t1, $t2 
sw $t0, -2720($fp) 
lw $t1, -2696($fp) 
lw $t2, -2720($fp) 
sub $t0, $t1, $t2 
sw $t0, -2724($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2728($fp) 
lw $t1, -2728($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2732($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2736($fp) 
lw $t1, -2732($fp) 
lw $t2, -2736($fp) 
sub $t0, $t1, $t2 
sw $t0, -2740($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2744($fp) 
lw $t1, -2744($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2748($fp) 
lw $t1, -2740($fp) 
lw $t2, -2748($fp) 
add $t0, $t1, $t2 
sw $t0, -2752($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2756($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2760($fp) 
lw $t1, -2760($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2764($fp) 
lw $t1, -2756($fp) 
lw $t2, -2764($fp) 
add $t0, $t1, $t2 
sw $t0, -2768($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2772($fp) 
lw $t1, -2768($fp) 
lw $t2, -2772($fp) 
sub $t0, $t1, $t2 
sw $t0, -2776($fp) 
lw $t1, -2752($fp) 
lw $t2, -2776($fp) 
sub $t0, $t1, $t2 
sw $t0, -2780($fp) 
lw $t1, -2724($fp) 
lw $t2, -2780($fp) 
add $t0, $t1, $t2 
sw $t0, -2784($fp) 
lw $t1, -2668($fp) 
lw $t2, -2784($fp) 
add $t0, $t1, $t2 
sw $t0, -2788($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2792($fp) 
lw $t1, -2792($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2796($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2800($fp) 
lw $t1, -2796($fp) 
lw $t2, -2800($fp) 
sub $t0, $t1, $t2 
sw $t0, -2804($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2808($fp) 
lw $t1, -2808($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2812($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2816($fp) 
lw $t1, -2812($fp) 
lw $t2, -2816($fp) 
sub $t0, $t1, $t2 
sw $t0, -2820($fp) 
lw $t1, -2804($fp) 
lw $t2, -2820($fp) 
add $t0, $t1, $t2 
sw $t0, -2824($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2828($fp) 
lw $t1, -2828($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2832($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2836($fp) 
lw $t1, -2832($fp) 
lw $t2, -2836($fp) 
sub $t0, $t1, $t2 
sw $t0, -2840($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2844($fp) 
lw $t1, -2844($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2848($fp) 
lw $t1, -2840($fp) 
lw $t2, -2848($fp) 
add $t0, $t1, $t2 
sw $t0, -2852($fp) 
lw $t1, -2824($fp) 
lw $t2, -2852($fp) 
add $t0, $t1, $t2 
sw $t0, -2856($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2860($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2864($fp) 
lw $t1, -2864($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2868($fp) 
lw $t1, -2860($fp) 
lw $t2, -2868($fp) 
add $t0, $t1, $t2 
sw $t0, -2872($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2876($fp) 
lw $t1, -2872($fp) 
lw $t2, -2876($fp) 
sub $t0, $t1, $t2 
sw $t0, -2880($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2884($fp) 
lw $t1, -2884($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2888($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2892($fp) 
lw $t1, -2888($fp) 
lw $t2, -2892($fp) 
sub $t0, $t1, $t2 
sw $t0, -2896($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2900($fp) 
lw $t1, -2900($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2904($fp) 
lw $t1, -2896($fp) 
lw $t2, -2904($fp) 
add $t0, $t1, $t2 
sw $t0, -2908($fp) 
lw $t1, -2880($fp) 
lw $t2, -2908($fp) 
add $t0, $t1, $t2 
sw $t0, -2912($fp) 
lw $t1, -2856($fp) 
lw $t2, -2912($fp) 
sub $t0, $t1, $t2 
sw $t0, -2916($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2920($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2924($fp) 
lw $t1, -2924($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2928($fp) 
lw $t1, -2920($fp) 
lw $t2, -2928($fp) 
add $t0, $t1, $t2 
sw $t0, -2932($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2936($fp) 
lw $t1, -2932($fp) 
lw $t2, -2936($fp) 
sub $t0, $t1, $t2 
sw $t0, -2940($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2944($fp) 
lw $t1, -2944($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2948($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2952($fp) 
lw $t1, -2948($fp) 
lw $t2, -2952($fp) 
sub $t0, $t1, $t2 
sw $t0, -2956($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2960($fp) 
lw $t1, -2960($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2964($fp) 
lw $t1, -2956($fp) 
lw $t2, -2964($fp) 
add $t0, $t1, $t2 
sw $t0, -2968($fp) 
lw $t1, -2940($fp) 
lw $t2, -2968($fp) 
add $t0, $t1, $t2 
sw $t0, -2972($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2976($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -2980($fp) 
lw $t1, -2980($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2984($fp) 
lw $t1, -2976($fp) 
lw $t2, -2984($fp) 
add $t0, $t1, $t2 
sw $t0, -2988($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -2992($fp) 
lw $t1, -2988($fp) 
lw $t2, -2992($fp) 
sub $t0, $t1, $t2 
sw $t0, -2996($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -3000($fp) 
lw $t1, -3000($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -3004($fp) 
lw $t1, r42 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -3008($fp) 
lw $t1, -3004($fp) 
lw $t2, -3008($fp) 
sub $t0, $t1, $t2 
sw $t0, -3012($fp) 
lw $t1, r44 
lw $t2, r42 
sub $t0, $t1, $t2 
sw $t0, -3016($fp) 
lw $t1, -3016($fp) 
lw $t2, r43 
add $t0, $t1, $t2 
sw $t0, -3020($fp) 
lw $t1, -3012($fp) 
lw $t2, -3020($fp) 
add $t0, $t1, $t2 
sw $t0, -3024($fp) 
lw $t1, -2996($fp) 
lw $t2, -3024($fp) 
add $t0, $t1, $t2 
sw $t0, -3028($fp) 
lw $t1, -2972($fp) 
lw $t2, -3028($fp) 
sub $t0, $t1, $t2 
sw $t0, -3032($fp) 
lw $t1, -2916($fp) 
lw $t2, -3032($fp) 
sub $t0, $t1, $t2 
sw $t0, -3036($fp) 
lw $t1, -2788($fp) 
lw $t2, -3036($fp) 
add $t0, $t1, $t2 
sw $t0, -3040($fp) 
lw $t1, -2544($fp) 
lw $t2, -3040($fp) 
sub $t0, $t1, $t2 
sw $t0, -3044($fp) 
lw $t0, r44 
lw $t1, -3044($fp) 
sw $t1, r44 
jump47: 
lw $t1, r44 
slt $t0, $t1, 536870912 
sw $t0, -3048($fp) 
beq $t0, $zero, if_false53 
if_true51: 
lw $t1, r44 
sgt $t0, $t1, -536870912 
sw $t0, -3056($fp) 
lw $t1, -3056($fp) 
sw $t1, -3052($fp) 
b go52 
if_false53: 
sw $0, -3052($fp) 
go52: 
lw $t0, -3052($fp) 
bne $t0, $zero, if_true45 
if_false46: 
add $sp, $sp, -388 
sw $a0, 0($sp) 
lw $t1, r42 
move $a0, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal toString1 
lw $a0, 16($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -3064($fp) 
lw $t1, -3064($fp) 
la $t2, s13 
lw $s1, ($t1) 
li $s2, 1 
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
sw $v0, -3068($fp) 
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
add $sp, $sp, -388 
sw $a0, 0($sp) 
lw $t1, r43 
move $a0, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal toString1 
lw $a0, 16($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -3076($fp) 
lw $t1, -3068($fp) 
lw $t2, -3076($fp) 
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
sw $v0, -3080($fp) 
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
lw $t1, -3080($fp) 
la $t2, s13 
lw $s1, ($t1) 
li $s2, 1 
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
sw $v0, -3084($fp) 
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
add $sp, $sp, -388 
sw $a0, 0($sp) 
lw $t1, r44 
move $a0, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal toString1 
lw $a0, 16($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -3092($fp) 
lw $t1, -3084($fp) 
lw $t2, -3092($fp) 
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
sw $v0, -3096($fp) 
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
lw $t0, -3096($fp) 
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
