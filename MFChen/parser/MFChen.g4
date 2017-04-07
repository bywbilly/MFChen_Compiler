grammar MFChen;
@header{package MFChen.parser;}
/*
program
	:	class_declaration program?
	|	func_declaration program?
	|	var_decl_stmt program?
	|   EOF
	;
*/

program
    :   (class_declaration | func_declaration | var_decl_stmt)*

    ;
class_declaration
	:	Class Identifier
		L_Brace
		member_declaration_list?
		R_Brace
	;

typeSpecifier
	:	('bool'
	|	'int'
	|	'string'
	|	Identifier)
		(L_Bracket R_Bracket)*

	;

member_declaration_list
	:	typeSpecifier Identifier Semi
	|	typeSpecifier Identifier Semi member_declaration_list
	;

func_declaration
	:	typeSpecifier Identifier
		L_Paren
		parameter_list?
		R_Paren
		block_statement
	|	Void Identifier
		L_Paren
		parameter_list?
		R_Paren
		block_statement
	;

parameter_list
	:	typeSpecifier Identifier
	|	typeSpecifier Identifier Comma
		parameter_list
	;

block_statement
	:	L_Brace
		statement_list?
		R_Brace
	;

statement_list
	:	statement
	|	statement statement_list
	;
/*
var_stmt
	:	typeSpecifier Identifier Comma
	|	typeSpecifier Identifier Assign expression Comma
	;
*/

var_decl_stmt
	:	typeSpecifier Identifier Semi
	|	typeSpecifier Identifier Assign expression Semi
	;


statement
	:	block_statement
	|	expression_statement
	|	selection_statement
	|	iteration_statement
	|	jump_statement
	| 	var_decl_stmt
	|	Semi
	;

jump_statement
	: 	Return expression? Semi
	|	Break Semi
	|	Continue Semi
	;

selection_statement
	:	If
		L_Paren
		expression
		R_Paren
		statement
	|	If
		L_Paren
		expression
		R_Paren
		statement
		Else statement
	;

iteration_statement
	:	While
		L_Paren
		expression
		R_Paren
		statement
	|	For
		L_Paren
		first_expression Semi
		second_expression Semi
		third_expression
		R_Paren
		statement
	;

first_expression
    :   expression?
    ;

second_expression
    :   expression?
    ;

third_expression
    :   expression?
    ;

expression_statement
	:	expression Semi
	;



 expression
	:	assignment_expression
	;

assignment_expression
	:	<assoc = right> assignment_expression Assign
		assignment_expression
	|	logical_oror_expression
	;

logical_oror_expression
	:	<assoc = right> logical_oror_expression
		OrOr logical_oror_expression
	|	logical_andand_expression
	;

logical_andand_expression
	:	<assoc = right> logical_andand_expression AndAnd
		logical_andand_expression
	|	logical_or_expression
	;

logical_or_expression
	:	logical_or_expression Or
		logical_or_expression
	|	logical_xor_expression
	;

logical_xor_expression
	:	logical_xor_expression Caret
		logical_xor_expression
	|	logical_and_expression
	;

logical_and_expression
	:	logical_and_expression And
		logical_and_expression
	|	logical_NotEqual_expression
	;

logical_NotEqual_expression
	:	logical_NotEqual_expression NotEqual
		logical_NotEqual_expression
	|	logical_Equal_expression
	;

logical_Equal_expression
	:	logical_Equal_expression Equal
		logical_Equal_expression
	|	logical_LessEqual_expression
	;

logical_LessEqual_expression
	:	logical_LessEqual_expression LessEqual
		logical_LessEqual_expression
	|	logical_Less_expression
	;

logical_Less_expression
	:	logical_Less_expression Less
		logical_Less_expression
	|	logical_GreaterEqual_expression
	;

logical_GreaterEqual_expression
	:	logical_GreaterEqual_expression GreaterEqual
		logical_GreaterEqual_expression
	|	logical_Greater_expression
	;

logical_Greater_expression
	:	logical_Greater_expression Greater
		logical_Greater_expression
	|	logical_RightShift_expression
	;

logical_RightShift_expression
	:	logical_RightShift_expression (RightShift | LeftShift)
		logical_RightShift_expression
	|	logical_LeftShift_expression
	;

logical_LeftShift_expression
	:
	/*
	    logical_LeftShift_expression LeftShift
		logical_LeftShift_expression
	|
	*/
	minus_expression
	;

minus_expression
	:	minus_expression (Minus | Plus)
		minus_expression
	|	plus_expression
	;

