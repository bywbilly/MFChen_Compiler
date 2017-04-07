.data
r9:	.space	4
r10:	.space	4
_buffer:	.word 0
NEWLINE:  .asciiz	 "\n" 
s0:	.asciiz	", "
s0ln:	.asciiz	", \n"
s1:	.asciiz	" enjoys this work. XD"
s1ln:	.asciiz	" enjoys this work. XD\n"
s3:	.asciiz	" wants to give up!!!!!"
s3ln:	.asciiz	" wants to give up!!!!!\n"
s4:	.asciiz	"the leading TA"
s4ln:	.asciiz	"the leading TA\n"
s5:	.asciiz	"the striking TA"
s5ln:	.asciiz	"the striking TA\n"
s6:	.asciiz	"MR"
s6ln:	.asciiz	"MR\n"
s7:	.asciiz	"Mars"
s7ln:	.asciiz	"Mars\n"
.text  
work1: 
add $t0, $a1, $t8 
sw $t0, -8($fp) 
lw $t1, -8($fp) 
lw $t4, ($t1) 
sle $t0, $t4, 100 
sw $t0, -16($fp) 
beq $t0, $zero, if_false3 
if_true2: 
la $t2, s0 
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
sw $v0, -24($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $a0 
add $s5, $s5, 3 
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
sub $s5, 1 
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
add $t0, $a1, $0 
sw $t0, -28($fp) 
lw $t1, -24($fp) 
lw $t2, -28($fp) 
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
sw $v0, -36($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $t1 
add $s5, $s5, 3 
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
move $s5, $t5 
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
lw $t1, -36($fp) 
la $t2, s1 
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
sw $v0, -44($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $t1 
add $s5, $s5, 3 
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
sub $s5, 1 
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
lw $t0, -44($fp) 
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
b go_on4 
if_false3: 
la $t2, s0 
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
sw $v0, -48($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $a0 
add $s5, $s5, 3 
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
sub $s5, 1 
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
add $t0, $a1, $0 
sw $t0, -52($fp) 
lw $t1, -48($fp) 
lw $t2, -52($fp) 
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
sw $v0, -60($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $t1 
add $s5, $s5, 3 
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
move $s5, $t5 
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
lw $t1, -60($fp) 
la $t2, s3 
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
sw $v0, -64($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $t1 
add $s5, $s5, 3 
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
sub $s5, 1 
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
lw $t0, -64($fp) 
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
go_on4: 
add $t0, $a1, $t8 
sw $t0, -68($fp) 
add $t0, $a1, $t8 
sw $t0, -72($fp) 
lw $t1, -72($fp) 
lw $t4, ($t1) 
lw $t2, r10 
add $t0, $t4, $t2 
sw $t0, -84($fp) 
lw $t0, -68($fp) 
lw $t1, -84($fp) 
sw $t1, ($t0) 
jr $ra 
main: 
li $s6, 16 
li $t9, 1 
li $t8, 4 
li $t6, 2 
li $v1, 8 
lw $t0, r9 
li $t0, 100 
sw $t0, r9 
lw $t0, r10 
li $t0, 10 
sw $t0, r10 
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
lw $t1, r9 
sw $t1, ($t0) 
add $sp, $sp, -332 
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
jal work1 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -72($fp) 
add $sp, $sp, -332 
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
jal work1 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -84($fp) 
add $sp, $sp, -332 
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
jal work1 
lw $a0, 16($fp) 
lw $a1, 12($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -96($fp) 
jr $ra 
