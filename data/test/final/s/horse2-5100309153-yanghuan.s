.data
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
s13:	.asciiz	"no solution!\n"
s13ln:	.asciiz	"no solution!\n\n"
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
check44: 
slt $t0, $a0, $a1 
sw $t0, -12($fp) 
beq $t0, $zero, if_false47 
if_true45: 
sge $t0, $a0, $0 
sw $t0, -20($fp) 
lw $t1, -20($fp) 
sw $t1, -16($fp) 
b go46 
if_false47: 
sw $0, -16($fp) 
go46: 
lw $t1, -16($fp) 
move $v0, $t1 
jr $ra 
main: 
li $s6, 16 
li $t9, 1 
li $t8, 4 
li $t6, 2 
li $v1, 8 
move $fp, $sp 
li $v0, 5 
syscall  
sw $v0, -64($fp) 
lw $t1, -64($fp) 
sw $t1, 0($fp) 
sw $0, -12($fp) 
lw $t1, -12($fp) 
sw $t1, -8($fp) 
sw $t1, -24($fp) 
sw $t1, -4($fp) 
lw $t1, 0($fp) 
sub $t0, $t1, $t9 
sw $t0, -68($fp) 
lw $t1, -68($fp) 
sw $t1, -20($fp) 
sw $t1, -16($fp) 
sw $0, -40($fp) 
lw $t1, -40($fp) 
sw $t1, -36($fp) 
sw $0, -28($fp) 
lw $t1, -28($fp) 
sw $t1, -32($fp) 
lw $t0, -72($fp) 
lw $t2, 0($fp) 
mul $t0, $t2, $t2 
sw $t0, -72($fp) 
lw $t1, -72($fp) 
sw $t1, -76($fp) 
lw $t0, -76($fp) 
mul $t0, $t0, $t8 
add $t0, $t0, $t8 
sw $t0, -76($fp) 
li $v0, 9 
move $t7, $a0 
lw $t1, -76($fp) 
move $a0, $t1 
sw $t1, -76($fp) 
syscall  
move $a0, $t7 
lw $t0, -76($fp) 
sub $t0, $t0, $t8 
div $t0, $t0, $t8 
sw $t0, -76($fp) 
sw $t0, 0($v0) 
sw $v0, -76($fp) 
lw $t1, -76($fp) 
sw $t1, -44($fp) 
sw $0, -56($fp) 
lw $t0, -80($fp) 
lw $t2, 0($fp) 
mul $t0, $t2, $t2 
sw $t0, -80($fp) 
lw $t1, -56($fp) 
lw $t2, -80($fp) 
bge $t1, $t2, if_false50 
if_true49: 
lw $t1, -44($fp) 
sw $t1, -88($fp) 
lw $t1, -56($fp) 
mul $t0, $t1, $t8 
sw $t0, -92($fp) 
lw $t0, -88($fp) 
lw $t2, -92($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -88($fp) 
sw $0, ($t0) 
jump51: 
lw $t1, -56($fp) 
sw $t1, -100($fp) 
lw $t0, -56($fp) 
add $t0, $t0, $t9 
sw $t0, -56($fp) 
lw $t0, -104($fp) 
lw $t2, 0($fp) 
mul $t0, $t2, $t2 
sw $t0, -104($fp) 
lw $t1, -56($fp) 
lw $t2, -104($fp) 
slt $t0, $t1, $t2 
sw $t0, -108($fp) 
bne $t0, $zero, if_true49 
if_false50: 
lw $t0, -112($fp) 
lw $t2, 0($fp) 
mul $t0, $t2, $t2 
sw $t0, -112($fp) 
lw $t1, -112($fp) 
sw $t1, -116($fp) 
lw $t0, -116($fp) 
mul $t0, $t0, $t8 
add $t0, $t0, $t8 
sw $t0, -116($fp) 
li $v0, 9 
move $t7, $a0 
lw $t1, -116($fp) 
move $a0, $t1 
sw $t1, -116($fp) 
syscall  
move $a0, $t7 
lw $t0, -116($fp) 
sub $t0, $t0, $t8 
div $t0, $t0, $t8 
sw $t0, -116($fp) 
sw $t0, 0($v0) 
sw $v0, -116($fp) 
lw $t1, -116($fp) 
sw $t1, -48($fp) 
sw $0, -56($fp) 
lw $t0, -120($fp) 
lw $t2, 0($fp) 
mul $t0, $t2, $t2 
sw $t0, -120($fp) 
lw $t1, -56($fp) 
lw $t2, -120($fp) 
bge $t1, $t2, if_false53 
if_true52: 
lw $t1, -48($fp) 
sw $t1, -128($fp) 
lw $t1, -56($fp) 
mul $t0, $t1, $t8 
sw $t0, -132($fp) 
lw $t0, -128($fp) 
lw $t2, -132($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -128($fp) 
sw $0, ($t0) 
jump54: 
lw $t1, -56($fp) 
sw $t1, -140($fp) 
lw $t0, -56($fp) 
add $t0, $t0, $t9 
sw $t0, -56($fp) 
lw $t0, -144($fp) 
lw $t2, 0($fp) 
mul $t0, $t2, $t2 
sw $t0, -144($fp) 
lw $t1, -56($fp) 
lw $t2, -144($fp) 
slt $t0, $t1, $t2 
sw $t0, -148($fp) 
bne $t0, $zero, if_true52 
if_false53: 
lw $t1, 0($fp) 
sw $t1, -152($fp) 
lw $t0, -152($fp) 
mul $t0, $t0, $t8 
add $t0, $t0, $t8 
sw $t0, -152($fp) 
li $v0, 9 
move $t7, $a0 
lw $t1, -152($fp) 
move $a0, $t1 
sw $t1, -152($fp) 
syscall  
move $a0, $t7 
lw $t0, -152($fp) 
sub $t0, $t0, $t8 
div $t0, $t0, $t8 
sw $t0, -152($fp) 
sw $t0, 0($v0) 
sw $v0, -152($fp) 
lw $t1, -152($fp) 
sw $t1, -52($fp) 
sw $0, -56($fp) 
lw $t1, -56($fp) 
lw $t2, 0($fp) 
bge $t1, $t2, if_false56 
if_true55: 
lw $t1, -52($fp) 
sw $t1, -160($fp) 
lw $t1, -56($fp) 
mul $t0, $t1, $t8 
sw $t0, -164($fp) 
lw $t0, -160($fp) 
lw $t2, -164($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -160($fp) 
lw $t1, 0($fp) 
sw $t1, -168($fp) 
lw $t0, -168($fp) 
mul $t0, $t0, $t8 
add $t0, $t0, $t8 
sw $t0, -168($fp) 
li $v0, 9 
move $t7, $a0 
lw $t1, -168($fp) 
move $a0, $t1 
sw $t1, -168($fp) 
syscall  
move $a0, $t7 
lw $t0, -168($fp) 
sub $t0, $t0, $t8 
div $t0, $t0, $t8 
sw $t0, -168($fp) 
sw $t0, 0($v0) 
sw $v0, -168($fp) 
lw $t0, -160($fp) 
lw $t1, -168($fp) 
sw $t1, ($t0) 
sw $0, -60($fp) 
lw $t1, -60($fp) 
lw $t2, 0($fp) 
bge $t1, $t2, jump57 
if_true58: 
lw $t1, -52($fp) 
sw $t1, -180($fp) 
lw $t1, -56($fp) 
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
lw $t1, -60($fp) 
mul $t0, $t1, $t8 
sw $t0, -184($fp) 
lw $t0, -180($fp) 
lw $t2, -184($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -180($fp) 
li $t7, -1 
sw $t7, ($t0) 
jump60: 
lw $t1, -60($fp) 
sw $t1, -192($fp) 
lw $t0, -60($fp) 
add $t0, $t0, $t9 
sw $t0, -60($fp) 
lw $t1, -60($fp) 
lw $t2, 0($fp) 
slt $t0, $t1, $t2 
sw $t0, -196($fp) 
bne $t0, $zero, if_true58 
beq $t0, $zero, jump57 
jump57: 
lw $t1, -56($fp) 
sw $t1, -200($fp) 
lw $t0, -56($fp) 
add $t0, $t0, $t9 
sw $t0, -56($fp) 
lw $t1, -56($fp) 
lw $t2, 0($fp) 
slt $t0, $t1, $t2 
sw $t0, -204($fp) 
bne $t0, $zero, if_true55 
if_false56: 
lw $t1, -44($fp) 
sw $t1, -208($fp) 
lw $t0, -208($fp) 
add $t0, $t0, $t8 
sw $t0, -208($fp) 
lw $t1, -8($fp) 
sw $t1, ($t0) 
lw $t1, -48($fp) 
sw $t1, -220($fp) 
lw $t0, -220($fp) 
add $t0, $t0, $t8 
sw $t0, -220($fp) 
lw $t1, -12($fp) 
sw $t1, ($t0) 
lw $t1, -52($fp) 
sw $t1, -232($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t8 
sw $t0, -236($fp) 
lw $t0, -232($fp) 
lw $t2, -236($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -232($fp) 
lw $t1, -232($fp) 
lw $t4, ($t1) 
sw $t4, -232($fp) 
lw $t1, -12($fp) 
mul $t0, $t1, $t8 
sw $t0, -236($fp) 
lw $t0, -232($fp) 
lw $t2, -236($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -232($fp) 
lw $t1, -232($fp) 
lw $t4, ($t1) 
seq $t0, $t4, $0 
sw $t0, -244($fp) 
lw $t1, -4($fp) 
lw $t2, -24($fp) 
bgt $t1, $t2, if_false62 
if_true61: 
lw $t1, -44($fp) 
sw $t1, -252($fp) 
lw $t1, -4($fp) 
mul $t0, $t1, $t8 
sw $t0, -256($fp) 
lw $t0, -252($fp) 
lw $t2, -256($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -252($fp) 
lw $t1, -48($fp) 
sw $t1, -264($fp) 
lw $t1, -4($fp) 
mul $t0, $t1, $t8 
sw $t0, -268($fp) 
lw $t0, -264($fp) 
lw $t2, -268($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -264($fp) 
lw $t1, -52($fp) 
sw $t1, -276($fp) 
lw $t1, -252($fp) 
lw $t4, ($t1) 
mul $t0, $t4, $t8 
sw $t0, -280($fp) 
lw $t0, -276($fp) 
lw $t2, -280($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -276($fp) 
lw $t1, -276($fp) 
lw $t4, ($t1) 
sw $t4, -276($fp) 
lw $t1, -264($fp) 
lw $t4, ($t1) 
mul $t0, $t4, $t8 
sw $t0, -280($fp) 
lw $t0, -276($fp) 
lw $t2, -280($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -276($fp) 
lw $t1, -276($fp) 
lw $t4, ($t1) 
sw $t4, -32($fp) 
lw $t1, -44($fp) 
sw $t1, -288($fp) 
lw $t1, -4($fp) 
mul $t0, $t1, $t8 
sw $t0, -292($fp) 
lw $t0, -288($fp) 
lw $t2, -292($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -288($fp) 
lw $t1, -288($fp) 
lw $t4, ($t1) 
sub $t0, $t4, $t9 
sw $t0, -300($fp) 
lw $t1, -300($fp) 
sw $t1, -36($fp) 
lw $t1, -48($fp) 
sw $t1, -304($fp) 
lw $t1, -4($fp) 
mul $t0, $t1, $t8 
sw $t0, -308($fp) 
lw $t0, -304($fp) 
lw $t2, -308($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -304($fp) 
lw $t1, -304($fp) 
lw $t4, ($t1) 
sub $t0, $t4, $t6 
sw $t0, -316($fp) 
lw $t1, -316($fp) 
sw $t1, -40($fp) 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
lw $t1, -36($fp) 
move $a0, $t1 
lw $t1, 0($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal check44 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -328($fp) 
lw $t0, -328($fp) 
beq $t0, $zero, if_false66 
if_true64: 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
lw $t1, -40($fp) 
move $a0, $t1 
lw $t1, 0($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal check44 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -344($fp) 
lw $t0, -344($fp) 
beq $t0, $zero, if_false66 
if_true67: 
lw $t1, -52($fp) 
sw $t1, -352($fp) 
lw $t1, -36($fp) 
mul $t0, $t1, $t8 
sw $t0, -356($fp) 
lw $t0, -352($fp) 
lw $t2, -356($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -352($fp) 
lw $t1, -352($fp) 
lw $t4, ($t1) 
sw $t4, -352($fp) 
lw $t1, -40($fp) 
mul $t0, $t1, $t8 
sw $t0, -356($fp) 
lw $t0, -352($fp) 
lw $t2, -356($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -352($fp) 
lw $t1, -352($fp) 
lw $t4, ($t1) 
seq $t0, $t4, -1 
sw $t0, -364($fp) 
lw $t1, -364($fp) 
sw $t1, -348($fp) 
go68: 
lw $t1, -348($fp) 
sw $t1, -332($fp) 
b go65 
if_false66: 
sw $0, -332($fp) 
go65: 
lw $t0, -332($fp) 
beq $t0, $zero, if_false70 
if_true69: 
lw $t1, -24($fp) 
add $t0, $t1, $t9 
sw $t0, -368($fp) 
lw $t1, -368($fp) 
sw $t1, -24($fp) 
lw $t1, -44($fp) 
sw $t1, -372($fp) 
lw $t1, -24($fp) 
mul $t0, $t1, $t8 
sw $t0, -376($fp) 
lw $t0, -372($fp) 
lw $t2, -376($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -372($fp) 
lw $t1, -36($fp) 
sw $t1, ($t0) 
lw $t1, -48($fp) 
sw $t1, -384($fp) 
lw $t1, -24($fp) 
mul $t0, $t1, $t8 
sw $t0, -388($fp) 
lw $t0, -384($fp) 
lw $t2, -388($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -384($fp) 
lw $t1, -40($fp) 
sw $t1, ($t0) 
lw $t1, -52($fp) 
sw $t1, -396($fp) 
lw $t1, -36($fp) 
mul $t0, $t1, $t8 
sw $t0, -400($fp) 
lw $t0, -396($fp) 
lw $t2, -400($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -396($fp) 
lw $t1, -396($fp) 
lw $t4, ($t1) 
sw $t4, -396($fp) 
lw $t1, -40($fp) 
mul $t0, $t1, $t8 
sw $t0, -400($fp) 
lw $t0, -396($fp) 
lw $t2, -400($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -396($fp) 
lw $t1, -32($fp) 
add $t0, $t1, $t9 
sw $t0, -404($fp) 
lw $t0, -396($fp) 
lw $t1, -404($fp) 
sw $t1, ($t0) 
lw $t1, -36($fp) 
lw $t2, -16($fp) 
seq $t0, $t1, $t2 
sw $t0, -412($fp) 
beq $t0, $zero, if_false74 
if_true72: 
lw $t1, -40($fp) 
lw $t2, -20($fp) 
seq $t0, $t1, $t2 
sw $t0, -420($fp) 
lw $t1, -420($fp) 
sw $t1, -416($fp) 
b go73 
if_false74: 
sw $0, -416($fp) 
go73: 
lw $t0, -416($fp) 
beq $t0, $zero, if_false70 
if_true75: 
sw $t9, -28($fp) 
if_false70: 
lw $t1, -44($fp) 
sw $t1, -424($fp) 
lw $t1, -4($fp) 
mul $t0, $t1, $t8 
sw $t0, -428($fp) 
lw $t0, -424($fp) 
lw $t2, -428($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -424($fp) 
lw $t1, -424($fp) 
lw $t4, ($t1) 
sub $t0, $t4, $t9 
sw $t0, -436($fp) 
lw $t1, -436($fp) 
sw $t1, -36($fp) 
lw $t1, -48($fp) 
sw $t1, -440($fp) 
lw $t1, -4($fp) 
mul $t0, $t1, $t8 
sw $t0, -444($fp) 
lw $t0, -440($fp) 
lw $t2, -444($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -440($fp) 
lw $t1, -440($fp) 
lw $t4, ($t1) 
add $t0, $t4, $t6 
sw $t0, -452($fp) 
lw $t1, -452($fp) 
sw $t1, -40($fp) 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
lw $t1, -36($fp) 
move $a0, $t1 
lw $t1, 0($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal check44 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -464($fp) 
lw $t0, -464($fp) 
beq $t0, $zero, if_false80 
if_true78: 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
lw $t1, -40($fp) 
move $a0, $t1 
lw $t1, 0($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal check44 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -480($fp) 
lw $t0, -480($fp) 
beq $t0, $zero, if_false80 
if_true81: 
lw $t1, -52($fp) 
sw $t1, -488($fp) 
lw $t1, -36($fp) 
mul $t0, $t1, $t8 
sw $t0, -492($fp) 
lw $t0, -488($fp) 
lw $t2, -492($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -488($fp) 
lw $t1, -488($fp) 
lw $t4, ($t1) 
sw $t4, -488($fp) 
lw $t1, -40($fp) 
mul $t0, $t1, $t8 
sw $t0, -492($fp) 
lw $t0, -488($fp) 
lw $t2, -492($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -488($fp) 
lw $t1, -488($fp) 
lw $t4, ($t1) 
seq $t0, $t4, -1 
sw $t0, -500($fp) 
lw $t1, -500($fp) 
sw $t1, -484($fp) 
go82: 
lw $t1, -484($fp) 
sw $t1, -468($fp) 
b go79 
if_false80: 
sw $0, -468($fp) 
go79: 
lw $t0, -468($fp) 
beq $t0, $zero, if_false84 
if_true83: 
lw $t1, -24($fp) 
add $t0, $t1, $t9 
sw $t0, -504($fp) 
lw $t1, -504($fp) 
sw $t1, -24($fp) 
lw $t1, -44($fp) 
sw $t1, -508($fp) 
lw $t1, -24($fp) 
mul $t0, $t1, $t8 
sw $t0, -512($fp) 
lw $t0, -508($fp) 
lw $t2, -512($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -508($fp) 
lw $t1, -36($fp) 
sw $t1, ($t0) 
lw $t1, -48($fp) 
sw $t1, -520($fp) 
lw $t1, -24($fp) 
mul $t0, $t1, $t8 
sw $t0, -524($fp) 
lw $t0, -520($fp) 
lw $t2, -524($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -520($fp) 
lw $t1, -40($fp) 
sw $t1, ($t0) 
lw $t1, -52($fp) 
sw $t1, -532($fp) 
lw $t1, -36($fp) 
mul $t0, $t1, $t8 
sw $t0, -536($fp) 
lw $t0, -532($fp) 
lw $t2, -536($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -532($fp) 
lw $t1, -532($fp) 
lw $t4, ($t1) 
sw $t4, -532($fp) 
lw $t1, -40($fp) 
mul $t0, $t1, $t8 
sw $t0, -536($fp) 
lw $t0, -532($fp) 
lw $t2, -536($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -532($fp) 
lw $t1, -32($fp) 
add $t0, $t1, $t9 
sw $t0, -540($fp) 
lw $t0, -532($fp) 
lw $t1, -540($fp) 
sw $t1, ($t0) 
lw $t1, -36($fp) 
lw $t2, -16($fp) 
seq $t0, $t1, $t2 
sw $t0, -548($fp) 
beq $t0, $zero, if_false88 
if_true86: 
lw $t1, -40($fp) 
lw $t2, -20($fp) 
seq $t0, $t1, $t2 
sw $t0, -556($fp) 
lw $t1, -556($fp) 
sw $t1, -552($fp) 
b go87 
if_false88: 
sw $0, -552($fp) 
go87: 
lw $t0, -552($fp) 
beq $t0, $zero, if_false84 
if_true89: 
sw $t9, -28($fp) 
if_false84: 
lw $t1, -44($fp) 
sw $t1, -560($fp) 
lw $t1, -4($fp) 
mul $t0, $t1, $t8 
sw $t0, -564($fp) 
lw $t0, -560($fp) 
lw $t2, -564($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -560($fp) 
lw $t1, -560($fp) 
lw $t4, ($t1) 
add $t0, $t4, $t9 
sw $t0, -572($fp) 
lw $t1, -572($fp) 
sw $t1, -36($fp) 
lw $t1, -48($fp) 
sw $t1, -576($fp) 
lw $t1, -4($fp) 
mul $t0, $t1, $t8 
sw $t0, -580($fp) 
lw $t0, -576($fp) 
lw $t2, -580($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -576($fp) 
lw $t1, -576($fp) 
lw $t4, ($t1) 
sub $t0, $t4, $t6 
sw $t0, -588($fp) 
lw $t1, -588($fp) 
sw $t1, -40($fp) 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
lw $t1, -36($fp) 
move $a0, $t1 
lw $t1, 0($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal check44 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -600($fp) 
lw $t0, -600($fp) 
beq $t0, $zero, if_false94 
if_true92: 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
lw $t1, -40($fp) 
move $a0, $t1 
lw $t1, 0($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal check44 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -616($fp) 
lw $t0, -616($fp) 
beq $t0, $zero, if_false94 
if_true95: 
lw $t1, -52($fp) 
sw $t1, -624($fp) 
lw $t1, -36($fp) 
mul $t0, $t1, $t8 
sw $t0, -628($fp) 
lw $t0, -624($fp) 
lw $t2, -628($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -624($fp) 
lw $t1, -624($fp) 
lw $t4, ($t1) 
sw $t4, -624($fp) 
lw $t1, -40($fp) 
mul $t0, $t1, $t8 
sw $t0, -628($fp) 
lw $t0, -624($fp) 
lw $t2, -628($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -624($fp) 
lw $t1, -624($fp) 
lw $t4, ($t1) 
seq $t0, $t4, -1 
sw $t0, -636($fp) 
lw $t1, -636($fp) 
sw $t1, -620($fp) 
go96: 
lw $t1, -620($fp) 
sw $t1, -604($fp) 
b go93 
if_false94: 
sw $0, -604($fp) 
go93: 
lw $t0, -604($fp) 
beq $t0, $zero, if_false98 
if_true97: 
lw $t1, -24($fp) 
add $t0, $t1, $t9 
sw $t0, -640($fp) 
lw $t1, -640($fp) 
sw $t1, -24($fp) 
lw $t1, -44($fp) 
sw $t1, -644($fp) 
lw $t1, -24($fp) 
mul $t0, $t1, $t8 
sw $t0, -648($fp) 
lw $t0, -644($fp) 
lw $t2, -648($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -644($fp) 
lw $t1, -36($fp) 
sw $t1, ($t0) 
lw $t1, -48($fp) 
sw $t1, -656($fp) 
lw $t1, -24($fp) 
mul $t0, $t1, $t8 
sw $t0, -660($fp) 
lw $t0, -656($fp) 
lw $t2, -660($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -656($fp) 
lw $t1, -40($fp) 
sw $t1, ($t0) 
lw $t1, -52($fp) 
sw $t1, -668($fp) 
lw $t1, -36($fp) 
mul $t0, $t1, $t8 
sw $t0, -672($fp) 
lw $t0, -668($fp) 
lw $t2, -672($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -668($fp) 
lw $t1, -668($fp) 
lw $t4, ($t1) 
sw $t4, -668($fp) 
lw $t1, -40($fp) 
mul $t0, $t1, $t8 
sw $t0, -672($fp) 
lw $t0, -668($fp) 
lw $t2, -672($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -668($fp) 
lw $t1, -32($fp) 
add $t0, $t1, $t9 
sw $t0, -676($fp) 
lw $t0, -668($fp) 
lw $t1, -676($fp) 
sw $t1, ($t0) 
lw $t1, -36($fp) 
lw $t2, -16($fp) 
seq $t0, $t1, $t2 
sw $t0, -684($fp) 
beq $t0, $zero, if_false102 
if_true100: 
lw $t1, -40($fp) 
lw $t2, -20($fp) 
seq $t0, $t1, $t2 
sw $t0, -692($fp) 
lw $t1, -692($fp) 
sw $t1, -688($fp) 
b go101 
if_false102: 
sw $0, -688($fp) 
go101: 
lw $t0, -688($fp) 
beq $t0, $zero, if_false98 
if_true103: 
sw $t9, -28($fp) 
if_false98: 
lw $t1, -44($fp) 
sw $t1, -696($fp) 
lw $t1, -4($fp) 
mul $t0, $t1, $t8 
sw $t0, -700($fp) 
lw $t0, -696($fp) 
lw $t2, -700($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -696($fp) 
lw $t1, -696($fp) 
lw $t4, ($t1) 
add $t0, $t4, $t9 
sw $t0, -708($fp) 
lw $t1, -708($fp) 
sw $t1, -36($fp) 
lw $t1, -48($fp) 
sw $t1, -712($fp) 
lw $t1, -4($fp) 
mul $t0, $t1, $t8 
sw $t0, -716($fp) 
lw $t0, -712($fp) 
lw $t2, -716($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -712($fp) 
lw $t1, -712($fp) 
lw $t4, ($t1) 
add $t0, $t4, $t6 
sw $t0, -724($fp) 
lw $t1, -724($fp) 
sw $t1, -40($fp) 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
lw $t1, -36($fp) 
move $a0, $t1 
lw $t1, 0($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal check44 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -736($fp) 
lw $t0, -736($fp) 
beq $t0, $zero, if_false108 
if_true106: 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
lw $t1, -40($fp) 
move $a0, $t1 
lw $t1, 0($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal check44 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -752($fp) 
lw $t0, -752($fp) 
beq $t0, $zero, if_false108 
if_true109: 
lw $t1, -52($fp) 
sw $t1, -760($fp) 
lw $t1, -36($fp) 
mul $t0, $t1, $t8 
sw $t0, -764($fp) 
lw $t0, -760($fp) 
lw $t2, -764($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -760($fp) 
lw $t1, -760($fp) 
lw $t4, ($t1) 
sw $t4, -760($fp) 
lw $t1, -40($fp) 
mul $t0, $t1, $t8 
sw $t0, -764($fp) 
lw $t0, -760($fp) 
lw $t2, -764($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -760($fp) 
lw $t1, -760($fp) 
lw $t4, ($t1) 
seq $t0, $t4, -1 
sw $t0, -772($fp) 
lw $t1, -772($fp) 
sw $t1, -756($fp) 
go110: 
lw $t1, -756($fp) 
sw $t1, -740($fp) 
b go107 
if_false108: 
sw $0, -740($fp) 
go107: 
lw $t0, -740($fp) 
beq $t0, $zero, if_false112 
if_true111: 
lw $t1, -24($fp) 
add $t0, $t1, $t9 
sw $t0, -776($fp) 
lw $t1, -776($fp) 
sw $t1, -24($fp) 
lw $t1, -44($fp) 
sw $t1, -780($fp) 
lw $t1, -24($fp) 
mul $t0, $t1, $t8 
sw $t0, -784($fp) 
lw $t0, -780($fp) 
lw $t2, -784($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -780($fp) 
lw $t1, -36($fp) 
sw $t1, ($t0) 
lw $t1, -48($fp) 
sw $t1, -792($fp) 
lw $t1, -24($fp) 
mul $t0, $t1, $t8 
sw $t0, -796($fp) 
lw $t0, -792($fp) 
lw $t2, -796($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -792($fp) 
lw $t1, -40($fp) 
sw $t1, ($t0) 
lw $t1, -52($fp) 
sw $t1, -804($fp) 
lw $t1, -36($fp) 
mul $t0, $t1, $t8 
sw $t0, -808($fp) 
lw $t0, -804($fp) 
lw $t2, -808($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -804($fp) 
lw $t1, -804($fp) 
lw $t4, ($t1) 
sw $t4, -804($fp) 
lw $t1, -40($fp) 
mul $t0, $t1, $t8 
sw $t0, -808($fp) 
lw $t0, -804($fp) 
lw $t2, -808($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -804($fp) 
lw $t1, -32($fp) 
add $t0, $t1, $t9 
sw $t0, -812($fp) 
lw $t0, -804($fp) 
lw $t1, -812($fp) 
sw $t1, ($t0) 
lw $t1, -36($fp) 
lw $t2, -16($fp) 
seq $t0, $t1, $t2 
sw $t0, -820($fp) 
beq $t0, $zero, if_false116 
if_true114: 
lw $t1, -40($fp) 
lw $t2, -20($fp) 
seq $t0, $t1, $t2 
sw $t0, -828($fp) 
lw $t1, -828($fp) 
sw $t1, -824($fp) 
b go115 
if_false116: 
sw $0, -824($fp) 
go115: 
lw $t0, -824($fp) 
beq $t0, $zero, if_false112 
if_true117: 
sw $t9, -28($fp) 
if_false112: 
lw $t1, -44($fp) 
sw $t1, -832($fp) 
lw $t1, -4($fp) 
mul $t0, $t1, $t8 
sw $t0, -836($fp) 
lw $t0, -832($fp) 
lw $t2, -836($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -832($fp) 
lw $t1, -832($fp) 
lw $t4, ($t1) 
sub $t0, $t4, $t6 
sw $t0, -844($fp) 
lw $t1, -844($fp) 
sw $t1, -36($fp) 
lw $t1, -48($fp) 
sw $t1, -848($fp) 
lw $t1, -4($fp) 
mul $t0, $t1, $t8 
sw $t0, -852($fp) 
lw $t0, -848($fp) 
lw $t2, -852($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -848($fp) 
lw $t1, -848($fp) 
lw $t4, ($t1) 
sub $t0, $t4, $t9 
sw $t0, -860($fp) 
lw $t1, -860($fp) 
sw $t1, -40($fp) 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
lw $t1, -36($fp) 
move $a0, $t1 
lw $t1, 0($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal check44 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -872($fp) 
lw $t0, -872($fp) 
beq $t0, $zero, if_false122 
if_true120: 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
lw $t1, -40($fp) 
move $a0, $t1 
lw $t1, 0($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal check44 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -888($fp) 
lw $t0, -888($fp) 
beq $t0, $zero, if_false122 
if_true123: 
lw $t1, -52($fp) 
sw $t1, -896($fp) 
lw $t1, -36($fp) 
mul $t0, $t1, $t8 
sw $t0, -900($fp) 
lw $t0, -896($fp) 
lw $t2, -900($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -896($fp) 
lw $t1, -896($fp) 
lw $t4, ($t1) 
sw $t4, -896($fp) 
lw $t1, -40($fp) 
mul $t0, $t1, $t8 
sw $t0, -900($fp) 
lw $t0, -896($fp) 
lw $t2, -900($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -896($fp) 
lw $t1, -896($fp) 
lw $t4, ($t1) 
seq $t0, $t4, -1 
sw $t0, -908($fp) 
lw $t1, -908($fp) 
sw $t1, -892($fp) 
go124: 
lw $t1, -892($fp) 
sw $t1, -876($fp) 
b go121 
if_false122: 
sw $0, -876($fp) 
go121: 
lw $t0, -876($fp) 
beq $t0, $zero, if_false126 
if_true125: 
lw $t1, -24($fp) 
add $t0, $t1, $t9 
sw $t0, -912($fp) 
lw $t1, -912($fp) 
sw $t1, -24($fp) 
lw $t1, -44($fp) 
sw $t1, -916($fp) 
lw $t1, -24($fp) 
mul $t0, $t1, $t8 
sw $t0, -920($fp) 
lw $t0, -916($fp) 
lw $t2, -920($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -916($fp) 
lw $t1, -36($fp) 
sw $t1, ($t0) 
lw $t1, -48($fp) 
sw $t1, -928($fp) 
lw $t1, -24($fp) 
mul $t0, $t1, $t8 
sw $t0, -932($fp) 
lw $t0, -928($fp) 
lw $t2, -932($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -928($fp) 
lw $t1, -40($fp) 
sw $t1, ($t0) 
lw $t1, -52($fp) 
sw $t1, -940($fp) 
lw $t1, -36($fp) 
mul $t0, $t1, $t8 
sw $t0, -944($fp) 
lw $t0, -940($fp) 
lw $t2, -944($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -940($fp) 
lw $t1, -940($fp) 
lw $t4, ($t1) 
sw $t4, -940($fp) 
lw $t1, -40($fp) 
mul $t0, $t1, $t8 
sw $t0, -944($fp) 
lw $t0, -940($fp) 
lw $t2, -944($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -940($fp) 
lw $t1, -32($fp) 
add $t0, $t1, $t9 
sw $t0, -948($fp) 
lw $t0, -940($fp) 
lw $t1, -948($fp) 
sw $t1, ($t0) 
lw $t1, -36($fp) 
lw $t2, -16($fp) 
seq $t0, $t1, $t2 
sw $t0, -956($fp) 
beq $t0, $zero, if_false130 
if_true128: 
lw $t1, -40($fp) 
lw $t2, -20($fp) 
seq $t0, $t1, $t2 
sw $t0, -964($fp) 
lw $t1, -964($fp) 
sw $t1, -960($fp) 
b go129 
if_false130: 
sw $0, -960($fp) 
go129: 
lw $t0, -960($fp) 
beq $t0, $zero, if_false126 
if_true131: 
sw $t9, -28($fp) 
if_false126: 
lw $t1, -44($fp) 
sw $t1, -968($fp) 
lw $t1, -4($fp) 
mul $t0, $t1, $t8 
sw $t0, -972($fp) 
lw $t0, -968($fp) 
lw $t2, -972($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -968($fp) 
lw $t1, -968($fp) 
lw $t4, ($t1) 
sub $t0, $t4, $t6 
sw $t0, -980($fp) 
lw $t1, -980($fp) 
sw $t1, -36($fp) 
lw $t1, -48($fp) 
sw $t1, -984($fp) 
lw $t1, -4($fp) 
mul $t0, $t1, $t8 
sw $t0, -988($fp) 
lw $t0, -984($fp) 
lw $t2, -988($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -984($fp) 
lw $t1, -984($fp) 
lw $t4, ($t1) 
add $t0, $t4, $t9 
sw $t0, -996($fp) 
lw $t1, -996($fp) 
sw $t1, -40($fp) 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
lw $t1, -36($fp) 
move $a0, $t1 
lw $t1, 0($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal check44 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -1008($fp) 
lw $t0, -1008($fp) 
beq $t0, $zero, if_false136 
if_true134: 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
lw $t1, -40($fp) 
move $a0, $t1 
lw $t1, 0($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal check44 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -1024($fp) 
lw $t0, -1024($fp) 
beq $t0, $zero, if_false136 
if_true137: 
lw $t1, -52($fp) 
sw $t1, -1032($fp) 
lw $t1, -36($fp) 
mul $t0, $t1, $t8 
sw $t0, -1036($fp) 
lw $t0, -1032($fp) 
lw $t2, -1036($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -1032($fp) 
lw $t1, -1032($fp) 
lw $t4, ($t1) 
sw $t4, -1032($fp) 
lw $t1, -40($fp) 
mul $t0, $t1, $t8 
sw $t0, -1036($fp) 
lw $t0, -1032($fp) 
lw $t2, -1036($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -1032($fp) 
lw $t1, -1032($fp) 
lw $t4, ($t1) 
seq $t0, $t4, -1 
sw $t0, -1044($fp) 
lw $t1, -1044($fp) 
sw $t1, -1028($fp) 
go138: 
lw $t1, -1028($fp) 
sw $t1, -1012($fp) 
b go135 
if_false136: 
sw $0, -1012($fp) 
go135: 
lw $t0, -1012($fp) 
beq $t0, $zero, if_false140 
if_true139: 
lw $t1, -24($fp) 
add $t0, $t1, $t9 
sw $t0, -1048($fp) 
lw $t1, -1048($fp) 
sw $t1, -24($fp) 
lw $t1, -44($fp) 
sw $t1, -1052($fp) 
lw $t1, -24($fp) 
mul $t0, $t1, $t8 
sw $t0, -1056($fp) 
lw $t0, -1052($fp) 
lw $t2, -1056($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -1052($fp) 
lw $t1, -36($fp) 
sw $t1, ($t0) 
lw $t1, -48($fp) 
sw $t1, -1064($fp) 
lw $t1, -24($fp) 
mul $t0, $t1, $t8 
sw $t0, -1068($fp) 
lw $t0, -1064($fp) 
lw $t2, -1068($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -1064($fp) 
lw $t1, -40($fp) 
sw $t1, ($t0) 
lw $t1, -52($fp) 
sw $t1, -1076($fp) 
lw $t1, -36($fp) 
mul $t0, $t1, $t8 
sw $t0, -1080($fp) 
lw $t0, -1076($fp) 
lw $t2, -1080($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -1076($fp) 
lw $t1, -1076($fp) 
lw $t4, ($t1) 
sw $t4, -1076($fp) 
lw $t1, -40($fp) 
mul $t0, $t1, $t8 
sw $t0, -1080($fp) 
lw $t0, -1076($fp) 
lw $t2, -1080($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -1076($fp) 
lw $t1, -32($fp) 
add $t0, $t1, $t9 
sw $t0, -1084($fp) 
lw $t0, -1076($fp) 
lw $t1, -1084($fp) 
sw $t1, ($t0) 
lw $t1, -36($fp) 
lw $t2, -16($fp) 
seq $t0, $t1, $t2 
sw $t0, -1092($fp) 
beq $t0, $zero, if_false144 
if_true142: 
lw $t1, -40($fp) 
lw $t2, -20($fp) 
seq $t0, $t1, $t2 
sw $t0, -1100($fp) 
lw $t1, -1100($fp) 
sw $t1, -1096($fp) 
b go143 
if_false144: 
sw $0, -1096($fp) 
go143: 
lw $t0, -1096($fp) 
beq $t0, $zero, if_false140 
if_true145: 
sw $t9, -28($fp) 
if_false140: 
lw $t1, -44($fp) 
sw $t1, -1104($fp) 
lw $t1, -4($fp) 
mul $t0, $t1, $t8 
sw $t0, -1108($fp) 
lw $t0, -1104($fp) 
lw $t2, -1108($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -1104($fp) 
lw $t1, -1104($fp) 
lw $t4, ($t1) 
add $t0, $t4, $t6 
sw $t0, -1116($fp) 
lw $t1, -1116($fp) 
sw $t1, -36($fp) 
lw $t1, -48($fp) 
sw $t1, -1120($fp) 
lw $t1, -4($fp) 
mul $t0, $t1, $t8 
sw $t0, -1124($fp) 
lw $t0, -1120($fp) 
lw $t2, -1124($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -1120($fp) 
lw $t1, -1120($fp) 
lw $t4, ($t1) 
sub $t0, $t4, $t9 
sw $t0, -1132($fp) 
lw $t1, -1132($fp) 
sw $t1, -40($fp) 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
lw $t1, -36($fp) 
move $a0, $t1 
lw $t1, 0($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal check44 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -1144($fp) 
lw $t0, -1144($fp) 
beq $t0, $zero, if_false150 
if_true148: 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
lw $t1, -40($fp) 
move $a0, $t1 
lw $t1, 0($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal check44 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -1160($fp) 
lw $t0, -1160($fp) 
beq $t0, $zero, if_false150 
if_true151: 
lw $t1, -52($fp) 
sw $t1, -1168($fp) 
lw $t1, -36($fp) 
mul $t0, $t1, $t8 
sw $t0, -1172($fp) 
lw $t0, -1168($fp) 
lw $t2, -1172($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -1168($fp) 
lw $t1, -1168($fp) 
lw $t4, ($t1) 
sw $t4, -1168($fp) 
lw $t1, -40($fp) 
mul $t0, $t1, $t8 
sw $t0, -1172($fp) 
lw $t0, -1168($fp) 
lw $t2, -1172($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -1168($fp) 
lw $t1, -1168($fp) 
lw $t4, ($t1) 
seq $t0, $t4, -1 
sw $t0, -1180($fp) 
lw $t1, -1180($fp) 
sw $t1, -1164($fp) 
go152: 
lw $t1, -1164($fp) 
sw $t1, -1148($fp) 
b go149 
if_false150: 
sw $0, -1148($fp) 
go149: 
lw $t0, -1148($fp) 
beq $t0, $zero, if_false154 
if_true153: 
lw $t1, -24($fp) 
add $t0, $t1, $t9 
sw $t0, -1184($fp) 
lw $t1, -1184($fp) 
sw $t1, -24($fp) 
lw $t1, -44($fp) 
sw $t1, -1188($fp) 
lw $t1, -24($fp) 
mul $t0, $t1, $t8 
sw $t0, -1192($fp) 
lw $t0, -1188($fp) 
lw $t2, -1192($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -1188($fp) 
lw $t1, -36($fp) 
sw $t1, ($t0) 
lw $t1, -48($fp) 
sw $t1, -1200($fp) 
lw $t1, -24($fp) 
mul $t0, $t1, $t8 
sw $t0, -1204($fp) 
lw $t0, -1200($fp) 
lw $t2, -1204($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -1200($fp) 
lw $t1, -40($fp) 
sw $t1, ($t0) 
lw $t1, -52($fp) 
sw $t1, -1212($fp) 
lw $t1, -36($fp) 
mul $t0, $t1, $t8 
sw $t0, -1216($fp) 
lw $t0, -1212($fp) 
lw $t2, -1216($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -1212($fp) 
lw $t1, -1212($fp) 
lw $t4, ($t1) 
sw $t4, -1212($fp) 
lw $t1, -40($fp) 
mul $t0, $t1, $t8 
sw $t0, -1216($fp) 
lw $t0, -1212($fp) 
lw $t2, -1216($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -1212($fp) 
lw $t1, -32($fp) 
add $t0, $t1, $t9 
sw $t0, -1220($fp) 
lw $t0, -1212($fp) 
lw $t1, -1220($fp) 
sw $t1, ($t0) 
lw $t1, -36($fp) 
lw $t2, -16($fp) 
seq $t0, $t1, $t2 
sw $t0, -1228($fp) 
beq $t0, $zero, if_false158 
if_true156: 
lw $t1, -40($fp) 
lw $t2, -20($fp) 
seq $t0, $t1, $t2 
sw $t0, -1236($fp) 
lw $t1, -1236($fp) 
sw $t1, -1232($fp) 
b go157 
if_false158: 
sw $0, -1232($fp) 
go157: 
lw $t0, -1232($fp) 
beq $t0, $zero, if_false154 
if_true159: 
sw $t9, -28($fp) 
if_false154: 
lw $t1, -44($fp) 
sw $t1, -1240($fp) 
lw $t1, -4($fp) 
mul $t0, $t1, $t8 
sw $t0, -1244($fp) 
lw $t0, -1240($fp) 
lw $t2, -1244($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -1240($fp) 
lw $t1, -1240($fp) 
lw $t4, ($t1) 
add $t0, $t4, $t6 
sw $t0, -1252($fp) 
lw $t1, -1252($fp) 
sw $t1, -36($fp) 
lw $t1, -48($fp) 
sw $t1, -1256($fp) 
lw $t1, -4($fp) 
mul $t0, $t1, $t8 
sw $t0, -1260($fp) 
lw $t0, -1256($fp) 
lw $t2, -1260($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -1256($fp) 
lw $t1, -1256($fp) 
lw $t4, ($t1) 
add $t0, $t4, $t9 
sw $t0, -1268($fp) 
lw $t1, -1268($fp) 
sw $t1, -40($fp) 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
lw $t1, -36($fp) 
move $a0, $t1 
lw $t1, 0($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal check44 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -1280($fp) 
lw $t0, -1280($fp) 
beq $t0, $zero, if_false164 
if_true162: 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
lw $t1, -40($fp) 
move $a0, $t1 
lw $t1, 0($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal check44 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -1296($fp) 
lw $t0, -1296($fp) 
beq $t0, $zero, if_false164 
if_true165: 
lw $t1, -52($fp) 
sw $t1, -1304($fp) 
lw $t1, -36($fp) 
mul $t0, $t1, $t8 
sw $t0, -1308($fp) 
lw $t0, -1304($fp) 
lw $t2, -1308($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -1304($fp) 
lw $t1, -1304($fp) 
lw $t4, ($t1) 
sw $t4, -1304($fp) 
lw $t1, -40($fp) 
mul $t0, $t1, $t8 
sw $t0, -1308($fp) 
lw $t0, -1304($fp) 
lw $t2, -1308($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -1304($fp) 
lw $t1, -1304($fp) 
lw $t4, ($t1) 
seq $t0, $t4, -1 
sw $t0, -1316($fp) 
lw $t1, -1316($fp) 
sw $t1, -1300($fp) 
go166: 
lw $t1, -1300($fp) 
sw $t1, -1284($fp) 
b go163 
if_false164: 
sw $0, -1284($fp) 
go163: 
lw $t0, -1284($fp) 
beq $t0, $zero, if_false168 
if_true167: 
lw $t1, -24($fp) 
add $t0, $t1, $t9 
sw $t0, -1320($fp) 
lw $t1, -1320($fp) 
sw $t1, -24($fp) 
lw $t1, -44($fp) 
sw $t1, -1324($fp) 
lw $t1, -24($fp) 
mul $t0, $t1, $t8 
sw $t0, -1328($fp) 
lw $t0, -1324($fp) 
lw $t2, -1328($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -1324($fp) 
lw $t1, -36($fp) 
sw $t1, ($t0) 
lw $t1, -48($fp) 
sw $t1, -1336($fp) 
lw $t1, -24($fp) 
mul $t0, $t1, $t8 
sw $t0, -1340($fp) 
lw $t0, -1336($fp) 
lw $t2, -1340($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -1336($fp) 
lw $t1, -40($fp) 
sw $t1, ($t0) 
lw $t1, -52($fp) 
sw $t1, -1348($fp) 
lw $t1, -36($fp) 
mul $t0, $t1, $t8 
sw $t0, -1352($fp) 
lw $t0, -1348($fp) 
lw $t2, -1352($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -1348($fp) 
lw $t1, -1348($fp) 
lw $t4, ($t1) 
sw $t4, -1348($fp) 
lw $t1, -40($fp) 
mul $t0, $t1, $t8 
sw $t0, -1352($fp) 
lw $t0, -1348($fp) 
lw $t2, -1352($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -1348($fp) 
lw $t1, -32($fp) 
add $t0, $t1, $t9 
sw $t0, -1356($fp) 
lw $t0, -1348($fp) 
lw $t1, -1356($fp) 
sw $t1, ($t0) 
lw $t1, -36($fp) 
lw $t2, -16($fp) 
seq $t0, $t1, $t2 
sw $t0, -1364($fp) 
beq $t0, $zero, if_false172 
if_true170: 
lw $t1, -40($fp) 
lw $t2, -20($fp) 
seq $t0, $t1, $t2 
sw $t0, -1372($fp) 
lw $t1, -1372($fp) 
sw $t1, -1368($fp) 
b go171 
if_false172: 
sw $0, -1368($fp) 
go171: 
lw $t0, -1368($fp) 
beq $t0, $zero, if_false168 
if_true173: 
sw $t9, -28($fp) 
if_false168: 
lw $t1, -28($fp) 
seq $t0, $t1, $t9 
sw $t0, -1376($fp) 
beq $t0, $zero, if_false177 
if_true176: 
b if_false62 
if_false177: 
lw $t1, -4($fp) 
add $t0, $t1, $t9 
sw $t0, -1380($fp) 
lw $t1, -1380($fp) 
sw $t1, -4($fp) 
jump63: 
lw $t1, -4($fp) 
lw $t2, -24($fp) 
sle $t0, $t1, $t2 
sw $t0, -1384($fp) 
bne $t0, $zero, if_true61 
if_false62: 
lw $t1, -28($fp) 
seq $t0, $t1, $t9 
sw $t0, -1388($fp) 
beq $t0, $zero, if_false180 
if_true179: 
lw $t1, -52($fp) 
sw $t1, -1392($fp) 
lw $t1, -16($fp) 
mul $t0, $t1, $t8 
sw $t0, -1396($fp) 
lw $t0, -1392($fp) 
lw $t2, -1396($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -1392($fp) 
lw $t1, -1392($fp) 
lw $t4, ($t1) 
sw $t4, -1392($fp) 
lw $t1, -20($fp) 
mul $t0, $t1, $t8 
sw $t0, -1396($fp) 
lw $t0, -1392($fp) 
lw $t2, -1396($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -1392($fp) 
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
b go_on181 
if_false180: 
li $v0, 4 
move $t7, $a0 
la $a0, s13 
syscall  
move $a0, $t7 
go_on181: 
li $v0, 0 
jr $ra 
