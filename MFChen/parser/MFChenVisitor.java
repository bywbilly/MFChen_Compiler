// Generated from MFChen.g4 by ANTLR 4.5.2
package MFChen.parser;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link MFChenParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface MFChenVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link MFChenParser#program}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgram(MFChenParser.ProgramContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#class_declaration}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClass_declaration(MFChenParser.Class_declarationContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#typeSpecifier}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTypeSpecifier(MFChenParser.TypeSpecifierContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#member_declaration_list}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMember_declaration_list(MFChenParser.Member_declaration_listContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#func_declaration}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunc_declaration(MFChenParser.Func_declarationContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#parameter_list}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParameter_list(MFChenParser.Parameter_listContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#block_statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBlock_statement(MFChenParser.Block_statementContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#statement_list}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStatement_list(MFChenParser.Statement_listContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#var_decl_stmt}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVar_decl_stmt(MFChenParser.Var_decl_stmtContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStatement(MFChenParser.StatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#jump_statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitJump_statement(MFChenParser.Jump_statementContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#selection_statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSelection_statement(MFChenParser.Selection_statementContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#iteration_statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIteration_statement(MFChenParser.Iteration_statementContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#first_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFirst_expression(MFChenParser.First_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#second_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSecond_expression(MFChenParser.Second_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#third_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitThird_expression(MFChenParser.Third_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#expression_statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpression_statement(MFChenParser.Expression_statementContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpression(MFChenParser.ExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#assignment_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAssignment_expression(MFChenParser.Assignment_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#logical_oror_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLogical_oror_expression(MFChenParser.Logical_oror_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#logical_andand_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLogical_andand_expression(MFChenParser.Logical_andand_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#logical_or_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLogical_or_expression(MFChenParser.Logical_or_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#logical_xor_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLogical_xor_expression(MFChenParser.Logical_xor_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#logical_and_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLogical_and_expression(MFChenParser.Logical_and_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#logical_NotEqual_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLogical_NotEqual_expression(MFChenParser.Logical_NotEqual_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#logical_Equal_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLogical_Equal_expression(MFChenParser.Logical_Equal_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#logical_LessEqual_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLogical_LessEqual_expression(MFChenParser.Logical_LessEqual_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#logical_Less_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLogical_Less_expression(MFChenParser.Logical_Less_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#logical_GreaterEqual_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLogical_GreaterEqual_expression(MFChenParser.Logical_GreaterEqual_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#logical_Greater_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLogical_Greater_expression(MFChenParser.Logical_Greater_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#logical_RightShift_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLogical_RightShift_expression(MFChenParser.Logical_RightShift_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#logical_LeftShift_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLogical_LeftShift_expression(MFChenParser.Logical_LeftShift_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#minus_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMinus_expression(MFChenParser.Minus_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#plus_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPlus_expression(MFChenParser.Plus_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#mod_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMod_expression(MFChenParser.Mod_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#multiply_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMultiply_expression(MFChenParser.Multiply_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#divide_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDivide_expression(MFChenParser.Divide_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#creation_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCreation_expression(MFChenParser.Creation_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#unary_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitUnary_expression(MFChenParser.Unary_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#paren_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParen_expression(MFChenParser.Paren_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#dim_list}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDim_list(MFChenParser.Dim_listContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#dim_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDim_expression(MFChenParser.Dim_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#call_parameter_list}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCall_parameter_list(MFChenParser.Call_parameter_listContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#call_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCall_expression(MFChenParser.Call_expressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MFChenParser#constant_expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitConstant_expression(MFChenParser.Constant_expressionContext ctx);
}