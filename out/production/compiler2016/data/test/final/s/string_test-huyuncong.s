.data
r9:	.space	4
r10:	.space	4
r11:	.space	4
r12:	.space	4
_buffer:	.word 0
NEWLINE:  .asciiz	 "\n" 
s0:	.asciiz	"Never Ever!"
s0ln:	.asciiz	"Never Ever!\n"
s1:	.asciiz	"length error!"
s1ln:	.asciiz	"length error!\n"
.text  
calc1: 
sw $a0, -16($fp) 
lw $t0, -12($fp) 
lw $t1, -16($fp) 
lw $t1, ($t1) 
move $t0, $t1 
sw $t0, -12($fp) 
lw $t1, -12($fp) 
sw $t1, -8($fp) 
seq $t0, $t1, $t9 
sw $t0, -20($fp) 
beq $t0, $zero, if_false3 
if_true2: 
move $v0, $a0 
jr $ra 
if_false3: 
lw $t1, -8($fp) 
div $t0, $t1, $t6 
sw $t0, -28($fp) 
add $sp, $sp, -384 
sw $a0, 0($sp) 
lw $t1, -28($fp) 
sub $t0, $t1, $t9 
sw $t0, -44($fp) 
sw $a0, -48($fp) 
move $s0, $a0 
lw $t1, -48($fp) 
lw $t2, -44($fp) 
move $s0, $a0 
li $v0, 9 
sub $a0, $t2, $0 
move $s1, $a0 
add $s1, $s1, $t9 
add $a0, $a0, 6 
syscall  
sw $s1, ($v0) 
move $s4, $v0 
add $v0, $v0, $t8 
add $t1, $t1, $t8 
add $t1, $t1, $0 
li $s5, 0 
begin_substring1: 
lb $s2, ($t1) 
sb $s2, ($v0) 
add $t1, $t1, $t9 
add $v0, $v0, $t9 
add $s5, $s5, $t9 
slt $s3, $s5, $s1 
beqz $s3, end_substring1 
b begin_substring1 
end_substring1: 
sb $0, ($v0) 
sw $s4, -40($fp) 
move $a0, $s0 
lw $t1, -40($fp) 
move $a0, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal calc1 
lw $a0, 16($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -56($fp) 
lw $t1, -56($fp) 
sw $t1, -36($fp) 
add $sp, $sp, -384 
sw $a0, 0($sp) 
lw $t1, -8($fp) 
sub $t0, $t1, $t9 
sw $t0, -68($fp) 
sw $a0, -72($fp) 
move $s0, $a0 
lw $t1, -72($fp) 
lw $t0, -28($fp) 
lw $t2, -68($fp) 
move $s0, $a0 
li $v0, 9 
sub $a0, $t2, $t0 
move $s1, $a0 
add $s1, $s1, $t9 
add $a0, $a0, 6 
syscall  
sw $s1, ($v0) 
move $s4, $v0 
add $v0, $v0, $t8 
add $t1, $t1, $t8 
add $t1, $t1, $t0 
li $s5, 0 
begin_substring2: 
lb $s2, ($t1) 
sb $s2, ($v0) 
add $t1, $t1, $t9 
add $v0, $v0, $t9 
add $s5, $s5, $t9 
slt $s3, $s5, $s1 
beqz $s3, end_substring2 
b begin_substring2 
end_substring2: 
sb $0, ($v0) 
sw $s4, -64($fp) 
move $a0, $s0 
lw $t1, -64($fp) 
move $a0, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal calc1 
lw $a0, 16($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -80($fp) 
lw $t1, -80($fp) 
sw $t1, -60($fp) 
lw $t1, -36($fp) 
lw $t2, -60($fp) 
lw $s1, ($t1) 
lw $s2, ($t2) 
slt $s7, $s1, $s2 
string_less11: 
beqz $s7, string_less21 
move $s0, $s1 
li $s4, 0 
b go_string_less1 
string_less21: 
move $s0, $s2 
li $s4, 1 
go_string_less1: 
add $t1, $t1, $t8 
add $t2, $t2, $t8 
li $s3, 0 
string_less31: 
lb $s1, ($t1) 
lb $s2, ($t2) 
add $t1, $t1, $t9 
add $t2, $t2, $t9 
add $s3, $s3, $t9 
seq $s7, $s1, $s2 
slt $t3, $s3, $s0 
and $s5, $s7, $t3 
bnez $s5, string_less31 
beqz $t3, shit1 
slt $s7, $s1, $s2 
bnez $s7, string_true1 
beqz $s7, string_false1 
shit1: 
bnez $s4, string_false1 
string_true1: 
li $t7, 1 
b save_string_less1 
string_false1: 
li $t7, 0 
save_string_less1: 
sw $t7, -84($fp) 
lw $t0, -84($fp) 
beq $t0, $zero, if_false6 
if_true5: 
lw $t1, -36($fp) 
lw $t2, -60($fp) 
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
sw $v0, -88($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $t1 
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
lw $t1, -88($fp) 
move $v0, $t1 
jr $ra 
b go_on7 
if_false6: 
lw $t1, -36($fp) 
lw $t2, -60($fp) 
lw $s1, ($t1) 
lw $s2, ($t2) 
slt $s7, $s1, $s2 
string_less12: 
beqz $s7, string_less22 
move $s0, $s1 
li $s4, 0 
b go_string_less2 
string_less22: 
move $s0, $s2 
li $s4, 1 
go_string_less2: 
add $t1, $t1, $t8 
add $t2, $t2, $t8 
li $s3, 0 
string_less32: 
lb $s1, ($t1) 
lb $s2, ($t2) 
add $t1, $t1, $t9 
add $t2, $t2, $t9 
add $s3, $s3, $t9 
seq $s7, $s1, $s2 
slt $t3, $s3, $s0 
and $s5, $s7, $t3 
bnez $s5, string_less32 
beqz $t3, shit2 
slt $s7, $s1, $s2 
bnez $s7, string_true2 
beqz $s7, string_false2 
shit2: 
bnez $s4, string_false2 
string_true2: 
li $t7, 1 
b save_string_less2 
string_false2: 
li $t7, 0 
save_string_less2: 
sw $t7, -96($fp) 
lw $t1, -60($fp) 
lw $t2, -36($fp) 
lw $s1, ($t1) 
lw $s2, ($t2) 
slt $s7, $s1, $s2 
string_less13: 
beqz $s7, string_less23 
move $s0, $s1 
li $s4, 0 
b go_string_less3 
string_less23: 
move $s0, $s2 
li $s4, 1 
go_string_less3: 
add $t1, $t1, $t8 
add $t2, $t2, $t8 
li $s3, 0 
string_less33: 
lb $s1, ($t1) 
lb $s2, ($t2) 
add $t1, $t1, $t9 
add $t2, $t2, $t9 
add $s3, $s3, $t9 
seq $s7, $s1, $s2 
slt $t3, $s3, $s0 
and $s5, $s7, $t3 
bnez $s5, string_less33 
beqz $t3, shit3 
slt $s7, $s1, $s2 
bnez $s7, string_true3 
beqz $s7, string_false3 
shit3: 
bnez $s4, string_false3 
string_true3: 
li $t7, 1 
b save_string_less3 
string_false3: 
li $t7, 0 
save_string_less3: 
sw $t7, -92($fp) 
lw $t1, -96($fp) 
lw $t2, -92($fp) 
or $t0, $t1, $t2 
sw $t0, -92($fp) 
lw $t1, -92($fp) 
seq $t0, $t1, $zero 
sw $t0, -92($fp) 
beq $t0, $zero, if_false9 
if_true8: 
lw $t1, -36($fp) 
sw $t1, -108($fp) 
lw $t0, -104($fp) 
lw $t1, -108($fp) 
add $t1, $t1, $t8 
add $t1, $t1, $0 
lb $t0, ($t1) 
sw $t0, -104($fp) 
lw $t1, -104($fp) 
sw $t1, -100($fp) 
lw $t1, -60($fp) 
sw $t1, -120($fp) 
lw $t0, -116($fp) 
lw $t1, -120($fp) 
add $t1, $t1, $t8 
add $t1, $t1, $0 
lb $t0, ($t1) 
sw $t0, -116($fp) 
lw $t1, -116($fp) 
sw $t1, -112($fp) 
lw $t1, -100($fp) 
lw $t2, -112($fp) 
slt $t0, $t1, $t2 
sw $t0, -124($fp) 
beq $t0, $zero, if_false12 
if_true11: 
lw $t1, -36($fp) 
lw $t2, -60($fp) 
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
sw $v0, -128($fp) 
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
lw $t1, -128($fp) 
move $v0, $t1 
jr $ra 
if_false12: 
lw $t1, -60($fp) 
lw $t2, -36($fp) 
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
sw $v0, -132($fp) 
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
lw $t1, -132($fp) 
move $v0, $t1 
jr $ra 
b go_on7 
if_false9: 
lw $t1, -60($fp) 
lw $t2, -36($fp) 
lw $s1, ($t1) 
lw $s2, ($t2) 
slt $s7, $s1, $s2 
string_less14: 
beqz $s7, string_less24 
move $s0, $s1 
li $s4, 0 
b go_string_less4 
string_less24: 
move $s0, $s2 
li $s4, 1 
go_string_less4: 
add $t1, $t1, $t8 
add $t2, $t2, $t8 
li $s3, 0 
string_less34: 
lb $s1, ($t1) 
lb $s2, ($t2) 
add $t1, $t1, $t9 
add $t2, $t2, $t9 
add $s3, $s3, $t9 
seq $s7, $s1, $s2 
slt $t3, $s3, $s0 
and $s5, $s7, $t3 
bnez $s5, string_less34 
beqz $t3, shit4 
slt $s7, $s1, $s2 
bnez $s7, string_true4 
beqz $s7, string_false4 
shit4: 
bnez $s4, string_false4 
string_true4: 
li $t7, 1 
b save_string_less4 
string_false4: 
li $t7, 0 
save_string_less4: 
sw $t7, -136($fp) 
lw $t0, -136($fp) 
beq $t0, $zero, go_on7 
if_true14: 
lw $t1, -60($fp) 
lw $t2, -36($fp) 
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
sw $v0, -140($fp) 
move $s4, $v0 
add $s4, $s4, 3 
move $s5, $t1 
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
lw $t1, -140($fp) 
move $v0, $t1 
jr $ra 
go_on7: 
li $v0, 4 
move $t7, $a0 
la $a0, s0ln 
syscall  
move $a0, $t7 
jr $ra 
main: 
li $s6, 16 
li $t9, 1 
li $t8, 4 
li $t6, 2 
li $v1, 8 
move $fp, $sp 
move $s0, $a0 
move $s1, $a1 
li $v0, 9 
li $a0, 260 
syscall  
add $v0, $v0, $t8 
sb $0, ($v0) 
move $t0, $v0 
li $v0, 8 
move $a0, $t0 
li $a1, 255 
syscall  
move $t1, $t0 
li $t2, 0 
begin_count1: 
lb $t3, ($t1) 
beqz $t3, end_count1 
add $t1, $t1, $t9 
add $t2, $t2, $t9 
b begin_count1 
end_count1: 
sub $t0, $t0, $t8 
sw $t2, ($t0) 
sw $t0, 0($fp) 
move $a0, $s0 
move $a1, $s1 
lw $t0, r9 
lw $t1, 0($fp) 
sw $t1, r9 
move $s0, $a0 
move $s1, $a1 
li $v0, 9 
li $a0, 260 
syscall  
add $v0, $v0, $t8 
sb $0, ($v0) 
move $t0, $v0 
li $v0, 8 
move $a0, $t0 
li $a1, 255 
syscall  
move $t1, $t0 
li $t2, 0 
begin_count2: 
lb $t3, ($t1) 
beqz $t3, end_count2 
add $t1, $t1, $t9 
add $t2, $t2, $t9 
b begin_count2 
end_count2: 
sub $t0, $t0, $t8 
sw $t2, ($t0) 
sw $t0, -8($fp) 
move $a0, $s0 
move $a1, $s1 
lw $t0, r10 
lw $t1, -8($fp) 
sw $t1, r10 
sw $t1, -20($fp) 
li $s2, 1 
li $s1, 0 
add $t1, $t1, $t8 
move $t2, $t1 
_count_num1: 
lb $s0, ($t1) 
bgt $s0, 57, _begin_parseInt1 
blt $s0, 48, _begin_parseInt1 
add $t1, $t1, $t9 
b _count_num1 
_begin_parseInt1: 
sub $t1, $t1, $t9 
_parseInt1: 
blt $t1, $t2, _finish_parseInt1 
lb $s0, ($t1) 
sub $s0, $s0, 48 
mul $s0, $s0, $s2 
add $s1, $s1, $s0 
mul $s2, $s2, 10 
sub $t1, $t1, $t9 
b _parseInt1 
_finish_parseInt1: 
sw $s1, -16($fp) 
lw $t0, r12 
lw $t1, -16($fp) 
sw $t1, r12 
lw $t1, r9 
sw $t1, -32($fp) 
lw $t0, -28($fp) 
lw $t1, -32($fp) 
lw $t1, ($t1) 
move $t0, $t1 
sw $t0, -28($fp) 
lw $t1, -28($fp) 
lw $t2, r12 
slt $t0, $t1, $t2 
sw $t0, -36($fp) 
beq $t0, $zero, if_false19 
if_true18: 
li $v0, 4 
move $t7, $a0 
la $a0, s1ln 
syscall  
move $a0, $t7 
li $v0, 0 
jr $ra 
if_false19: 
add $sp, $sp, -384 
sw $a0, 0($sp) 
lw $t1, r12 
sub $t0, $t1, $t9 
sw $t0, -44($fp) 
lw $t1, r9 
sw $t1, -48($fp) 
move $s0, $a0 
lw $t1, -48($fp) 
lw $t2, -44($fp) 
move $s0, $a0 
li $v0, 9 
sub $a0, $t2, $0 
move $s1, $a0 
add $s1, $s1, $t9 
add $a0, $a0, 6 
syscall  
sw $s1, ($v0) 
move $s4, $v0 
add $v0, $v0, $t8 
add $t1, $t1, $t8 
add $t1, $t1, $0 
li $s5, 0 
begin_substring3: 
lb $s2, ($t1) 
sb $s2, ($v0) 
add $t1, $t1, $t9 
add $v0, $v0, $t9 
add $s5, $s5, $t9 
slt $s3, $s5, $s1 
beqz $s3, end_substring3 
b begin_substring3 
end_substring3: 
sb $0, ($v0) 
sw $s4, -40($fp) 
move $a0, $s0 
lw $t1, -40($fp) 
move $a0, $t1 
sw $ra, -16($sp) 
sw $fp, -20($sp) 
sub $sp, $sp, $s6 
move $fp, $sp 
sub $sp, $sp, $v1 
jal calc1 
lw $a0, 16($fp) 
lw $ra, 0($fp) 
move $sp, $fp 
lw $fp, -4($fp) 
add $sp, $sp, 24 
sw $v0, -56($fp) 
lw $t0, r11 
lw $t1, -56($fp) 
sw $t1, r11 
lw $t0, r11 
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
