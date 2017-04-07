// Generated from MFChen.g4 by ANTLR 4.5.2
package MFChen.Optimization;

import MFChen.parser.MFChenParser;
import MFChen.parser.MFChenVisitor;
import org.antlr.v4.runtime.tree.AbstractParseTreeVisitor;

/**
 * This class provides an empty implementation of {@link MFChenVisitor},
 * which can be extended to create a visitor which only needs to handle a subset
 * of the available methods.
 *
 * operations with no return type.
 */
public class prettyPrint extends AbstractParseTreeVisitor<Object> implements MFChenVisitor<Object> {

    public int scope = 0;

    public String NEWLINE = "\n";
    public String prettyPrintCode = "";

    public String getTab(int scope) {
        String ret = "";
        for (int i = 0; i < scope; i++) {
            ret = ret + "\t";
        }
        return ret;
    }

    public void print() {
        System.out.println(prettyPrintCode);
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitProgram(MFChenParser.ProgramContext ctx) {
        for (int i = 0; i < ctx.var_decl_stmt().size(); i++) {
            prettyPrintCode += (String)visit(ctx.var_decl_stmt(i));
        }
        for (int i = 0; i < ctx.class_declaration().size(); i++) {
            prettyPrintCode += (String)visit(ctx.class_declaration(i));
        }
        for (int i = 0; i < ctx.func_declaration().size(); i++) {
            prettyPrintCode += (String)visit(ctx.func_declaration(i));
        }
        return prettyPrintCode;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitClass_declaration(MFChenParser.Class_declarationContext ctx) {
        scope++;
        String ret = "";
        ret += "class " + ctx.Identifier().getText() + "{" + NEWLINE;
        if (ctx.member_declaration_list() != null) {
            ret += (String)visit(ctx.member_declaration_list());
        }
        ret += "}" + NEWLINE;
        scope--;
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitTypeSpecifier(MFChenParser.TypeSpecifierContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitMember_declaration_list(MFChenParser.Member_declaration_listContext ctx) {
        String ret = "";
        if (ctx.member_declaration_list() == null) {
            ret += getTab(scope) + ctx.typeSpecifier().getText() + " " + ctx.Identifier().getText() + ";" + NEWLINE;
        } else {
            ret += getTab(scope) + ctx.typeSpecifier().getText() + " " + ctx.Identifier().getText() + ";" + NEWLINE;
            ret += (String)visit(ctx.member_declaration_list());
        }
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitFunc_declaration(MFChenParser.Func_declarationContext ctx) {
        scope++;
        String ret = "";
        if (ctx.Void() != null) {
            ret += "Void " + ctx.Identifier().getText() + "(";
        } else {
            ret += ctx.typeSpecifier().getText() + " " + ctx.Identifier().getText() + "(";
        }
        if (ctx.parameter_list() != null) {
            ret += (String)visit(ctx.parameter_list());
        }
        ret += ")";
        ret += (String)visit(ctx.block_statement());
        scope--;
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitParameter_list(MFChenParser.Parameter_listContext ctx) {
        String ret = "";
        ret += ctx.typeSpecifier().getText() + " " + ctx.Identifier().getText();
        if (ctx.parameter_list() != null) {
            ret += ", " + (String)visit(ctx.parameter_list());
        }
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitBlock_statement(MFChenParser.Block_statementContext ctx) {
        String ret = NEWLINE + getTab(scope - 1) + "{" + NEWLINE;
        if (ctx.statement_list() != null) {
            ret += (String)visit(ctx.statement_list());
        }
        ret += getTab(scope - 1) + "}" + NEWLINE;
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitStatement_list(MFChenParser.Statement_listContext ctx) {
        String ret = "";
        ret += (String)visit(ctx.statement());
        if (ctx.statement_list() != null) {
            ret += (String)visit(ctx.statement_list());
        }
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */


    @Override public Object visitVar_decl_stmt(MFChenParser.Var_decl_stmtContext ctx) {
        String ret = "";
        ret += getTab(scope);
        ret += ctx.typeSpecifier().getText() + " " + ctx.Identifier().getText();
        if (ctx.Assign() != null) {
            ret += " " + "=" + " " + (String)visit(ctx.expression());
        }
        ret += ";" + NEWLINE;
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitStatement(MFChenParser.StatementContext ctx) {
        String ret = "";
        ret += (String)visitChildren(ctx);
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitJump_statement(MFChenParser.Jump_statementContext ctx) {
        String ret = "";
        ret += getTab(scope);
        if (ctx.Return() != null) {
            ret += "return";
        }
        if (ctx.Break() != null) {
            ret += "break";
        }
        if (ctx.Continue() != null) {
            ret += "continue";
        }
        if (ctx.expression() != null) {
            ret += " " + (String)visit(ctx.expression());
        }
        ret += ";" + NEWLINE;
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitSelection_statement(MFChenParser.Selection_statementContext ctx) {
        String ret = "";
        ret += getTab(scope);
        ret += "if (" + (String)visit(ctx.expression()) + ")";
        scope++;
        if (ctx.statement(0).getText().indexOf("{") != 0) {
            ret += NEWLINE;
        }
        ret += visit(ctx.statement(0));
        if (ctx.Else() != null) {
            ret += getTab(scope - 1) + "else";
            if (ctx.statement(1).getText().indexOf("{") != 0) {
                ret += NEWLINE;
            }
            ret += visit(ctx.statement(1));
        }
        scope--;
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitIteration_statement(MFChenParser.Iteration_statementContext ctx) {
        String ret = "";
        ret += getTab(scope);
        if (ctx.While() != null) {
            ret += "while(" + (String)visit(ctx.expression()) + ")";
            if (ctx.statement().getText().indexOf("{") != 0) {
                ret += NEWLINE;
            }
        } else {
            ret += "for (" + visit(ctx.first_expression()) + "; " + visit(ctx.second_expression()) + "; " + visit(ctx.third_expression()) + ")";
            if (ctx.statement().getText().indexOf("{") != 0) {
                ret += NEWLINE;
            }
        }
        scope++;
        ret += (String)visit(ctx.statement());
        scope--;
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of callin
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitFirst_expression(MFChenParser.First_expressionContext ctx) {
        String ret = "";
        if (ctx.expression() != null) {
            ret += visit(ctx.expression());
        }
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitSecond_expression(MFChenParser.Second_expressionContext ctx) {
        String ret = "";
        if (ctx.expression() != null) {
            ret += visit(ctx.expression());
        }
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitThird_expression(MFChenParser.Third_expressionContext ctx) {
        String ret = "";
        if (ctx.expression() != null) {
            ret += visit(ctx.expression());
        }
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitExpression_statement(MFChenParser.Expression_statementContext ctx) {
        String ret = getTab(scope);
        ret += visit(ctx.expression()) + ";" + NEWLINE;
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitExpression(MFChenParser.ExpressionContext ctx) {
        String ret = (String)visit(ctx.assignment_expression());
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    //-1 for not constant
    // 0 for null
    // 1 for true | false
    // 2 for number
    // 3 for string literal
    @Override public Object visitAssignment_expression(MFChenParser.Assignment_expressionContext ctx) {
        String ret = "";
        if (ctx.logical_oror_expression() == null) {
            ret += visit(ctx.assignment_expression(0)) + " = " + visit(ctx.assignment_expression(1));
        } else {
            ret += visit(ctx.logical_oror_expression());
        }
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    //-1 for not constant
    // 0 for null
    // 1 for true | false
    // 2 for number
    // 3 for string literal


    @Override public Object visitLogical_oror_expression(MFChenParser.Logical_oror_expressionContext ctx) {
        String ret = "";
        if (ctx.logical_andand_expression() == null) {
            ret += visit(ctx.logical_oror_expression(0)) + " || " + visit(ctx.logical_oror_expression(1));
        } else {
            ret += visit(ctx.logical_andand_expression());
        }
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */


    @Override public Object visitLogical_andand_expression(MFChenParser.Logical_andand_expressionContext ctx) {
        String ret = "";
        if (ctx.logical_or_expression() == null) {
            ret += visit(ctx.logical_andand_expression(0)) + " && " + visit(ctx.logical_andand_expression(1));
        } else {
            ret += visit(ctx.logical_or_expression());
        }
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    //-1 for not constant
    // 0 for null
    // 1 for true | false
    // 2 for number
    // 3 for string literal
    @Override public Object visitLogical_or_expression(MFChenParser.Logical_or_expressionContext ctx) {
        String ret = "";
        if (ctx.logical_xor_expression() == null) {
            ret += visit(ctx.logical_or_expression(0)) + " | " + visit(ctx.logical_or_expression(1));
        } else {
            ret += visit(ctx.logical_xor_expression());
        }
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitLogical_xor_expression(MFChenParser.Logical_xor_expressionContext ctx) {
        String ret = "";
        if (ctx.logical_and_expression() == null) {
            ret += visit(ctx.logical_xor_expression(0)) + " ^ " + visit(ctx.logical_xor_expression(1));
        } else {
            ret += visit(ctx.logical_and_expression());
        }
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitLogical_and_expression(MFChenParser.Logical_and_expressionContext ctx) {
        String ret = "";
        if (ctx.logical_NotEqual_expression() == null) {
            ret += visit(ctx.logical_and_expression(0)) + " & " + visit(ctx.logical_and_expression(1));
        } else {
            ret += visit(ctx.logical_NotEqual_expression());
        }
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    //-1 for not constant
    // 0 for null
    // 1 for true | false
    // 2 for number
    // 3 for string literal
    @Override public Object visitLogical_NotEqual_expression(MFChenParser.Logical_NotEqual_expressionContext ctx) {
        String ret = "";
        if (ctx.logical_Equal_expression() == null) {
            ret += visit(ctx.logical_NotEqual_expression(0)) + " != " + visit(ctx.logical_NotEqual_expression(1));
        } else {
            ret += visit(ctx.logical_Equal_expression());
        }
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitLogical_Equal_expression(MFChenParser.Logical_Equal_expressionContext ctx) {
        String ret = "";
        if (ctx.logical_LessEqual_expression() == null) {
            ret += visit(ctx.logical_Equal_expression(0)) + " == " + visit(ctx.logical_Equal_expression(1));
        } else {
            ret += visit(ctx.logical_LessEqual_expression());
        }
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitLogical_LessEqual_expression(MFChenParser.Logical_LessEqual_expressionContext ctx) {
        String ret = "";
        if (ctx.logical_Less_expression() == null) {
            ret += visit(ctx.logical_LessEqual_expression(0)) + " <= " + visit(ctx.logical_LessEqual_expression(1));
        } else {
            ret += visit(ctx.logical_Less_expression());
        }
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitLogical_Less_expression(MFChenParser.Logical_Less_expressionContext ctx) {
        String ret = "";
        if (ctx.logical_GreaterEqual_expression() == null) {
            ret += visit(ctx.logical_Less_expression(0)) + " < " + visit(ctx.logical_Less_expression(1));
        } else {
            ret += visit(ctx.logical_GreaterEqual_expression());
        }
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitLogical_GreaterEqual_expression(MFChenParser.Logical_GreaterEqual_expressionContext ctx) {
        String ret = "";
        if (ctx.logical_Greater_expression() == null) {
            ret += visit(ctx.logical_GreaterEqual_expression(0)) + " >= " + visit(ctx.logical_GreaterEqual_expression(1));
        } else {
            ret += visit(ctx.logical_Greater_expression());
        }
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitLogical_Greater_expression(MFChenParser.Logical_Greater_expressionContext ctx) {
        String ret = "";
        if (ctx.logical_RightShift_expression() == null) {
            ret += visit(ctx.logical_Greater_expression(0)) + " > " + visit(ctx.logical_Greater_expression(1));
        } else {
            ret += visit(ctx.logical_RightShift_expression());
        }
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitLogical_RightShift_expression(MFChenParser.Logical_RightShift_expressionContext ctx) {
        String ret = "";
        if (ctx.logical_LeftShift_expression() == null) {
            ret += visit(ctx.logical_RightShift_expression(0)) + " >> " + visit(ctx.logical_RightShift_expression(1));
        } else {
            ret += visit(ctx.logical_LeftShift_expression());
        }
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitLogical_LeftShift_expression(MFChenParser.Logical_LeftShift_expressionContext ctx) {
        String ret = "";
        ret += visit(ctx.minus_expression());
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitMinus_expression(MFChenParser.Minus_expressionContext ctx) {
        String ret = "";
        if (ctx.plus_expression() == null) {
            ret += visit(ctx.minus_expression(0));
            if (ctx.Minus() == null) {
                ret += " + ";
            } else {
                ret += " - ";
            }
            ret += visit(ctx.minus_expression(1));
        } else {
            ret += visit(ctx.plus_expression());
        }
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitPlus_expression(MFChenParser.Plus_expressionContext ctx) {
        return visit(ctx.multiply_expression());
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitMod_expression(MFChenParser.Mod_expressionContext ctx) {
        return visit(ctx.creation_expression());
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitMultiply_expression(MFChenParser.Multiply_expressionContext ctx) {
        String ret = "";
        if (ctx.divide_expression() == null) {
            ret += visit(ctx.multiply_expression(0));
            if (ctx.Star() != null) {
                ret += " * ";
            } else if (ctx.Mod() != null) {
                ret += " % ";
            } else {
                ret += " / ";
            }
            ret += visit(ctx.multiply_expression(1));
        } else {
            ret += visit(ctx.divide_expression());
        }
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitDivide_expression(MFChenParser.Divide_expressionContext ctx) {
        return visit(ctx.mod_expression());
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitCreation_expression(MFChenParser.Creation_expressionContext ctx) {
        String ret = "";
        if (ctx.unary_expression() == null) {
            ret += "new " + ctx.typeSpecifier().getText() + ctx.dim_expression().getText();
        } else {
            ret += visit(ctx.unary_expression());
        }
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */



    @Override public Object visitUnary_expression(MFChenParser.Unary_expressionContext ctx) {
        if (ctx.call_expression() != null) {
            return visit(ctx.call_expression());
        } else if (ctx.paren_expression() != null){
            return visit(ctx.paren_expression());
        }
        return ctx.getText();
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitParen_expression(MFChenParser.Paren_expressionContext ctx) {
        String ret = "";
        ret += "(" + visit(ctx.expression()) + ")";
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitDim_list(MFChenParser.Dim_listContext ctx) {
        return "wtf";
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */



    @Override public Object visitDim_expression(MFChenParser.Dim_expressionContext ctx) {
        return "wtf";
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitCall_parameter_list(MFChenParser.Call_parameter_listContext ctx) {
        String ret = "";
        for (int i = 0; i < ctx.Comma().size(); i++) {
            ret += visit(ctx.expression(i)) + ", ";
        }
        ret += visit(ctx.expression(ctx.expression().size() - 1));
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitCall_expression(MFChenParser.Call_expressionContext ctx) {
        String ret = "";
        ret += ctx.Identifier().getText() + ctx.dim_expression().getText() + "(";
        if (ctx.call_parameter_list() != null) {
            ret += visit(ctx.call_parameter_list());
        }
        ret += ")";
        return ret;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitConstant_expression(MFChenParser.Constant_expressionContext ctx) {
        return "wtf";
    }
}