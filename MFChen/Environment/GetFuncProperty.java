package MFChen.Environment;

/**
 * Created by bywbilly on 16/3/30.
 */

import MFChen.Symbol.Symbol;
import MFChen.Symbol.Table;
import MFChen.parser.MFChenParser;
import MFChen.parser.MFChenVisitor;
import org.antlr.v4.runtime.misc.Pair;
import org.antlr.v4.runtime.tree.AbstractParseTreeVisitor;

import java.util.ArrayList;
import java.util.HashMap;

public class GetFuncProperty extends AbstractParseTreeVisitor<Property> implements MFChenVisitor<Property> {
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */

    public HashMap<String, Integer> nameType;

    public void GetType(HashMap<String, Integer> _nameType) {
        nameType = _nameType;
    }

    //public int scope = 0;

    public Table Symbol_Table = new Table();
    public HashMap<Integer, HashMap<String, Integer>> classType = new HashMap<>();



    @Override public Property visitProgram(MFChenParser.ProgramContext ctx) {
        return visitChildren(ctx);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitClass_declaration(MFChenParser.Class_declarationContext ctx) {
        int uID = -1;
        String classname = ctx.Identifier().getText();
        if (Symbol_Table.get(Symbol.symbol(classname)) != null) {
            int line = ctx.getStart().getLine();
            throw new RuntimeException("Compilation error " + line + ": ambiguous classname defined.");
        }
        if (nameType.containsKey(classname) == false) {
            int line = ctx.getStart().getLine();
            throw new RuntimeException("Compilation error " + line + ": Amazing error.");
        } else {
            uID = nameType.get(classname);
            if (ctx.member_declaration_list() != null) {
                Property ret = visit(ctx.member_declaration_list());
                classType.put(uID, ret.classinfo);
            } else {
                classType.put(uID, null);
            }
        }
        Property classProperty = new Property(1, uID, classType.get(uID), null, null);
        Symbol_Table.put(Symbol.symbol(classname), new Pair<>(1, classProperty));
        return new Property(-1, -1, null, null, null);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitTypeSpecifier(MFChenParser.TypeSpecifierContext ctx) {
        if (ctx.L_Bracket().size() == 0) {
            String tmpType = ctx.getText();
            /*
            if (nameType.containsKey(tmpType) == false) {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Undefined type.");
            }
            */
            return new Property(-1, -1, null, null, null);
        } else {
            String newType = ctx.getText();
            String oldType = newType.substring(0, newType.indexOf('['));
            //System.out.println('!' + " " + oldType);
            if (nameType.containsKey(oldType) == false) {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Undefined type.");
            }
            if (nameType.containsKey(newType) == false) {
                int uID = nameType.size();
                nameType.put(newType, uID + 1);
                return new Property(-1, -1, null, null, null);
            }
            //System.out.print(newType);
        }
        return new Property(-1, -1, null, null, null);
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitMember_declaration_list(MFChenParser.Member_declaration_listContext ctx) {
        visit(ctx.typeSpecifier());

        int uID = -1;
        HashMap<String, Integer> ret = new HashMap<>();
        String tmpType = ctx.typeSpecifier().getText();
        String tmpID = ctx.Identifier().getText();
        if (nameType.containsKey(tmpType) == false) {
            int line = ctx.getStart().getLine();
            throw new RuntimeException("Compilation error " + line + ": Undefined type.");
        } else {
            uID = nameType.get(tmpType);
        }
        if (ctx.member_declaration_list() == null) {
            ret.put(tmpID, uID);
        } else {
            ret.put(tmpID, uID);
            Property property = visit(ctx.member_declaration_list());
            HashMap<String, Integer> nret = property.classinfo;
            for (HashMap.Entry<String, Integer> entry : nret.entrySet()) {
                String key = entry.getKey();
                int value = entry.getValue();
                if (ret.containsKey(key)) {
                    //System.out.println(ret + " " + key);
                    int line = ctx.getStart().getLine();
                    //System.out.println("Compilation error " + line + ": This variable cannot be defined more than once!");
                    throw new RuntimeException("Compilation error " + line + ": This variable cannot be defined more than once!");
                } else {
                    ret.put(key, value);
             //       System.out.println(key + ' ' + value);
                }
            }
        }
        return new Property(1, uID, ret, null, null);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitFunc_declaration(MFChenParser.Func_declarationContext ctx) {
        Property property = new Property(2, 0, null, null, null);
        String tmpType;
        if (ctx.typeSpecifier() != null) {
            visit(ctx.typeSpecifier());
            tmpType = ctx.typeSpecifier().getText();
        } else {
            tmpType = "void";
        }
        String funcName = ctx.Identifier().getText();
        if (Symbol_Table.get(Symbol.symbol(funcName)) != null) {
            int line = ctx.getStart().getLine();
            throw new RuntimeException("Compilation error " + line + ": ambiguous function name defined.");
        }
        if (nameType.containsKey(tmpType) == false) {
            int line = ctx.getStart().getLine();
            throw new RuntimeException("Compilation error " + line + ": Undefined type.");
        } else {
            property.typeProperty = nameType.get(tmpType);
            if (ctx.parameter_list() != null) {
                Property tmpProperty = visit(ctx.parameter_list());
                property.funcinfo  = tmpProperty.funcinfo;
                property.funcinfo2 = tmpProperty.funcinfo2;
            }
        }
        //System.out.println(ctx.Identifier().getText());
        //System.out.println(property.funcinfo);
        //System.out.println(property.funcinfo2);
        Symbol_Table.put(Symbol.symbol(ctx.Identifier().getText()), new Pair<>(1, property));
        return property;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitParameter_list(MFChenParser.Parameter_listContext ctx) {
        visit(ctx.typeSpecifier());
        String tmpType = ctx.typeSpecifier().getText();
        String tmpID   = ctx.Identifier().getText();
        ArrayList<Integer> parameter1 = new ArrayList<>();
        ArrayList<String>  parameter2 = new ArrayList<>();
        if (nameType.containsKey(tmpType) == false) {
            int line = ctx.getStart().getLine();
            throw new RuntimeException("Compilation error " + line + ": Undefined type");
        } else {
            int uID = nameType.get(tmpType);
            if (ctx.parameter_list() == null) {
                parameter1.add(nameType.get(tmpType));
                parameter2.add(ctx.Identifier().getText());
            } else {
                parameter1.add(nameType.get(tmpType));
                parameter2.add(ctx.Identifier().getText());
                Property property = visit(ctx.parameter_list());
                ArrayList<String>  tmpParameter2 = property.funcinfo2;
                ArrayList<Integer> tmpParameter1 = property.funcinfo;
                if (tmpParameter2.contains(tmpID) == true) {
                    int line = ctx.getStart().getLine();
                    throw new RuntimeException("Compilation error " + line + ": ambiguous parameter define.");
                } else {
                    for (Integer entry : tmpParameter1) {
                        parameter1.add(entry);
                    }
                    for (String  entry : tmpParameter2) {
                        parameter2.add(entry);
                    }
                }
            }
        }
        return new Property(2, 0, null, parameter1, parameter2);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitBlock_statement(MFChenParser.Block_statementContext ctx) {
        return visitChildren(ctx);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitStatement_list(MFChenParser.Statement_listContext ctx) {
        return visitChildren(ctx);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitVar_decl_stmt(MFChenParser.Var_decl_stmtContext ctx) {
        return visitChildren(ctx);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitStatement(MFChenParser.StatementContext ctx) {
        return visitChildren(ctx);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitJump_statement(MFChenParser.Jump_statementContext ctx) {
        return visitChildren(ctx);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitSelection_statement(MFChenParser.Selection_statementContext ctx) {
        return visitChildren(ctx);
    }

    @Override public Property visitFirst_expression(MFChenParser.First_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitSecond_expression(MFChenParser.Second_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitThird_expression(MFChenParser.Third_expressionContext ctx) { return visitChildren(ctx); }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitIteration_statement(MFChenParser.Iteration_statementContext ctx) {
        return visitChildren(ctx);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitExpression_statement(MFChenParser.Expression_statementContext ctx) {
        return visitChildren(ctx);}
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitExpression(MFChenParser.ExpressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitAssignment_expression(MFChenParser.Assignment_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_oror_expression(MFChenParser.Logical_oror_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_andand_expression(MFChenParser.Logical_andand_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_or_expression(MFChenParser.Logical_or_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_xor_expression(MFChenParser.Logical_xor_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_and_expression(MFChenParser.Logical_and_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_NotEqual_expression(MFChenParser.Logical_NotEqual_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_Equal_expression(MFChenParser.Logical_Equal_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_LessEqual_expression(MFChenParser.Logical_LessEqual_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_Less_expression(MFChenParser.Logical_Less_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_GreaterEqual_expression(MFChenParser.Logical_GreaterEqual_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_Greater_expression(MFChenParser.Logical_Greater_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_RightShift_expression(MFChenParser.Logical_RightShift_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_LeftShift_expression(MFChenParser.Logical_LeftShift_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitMinus_expression(MFChenParser.Minus_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitPlus_expression(MFChenParser.Plus_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitMod_expression(MFChenParser.Mod_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitMultiply_expression(MFChenParser.Multiply_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitDivide_expression(MFChenParser.Divide_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitCreation_expression(MFChenParser.Creation_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */

    @Override public Property visitParen_expression(MFChenParser.Paren_expressionContext ctx) { return visitChildren(ctx); }

    @Override public Property visitUnary_expression(MFChenParser.Unary_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitDim_list(MFChenParser.Dim_listContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitDim_expression(MFChenParser.Dim_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitCall_parameter_list(MFChenParser.Call_parameter_listContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitCall_expression(MFChenParser.Call_expressionContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitConstant_expression(MFChenParser.Constant_expressionContext ctx) { return visitChildren(ctx); }
}
