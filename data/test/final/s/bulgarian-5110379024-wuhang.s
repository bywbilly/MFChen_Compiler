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
s15:	.asciiz	"Sorry, the number n must be a number s.t. there exists i satisfying n=1+2+...+i"
s15ln:	.asciiz	"Sorry, the number n must be a number s.t. there exists i satisfying n=1+2+...+i\n"
s16:	.asciiz	"Let's start!"
s16ln:	.asciiz	"Let's start!\n"
s17:	.asciiz	"step "
s17ln:	.asciiz	"step \n"
s18:	.asciiz	":"
s18ln:	.asciiz	":\n"
s19:	.asciiz	"Total: "
s19ln:	.asciiz	"Total: \n"
s20:	.asciiz	" step(s)"
s20ln:	.asciiz	" step(s)\n"
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
random44: 
lw $t1, r50 
lw $t2, r48 
rem $t0, $t1, $t2 
sw $t0, -20($fp) 
lw $t1, r46 
lw $t2, -20($fp) 
mul $t0, $t1, $t2 
sw $t0, -28($fp) 
lw $t1, r50 
lw $t2, r48 
div $t0, $t1, $t2 
sw $t0, -32($fp) 
lw $t1, r49 
lw $t2, -32($fp) 
mul $t0, $t1, $t2 
sw $t0, -40($fp) 
lw $t1, -28($fp) 
lw $t2, -40($fp) 
sub $t0, $t1, $t2 
sw $t0, -44($fp) 
lw $t1, -44($fp) 
sw $t1, -8($fp) 
sge $t0, $t1, $0 
sw $t0, -48($fp) 
beq $t0, $zero, if_false46 
if_true45: 
lw $t0, r50 
lw $t1, -8($fp) 
sw $t1, r50 
b go_on47 
if_false46: 
lw $t1, -8($fp) 
lw $t2, r47 
add $t0, $t1, $t2 
sw $t0, -56($fp) 
lw $t0, r50 
lw $t1, -56($fp) 
sw $t1, r50 
go_on47: 
lw $t1, r50 
move $v0, $t1 
jr $ra 
initialize48: 
sw $a0, r50 
jr $ra 
swap49: 
lw $t1, r45 
sw $t1, -12($fp) 
mul $t0, $a0, $t8 
sw $t0, -16($fp) 
lw $t0, -12($fp) 
lw $t2, -16($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -12($fp) 
lw $t1, -12($fp) 
lw $t4, ($t1) 
sw $t4, -8($fp) 
lw $t1, r45 
sw $t1, -24($fp) 
mul $t0, $a0, $t8 
sw $t0, -28($fp) 
lw $t0, -24($fp) 
lw $t2, -28($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -24($fp) 
lw $t1, r45 
sw $t1, -36($fp) 
mul $t0, $a1, $t8 
sw $t0, -40($fp) 
lw $t0, -36($fp) 
lw $t2, -40($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -36($fp) 
lw $t0, -24($fp) 
lw $t1, -36($fp) 
lw $t4, ($t1) 
sw $t4, ($t0) 
lw $t1, r45 
sw $t1, -52($fp) 
mul $t0, $a1, $t8 
sw $t0, -56($fp) 
lw $t0, -52($fp) 
lw $t2, -56($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -52($fp) 
lw $t1, -8($fp) 
sw $t1, ($t0) 
jr $ra 
pd50: 
lw $t1, r43 
bgt $t1, $a0, if_false52 
if_true51: 
lw $t1, r43 
add $t0, $t1, $t9 
sw $t0, -16($fp) 
lw $t1, r43 
lw $t2, -16($fp) 
mul $t0, $t1, $t2 
sw $t0, -20($fp) 
lw $t1, -20($fp) 
div $t0, $t1, $t6 
sw $t0, -24($fp) 
lw $t2, -24($fp) 
seq $t0, $a0, $t2 
sw $t0, -28($fp) 
beq $t0, $zero, jump53 
if_true54: 
li $v0, 1 
jr $ra 
jump53: 
lw $t0, r43 
add $t0, $t0, $t9 
sw $t0, r43 
lw $t1, r43 
sle $t0, $t1, $a0 
sw $t0, -32($fp) 
bne $t0, $zero, if_true51 
if_false52: 
li $v0, 0 
jr $ra 
show57: 
sw $0, -8($fp) 
lw $t1, -8($fp) 
lw $t2, r44 
bge $t1, $t2, if_false59 
if_true58: 
lw $t1, r45 
sw $t1, -20($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t8 
sw $t0, -24($fp) 
lw $t0, -20($fp) 
lw $t2, -24($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -20($fp) 
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
jump60: 
lw $t0, -8($fp) 
add $t0, $t0, $t9 
sw $t0, -8($fp) 
lw $t1, -8($fp) 
lw $t2, r44 
slt $t0, $t1, $t2 
sw $t0, -32($fp) 
bne $t0, $zero, if_true58 
if_false59: 
li $v0, 4 
move $t7, $a0 
la $a0, s0ln 
syscall  
move $a0, $t7 
jr $ra 
win61: 
li $v0, 9 
move $t7, $a0 
li $a0, 404 
syscall  
move $a0, $t7 
li $t1, 100 
sw $t1, 0($v0) 
sw $v0, -20($fp) 
lw $t1, -20($fp) 
sw $t1, -16($fp) 
lw $t1, r44 
lw $t2, r43 
sne $t0, $t1, $t2 
sw $t0, -28($fp) 
beq $t0, $zero, if_false63 
if_true62: 
li $v0, 0 
jr $ra 
if_false63: 
sw $0, -12($fp) 
lw $t1, -12($fp) 
lw $t2, r44 
bge $t1, $t2, if_false66 
if_true65: 
lw $t1, -16($fp) 
sw $t1, -36($fp) 
lw $t1, -12($fp) 
mul $t0, $t1, $t8 
sw $t0, -40($fp) 
lw $t0, -36($fp) 
lw $t2, -40($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -36($fp) 
lw $t1, r45 
sw $t1, -44($fp) 
lw $t1, -12($fp) 
mul $t0, $t1, $t8 
sw $t0, -48($fp) 
lw $t0, -44($fp) 
lw $t2, -48($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -44($fp) 
lw $t0, -36($fp) 
lw $t1, -44($fp) 
lw $t4, ($t1) 
sw $t4, ($t0) 
jump67: 
lw $t0, -12($fp) 
add $t0, $t0, $t9 
sw $t0, -12($fp) 
lw $t1, -12($fp) 
lw $t2, r44 
slt $t0, $t1, $t2 
sw $t0, -60($fp) 
bne $t0, $zero, if_true65 
if_false66: 
sw $0, -8($fp) 
lw $t1, r44 
sub $t0, $t1, $t9 
sw $t0, -64($fp) 
lw $t1, -8($fp) 
lw $t2, -64($fp) 
bge $t1, $t2, if_false69 
if_true68: 
lw $t1, -8($fp) 
add $t0, $t1, $t9 
sw $t0, -72($fp) 
lw $t1, -72($fp) 
sw $t1, -12($fp) 
lw $t2, r44 
bge $t1, $t2, jump70 
if_true71: 
lw $t1, -16($fp) 
sw $t1, -80($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t8 
sw $t0, -84($fp) 
lw $t0, -80($fp) 
lw $t2, -84($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -80($fp) 
lw $t1, -16($fp) 
sw $t1, -88($fp) 
lw $t1, -12($fp) 
mul $t0, $t1, $t8 
sw $t0, -92($fp) 
lw $t0, -88($fp) 
lw $t2, -92($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -88($fp) 
lw $t1, -80($fp) 
lw $t4, ($t1) 
lw $t2, -88($fp) 
lw $t5, ($t2) 
sgt $t0, $t4, $t5 
sw $t0, -104($fp) 
beq $t0, $zero, jump73 
if_true74: 
lw $t1, -16($fp) 
sw $t1, -108($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t8 
sw $t0, -112($fp) 
lw $t0, -108($fp) 
lw $t2, -112($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -108($fp) 
lw $t1, -108($fp) 
lw $t4, ($t1) 
sw $t4, -24($fp) 
lw $t1, -16($fp) 
sw $t1, -120($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t8 
sw $t0, -124($fp) 
lw $t0, -120($fp) 
lw $t2, -124($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -120($fp) 
lw $t1, -16($fp) 
sw $t1, -128($fp) 
lw $t1, -12($fp) 
mul $t0, $t1, $t8 
sw $t0, -132($fp) 
lw $t0, -128($fp) 
lw $t2, -132($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -128($fp) 
lw $t0, -120($fp) 
lw $t1, -128($fp) 
lw $t4, ($t1) 
sw $t4, ($t0) 
lw $t1, -16($fp) 
sw $t1, -144($fp) 
lw $t1, -12($fp) 
mul $t0, $t1, $t8 
sw $t0, -148($fp) 
lw $t0, -144($fp) 
lw $t2, -148($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -144($fp) 
lw $t1, -24($fp) 
sw $t1, ($t0) 
jump73: 
lw $t0, -12($fp) 
add $t0, $t0, $t9 
sw $t0, -12($fp) 
lw $t1, -12($fp) 
lw $t2, r44 
slt $t0, $t1, $t2 
sw $t0, -156($fp) 
bne $t0, $zero, if_true71 
beq $t0, $zero, jump70 
jump70: 
lw $t0, -8($fp) 
add $t0, $t0, $t9 
sw $t0, -8($fp) 
lw $t1, r44 
sub $t0, $t1, $t9 
sw $t0, -160($fp) 
lw $t1, -8($fp) 
lw $t2, -160($fp) 
slt $t0, $t1, $t2 
sw $t0, -164($fp) 
bne $t0, $zero, if_true68 
if_false69: 
sw $0, -8($fp) 
lw $t1, -8($fp) 
lw $t2, r44 
bge $t1, $t2, if_false78 
if_true77: 
lw $t1, -16($fp) 
sw $t1, -172($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t8 
sw $t0, -176($fp) 
lw $t0, -172($fp) 
lw $t2, -176($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -172($fp) 
lw $t1, -8($fp) 
add $t0, $t1, $t9 
sw $t0, -180($fp) 
lw $t1, -172($fp) 
lw $t4, ($t1) 
lw $t2, -180($fp) 
sne $t0, $t4, $t2 
sw $t0, -188($fp) 
beq $t0, $zero, jump79 
if_true80: 
li $v0, 0 
jr $ra 
jump79: 
lw $t0, -8($fp) 
add $t0, $t0, $t9 
sw $t0, -8($fp) 
lw $t1, -8($fp) 
lw $t2, r44 
slt $t0, $t1, $t2 
sw $t0, -192($fp) 
bne $t0, $zero, if_true77 
if_false78: 
li $v0, 1 
jr $ra 
merge83: 
sw $0, -8($fp) 
lw $t1, -8($fp) 
lw $t2, r44 
bge $t1, $t2, if_false85 
if_true84: 
lw $t1, r45 
sw $t1, -16($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t8 
sw $t0, -20($fp) 
lw $t0, -16($fp) 
lw $t2, -20($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -16($fp) 
lw $t1, -16($fp) 
lw $t4, ($t1) 
seq $t0, $t4, $0 
sw $t0, -28($fp) 
beq $t0, $zero, jump86 
if_true87: 
lw $t1, -8($fp) 
add $t0, $t1, $t9 
sw $t0, -36($fp) 
lw $t1, -36($fp) 
sw $t1, -32($fp) 
lw $t2, r44 
bge $t1, $t2, jump86 
if_true90: 
lw $t1, r45 
sw $t1, -44($fp) 
lw $t1, -32($fp) 
mul $t0, $t1, $t8 
sw $t0, -48($fp) 
lw $t0, -44($fp) 
lw $t2, -48($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -44($fp) 
lw $t1, -44($fp) 
lw $t4, ($t1) 
sne $t0, $t4, $0 
sw $t0, -56($fp) 
beq $t0, $zero, jump92 
if_true93: 
add $sp, $sp, -388 
sw $a0, 0($sp) 
sw $a1, -4($sp) 
lw $t1, -8($fp) 
move $a0, $t1 
lw $t1, -32($fp) 
move $a1, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal swap49 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -68($fp) 
b jump86 
jump92: 
lw $t0, -32($fp) 
add $t0, $t0, $t9 
sw $t0, -32($fp) 
lw $t1, -32($fp) 
lw $t2, r44 
slt $t0, $t1, $t2 
sw $t0, -72($fp) 
bne $t0, $zero, if_true90 
beq $t0, $zero, jump86 
jump86: 
lw $t0, -8($fp) 
add $t0, $t0, $t9 
sw $t0, -8($fp) 
lw $t1, -8($fp) 
lw $t2, r44 
slt $t0, $t1, $t2 
sw $t0, -76($fp) 
bne $t0, $zero, if_true84 
if_false85: 
sw $0, -8($fp) 
lw $t1, -8($fp) 
lw $t2, r44 
bge $t1, $t2, if_false97 
if_true96: 
lw $t1, r45 
sw $t1, -84($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t8 
sw $t0, -88($fp) 
lw $t0, -84($fp) 
lw $t2, -88($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -84($fp) 
lw $t1, -84($fp) 
lw $t4, ($t1) 
seq $t0, $t4, $0 
sw $t0, -96($fp) 
beq $t0, $zero, jump98 
if_true99: 
lw $t0, r44 
lw $t1, -8($fp) 
sw $t1, r44 
b if_false97 
jump98: 
lw $t0, -8($fp) 
add $t0, $t0, $t9 
sw $t0, -8($fp) 
lw $t1, -8($fp) 
lw $t2, r44 
slt $t0, $t1, $t2 
sw $t0, -100($fp) 
bne $t0, $zero, if_true96 
if_false97: 
jr $ra 
move102: 
sw $0, -8($fp) 
lw $t1, -8($fp) 
lw $t2, r44 
bge $t1, $t2, if_false104 
if_true103: 
lw $t1, r45 
sw $t1, -16($fp) 
lw $t1, -8($fp) 
mul $t0, $t1, $t8 
sw $t0, -20($fp) 
lw $t0, -16($fp) 
lw $t2, -20($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -16($fp) 
lw $t1, -16($fp) 
lw $t4, ($t1) 
sub $t0, $t4, $t9 
sw $t0, -24($fp) 
lw $t0, -16($fp) 
lw $t3, ($t0) 
sub $t3, $t3, $t9 
sw $t3, ($t0) 
lw $t1, -8($fp) 
add $t0, $t1, $t9 
sw $t0, -28($fp) 
lw $t1, -28($fp) 
sw $t1, -8($fp) 
jump105: 
lw $t1, -8($fp) 
lw $t2, r44 
slt $t0, $t1, $t2 
sw $t0, -32($fp) 
bne $t0, $zero, if_true103 
if_false104: 
lw $t1, r45 
sw $t1, -36($fp) 
lw $t1, r44 
mul $t0, $t1, $t8 
sw $t0, -40($fp) 
lw $t0, -36($fp) 
lw $t2, -40($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -36($fp) 
lw $t1, r44 
sw $t1, ($t0) 
lw $t1, r44 
sw $t1, -48($fp) 
lw $t0, r44 
add $t0, $t0, $t9 
sw $t0, r44 
jr $ra 
main: 
li $s6, 16 
li $t9, 1 
li $t8, 4 
li $t6, 2 
li $v1, 8 
lw $t0, r46 
li $t0, 48271 
sw $t0, r46 
lw $t0, r47 
li $t0, 2147483647 
sw $t0, r47 
sw $t9, r50 
move $fp, $sp 
sw $0, 0($fp) 
sw $0, -4($fp) 
sw $0, -8($fp) 
li $t0, 210 
sw $t0, r42 
sw $0, r43 
li $v0, 9 
move $t7, $a0 
li $a0, 404 
syscall  
move $a0, $t7 
li $t1, 100 
sw $t1, 0($v0) 
sw $v0, -12($fp) 
lw $t0, r45 
lw $t1, -12($fp) 
sw $t1, r45 
lw $t1, r47 
lw $t2, r46 
div $t0, $t1, $t2 
sw $t0, -24($fp) 
lw $t0, r48 
lw $t1, -24($fp) 
sw $t1, r48 
lw $t1, r47 
lw $t2, r46 
rem $t0, $t1, $t2 
sw $t0, -28($fp) 
lw $t0, r49 
lw $t1, -28($fp) 
sw $t1, r49 
add $sp, $sp, -388 
sw $a0, 0($sp) 
lw $t1, r42 
move $a0, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal pd50 
lw $a0, 16($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -36($fp) 
lw $t1, -36($fp) 
seq $t0, $t1, $zero 
sw $t0, -40($fp) 
beq $t0, $zero, if_false108 
if_true107: 
li $v0, 4 
move $t7, $a0 
la $a0, s15ln 
syscall  
move $a0, $t7 
li $v0, 1 
jr $ra 
if_false108: 
li $v0, 4 
move $t7, $a0 
la $a0, s16ln 
syscall  
move $a0, $t7 
add $sp, $sp, -388 
sw $a0, 0($sp) 
li $a0, 3654898 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal initialize48 
lw $a0, 16($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -44($fp) 
add $sp, $sp, -388 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal random44 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -48($fp) 
lw $t1, -48($fp) 
rem $t0, $t1, 10 
sw $t0, -52($fp) 
lw $t1, -52($fp) 
add $t0, $t1, $t9 
sw $t0, -56($fp) 
lw $t0, r44 
lw $t1, -56($fp) 
sw $t1, r44 
lw $t0, r44 
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
lw $t1, r44 
sub $t0, $t1, $t9 
sw $t0, -60($fp) 
lw $t1, 0($fp) 
lw $t2, -60($fp) 
bge $t1, $t2, if_false111 
if_true110: 
lw $t1, r45 
sw $t1, -68($fp) 
lw $t1, 0($fp) 
mul $t0, $t1, $t8 
sw $t0, -72($fp) 
lw $t0, -68($fp) 
lw $t2, -72($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -68($fp) 
add $sp, $sp, -388 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal random44 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -76($fp) 
lw $t1, -76($fp) 
rem $t0, $t1, 10 
sw $t0, -80($fp) 
lw $t1, -80($fp) 
add $t0, $t1, $t9 
sw $t0, -84($fp) 
lw $t0, -68($fp) 
lw $t1, -84($fp) 
sw $t1, ($t0) 
lw $t1, r45 
sw $t1, -92($fp) 
lw $t1, 0($fp) 
mul $t0, $t1, $t8 
sw $t0, -96($fp) 
lw $t0, -92($fp) 
lw $t2, -96($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -92($fp) 
lw $t1, -92($fp) 
lw $t4, ($t1) 
lw $t2, -4($fp) 
add $t0, $t4, $t2 
sw $t0, -104($fp) 
lw $t1, -104($fp) 
lw $t2, r42 
ble $t1, $t2, if_false114 
if_true113: 
lw $t1, r45 
sw $t1, -112($fp) 
lw $t1, 0($fp) 
mul $t0, $t1, $t8 
sw $t0, -116($fp) 
lw $t0, -112($fp) 
lw $t2, -116($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -112($fp) 
add $sp, $sp, -388 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal random44 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -120($fp) 
lw $t1, -120($fp) 
rem $t0, $t1, 10 
sw $t0, -124($fp) 
lw $t1, -124($fp) 
add $t0, $t1, $t9 
sw $t0, -128($fp) 
lw $t0, -112($fp) 
lw $t1, -128($fp) 
sw $t1, ($t0) 
jump115: 
lw $t1, r45 
sw $t1, -136($fp) 
lw $t1, 0($fp) 
mul $t0, $t1, $t8 
sw $t0, -140($fp) 
lw $t0, -136($fp) 
lw $t2, -140($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -136($fp) 
lw $t1, -136($fp) 
lw $t4, ($t1) 
lw $t2, -4($fp) 
add $t0, $t4, $t2 
sw $t0, -148($fp) 
lw $t1, -148($fp) 
lw $t2, r42 
sgt $t0, $t1, $t2 
sw $t0, -152($fp) 
bne $t0, $zero, if_true113 
if_false114: 
lw $t1, r45 
sw $t1, -156($fp) 
lw $t1, 0($fp) 
mul $t0, $t1, $t8 
sw $t0, -160($fp) 
lw $t0, -156($fp) 
lw $t2, -160($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -156($fp) 
lw $t1, -4($fp) 
lw $t2, -156($fp) 
lw $t5, ($t2) 
add $t0, $t1, $t5 
sw $t0, -168($fp) 
lw $t1, -168($fp) 
sw $t1, -4($fp) 
jump112: 
lw $t0, 0($fp) 
add $t0, $t0, $t9 
sw $t0, 0($fp) 
lw $t1, r44 
sub $t0, $t1, $t9 
sw $t0, -172($fp) 
lw $t1, 0($fp) 
lw $t2, -172($fp) 
slt $t0, $t1, $t2 
sw $t0, -176($fp) 
bne $t0, $zero, if_true110 
if_false111: 
lw $t1, r44 
sub $t0, $t1, $t9 
sw $t0, -180($fp) 
lw $t1, r45 
sw $t1, -184($fp) 
lw $t1, -180($fp) 
mul $t0, $t1, $t8 
sw $t0, -188($fp) 
lw $t0, -184($fp) 
lw $t2, -188($fp) 
add $t0, $t0, $t2 
add $t0, $t0, $t8 
sw $t0, -184($fp) 
lw $t1, r42 
lw $t2, -4($fp) 
sub $t0, $t1, $t2 
sw $t0, -192($fp) 
lw $t0, -184($fp) 
lw $t1, -192($fp) 
sw $t1, ($t0) 
add $sp, $sp, -388 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal show57 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -200($fp) 
add $sp, $sp, -388 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal merge83 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -204($fp) 
add $sp, $sp, -388 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal win61 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -208($fp) 
lw $t1, -208($fp) 
bne $t1, $zero, if_false117 
if_true116: 
lw $t0, -8($fp) 
add $t0, $t0, $t9 
sw $t0, -8($fp) 
li $v0, 4 
move $t7, $a0 
la $a0, s17 
syscall  
move $a0, $t7 
lw $t0, -8($fp) 
move $t7, $a0 
move $a0, $t0 
li $v0, 1 
syscall  
move $a0, $t7 
li $v0, 4 
move $t7, $a0 
la $a0, s18ln 
syscall  
move $a0, $t7 
add $sp, $sp, -388 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal move102 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -216($fp) 
add $sp, $sp, -388 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal merge83 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -220($fp) 
add $sp, $sp, -388 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal show57 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -224($fp) 
jump118: 
add $sp, $sp, -388 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal win61 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -228($fp) 
lw $t1, -228($fp) 
seq $t0, $t1, $zero 
sw $t0, -232($fp) 
bne $t0, $zero, if_true116 
if_false117: 
add $sp, $sp, -388 
sw $a0, 0($sp) 
lw $t1, -8($fp) 
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
sw $v0, -240($fp) 
la $t1, s19 
lw $t2, -240($fp) 
li $s1, 7 
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
sw $v0, -244($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $t1 
sub $s5, $s5, $t9 
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
lw $t1, -244($fp) 
la $t2, s20 
lw $s1, ($t1) 
li $s2, 8 
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
sw $v0, -248($fp) 
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
sub $s5, 1 
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
lw $t0, -248($fp) 
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
