package MFChen.Environment;

/**
 * Created by bywbilly on 16/3/31.
 */
// Generated from MFChen.g4 by ANTLR 4.5.2

import MFChen.Symbol.Symbol;
import MFChen.Symbol.Table;
import MFChen.parser.MFChenParser;
import MFChen.parser.MFChenVisitor;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.misc.Pair;
import org.antlr.v4.runtime.tree.AbstractParseTreeVisitor;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

/**
 * This class provides an empty implementation of {@link MFChenVisitor},
 * which can be extended to create a visitor which only needs to handle a subset
 * of the available methods.
 *
 *
 */
public class TypeCheck extends AbstractParseTreeVisitor<Property> implements MFChenVisitor<Property> {

    public Table Symbol_Table;
    public HashMap<String, Integer> nameType;

    public int scope = 1;

    public boolean canBeNull(String type) {
        int pos = type.indexOf('[');
        if (pos == -1) {
            if (type.equals("int") || type.equals("bool") || type.equals("string")) {
                return false;
            } else {
                return true;
            }
        } else {
            return true;
        }
    }

    public void getEnvironment(Table _Symbol_Table, HashMap<String, Integer> _nameType) {
        Symbol_Table = _Symbol_Table;
        nameType = _nameType;
        /*
        if (Symbol_Table.get(Symbol.symbol("main")) == null) {
            throw new RuntimeException("Compilation error No main function.");
        }
        */
        Pair<Integer, Property> mainProperty = (Pair<Integer, Property>)(Symbol_Table.get(Symbol.symbol("main")));
        if (mainProperty == null || mainProperty.b.kind != 2 || mainProperty.b.typeProperty != 1) {
            throw new RuntimeException("Compilation error No main fun   ction.");
        }
        String funcName = "";
        ArrayList<Integer>  arr1 = new ArrayList<>();
        ArrayList<String>   arr2 = new ArrayList<>();
        arr1.add(2); arr2.add("str");
        Symbol_Table.put(Symbol.symbol("print"), new Pair<>(scope, new Property(2, 4, null, arr1, arr2)));
        Symbol_Table.put(Symbol.symbol("println"), new Pair<>(scope, new Property(2, 4, null, arr1, arr2)));
        Symbol_Table.put(Symbol.symbol("getString"), new Pair<>(scope, new Property(2, 2, null, null, null)));
        Symbol_Table.put(Symbol.symbol("getInt"), new Pair<>(scope, new Property(2, 1, null, null, null)));
        ArrayList<Integer> arr3 = new ArrayList<>();
        arr3.add(1);
        ArrayList<String> arr4 = new ArrayList<>();
        arr4.add("x");
        //Symbol_Table.put(Symbol.symbol("toString"), new Pair<>(scope, new Property(2, 2, null, arr3, arr4)));
        Symbol_Table.put(Symbol.symbol("__output"), new Pair<>(scope, new Property(2, 1, null, arr3, arr2)));
    }

    public String getOriginalType(String nowType) {
        String ret = nowType;
        if (nowType.indexOf('[') == -1) {
            return ret;
        } else {
            ret = nowType.substring(0, nowType.indexOf('['));
            return ret;
        }
    }