plus_expression
	:
	/*
	plus_expression Plus
	plus_expression
	*/
	    multiply_expression
	;

mod_expression
	:
	/*
	    mod_expression Mod
		mod_expression
	|
	*/
	creation_expression
	;

multiply_expression
	:	multiply_expression (Star | Mod | Div)
		multiply_expression
	|	divide_expression
	;

divide_expression
	:
	/*
	    divide_expression Div
		divide_expression
	|
	*/
	mod_expression
	;

creation_expression
	:	New typeSpecifier dim_expression
	|	unary_expression
	;


unary_expression
    :  unary_expression Dot Identifier dim_expression (L_Paren call_parameter_list? R_Paren)?
    |   <assoc = right> PlusPlus unary_expression
    |   <assoc = right> unary_expression PlusPlus
    |   <assoc = right> Minus unary_expression
    |   <assoc = right> Not unary_expression
    |   <assoc = right> Tilde unary_expression
    |   call_expression dim_expression
    |   constant_expression
    |   Identifier dim_expression
    |   Identifier
    |   paren_expression
    ;

paren_expression
    :   L_Paren expression R_Paren
    ;

/*
unary_expression
	:	Identifier
	|	Identifier dim_expression
	|	<assoc = right> unary_expression Dot Identifier
	|	<assoc = right> PlusPlus unary_expression
	|	<assoc = right> unary_expression PlusPlus
	|	<assoc = right> Minus unary_expression
	|	<assoc = right> Not unary_expression
	|	<assoc = right> Tilde unary_expression
	|	call_expression
	|	constant_expression
	|	L_Paren unary_expression R_Paren
	;
*/

dim_list
    :   IntLiteral
    |   expression
    ;

dim_expression
	:	(L_Bracket
		 dim_list
		 R_Bracket
		)*
		(L_Bracket
       	 R_Bracket
        )*
	;

call_parameter_list
	:	(expression Comma)* expression
	;

call_expression
	:	Identifier dim_expression L_Paren call_parameter_list? R_Paren
/*
	|	(Identifier | StringLiteral) dim_expression Dot Identifier
		(L_Paren
		 call_parameter_list?
		 R_Paren
		)
*/
	;
/*
left_value
	:	Identifier
	|	left_value Dot Identifier
	;
*/
constant_expression
	:	Null
	|	IntLiteral
	|	StringLiteral
	|	LogicalConstant
	;


Break : 'break';
Class : 'class';
Continue : 'continue';
Const : 'const';
Else : 'else';
For : 'for';
If : 'if';
Int : 'int';
New : 'new';
Null : 'null';
Return : 'return';
String : 'string';
Void : 'void';
While : 'while';

Bool : 'bool';

L_Paren : '(';
R_Paren : ')';
L_Bracket : '[';
R_Bracket : ']';
L_Brace : '{';
R_Brace : '}';

Less : '<';
LessEqual : '<=';
Greater : '>';
GreaterEqual : '>=';
LeftShift : '<<';
RightShift : '>>';

Plus : '+';
PlusPlus : '++' | '--';
Minus : '-';
MinusMinus : '--';
Star : '*';
Div : '/';
Mod : '%';

And : '&';
Or : '|';
AndAnd : '&&';
OrOr : '||';
Caret : '^';
Not : '!';
Tilde : '~';

Colon : ':';
Semi : ';';
Comma : ',';

Assign : '=';

Equal : '==';
NotEqual : '!=';

Dot : '.';

LogicalConstant
	:	'true'
	|	'false'
	;

fragment
Digit
	:	[0-9]
	;

IntLiteral
	:	Digit+
	;

fragment
Nondigit
	:	[a-zA-Z_]
	;

Identifier
	:	Nondigit
		(
			Nondigit | Digit
		)*
	;

fragment
NonzeroDigit
	:	[1-9]
	;

IntegerConstant
	:	Digit+
	;

fragment
Sign
	:	'+' | '-'
	;

StringLiteral
	:	'"' (EscapSequence | .)*? '"'
	;
fragment
EscapSequence
	:	'\\' [btnr"\\]
	;
/*
SCharSequence
	:	(. | EscapSequence)*
	;
*/


Constant
	:	IntegerConstant
	|	StringLiteral
	|	LogicalConstant
	|	Null
	;

WhiteSpace
	:	[ \r\n\t]+ -> skip
	;

Comment
	:	'//' ~[\r\n]*
		-> skip
	;


Length : 'length';
Substring : 'substring';
Parseint : 'parseInt';
Ord : 'ord';
Size : 'size';