    public String getTypeString(Integer pos) {
        String ret ="";
        Set<String> allType = nameType.keySet();
        for (String iType : allType) {
            if (nameType.get(iType) == pos) {
                ret = iType;
                break;
            }
        }
        return ret;
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
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
        return new Property(-1, -1, null, null, null);
        //return visitChildren(ctx);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitTypeSpecifier(MFChenParser.TypeSpecifierContext ctx) {
        String tmpType = ctx.getText();
        if (nameType.containsKey(tmpType) == false) {
            if (ctx.L_Bracket().size() != 0) {
                String oldType = tmpType.substring(0, tmpType.indexOf('['));
                //System.out.println(oldType);
                if (nameType.containsKey(oldType) == false) {
                    int line = ctx.getStart().getLine();
                    //throw new RuntimeException("Compilation error " + line + ": Undefined type.");
                } else {
                    if (nameType.containsKey(tmpType) == false) {
                        int uID = nameType.size();
                        nameType.put(tmpType, uID + 1);
                        return new Property(-1, -1, null, null, null);
                    }
                }
            }
        }
        return new Property();
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitMember_declaration_list(MFChenParser.Member_declaration_listContext ctx) {
        return new Property(-1, -1, null, null, null);
        //return visitChildren(ctx);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitFunc_declaration(MFChenParser.Func_declarationContext ctx) {
        String funcName = ctx.Identifier().getText();
        //System.out.println(funcName);
        Pair<Integer, Property> funcPair = (Pair<Integer, Property>)Symbol_Table.get(Symbol.symbol(funcName));
        Property funcInfo = null;
        if (funcPair != null) {
            funcInfo = funcPair.b;
        }
        Symbol_Table.beginScope();
        scope++;

        int size = 0;
        if (funcInfo.funcinfo != null) {
            size = funcInfo.funcinfo.size();
        }
        for (int i = 0; i < size; i++) {
            String key = funcInfo.funcinfo2.get(i);
            Integer value = funcInfo.funcinfo.get(i);
            Symbol_Table.put(Symbol.symbol(key), new Pair<>(scope, new Property(0, value, null, null, null)));
        }
        Property retProperty = null;

        if (ctx.block_statement() != null) {
            retProperty = visit(ctx.block_statement());
        }
       // System.out.print("T_T");
     //   System.out.println(retProperty.kind + " " + retProperty.typeProperty + " " + funcInfo.typeProperty );

        if (retProperty.kind != 4 && retProperty.typeProperty != 4) {
            int line = ctx.getStart().getLine();
            throw new RuntimeException("Compilation error " + line + ": No Return Statement.");
            //return new Property();
        }
        if (retProperty != null && retProperty.kind == 4 && retProperty.typeProperty != funcInfo.typeProperty) {
            //System.out.println(retProperty.kind + " " + funcInfo.typeProperty);
            int line = ctx.getStart().getLine();
            throw new RuntimeException("Compilation error " + line + ": Wrong return type.");
        }
        //System.out.print("T_T");
        Symbol_Table.endScope();
        scope--;
        return new Property(-1, -1, null, null, null);
        //return visitChildren(ctx);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitParameter_list(MFChenParser.Parameter_listContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitBlock_statement(MFChenParser.Block_statementContext ctx) {
        String ss = "";
        if (ctx.statement_list() != null) {
            ss = ctx.statement_list().getText();
        }
        //System.out.println("!! " + ss);
        if (ctx.statement_list() == null) {
            return new Property(-1, 4, null, null, null);
        } else {
            Property retProperty = visit(ctx.statement_list());
            if (retProperty.kind != 4) {
                retProperty.typeProperty = 4;
            }
            return retProperty;
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitStatement_list(MFChenParser.Statement_listContext ctx) {
        Property property = visit(ctx.statement());
        if (ctx.statement_list() != null) {
            Property retProperty = visit(ctx.statement_list());
            //System.out.println(retProperty);
            if (retProperty.kind == 4) {
                if (property.kind == 4) {
                    if (retProperty.typeProperty != property.typeProperty) {
                        int line = ctx.getStart().getLine();
                        throw new RuntimeException("Compilation error " + line + ": wrong return type.");
                        //return new Property();
                    }
                } else {
                    property.kind = 4;
                    property.typeProperty = retProperty.typeProperty;
                }
            }
        }
        //System.out.println(" ? " + property);
        return property;

        //return visitChildren(ctx);
    }
    /**
     * {@inheritDoc}
     *-
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitVar_decl_stmt(MFChenParser.Var_decl_stmtContext ctx) {
        visit(ctx.typeSpecifier());
        String tmpType = ctx.typeSpecifier().getText();
        String tmpID   = ctx.Identifier().getText();
        //System.out.println(tmpID);
        if (nameType.containsKey(tmpType) == false) {
            int line = ctx.getStart().getLine();
            throw new RuntimeException("Compilation error " + line + ": Undefined Type.");
        } else {
            //System.out.println(tmpID);
            Pair<Integer, Property> idPair = (Pair<Integer, Property>)Symbol_Table.get(Symbol.symbol(tmpID));
            //System.out.println(ctx.getText() + " " + tmpID);
            if (idPair != null) {
                int nowScope = idPair.a;
                if (nowScope == scope) {
                    int line = ctx.getStart().getLine();
                    throw new RuntimeException("Compilation error " + line + ": reDefined Identifier.");
                }
            }
            if (ctx.expression() == null) {
                Symbol_Table.put(Symbol.symbol(tmpID), new Pair<>(scope, new Property(3, nameType.get(tmpType), null, null, null)));
            } else {
                Property property = visit(ctx.expression());
                //int size = tmpID.indexOf('[');
                if (property.typeProperty == 4) {
                    int size = tmpType.indexOf('[');
                    if (size == -1) {
                        if (tmpType.equals("int") || tmpType.equals("bool") || tmpType.equals("string")) {
                            int line = ctx.getStart().getLine();
                            throw new RuntimeException("Compilation error " + line + ": Assign expression wrong");
                        } else {
                            Symbol_Table.put(Symbol.symbol(tmpID), new Pair<>(scope, new Property(3, nameType.get(tmpType), null, null, null)));
                        }
                    } else {
                        Symbol_Table.put(Symbol.symbol(tmpID), new Pair<>(scope, new Property(3, nameType.get(tmpType), null, null, null)));
                    }
                } else {
                    if (nameType.get(tmpType) != property.typeProperty) {
                        int line = ctx.getStart().getLine();
                        throw new RuntimeException("Compilation error " + line + ": Assign expression wrong");
                    } else {
                        Symbol_Table.put(Symbol.symbol(tmpID), new Pair<>(scope, new Property(3, nameType.get(tmpType), null, null, null)));
                    }
                }
            }
        }
        return new Property(-1, -1, null, null, null);
        //return visitChildren(ctx);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitStatement(MFChenParser.StatementContext ctx) {
        if (ctx.block_statement() != null) {
            return visit(ctx.block_statement());
        } else if (ctx.expression_statement() != null) {
            return visit(ctx.expression_statement());
        } else if (ctx.selection_statement() != null) {
            return visit(ctx.selection_statement());
        } else if (ctx.iteration_statement() != null) {
            return visit(ctx.iteration_statement());
        } else if (ctx.jump_statement() != null) {
            return visit(ctx.jump_statement());
        } else if (ctx.var_decl_stmt() != null) {
            return visit(ctx.var_decl_stmt());
        } else {
            return new Property();
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitJump_statement(MFChenParser.Jump_statementContext ctx) {
        if (ctx.Return() != null) {
            Property property = new Property();
            if (ctx.expression() != null) {
                property = visit(ctx.expression());
            } else {
                property.typeProperty = 4;
            }
            property.kind = 4;
            return property;
        } else {
            ParserRuleContext curCtx = ctx;

            ParserRuleContext loop = new MFChenParser.Iteration_statementContext(ctx, -1);
            while(curCtx.depth() != 1) {
                if (curCtx.getRuleIndex() == loop.getRuleIndex()) {
                    return new Property();
                }
                curCtx = curCtx.getParent();
            }
            int line = ctx.getStart().getLine();
            throw new RuntimeException("Compilation error " + line + ": Wrong break or continue place.");
            //return new Property();
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitSelection_statement(MFChenParser.Selection_statementContext ctx) {
        Symbol_Table.beginScope();
        scope++;
        Property property = visit(ctx.expression());
        if (property.typeProperty != 3) {
            int line = ctx.getStart().getLine();
            throw new RuntimeException("Compilation error " + line + ": wrong expression type.");
        }
        int size = ctx.statement().size();
        for (int i = 0; i < size; i++) {
            if (size == 1) {
                Symbol_Table.beginScope();
            }
            visit(ctx.statement(i));
            if (size == 1) {
                Symbol_Table.endScope();
            }
        }
        Symbol_Table.endScope();
        scope--;
        return new Property();
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

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitIteration_statement(MFChenParser.Iteration_statementContext ctx) {
        Symbol_Table.beginScope();
        scope++;
        if (ctx.While() != null) {
            Property tmpProperty = visit(ctx.expression());
            //System.out.println("! " + tmpProperty.typeProperty);
            if (tmpProperty.typeProperty != nameType.get("bool")) {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": The loop condition should be boolean.");
            }
        } else {
            Property retProperty1 = visit(ctx.first_expression());
            Property retProperty2 = visit(ctx.second_expression());
            Property retProperty3 = visit(ctx.third_expression());
            if (retProperty2 != null) {
                if (retProperty2.typeProperty != 3) {
                    int line = ctx.getStart().getLine();
                    throw new RuntimeException("Compilation error " + line + ": The loop condition should be boolean.");
                }
            }
            return new Property();
        }

        Symbol_Table.endScope();
        scope--;
        return new Property(-1, -1, null, null, null);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitExpression_statement(MFChenParser.Expression_statementContext ctx) {
        return visit(ctx.expression());
        // return visitChildren(ctx);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitExpression(MFChenParser.ExpressionContext ctx) {
        return visitChildren(ctx);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitAssignment_expression(MFChenParser.Assignment_expressionContext ctx) {
        if (ctx.logical_oror_expression() == null) {
            Property tmpProperty1, tmpProperty2;
            tmpProperty1 = visit(ctx.assignment_expression(0));
            tmpProperty2 = visit(ctx.assignment_expression(1));

            //System.out.println(tmpProperty2.typeProperty);

            if (tmpProperty1.kind != 3 ){
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Not a left-value.");
                //return new Property();
            } else if (tmpProperty1.typeProperty == tmpProperty2.typeProperty) {
                //System.out.println(tmpProperty1.kind);
                //System.out.println(tmpProperty1.typeProperty + " " + tmpProperty2.typeProperty);
                return new Property(0, tmpProperty1.typeProperty, null, null, null);
            } else {
               // System.out.println(nameType);
                //System.out.println(tmpProperty1.typeProperty + " " + tmpProperty2.typeProperty);
                if (tmpProperty2.typeProperty != 4) {
                    int line = ctx.getStart().getLine();
                  //  System.out.println(ctx.getText());
                    throw new RuntimeException("Compilation error " + line + ": Cannot transform type.");
                    //return new Property(-1, -1, null, null, null);
                } else {
                    String rhsType = getTypeString(tmpProperty1.typeProperty);
                    //System.out.println(rhsType);
                    String oldType = getOriginalType(rhsType);
                    Boolean flag = true;
                    if (rhsType.indexOf('[') == -1) {
                        if (oldType.equals("int") || oldType.equals("string") || oldType.equals("bool")) {
                            flag = false;
                        }
                    }
                    if (flag == false) {
                        int line = ctx.getStart().getLine();
                        throw new RuntimeException("Compilation error " + line + ": Not an object.");
                        //return new Property();
                    } else {
                        return new Property(0, 4, null, null, null);
                    }
                }
            }
        } else {
            return visit(ctx.logical_oror_expression());
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_oror_expression(MFChenParser.Logical_oror_expressionContext ctx) {
        if (ctx.logical_andand_expression() == null) {
            Property tmpProperty1, tmpProperty2;
            tmpProperty1 = visit(ctx.logical_oror_expression(0));
            tmpProperty2 = visit(ctx.logical_oror_expression(1));
            if (tmpProperty1.typeProperty == 3 && tmpProperty2.typeProperty == 3) {
                return new Property(0, 3, null, null, null);
            } else {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Cannot transform type.");
                //return new Property(-1, -1, null, null, null);
            }
        } else {
            return visit(ctx.logical_andand_expression());
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_andand_expression(MFChenParser.Logical_andand_expressionContext ctx) {
        if (ctx.logical_or_expression() == null) {
            Property tmpProperty1, tmpProperty2;
            tmpProperty1 = visit(ctx.logical_andand_expression(0));
            tmpProperty2 = visit(ctx.logical_andand_expression(1));
            if (tmpProperty1.typeProperty == 3 && tmpProperty2.typeProperty == 3) {
                return new Property(0, 3, null, null, null);
            } else {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Cannot transform type.");
                //return new Property(-1, -1, null, null, null);
            }
        } else {
            return visit(ctx.logical_or_expression());
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_or_expression(MFChenParser.Logical_or_expressionContext ctx) {
        if (ctx.logical_xor_expression() == null) {
            Property tmpProperty1, tmpProperty2;
            tmpProperty1 = visit(ctx.logical_or_expression(0));
            tmpProperty2 = visit(ctx.logical_or_expression(1));
            if (tmpProperty1.typeProperty == 1 && tmpProperty2.typeProperty == 1) {
                return new Property(0, 1, null, null, null);
            } else {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Cannot transform type.");
                //return new Property(-1, -1, null, null, null);
            }
        } else {
            return visit(ctx.logical_xor_expression());
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_xor_expression(MFChenParser.Logical_xor_expressionContext ctx) {
        if (ctx.logical_and_expression() == null) {
            Property tmpProperty1, tmpProperty2;
            tmpProperty1 = visit(ctx.logical_xor_expression(0));
            tmpProperty2 = visit(ctx.logical_xor_expression(1));
            if (tmpProperty1.typeProperty == 1 && tmpProperty2.typeProperty == 1) {
                return new Property(0, 1, null, null, null);
            } else {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Cannot transform type.");
                //return new Property(-1, -1, null, null, null);
            }
        } else {
            return visit(ctx.logical_and_expression());
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_and_expression(MFChenParser.Logical_and_expressionContext ctx) {
        if (ctx.logical_NotEqual_expression() == null) {
            Property tmpProperty1, tmpProperty2;
            tmpProperty1 = visit(ctx.logical_and_expression(0));
            tmpProperty2 = visit(ctx.logical_and_expression(1));
            if (tmpProperty1.typeProperty == 1 && tmpProperty2.typeProperty == 1) {
                return new Property(0, 1, null, null, null);
            } else {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Cannot transform type.");
                //return new Property(-1, -1, null, null, null);
            }
        } else {
            return visit(ctx.logical_NotEqual_expression());
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_NotEqual_expression(MFChenParser.Logical_NotEqual_expressionContext ctx) {
        if (ctx.logical_Equal_expression() == null) {
            Property tmpProperty1, tmpProperty2;
            tmpProperty1 = visit(ctx.logical_NotEqual_expression(0));
            tmpProperty2 = visit(ctx.logical_NotEqual_expression(1));
            if (tmpProperty1.typeProperty != 4 && tmpProperty1.typeProperty == tmpProperty2.typeProperty) {
                return new Property(0, 3, null, null, null);
            } else {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Cannot transform type.");
                //return new Property(-1, -1, null, null, null);
            }
        } else {
            return visit(ctx.logical_Equal_expression());
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_Equal_expression(MFChenParser.Logical_Equal_expressionContext ctx) {
        if (ctx.logical_LessEqual_expression() == null) {
            Property tmpProperty1, tmpProperty2;
            tmpProperty1 = visit(ctx.logical_Equal_expression(0));
            tmpProperty2 = visit(ctx.logical_Equal_expression(1));
            if (tmpProperty1.typeProperty == 4) {
                String type2 = getTypeString(tmpProperty2.typeProperty);
                if (canBeNull(type2)) {
                    return new Property(0, 3, null, null, null);
                } else {
                    int line = ctx.getStart().getLine();
                    throw new RuntimeException("Compilation error " + line + ": Cannot transform type.");
                }
            }
            if (tmpProperty2.typeProperty == 4) {
                String type1 = getTypeString(tmpProperty1.typeProperty);
                if (canBeNull(type1)) {
                    return new Property(0, 3, null, null, null);
                } else {
                    int line = ctx.getStart().getLine();
                    throw new RuntimeException("Compilation error " + line + ": Cannot transform type.");
                }
            }
            if (tmpProperty1.typeProperty == tmpProperty2.typeProperty) {
                return new Property(0, 3, null, null, null);
            } else {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Cannot transform type.");
                //return new Property(-1, -1, null, null, null);
            }
        } else {
            return visit(ctx.logical_LessEqual_expression());
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_LessEqual_expression(MFChenParser.Logical_LessEqual_expressionContext ctx) {
        if (ctx.logical_Less_expression() == null) {
            Property tmpProperty1, tmpProperty2;
            tmpProperty1 = visit(ctx.logical_LessEqual_expression(0));
            tmpProperty2 = visit(ctx.logical_LessEqual_expression(1));
            if (tmpProperty1.typeProperty <= 2 && tmpProperty1.typeProperty == tmpProperty2.typeProperty) {
                return new Property(0, 3, null, null, null);
            } else {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Cannot transform type.");
                //return new Property(-1, -1, null, null, null);
            }
        } else {
            return visit(ctx.logical_Less_expression());
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_Less_expression(MFChenParser.Logical_Less_expressionContext ctx) {
        if (ctx.logical_GreaterEqual_expression() == null) {
            Property tmpProperty1, tmpProperty2;
            tmpProperty1 = visit(ctx.logical_Less_expression(0));
            tmpProperty2 = visit(ctx.logical_Less_expression(1));
            if (tmpProperty1.typeProperty <= 2 && tmpProperty1.typeProperty == tmpProperty2.typeProperty) {
                return new Property(0, 3, null, null, null);
            } else {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Cannot transform type.");
                //return new Property(-1, -1, null, null, null);
            }
        } else {
            return visit(ctx.logical_GreaterEqual_expression());
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_GreaterEqual_expression(MFChenParser.Logical_GreaterEqual_expressionContext ctx) {
        if (ctx.logical_Greater_expression() == null) {
            Property tmpProperty1, tmpProperty2;
            tmpProperty1 = visit(ctx.logical_GreaterEqual_expression(0));
            tmpProperty2 = visit(ctx.logical_GreaterEqual_expression(1));
            if (tmpProperty1.typeProperty <= 2 && tmpProperty1.typeProperty == tmpProperty2.typeProperty) {
                return new Property(0, 3, null, null, null);
            } else {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Cannot transform type.");
                //return new Property(-1, -1, null, null, null);
            }
        } else {
            return visit(ctx.logical_Greater_expression());
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_Greater_expression(MFChenParser.Logical_Greater_expressionContext ctx) {
        if (ctx.logical_RightShift_expression() == null) {
            Property tmpProperty1, tmpProperty2;
            tmpProperty1 = visit(ctx.logical_Greater_expression(0));
            tmpProperty2 = visit(ctx.logical_Greater_expression(1));
            if (tmpProperty1.typeProperty <= 2 && tmpProperty1.typeProperty == tmpProperty2.typeProperty) {
                return new Property(0, 3, null, null, null);
            } else {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Cannot transform type.");
                //return new Property(-1, -1, null, null, null);
            }
        } else {
            return visit(ctx.logical_RightShift_expression());
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_RightShift_expression(MFChenParser.Logical_RightShift_expressionContext ctx) {
        if (ctx.logical_LeftShift_expression() == null) {
            Property tmpProperty1, tmpProperty2;
            tmpProperty1 = visit(ctx.logical_RightShift_expression(0));
            tmpProperty2 = visit(ctx.logical_RightShift_expression(1));
            if (tmpProperty1.typeProperty == 1 && tmpProperty2.typeProperty == 1) {
                return new Property(0, 1, null, null, null);
            } else {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Need to be Intger.");
                //return new Property(-1, -1, null, null, null);
            }
        } else {
            return visit(ctx.logical_LeftShift_expression());
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitLogical_LeftShift_expression(MFChenParser.Logical_LeftShift_expressionContext ctx) {
        /*
        if (ctx.minus_expression() == null) {
            Property tmpProperty1, tmpProperty2;
            tmpProperty1 = visit(ctx.logical_LeftShift_expression(0));
            tmpProperty2 = visit(ctx.logical_LeftShift_expression(1));
            if (tmpProperty1.typeProperty == 1 && tmpProperty2.typeProperty == 1) {
                return new Property(0, 1, null, null, null);
            } else {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Need to be Intger.");
                //return new Property(-1, -1, null, null, null);
            }
        } else
        */
        {
            return visit(ctx.minus_expression());
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitMinus_expression(MFChenParser.Minus_expressionContext ctx) {
        if (ctx.plus_expression() == null) {
            Property tmpProperty1, tmpProperty2;
            tmpProperty1 = visit(ctx.minus_expression(0));
            tmpProperty2 = visit(ctx.minus_expression(1));
            if ((tmpProperty1.typeProperty == 1 && tmpProperty2.typeProperty == 1) ||
                    (tmpProperty1.typeProperty == 2 && tmpProperty2.typeProperty == 2)) {
                return new Property(0, tmpProperty1.typeProperty, null, null, null);
            } else {
                //System.out.println(tmpProperty1.typeProperty + " " + tmpProperty2.typeProperty + " " + ctx.minus_expression(0).getText());
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Need to be Integer.");
                //return new Property(-1, -1, null, null, null);
            }
        } else {
            return visit(ctx.plus_expression());
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitPlus_expression(MFChenParser.Plus_expressionContext ctx) {
        /*
        if (ctx.multiply_expression() == null) {
            Property tmpProperty1, tmpProperty2;
            tmpProperty1 = visit(ctx.plus_expression(0));
            tmpProperty2 = visit(ctx.plus_expression(1));
           // System.out.println(tmpProperty1.typeProperty);
            if (tmpProperty1.typeProperty <= 2 && tmpProperty2.typeProperty == tmpProperty1.typeProperty) {
                return new Property(0, tmpProperty1.typeProperty, null, null, null);
            } else {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Need to be Integer or String.");
                //return new Property(-1, -1, null, null, null);
            }
        } else
        */
        {
            return visit(ctx.multiply_expression());
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitMod_expression(MFChenParser.Mod_expressionContext ctx) {
        /*
        if (ctx.creation_expression() == null) {
            Property tmpProperty1, tmpProperty2;
            tmpProperty1 = visit(ctx.mod_expression(0));
            tmpProperty2 = visit(ctx.mod_expression(1));
            if (tmpProperty1.typeProperty == 1 && tmpProperty2.typeProperty == 1) {
                return new Property(0, 1, null, null, null);
            } else {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Need to be Intger.");
                //return new Property(-1, -1, null, null, null);
            }
        } else
        */
        {
            return visit(ctx.creation_expression());
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitMultiply_expression(MFChenParser.Multiply_expressionContext ctx) {
        if (ctx.divide_expression() == null) {
            Property tmpProperty1, tmpProperty2;
            tmpProperty1 = visit(ctx.multiply_expression(0));
            tmpProperty2 = visit(ctx.multiply_expression(1));
            if (tmpProperty1.typeProperty == 1 && tmpProperty2.typeProperty == 1) {
                return new Property(0, 1, null, null, null);
            } else {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Need to be Integer.");
                //return new Property(-1, -1, null, null, null);
            }
        } else {
            return visit(ctx.divide_expression());
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitDivide_expression(MFChenParser.Divide_expressionContext ctx) {
        /*
        if (ctx.mod_expression() == null) {
            Property tmpProperty1, tmpProperty2;
            tmpProperty1 = visit(ctx.divide_expression(0));
            tmpProperty2 = visit(ctx.divide_expression(1));
            if (tmpProperty1.typeProperty == 1 && tmpProperty2.typeProperty == 1) {
                return new Property(0, 1, null, null, null);
            } else {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Need to be Intger.");
                //return new Property(-1, -1, null, null, null);
            }
        }
        else
        */
        {
            return visit(ctx.mod_expression());
        }

    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitCreation_expression(MFChenParser.Creation_expressionContext ctx) {
        if (ctx.unary_expression() == null) {
            //visit(ctx.typeSpecifier());
            String tmpType = ctx.typeSpecifier().getText();
            if (nameType.containsKey(tmpType) == false) {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Undefined type.");
                //return new Property(-1, -1, null, null, null);
            } else {
                Property property = visit(ctx.dim_expression());
                String nowType = tmpType;
                int size = 0;
                if (property != null) {
                    size = property.typeProperty;
                }
                for (int i = 0; i < size; i++) {
                    nowType += "[]";
                }
                if (nameType.containsKey(nowType) == false) {
                    int line = ctx.getStart().getLine();
                    throw new RuntimeException("Compilation error " + line + ": dimension fault.");
                    //return new Property(-1, -1, null, null, null);
                } else {
                    return new Property(0, nameType.get(nowType), null, null, null);
                }
            }
        } else {
            return visit(ctx.unary_expression());
        }
    }



    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */

    @Override public Property visitParen_expression(MFChenParser.Paren_expressionContext ctx) {
        return visit(ctx.expression());
    }

    @Override public Property visitUnary_expression(MFChenParser.Unary_expressionContext ctx) {
        if (ctx.paren_expression() != null) {
            return visit(ctx.paren_expression());
        } else if (ctx.Dot() != null) {
            String idName = ctx.Identifier().getText();
            Property property = visit(ctx.unary_expression());
            Property dimProperty = visit(ctx.dim_expression());
            //System.out.println(nameType);
            //System.out.println(ctx.getText() + " " + property.typeProperty);
            String typeName = getTypeString(property.typeProperty);
            if (typeName.contains("[")) {
                if (idName.equals("size")) {
                    if (ctx.L_Paren() == null && dimProperty.typeProperty == 0) {
                        int line =ctx.getStart().getLine();
                        throw new RuntimeException("Compilation error " + line + ": Not a left-value");
                    } else {
                        if (ctx.call_parameter_list() == null) {
                            return new Property(0, 1, null, null, null);
                        } else {
                            int line =ctx.getStart().getLine();
                            throw new RuntimeException("Compilation error " + line + ": Not a left-value");
                        }
                    }
                } else {
                    int line =ctx.getStart().getLine();
                    throw new RuntimeException("Compilation error " + line + ": Dot wrong");
                }
            } else {
                if (property.typeProperty > 4) {
                    Pair<Integer, Property> classPair = (Pair<Integer, Property>)Symbol_Table.get(Symbol.symbol(typeName));
                    Property classProperty = null;
                    if (classPair != null) {
                        classProperty = classPair.b;
                    }
                    if (classProperty == null) {
                        int line =ctx.getStart().getLine();
                        throw new RuntimeException("Compilation error " + line + ": Undefined Class");
                    } else {
                        if (classProperty.classinfo.get(idName) == null) {
                            int line =ctx.getStart().getLine();
                            throw new RuntimeException("Compilation error " + line + ": No this item");
                        } else {
                            String itemType = getTypeString(classProperty.classinfo.get(idName));
                            int size = 0;
                            for (int i = 0; i < itemType.length(); i++) {
                                if (itemType.charAt(i) == '[') {
                                    size++;
                                }
                            }
                            if (size < dimProperty.typeProperty) {
                                int line =ctx.getStart().getLine();
                                throw new RuntimeException("Compilation error " + line + ": Dimension wrong");
                            } else {
                                if (ctx.L_Paren() != null) {
                                    int line =ctx.getStart().getLine();
                                    throw new RuntimeException("Compilation error " + line + ": Dot wrong");
                                } else {
                                    String retType = itemType;
                                    //System.out.println("!! " + ctx.dim_expression().getText());
                                    //System.out.println("! " + ctx.getText() + " " + dimProperty.typeProperty);
                                    for (int i = 0; i < dimProperty.typeProperty; i++) {
                                        retType = retType.substring(0, retType.length() - 2);
                                    }
                                    if (nameType.get(retType) == null) {
                                        nameType.put(retType, nameType.size() + 1);
                                    }
                                    return new Property(3, nameType.get(retType), null, null, null);
                                }
                            }
                        }
                    }
                } else if (property.typeProperty == 2) {
                    if (dimProperty.typeProperty != 0 || ctx.L_Paren() == null) {
                        int line =ctx.getStart().getLine();
                        throw new RuntimeException("Compilation error " + line + ": Dot wrong");
                    } else {
                        if (ctx.call_parameter_list() == null) {
                            if (idName.equals("length") || idName.equals("parseInt")) {
                                return new Property(0, 1, null, null, null);
                            } else {
                                int line =ctx.getStart().getLine();
                                throw new RuntimeException("Compilation error " + line + ": Dot wrong");
                            }
                        } else {
                            Property paraProperty = visit(ctx.call_parameter_list());
                            if (idName.equals("ord")) {
                                if (paraProperty.typeProperty == 1) {
                                    if (paraProperty.funcinfo.get(0) != 1) {
                                        int line =ctx.getStart().getLine();
                                        throw new RuntimeException("Compilation error " + line + ": Parameter wrong");
                                    }
                                    return new Property(0, 1, null, null, null);
                                } else {
                                    int line =ctx.getStart().getLine();
                                    throw new RuntimeException("Compilation error " + line + ":Parameter wrong");
                                }
                            } else if (idName.equals("substring")) {
                                if (paraProperty.typeProperty == 2) {
                                    for (int i = 0; i < 2; i++){
                                        if (paraProperty.funcinfo.get(i) != 1) {
                                            int line =ctx.getStart().getLine();
                                            throw new RuntimeException("Compilation error " + line + ": Not a left-value");
                                        }
                                    }
                                    return new Property(0, 2, null, null, null);
                                } else {
                                    int line =ctx.getStart().getLine();
                                    throw new RuntimeException("Compilation error " + line + ": Parameter wrong");
                                }
                            } else {
                                int line =ctx.getStart().getLine();
                                throw new RuntimeException("Compilation error " + line + ": Dot wrong");
                            }
                        }
                    }
                } else {
                    int line =ctx.getStart().getLine();
                    throw new RuntimeException("Compilation error " + line + ": Dot wrong");
                }
            }
        } else if (ctx.PlusPlus() != null) {
            Property property = visit(ctx.unary_expression());
            if (property.typeProperty == 1 && property.kind == 3) {
                return new Property(0, 1, null, null, null);
            } else {
                if (property.typeProperty == 1) {
                    int line =ctx.getStart().getLine();
                    //System.out.println("! " + ctx.getText());
                    throw new RuntimeException("Compilation error " + line + ": Not a left-value");
                    //return new Property();
                } else {
                    int line = ctx.getStart().getLine();
                    throw new RuntimeException("Compilation error " + line + ": Need to be Integer.");
                    //return new Property();
                }
            }
        } else if (ctx.Minus() != null) {
            Property property = visit(ctx.unary_expression());
            if (property.typeProperty == 1) {
                return new Property(0, 1, null, null, null);
            } else {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Need to be Integer.");
                //return new Property();
            }
        } else if (ctx.Not() != null) {
            Property property = visit(ctx.unary_expression());
            if (property.typeProperty == 3) {
                return new Property(0, 3, null, null, null);
            } else {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Need to be Boolean.");
                //return new Property();
            }
        } else if (ctx.Tilde() != null) {
            Property property = visit(ctx.unary_expression());
            if (property.typeProperty == 1) {
                return new Property(0, 1, null, null, null);
            } else {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Need to be Boolean.");
                //return new Property();
            }
        } else if (ctx.call_expression() != null) {
            Property property = visit(ctx.call_expression());
            Property dimProperty = visit(ctx.dim_expression());
            if (dimProperty.typeProperty == 0) {
                return property;
            } else {
                int size = 0;
                String funcType = getTypeString(property.typeProperty);
                for (int i = 0; i < funcType.length(); i++) {
                    if (funcType.charAt(i) == '[') {
                        size++;
                    }
                }
                if (size >= dimProperty.typeProperty) {
                    int delta = dimProperty.typeProperty - size;
                    String oldType = getOriginalType(getTypeString(property.typeProperty));
                    String newType = oldType;
                    for (int i = 0; i < delta; i++) {
                        newType += "[]";
                    }
                    if (nameType.get(newType) == null) {
                        nameType.put(newType, nameType.size() + 1);
                    }
                    return new Property(3, nameType.get(newType), null, null, null);
                } else {
                    int line = ctx.getStart().getLine();
                    throw new RuntimeException("Compilation error " + line + ": dimension Wrong.");
                    //return new Property();
                }
            }
        } else if (ctx.constant_expression() != null) {
            return visit(ctx.constant_expression());
        } else {
            String idName = ctx.Identifier().getText();
            if (ctx.dim_expression().getText().isEmpty() == false) {
                Property dimProperty = visit(ctx.dim_expression());
                //System.out.println("! " + idName + " " + ctx.getText());
                Pair<Integer, Property> idPair = (Pair<Integer, Property>)Symbol_Table.get(Symbol.symbol(idName));
                Property property = null;
                if (idPair != null) {
                    property = idPair.b;
                }
                if (property == null) {
                    int line = ctx.getStart().getLine();
                    throw new RuntimeException("Compilation error " + line + ": Undefined Identifier.");
                    //return new Property();
                } else {
                    int size = 0;
                    String idType = getTypeString(property.typeProperty);
                    for (int i = 0; i < idType.length(); i++) {
                        if (idType.charAt(i) == '[') {
                            size++;
                        }
                    }
                    //System.out.println(dimProperty.typeProperty);
                    if (dimProperty.typeProperty <= size) {
                        int delta = size - dimProperty.typeProperty;
                        String oldType = getOriginalType(idType);
                        String newType = oldType;
                        for (int i = 0; i < delta; i++) {
                            newType += "[]";
                        }
                        if (nameType.get(newType) == null) {
                            nameType.put(newType, nameType.size() + 1);
                        }
                        return new Property(3, nameType.get(newType), null, null, null);
                    } else {
                        int line = ctx.getStart().getLine();
                        throw new RuntimeException("Compilation error " + line + ": Dimension wrong.");
                        //return new Property();
                        /*
                        if (property == null) {
                            int line = ctx.getStart().getLine();
                            throw new RuntimeException("Compilation error " + line + ": Dimension wrong.");
                            return new Property();
                        } else {
                            return property;
                        }
                        */
                    }
                }
            } else {
              //  System.out.println(idName);
                Pair<Integer, Property> idPair = (Pair<Integer, Property>)Symbol_Table.get(Symbol.symbol(idName));
                Property property = null;
                if (idPair != null) {
                    property = idPair.b;
                }
                if (property == null) {
                    int line = ctx.getStart().getLine();
                    throw new RuntimeException("Compilation error " + line + ": Undefined Identifier.");
                    //return new Property();
                } else {
                    property.kind = 3;
                    return property;
                }
            }
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitDim_list(MFChenParser.Dim_listContext ctx) {
        if (ctx.IntLiteral() != null) {
            return new Property();
        } else {
            Property property = visit(ctx.expression());
            if (property.typeProperty > 4) {
                String oldType = "";
                Set<String> allType = nameType.keySet();
                for (String iType : allType) {
                    if (nameType.get(iType) == property.typeProperty) {
                        oldType = iType;
                        break;
                    }
                }
                if (oldType.indexOf('[') != -1) {
                    String newType = oldType.substring(0, oldType.indexOf('['));
                    if (nameType.get(newType) != 1) {
                        int line = ctx.getStart().getLine();
                        throw new RuntimeException("Compilation error " + line + ": Dimension expression should be Integer.");
                        //return new Property();
                    } else {
                        return new Property();
                    }
                } else {
                    int line = ctx.getStart().getLine();
                    throw new RuntimeException("Compilation error " + line + ": Dimension expression should be Integer.");
                    //return new Property();
                }
            } else if (property.typeProperty != 1) {
                int line = ctx.getStart().getLine();
                throw new RuntimeException("Compilation error " + line + ": Dimension expression should be Integer.");
                //return new Property();
            } else {
                return new Property();
            }
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitDim_expression(MFChenParser.Dim_expressionContext ctx) {
        int size = ctx.dim_list().size();
        for (int i = 0; i < size; i++){
            visit(ctx.dim_list(i));
        }
        return new Property(0, ctx.L_Bracket().size(), null, null, null);
        //    return visitChildren(ctx);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitCall_parameter_list(MFChenParser.Call_parameter_listContext ctx) {
        int size = ctx.expression().size();
        ArrayList<Integer> typeArray = new ArrayList();
        for (int i = 0; i < size; i++){
            Property property = visit(ctx.expression(i));
            typeArray.add(property.typeProperty);
        }
        return new Property(2, size, null, typeArray, null);
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitCall_expression(MFChenParser.Call_expressionContext ctx) {
      //  System.out.println("!! " + ((Property)Symbol_Table.get(Symbol.symbol("print"))).funcinfo);
        //System.out.println(ctx.getText());
            String funcName = ctx.Identifier().getText();
            //System.out.println(funcName);
            Pair<Integer, Property> pairFunc = (Pair<Integer, Property>)Symbol_Table.get(Symbol.symbol(funcName));
            Property funcProperty = null;
            if (pairFunc != null) {
                funcProperty = pairFunc.b;
            }
            //System.out.println(funcProperty.funcinfo);
            if (funcProperty == null) {
                int line = ctx.getStart().getLine();
              //  System.out.println(ctx.getText());
                throw new RuntimeException("Compilation error " + line + ": Undefined function name.");
                //return new Property();
            } else {
                if (funcProperty.kind != 2) {
                    int line = ctx.getStart().getLine();
                   //System.out.println(funcName + "!");
                    throw new RuntimeException("Compilation error " + line + ": Undefined function name.");
                    //return new Property();
                }
                if (ctx.call_parameter_list() == null) {
                    if (funcProperty.funcinfo == null) {
                        return new Property(0, funcProperty.typeProperty, null, null, null);
                    } else {
                        int line = ctx.getStart().getLine();
                        throw new RuntimeException("Compilation error " + line + ": parameter list should be empty.");
                        //return new Property();
                    }
                } else {
                    //System.out.println(ctx.call_parameter_list().getText() + " " );
                    Property paraProperty = visit(ctx.call_parameter_list());

                    //System.out.println(funcName);

                    //System.out.println(paraProperty.funcinfo);
                    //System.out.println(funcProperty.funcinfo);
                    if ((paraProperty == null && funcProperty.funcinfo.size() != 0) || paraProperty.funcinfo.size() != funcProperty.funcinfo.size()) {
                        int line = ctx.getStart().getLine();
                        throw new RuntimeException("Compilation error " + line + ": number of parameter is not equal.");
                        //return new Property();
                    } else {
                        //System.out.println(ctx.call_parameter_list().getText() + " " );
                        int size = paraProperty.funcinfo.size();
                        for (int i = 0; i < size; i++){
                         //   System.out.println(funcName + " " + paraProperty.funcinfo.get(i) + " " + funcProperty.funcinfo.get(i));
                            if (paraProperty.funcinfo.get(i) != funcProperty.funcinfo.get(i)) {
                                int line = ctx.getStart().getLine();
                                throw new RuntimeException("Compilation error " + line + ": the type of " + i + "parameter is wrong.");
                                //return new Property();
                            }
                        }
                        return new Property(0, funcProperty.typeProperty, null, paraProperty.funcinfo, null);
                    }
                }
            }
        /*
        else {
            if (ctx.L_Paren() != null) {
                if (ctx.StringLiteral() == null) {
                    String tmpID = ctx.Identifier(0).getText();
               //     System.out.println("! " + tmpID);
                    Pair<Integer, Property> idPair = (Pair<Integer, Property>)Symbol_Table.get(Symbol.symbol(tmpID));
                    Property idProperty = null;
                    if (idPair != null) {
                        idProperty = idPair.b;
                    }
                    if (idProperty == null) {
                        int line = ctx.getStart().getLine();
                        throw new RuntimeException("Compilation error " + line + ": undefined Identifier.");
                        //return new Property();
                    }
                    Property dimProperty = visit(ctx.dim_expression());
                    if (dimProperty.typeProperty == 0) {
                        int line = ctx.getStart().getLine();
                        throw new RuntimeException("Compilation error " + line + ": only arrayType has inner method.");
                        //return new Property();
                    } else {
                        String methodName = ctx.Identifier(1).getText();
                        if (methodName.equals("size")) {
                            if (ctx.L_Paren() == null) {
                                int line = ctx.getStart().getLine();
                                throw new RuntimeException("Compilation error " + line + ": wrong format");
                                //return new Property();
                            } else {
                                if (ctx.call_parameter_list() != null) {
                                    int line = ctx.getStart().getLine();
                                    throw new RuntimeException("Compilation error " + line + ": wrong parameter list format");
                                    //return new Property();
                                } else {
                                    return new Property(0, 1, null, null, null);
                                }
                            }
                        } else {
                            String oldType = getOriginalType(getTypeString(idProperty.typeProperty));
                            if (nameType.get(oldType) != 2) {
                                //System.out.println("! " + oldType);
                                int line = ctx.getStart().getLine();
                                //System.out.println(ctx.getText());
                                throw new RuntimeException("Compilation error " + line + ": no this inner method.");
                                //return new Property();
                            } else {
                                String funcName = ctx.Identifier(1).getText();
                                Property paraProperty = visit(ctx.call_parameter_list());
                                if (funcName.equals("length") || funcName.equals("parseInt")) {
                                    if (paraProperty == null) {
                                        return new Property(0, 1, null, null, null);
                                    } else {
                                        int line = ctx.getStart().getLine();
                                        throw new RuntimeException("Compilation error " + line + ": wrong parameter list format");
                                        //return new Property();
                                    }
                                } else if (funcName.equals("substring")) {
                                    if (paraProperty == null || paraProperty.funcinfo.size() != 2) {
                                        int line = ctx.getStart().getLine();
                                        throw new RuntimeException("Compilation error " + line + ": wrong parameter list format");
                                        //return new Property();
                                    } else {
                                        for (int i = 0; i < 2; i++) {
                                            if (paraProperty.funcinfo.get(i) != 1) {
                                                int line = ctx.getStart().getLine();
                                                throw new RuntimeException("Compilation error " + line + ": parameter should be integer.");
                                                //return new Property();
                                            }
                                        }
                                        return new Property(0, 2, null, null, null);
                                    }
                                } else if (funcName.equals("ord")) {
                                    if (paraProperty == null || paraProperty.funcinfo.size() != 1) {
                                        int line = ctx.getStart().getLine();
                                        throw new RuntimeException("Compilation error " + line + ": wrong parameter list format");
                                        //return new Property();
                                    } else {
                                        if (paraProperty.funcinfo.get(0) != 1) {
                                            int line = ctx.getStart().getLine();
                                            throw new RuntimeException("Compilation error " + line + ": wrong parameter list format");
                                            //return new Property();
                                        } else {
                                            return new Property(0, 1, null, null, null);
                                        }
                                    }
                                } else {
                                    int line = ctx.getStart().getLine();
                                    throw new RuntimeException("Compilation error " + line + ": wrong parameter list format");
                                    //return new Property();
                                }
                            }
                        }
                    }
                } else {
                    Property dimProperty = visit(ctx.dim_expression());
                    int size = dimProperty.typeProperty;
                    if (size > 0) {
                        int line = ctx.getStart().getLine();
                        throw new RuntimeException("Compilation error " + line + ": wrong array format");
                        //return new Property();
                    } else {
                        String funcName = ctx.Identifier(0).getText();
                        Property paraProperty = null;
                        if (ctx.call_parameter_list() != null) {
                            paraProperty = visit(ctx.call_parameter_list());
                        }
                        if (funcName.equals("parseInt") || funcName.equals("length")) {
                            if (paraProperty.funcinfo == null) {
                                return new Property(0, 1, null, null, null);
                            } else {
                                int line = ctx.getStart().getLine();
                                throw new RuntimeException("Compilation error " + line + ": parameter list is wrong.");
                                //return new Property();
                            }
                        } else if (funcName.equals("subnstring")) {
                            if (paraProperty.funcinfo == null || paraProperty.funcinfo.size() != 2) {
                                int line = ctx.getStart().getLine();
                                throw new RuntimeException("Compilation error " + line + ": number of parameter is wrong.");
                                //return new Property();
                            } else {
                                for (int i = 0; i < 2; i++) {
                                    if (paraProperty.funcinfo.get(i) != 1) {
                                        int line = ctx.getStart().getLine();
                                        throw new RuntimeException("Compilation error " + line + ": " + i + "th need to be Integer.");
                                        //return new Property();
                                    }
                                }
                                return new Property(0, 2, null, null, null);
                            }
                        } else if (funcName.equals("ord")) {
                            if (paraProperty.funcinfo.size() != 1) {
                                int line = ctx.getStart().getLine();
                                throw new RuntimeException("Compilation error " + line + ": number of parameter is wrong.");
                                //return new Property();
                            } else {
                                if (paraProperty.funcinfo.get(0) != 1) {
                                    int line = ctx.getStart().getLine();
                                    throw new RuntimeException("Compilation error " + line + "parameter should be integer.");
                                    //return new Property();
                                } else {
                                    return new Property(0, 1, null, null, null);
                                }
                            }
                        } else {
                            int line = ctx.getStart().getLine();
                            throw new RuntimeException("Compilation error " + line + ": undefined inner function");
                            //return new Property();
                        }
                    }
                }
            } else {
                if (ctx.StringLiteral() != null) {
                    int line = ctx.getStart().getLine();
                    throw new RuntimeException("Compilation error " + line + ": StringLiteral cannot be class name.");
                    //return new Property();
                } else {
                    int size = 0;
                    Property dimProperty = visit(ctx.dim_expression());
                    if (dimProperty != null) {
                        size = dimProperty.typeProperty;
                    }
                    String classID = ctx.Identifier(0).getText();
                    String classItem = ctx.Identifier(1).getText();
                    //System.out.println(classID + " " + classItem);
                    Pair<Integer, Property> pairId = (Pair<Integer, Property>)Symbol_Table.get(Symbol.symbol(classID));
                    Property idProperty = null;
                    if (pairId != null) {
                        idProperty = pairId.b;
                    }
                    if (idProperty == null) {
                        int line = ctx.getStart().getLine();
                        throw new RuntimeException("Compilation error " + line + ": undefined Identifier.");
                        //return new Property();
                    } else {
                        String className = getTypeString(idProperty.typeProperty);
                        int parenSize = 0;
                        for (int i = 0; i < className.length(); i++) {
                            if (className.charAt(i) == '['){
                                parenSize++;
                            }
                        }
                        if (parenSize != dimProperty.typeProperty) {
                            int line = ctx.getStart().getLine();
                            throw new RuntimeException("Compilation error " + line + ": dimension fault.");
                            //return new Property();
                        }
                        int pos = className.indexOf('[');
                        if (pos != -1) {
                            className = className.substring(0, pos);
                        }
                        Pair<Integer, Property> pairClass = (Pair<Integer, Property>)Symbol_Table.get(Symbol.symbol(className));
                        Property classProperty = null;
                        if (pairClass != null) {
                            classProperty = pairClass.b;
                        }
                        if (classProperty == null) {
                        //(classID + " " + classItem);
                            return new Property();
                        } else {
                            if (classProperty.classinfo.get(classItem) == null) {
                                int line = ctx.getStart().getLine();
                                throw new RuntimeException("Compilation error " + line + ": Undefined class Item.");
                                //return new Property();
                            } else {
                                return new Property(3, classProperty.classinfo.get(classItem), null, null, null);
                            }
                        }
                    }
                }
            }
        }
        */
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Property visitConstant_expression(MFChenParser.Constant_expressionContext ctx) {
        if (ctx.Null() != null) {
            return new Property(0, 4, null, null, null);
        } else if (ctx.IntLiteral() != null) {
            return new Property(0, 1, null, null, null);
        } else if (ctx.StringLiteral() != null) {
            return new Property(0, 2, null, null, null);
        } else if (ctx.LogicalConstant() != null) {
            return new Property(0, 3, null, null, null);
        }
        return new Property();
    }
}
