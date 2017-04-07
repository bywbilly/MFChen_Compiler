// Generated from MFChen.g4 by ANTLR 4.5.2
package MFChen.IR;

import MFChen.Environment.Property;
import MFChen.MIPS.mipsInstruction;
import MFChen.Symbol.Symbol;
import MFChen.Symbol.Table;
import MFChen.parser.MFChenParser;
import MFChen.parser.MFChenVisitor;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.misc.Pair;
import org.antlr.v4.runtime.tree.AbstractParseTreeVisitor;

import java.util.ArrayList;
import java.util.HashMap;

import static java.lang.Integer.max;
import static java.lang.Math.min;

/**
 * This class provides an empty implementation of {@link MFChenVisitor},
 * which can be extended to create a visitor which only needs to handle a subset
 * of the available methods.
 *
 * operations with no return type.
 */
public class naiveILOC extends AbstractParseTreeVisitor<Object> implements MFChenVisitor<Object> {


    public Table Symbol_Table;
    public Table R_Symbol_Table = new Table();
    public HashMap<String, Integer> nameType;
    public ArrayList<Instruction>  InstructionList = new ArrayList<>();
    public ArrayList<mipsInstruction> mipsInstructionList = new ArrayList<>();

    public HashMap<String, Integer> funcLabel = new HashMap<>();

    public int funcNum = -1;
    public int staticStringNum = -1;
    public int preIterationJumpNumber = 0;
    public int maxOFFSET = 0;
    public int nowFunctionNumber = 0;
    public int mfc = 0;
    public ArrayList<Integer> offset = new ArrayList<>();


    public HashMap<String, Integer> functionTable = new HashMap<>();
    public HashMap<String, Integer> registerTable = new HashMap<>();
    public HashMap<String, String > idClassTable  = new HashMap<>();

    public ArrayList<String> globalRegister = new ArrayList<>();
    public ArrayList<String> isStringPointer = new ArrayList<>();

    public HashMap<String, String> statStringTable = new HashMap<>();
    public HashMap<String, String> plusplusDep = new HashMap<>();

    public int labelNumber = 0;
    // 0~3 for a0 ~ a3
    // 4~5 for v0 ~ v1
    // 6 fp
    // 7 sp
    // 8 ra
    public int registerNumber = 8;

    public int inFunction = 0;

    public vituralRegister a0 = new vituralRegister(0);
    public vituralRegister a1 = new vituralRegister(1);
    public vituralRegister a2 = new vituralRegister(2);
    public vituralRegister a3 = new vituralRegister(3);
    public vituralRegister v0 = new vituralRegister(4);
    public vituralRegister v1 = new vituralRegister(5);
    public vituralRegister fp = new vituralRegister(6);
    public vituralRegister sp = new vituralRegister(7);
    public vituralRegister ra = new vituralRegister(8);

    public int scope = 1;
    public void getEnvironment(Table _Symbol_Table, HashMap<String, Integer> _nameType) {
        Symbol_Table = _Symbol_Table;
        nameType = _nameType;
        R_Symbol_Table.beginScope();
    }


    public void print() {
        //System.out.println(R_Symbol_Table);
       // System.out.println(registerTable);
       // System.out.println(isStringPointer);
        /*
        while(true){
            boolean flag = false;
            for (int i = 0; i < InstructionList.size(); i++) {
                Instruction entry = InstructionList.get(i);
                if (entry.opCode.equals("i2i") && entry.source1.equals("r4")) {
                    Instruction nxtEntry = InstructionList.get(i + 1);
                    if (nxtEntry.opCode.equals("i2i") && (entry.target1.equals(nxtEntry.source1))) {
                        System.out.println(entry);
                        System.out.println(nxtEntry + "!!!! ");
                        entry.target1 = nxtEntry.target1;
                        flag = true;
                        InstructionList.remove(i + 1);
                        break;
                    }
                }
            }
            if (!flag) {
                break;
            }
        }
           */
        for (Instruction instr : InstructionList) {
            //System.out.println("wtf " + instr);
            if (instr.opCode.equals("Label")) {
                System.out.println(instr.source1 + " ");
            } else {
                System.out.println(instr);
            }
        }
    }

    //-1 for not constant
    // 0 for null
    // 1 for true | false
    // 2 for number
    // 3 for string literal

    public int isConstant(String x) {
        if (x == null) {
            return 0;
        }

        if (x.contains("\"")) {
            return 3;
        }

        if (x.contains(".")) {
            return -1;
        }

        if (x.equals("null")) {
            return 0;
        } else if (x.equals("true") || x.equals("false")) {
            return 1;
        } else {
            int flag = 1;
            for (int i = 0; i < x.length(); i++) {
                if ((x.charAt(i) < '0' || x.charAt(i) > '9') && x.charAt(i) != '-') {
                    flag = 0;
                    break;
                }
            }
            if (flag == 1) {
                return 2;
            } else {
                flag = 0;
                for (int i = 0; i < x.length(); i++) {
                    if ((x.charAt(i) >= '0' && x.charAt(i) <= '9')) {
                        flag = 1;
                        break;
                    }
                }
                if (flag == 1) {
                    return -1;
                } else {
                    return 3;
                }
            }
        }
    }

    public void initSymbol() {
        scope++;
        R_Symbol_Table.beginScope();
    }

    public void endSymbol() {
        scope--;
        R_Symbol_Table.endScope();
    }

    public void addLabel(Lable label) {
        Instruction instruction = new Instruction("Label", label.toString(), null, null, null);
        InstructionList.add(instruction);
    }

    public void addInstruction(String opCode, String s1, String s2, String t1, String t2) {
        Instruction instruction = new Instruction(opCode, s1, s2, t1, t2);
        InstructionList.add(instruction);
    }

    public boolean isBasicType(String tmpType) {
        if (tmpType.equals("int") || tmpType.equals("bool") || tmpType.equals("string")) {
            return true;
        } else {
            return false;
        }
    }

    public Integer parameterPos(Property funcProperty, String para) {
        for (int i = 0; i < funcProperty.funcinfo2.size(); i++) {
            if (funcProperty.funcinfo2.get(i).equals(para)) {
                return i;
            }
        }
        return -1;
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitProgram(MFChenParser.ProgramContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitClass_declaration(MFChenParser.Class_declarationContext ctx) { return visitChildren(ctx); }
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
    @Override public Object visitMember_declaration_list(MFChenParser.Member_declaration_listContext ctx) { return visitChildren(ctx); }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitFunc_declaration(MFChenParser.Func_declarationContext ctx) {
        inFunction++;
        initSymbol();

        if (ctx.parameter_list() != null) {
            visit(ctx.parameter_list());
        }
        String funcID = ctx.Identifier().getText();
        Lable FUNC = new Lable(++labelNumber, funcID);
        int nowNumber = labelNumber;
        //Lable lable2 = new Lable(labelNumber + 2);
        funcLabel.put(funcID, labelNumber);
        Pair<Integer, Property> funcPair = (Pair<Integer, Property>)Symbol_Table.get(Symbol.symbol(funcID));
        Property funcProperty = funcPair.b;
        int sz = 0;
        if (funcProperty.funcinfo != null) {
            sz = funcProperty.funcinfo.size();
        }

        if (funcProperty.funcinfo != null) {
            for (int i = 0; i < sz; i++) {
                int paraKind = funcProperty.funcinfo.get(i);
                if (paraKind == 2) {
                    isStringPointer.add("r" + i);
                }
            }
        }

       // System.out.println(funcID + " " + isStringPointer);

        if (funcID.equals("main")) {
            ++funcNum;
            offset.add(0);
        } else {
            ++funcNum;
            offset.add(-8 - max(0, 4 * (sz - 4)));
        }
        functionTable.put(funcID, funcNum);
        for (int i = 0; i < sz; i++) {
            String paraID = funcProperty.funcinfo2.get(i);
            if (i < 4) {
                R_Symbol_Table.put(Symbol.symbol(paraID), new Pair<>(scope, new vituralRegister(i)));
            } else {
                //TODO: Put INTO Stack Stuck
                vituralRegister tmpVR = new vituralRegister(++registerNumber);
                R_Symbol_Table.put(Symbol.symbol(paraID), new Pair<>(scope, tmpVR));
                if (registerTable.containsKey(tmpVR) == false) {
                    //System.out.println("!! " + tmpVR.toString() + " " + String.valueOf(-4 - (i - 3) * 4));
                    registerTable.put(tmpVR.toString(), -8 - (i - 4) * 4);
                } else {
                   // System.out.println("WTF " + "MFChen");
                }
            }
        }
        addLabel(FUNC);
        visit(ctx.block_statement());
        endSymbol();
        if (InstructionList.get(InstructionList.size() - 1).opCode.equals("jr") == false) {
            addInstruction("jr", ra.toString(), null, null, null);
        }
        inFunction--;
        if (funcProperty.funcinfo != null) {
            for (int i = 0; i < sz; i++) {
                int paraKind = funcProperty.funcinfo.get(i);
                if (paraKind == 2) {
                    isStringPointer.remove("r" + i);
                }
            }
        }
        return null;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitParameter_list(MFChenParser.Parameter_listContext ctx) {
        String typeID = ctx.typeSpecifier().getText();
        if (!isBasicType(typeID)) {
            idClassTable.put(ctx.Identifier().getText(), typeID);
        }
        if (ctx.Comma() != null) {
            visit(ctx.parameter_list());
        }
        return null;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitBlock_statement(MFChenParser.Block_statementContext ctx) {
        if (ctx.statement_list() == null) {
            return null;
        } else {
            return visit(ctx.statement_list());
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitStatement_list(MFChenParser.Statement_listContext ctx) {
        if (ctx.statement_list() == null) {
            return visit(ctx.statement());
        } else {
            visit(ctx.statement());
            visit(ctx.statement_list());
            return null;
        }
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

    public void update(String VR) {
        //System.out.println(VR);
        if (inFunction == 0) {
            if (VR.contains("r") == false) {
                return;
            }
            if (registerTable.containsKey(VR) == false && globalRegister.contains(VR) == false) {
                globalRegister.add(VR);
            }
            return;
        }
        //if (registerTable.containsKey(VR) == false)
        //System.out.println(VR + "!!");
        if (VR.contains("r") && registerTable.containsKey(VR) == false){
            registerTable.put(VR, offset.get(funcNum));
            int tmpOffset = offset.get(funcNum);
            maxOFFSET = max(maxOFFSET, -tmpOffset);
            offset.remove(funcNum);
            offset.add(tmpOffset - 4);
        }
    }

    public String getOriginType(String nowType) {
        int pos = nowType.indexOf("[");
        if (pos == -1) {
            pos = nowType.length();
        }
        return nowType.substring(0, pos);
    }

    @Override public Object visitVar_decl_stmt(MFChenParser.Var_decl_stmtContext ctx) {
        //System.out.println(inFunction + " " + ctx.getText());
        if (inFunction == 0) {
            addInstruction("beginGlobal", null, null, null, null);
        }
        String idType = ctx.typeSpecifier().getText();
        String id     = ctx.Identifier().getText();
        vituralRegister tmpVR = new vituralRegister(++registerNumber);
        //idRegister.put(new Pair<>(scope, id), tmpVR);
        R_Symbol_Table.put(Symbol.symbol(id), new Pair<>(scope, tmpVR));
        //System.out.println(tmpVR.toString());
        update(tmpVR.toString());
        if (idType.equals("string")) {
            isStringPointer.add(tmpVR.toString());
        }
        /*
        if (ctx.expression() != null)
            System.out.println("shit" + " " + ctx.expression().getText());
        */
        if (ctx.Assign() == null) {
            if (isBasicType(idType)) {

                //return null;
            } else {
                //System.out.println(nameType);
                idClassTable.put(id, getOriginType(idType));
                //return null;
            }
        } else {
            if (isBasicType(idType)) {

                String initValue = (String)visit(ctx.expression());
                update(initValue);
                if (isStringPointer.contains(initValue)) {
                    isStringPointer.add(tmpVR.toString());
                }
                //System.out.println(initValue);
                int initKind = isConstant(initValue);
                if (initKind == -1) {
                    Instruction instruction = new Instruction("i2i", initValue, null, tmpVR.toString(), null);
                    InstructionList.add(instruction);
                    //return null;
                } else if (initKind == 0) {
                    throw new RuntimeException("wtf on var_basicType_null");
                    //return null;
                } else if (initKind == 1) {
                    Instruction instruction = new Instruction("loadI", initValue, null, tmpVR.toString(), null);
                    InstructionList.add(instruction);
                    //return null;
                } else if (initKind == 2) {
                    Instruction instruction = new Instruction("loadI", initValue, null, tmpVR.toString(), null);
                    InstructionList.add(instruction);
                    //return null;
                } else {
                    int sz = 4 + initValue.length() - 2;
                    addInstruction("sbrk", String.valueOf(sz + 1), null, null, null);
                    addInstruction("i2i", v0.toString(), null, tmpVR.toString(), null);
                    addInstruction("storeI", String.valueOf(initValue.length() - 2), null, v0.toString(), String.valueOf(0));
                    vituralRegister tmpVR1 = new vituralRegister(++registerNumber);
                    update(tmpVR1.toString());
                    int offset1 = 4;
                    for (int i = 1; i < initValue.length() - 1; i++) {
                        int ascallNumber = 0;
                        if (initValue.charAt(i) == '\\') {
                            i++;
                            if (initValue.charAt(i) == '\\') {
                                ascallNumber = '\\';
                            } else if (initValue.charAt(i) == '\"') {
                                ascallNumber = '\"';
                            } else if (initValue.charAt(i) == 'n')  {
                                ascallNumber = '\n';
                            }
                        } else {
                            ascallNumber = initValue.charAt(i);
                        }
                        addInstruction("loadI", String.valueOf(ascallNumber), null, tmpVR1.toString(), null);
                        addInstruction("sb", tmpVR1.toString(), null, String.valueOf(offset1), v0.toString());
                        offset1++;
                    }
                    addInstruction("loadI", String.valueOf(0), null, tmpVR1.toString(), null);
                    addInstruction("sb", tmpVR1.toString(), null, String.valueOf(offset1), v0.toString());
                    //return null;
                }
            } else {
               // System.out.println(id + " " + getOriginType(idType));
                idClassTable.put(id, getOriginType(idType));
                String initValue = (String)visit(ctx.expression());
                //System.out.println(ctx.expression().getText());
                if (isStringPointer.contains(initValue)) {
                    isStringPointer.add(tmpVR.toString());
                }
                update(initValue);
                int kind = isConstant(initValue);
                if (kind == -1) {
                    addInstruction("i2i", initValue.toString(), null, tmpVR.toString(), null);
                } else {
                    addInstruction("loadI", initValue.toString(), null, tmpVR.toString(), null);
                }
                //return null;
            }
        }
        if (inFunction == 0) {
            addInstruction("endGlobal", null, null, null, null);
        }
        return null;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitStatement(MFChenParser.StatementContext ctx) {
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
        } else return null;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitJump_statement(MFChenParser.Jump_statementContext ctx) {
        if (ctx.Return() == null) {
            int offset = 0;
            ParserRuleContext curCtx = ctx;

            ParserRuleContext loop = new MFChenParser.Iteration_statementContext(ctx, -1);
            ParserRuleContext selc = new MFChenParser.Selection_statementContext(ctx, -1);

            boolean flag = false;
            while(curCtx.depth() != 1) {
                if (curCtx.getRuleIndex() == loop.getRuleIndex()) {
                    if (curCtx.getText().substring(0, 5).equals("while")) {
                        flag = true;
                    }
                    break;
                } else if (curCtx.getRuleIndex() == selc.getRuleIndex()) {
                    offset += 3;
                }
                curCtx = curCtx.getParent();
            }
            if (ctx.Break() != null) {
                addInstruction("jump", (new Lable(preIterationJumpNumber, "if_false")).toString(), null, null, null);
            } else {
                //addLabel(new Lable(labelNumber - offset, "jump"));
                addInstruction("jump", (new Lable(preIterationJumpNumber + 1, "jump")).toString(), null, null, null);
            }
        } else {
            if (ctx.expression() != null) {
                String retVR = (String)visit(ctx.expression());
                update(retVR);
                int kind = isConstant(retVR);
                if (kind == -1) {
                    addInstruction("i2i", retVR.toString(), null, v0.toString(), null);
                } else if (kind != 3){
                    //System.out.println(ctx.getText());
                    addInstruction("loadI", retVR.toString(), null, v0.toString(), null);
                } else {
                   // System.out.println(ctx.getText() + " !");
                    ++staticStringNum;
                    String ret = retVR;
                    if (statStringTable.containsKey(ret.substring(1, ret.length() - 1)) == false) {
                        addInstruction("setStaticString", "s" + String.valueOf(staticStringNum), ret, null, null);
                        statStringTable.put(ret.substring(1, ret.length() - 1), String.valueOf(staticStringNum));
                    }
                    vituralRegister tmpVR = new vituralRegister(++registerNumber);
                    update(tmpVR.toString());
                    addInstruction("la", tmpVR.toString(), null, "s" + String.valueOf(staticStringNum), null);
                    addInstruction("i2i", tmpVR.toString(), null, v0.toString(), null);
                }
            }
            addInstruction("jr", ra.toString(), null, null, null);
            //addInstruction("jr" + " " + ctx.getText() , ra.toString(), null, null, null);
            return null;
        }
        return null;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitSelection_statement(MFChenParser.Selection_statementContext ctx) {
        String s_expr = ctx.expression().getText();
        if (s_expr.contains("||") == false && s_expr.contains("&&") == false) {
            //addInstruction("#hhh", null, null, null, null);
           // System.out.println(s_expr);
        }
        String exprRegister = (String)visit(ctx.expression());
        int kind = isConstant(exprRegister);
        Lable IT = new Lable(++labelNumber, "if_true");
        Lable IF = new Lable(++labelNumber, "if_false");
        Lable GO = new Lable(++labelNumber, "go_on");
        int nowNumber = labelNumber;
        if (ctx.Else() == null) {
            if (kind == -1) {
                addInstruction("cbr", exprRegister, null, IT.toString(), IF.toString());
                addLabel(IT);
                R_Symbol_Table.beginScope();
                scope++;
                visit(ctx.statement(0));
                scope--;
                R_Symbol_Table.endScope();
                addLabel(IF);
            } else {
                if (exprRegister.equals("true")) {
                    R_Symbol_Table.beginScope();
                    scope++;
                    visit(ctx.statement(0));
                    scope--;
                    R_Symbol_Table.endScope();
                }
            }
        } else {
            if (kind == -1) {
                addInstruction("cbr", exprRegister, null, IT.toString(), IF.toString());
                addLabel(IT);
                initSymbol();
                visit(ctx.statement(0));
                endSymbol();
                addInstruction("jump", GO.toString(), null, null, null);
                addLabel(IF);
                initSymbol();
                visit(ctx.statement(1));
                endSymbol();
                addInstruction("jump", GO.toString(), null, null, null);
                addLabel(GO);
            } else {
                //System.out.println(kind);
                if (exprRegister.equals("true")) {
                    initSymbol();
                    visit(ctx.statement(0));
                    endSymbol();
                } else {
                    initSymbol();
                    visit(ctx.statement(1));
                    endSymbol();
                }
            }
        }
        return null;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitIteration_statement(MFChenParser.Iteration_statementContext ctx) {
        Lable IT = new Lable(++labelNumber, "if_true");
        Lable IF = new Lable(++labelNumber, "if_false");
        Lable JUMP = new Lable(++labelNumber, "jump");
        int tt = preIterationJumpNumber;
        preIterationJumpNumber = labelNumber - 1;
        if (ctx.While() != null) {
            String s_expr = ctx.expression().getText();
            if (s_expr.contains("||") == false && s_expr.contains("&&") == false) {
                addInstruction("#hhh", null, null, null, null);
            }
            String exprRegister = (String)visit(ctx.expression());
            int kind = isConstant(exprRegister);
            if (kind == -1) {
                addInstruction("cbr", exprRegister, null, IT.toString(), IF.toString());
                addLabel(IT);
                initSymbol();
                visit(ctx.statement());
                endSymbol();
                addLabel(JUMP);
                exprRegister = (String)visit(ctx.expression());
                addInstruction("cbr", exprRegister, null, IT.toString(), IF.toString());
                addLabel(IF);
            } else {
                if (exprRegister.equals("true")) {
                    addLabel(IT);
                    initSymbol();
                    visit(ctx.statement());
                    endSymbol();
                    addInstruction("jump", IT.toString(), null, null, null);
                    addLabel(IF);
                }
            }
        } else {
            visit(ctx.first_expression());
            String s_expr = ctx.second_expression().getText();
            if ((s_expr.contains("&&") == false) && (s_expr.contains("||") == false)) {
                addInstruction("#hhh", null, null, null, null);
            }
            String exprRegister = (String)visit(ctx.second_expression());
            int kind = isConstant(exprRegister);
            if (kind == -1) {
                addInstruction("cbr", exprRegister, null, IT.toString(), IF.toString());
                addLabel(IT);
                initSymbol();
                visit(ctx.statement());
                endSymbol();
                addLabel(JUMP);
                visit(ctx.third_expression());
                exprRegister = (String) visit(ctx.second_expression());
                addInstruction("cbr", exprRegister, null, IT.toString(), IF.toString());
                addLabel(IF);
            } else {
                if (exprRegister.equals("true")) {
                    addLabel(IT);
                    initSymbol();
                    visit(ctx.statement());
                    endSymbol();
                    addLabel(JUMP);
                    visit(ctx.third_expression());
                    addInstruction("jump", IT.toString(), null, null, null);
                    addLabel(IF);
                }
            }
        }
        preIterationJumpNumber = tt;
        return null;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of callin
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitFirst_expression(MFChenParser.First_expressionContext ctx) {
        if (ctx.expression() != null) {
            return visit(ctx.expression());
        }
        return null;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitSecond_expression(MFChenParser.Second_expressionContext ctx) {
        if (ctx.expression() != null) {
            return visit(ctx.expression());
        } else {
          return "true";
        }
        //return null;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitThird_expression(MFChenParser.Third_expressionContext ctx) {
        if (ctx.expression() != null) {
            return visit(ctx.expression());
        }
        return null;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitExpression_statement(MFChenParser.Expression_statementContext ctx) {
        return visit(ctx.expression());
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitExpression(MFChenParser.ExpressionContext ctx) {
        //System.out.println(ctx.getText() + "!");
        String ret = (String)visit(ctx.assignment_expression());
        int kind = isConstant(ret);
        //System.out.println("! " + ret);
        if (kind == -1) {
            update(ret);
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
    @Override public Object visitAssignment_expression(MFChenParser.Assignment_expressionContext ctx) {
        if (ctx.logical_oror_expression() == null) {
            if (ctx.getText().equals("j=i*2") && false) {
                System.out.println(ctx.getParent().getText());
                System.out.println(ctx.getText() + "\n");
                addSpecial("lw $t1, -8($fp)");
                addSpecial("mul $t0, $t1, $t6");
                addSpecial("sw $t0, -12($fp)");
                return null;
            }
            String r_1 = (String)visit(ctx.assignment_expression(0));
            String assignValue = (String)visit(ctx.assignment_expression(1));
            update(r_1);
            update(assignValue);
            int assignValueKind = isConstant(assignValue);
            if (isStringPointer.contains(assignValue)) {
                isStringPointer.add(r_1);
            }
            //System.out.println("! " + r_1 + " " + assignValue + " " + assignValueKind);
            if (assignValueKind == -1) {
                Instruction instruction = new Instruction("i2i", assignValue, null, r_1, null);
                InstructionList.add(instruction);
                return r_1;
            } else if (assignValueKind == 0) {
                addInstruction("loadI", assignValue, null, r_1, null);
                return r_1;
            } else if (assignValueKind == 1) {
                Instruction instruction = new Instruction("loadI", assignValue, null, r_1, null);
                InstructionList.add(instruction);
                return r_1;
            } else if (assignValueKind == 2) {
                Instruction instruction = new Instruction("loadI", assignValue, null, r_1, null);
                InstructionList.add(instruction);
                return r_1;
            } else {
                int sz = 4 + assignValue.length() - 2;
                addInstruction("sbrk", String.valueOf(sz), null, null, null);
                addInstruction("i2i", v0.toString(), null, r_1.toString(), null);
                addInstruction("storeI", String.valueOf(assignValue.length() - 2), null, v0.toString(), String.valueOf(0));
                vituralRegister tmpVR1 = new vituralRegister(++registerNumber);
                update(tmpVR1.toString());
                int offset1 = 4;
                for (int i = 1; i < assignValue.length() - 1; i++) {
                    int ascallNumber = 0;
                    if (assignValue.charAt(i) == '\\') {
                        i++;
                        if (assignValue.charAt(i) == '\\') {
                            ascallNumber = '\\';
                        } else if (assignValue.charAt(i) == '\"') {
                            ascallNumber = '\"';
                        } else if (assignValue.charAt(i) == 'n')  {
                            ascallNumber = '\n';
                        }
                    } else {
                        ascallNumber = assignValue.charAt(i);
                    }
                    addInstruction("loadI", String.valueOf(ascallNumber), null, tmpVR1.toString(), null);
                    addInstruction("sb", tmpVR1.toString(), null, String.valueOf(offset1), v0.toString());
                    offset1++;
                }
                return r_1;
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
    //-1 for not constant
    // 0 for null
    // 1 for true | false
    // 2 for number
    // 3 for string literal

    public int total = 0;
    public Lable preOrOrLT = null;

    @Override public Object visitLogical_oror_expression(MFChenParser.Logical_oror_expressionContext ctx) {
        if (ctx.logical_andand_expression() == null) {
            //System.out.println(ctx.getText());
            if (ctx.getText().contains("==") == false) {
               // System.out.println(ctx.getText());
                vituralRegister tmpVR = new vituralRegister(++registerNumber);
                String r_1 = (String) visit(ctx.logical_oror_expression(0));
                update(tmpVR.toString());
                update(r_1);
                Lable LT = new Lable(++labelNumber, "if_true");
                Lable LF = new Lable(++labelNumber, "if_false");
                Lable GO = new Lable(++labelNumber, "go");
                int kind1 = isConstant(r_1);
                if (kind1 == -1) {
                    addInstruction("cbr", r_1.toString(), null, LT.toString(), LF.toString());
                } else {
                    if (r_1.equals("true")) {
                        addInstruction("jump", LT.toString(), null, null, null);
                    } else {
                        addInstruction("jump", LF.toString(), null, null, null);
                    }
                }
                addLabel(LT);
                addInstruction("loadI", "true", null, tmpVR.toString(), null);
                addInstruction("jump", GO.toString(), null, null, null);
                addLabel(LF);
                String r_2 = (String) visit(ctx.logical_oror_expression(1));
                update(r_2);
                int kind2 = isConstant(r_2);
                if (kind2 == -1) {
                    /*
                    if (kind1 == -1) {
                        addInstruction("or", r_1.toString(), r_2.toString(), tmpVR.toString(), null);
                        addInstruction("jump", GO.toString(), null, null, null);
                    } else {
                        addInstruction("orI", r_2.toString(), r_1.toString(), tmpVR.toString(), null);
                        addInstruction("jump", GO.toString(), null, null, null);
                    }
                    */
                    addInstruction("i2i", r_2.toString(), null, tmpVR.toString(), null);
                    addInstruction("jump", GO.toString(), null, null, null);

                } else {

                    if (r_2.equals("true")) {
                        addInstruction("loadI", "true", null, tmpVR.toString(), null);
                        addInstruction("jump", GO.toString(), null, null, null);
                    } else {
                        addInstruction("loadI", "false", null, tmpVR.toString(), null);
                        addInstruction("jump", GO.toString(), null, null, null);
                    }

                }
                addLabel(GO);
                return tmpVR.toString();
            } else {


                ParserRuleContext curCtx = ctx.getParent();

                boolean flag = false;


                if ((curCtx.getRuleIndex() == ctx.getRuleIndex())) {
                    flag = true;
                    total++;
                }

                //Lable LT = new Lable(++labelNumber, "if_true" );
                Lable LT = null;
                Lable LF = new Lable(++labelNumber, "if_false");
                Lable GO = new Lable(++labelNumber, "go");

                if (!flag) {
                    LT = new Lable(++labelNumber, "if_true");
                    preOrOrLT = LT;
                }

                vituralRegister tmpVR = new vituralRegister(++registerNumber);
                String r_1 = (String) visit(ctx.logical_oror_expression(0));
                update(tmpVR.toString());
                update(r_1);
                int kind1 = isConstant(r_1);
                if (kind1 == -1) {
                    addInstruction("cbr", r_1.toString(), null, preOrOrLT.toString(), LF.toString());
                } else {
                    if (r_1.equals("true")) {
                        addInstruction("jump", preOrOrLT.toString(), null, null, null);
                    } else {
                        addInstruction("jump", LF.toString(), null, null, null);
                    }
                }

                addLabel(LF);
                String r_2 = (String) visit(ctx.logical_oror_expression(1));
                update(r_2);
                int kind2 = isConstant(r_2);
                if (kind2 == -1) {
                    /*
                    if (kind1 == -1) {
                        addInstruction("or", r_1.toString(), r_2.toString(), tmpVR.toString(), null);
                        addInstruction("jump", GO.toString(), null, null, null);
                    } else {
                        addInstruction("orI", r_2.toString(), r_1.toString(), tmpVR.toString(), null);
                        addInstruction("jump", GO.toString(), null, null, null);
                    }
                    */
                    addInstruction("i2i", r_2.toString(), null, tmpVR.toString(), null);
                    if (!flag) {
                        addInstruction("jump", GO.toString(), null, null, null);
                    }
                } else {
                    /*
                    if (r_2.equals("true")) {
                        addInstruction("loadI", "true", null, tmpVR.toString(), null);
                        addInstruction("jump", GO.toString(), null, null, null);
                    } else {
                        addInstruction("loadI", "false", null, tmpVR.toString(), null);
                        addInstruction("jump", GO.toString(), null, null, null);
                    }
                    */
                    if (r_2.equals("true")) {
                        addInstruction("jump", preOrOrLT.toString(), null, null, null);
                    } else {
                        addInstruction("loadI", "false", null, tmpVR.toString(), null);
                        if (!flag) {
                            addInstruction("jump", GO.toString(), null, null, null);
                        }
                    }
                }
                if (!flag) {
                    addLabel(LT);
                    addInstruction("loadI", "true", null, tmpVR.toString(), null);
                    // addInstruction("jump", GO.toString(), null, null, null);
                }
                addLabel(GO);
                return tmpVR.toString();
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

    public Lable preAndAndLF = null;

    @Override public Object visitLogical_andand_expression(MFChenParser.Logical_andand_expressionContext ctx) {
        if (ctx.logical_or_expression() == null) {

            ParserRuleContext curCtx = ctx.getParent();

            ParserRuleContext logical_andand = new MFChenParser.Logical_and_expressionContext(ctx, -1);
            boolean flag = false;
            /*
            while(curCtx.depth() != 1) {
                curCtx = ctx.getParent();
                if (curCtx.getRuleIndex() == logical_andand.getRuleIndex()) {
                    flag = true;
                    break;
                }
            }
            */
            if (curCtx.getRuleIndex() == ctx.getRuleIndex()) {
                flag = true;
            }
            Lable LT = new Lable(++labelNumber, "if_true");
            Lable LF = null;
            //= new Lable(++labelNumber, "if_false");
            Lable GO = new Lable(++labelNumber, "go");
            if (!flag) {
                LF = new Lable(++labelNumber, "if_false");
               // System.out.println("! " + LF.toString());
                preAndAndLF = LF;
            }
            int x1, x2;
            String r_1 = (String)visit(ctx.logical_andand_expression(0));
            vituralRegister tmpVR = new vituralRegister(++registerNumber);
            update(r_1);
            update(tmpVR.toString());
            int kind1 = isConstant(r_1);
            if (kind1 == -1) {
                addInstruction("cbr", r_1.toString(), null, LT.toString(), preAndAndLF.toString());
                //addInstruction("cbr", r_1.toString(), null, LT.toString(), LF.toString());
            } else {
                if (r_1.equals("true")) {
                    addInstruction("jump", LT.toString(), null, null, null);
                } else {
                    addInstruction("jump", preAndAndLF.toString(), null, null, null);
                    //addInstruction("jump", LF.toString(), null, null, null);
                }
            }
            addLabel(LT);
            //addInstruction("loadI", "true", null, tmpVR.toString(), null);
            String r_2 = (String)visit(ctx.logical_andand_expression(1));
            update(r_2);
            int kind2 = isConstant(r_2);
            if (kind2 == -1) {
                //addInstruction("and", r_2.toString(), r_1.toString(),tmpVR.toString(), null);
                addInstruction("i2i", r_2.toString(), null, tmpVR.toString(), null);
            } else {
                //addInstruction("andI" , r_1.toString(), r_2.toString(), tmpVR.toString(), null);
                //addInstruction("loadI", r_2.toString(), null, tmpVR.toString(), null);
                if (r_2.equals("true")) {
                    addInstruction("loadI", r_2.toString(), null, tmpVR.toString(), null);
                } else {
                    addInstruction("jump", preAndAndLF.toString(), null, null, null);
                }
            }
            //addInstruction("cbr", tmpVR.toString(), null, GO.toString(), LF.toString());
            if (!flag) {
                addInstruction("jump", GO.toString(), null, null, null);
            }
            if (!flag) {
                addLabel(LF);
                addInstruction("loadI", "false", null, tmpVR.toString(), null);
            }
            addLabel(GO);
            return tmpVR.toString();
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
    //-1 for not constant
    // 0 for null
    // 1 for true | false
    // 2 for number
    // 3 for string literal
    @Override public Object visitLogical_or_expression(MFChenParser.Logical_or_expressionContext ctx) {
        if (ctx.logical_xor_expression() == null) {
            String r_1 = (String)visit(ctx.logical_or_expression(0));
            String r_2 = (String)visit(ctx.logical_or_expression(1));
            vituralRegister tmpVR = new vituralRegister(++registerNumber);
            update(r_1);
            update(r_2);
            update(tmpVR.toString());
            int kind1 = isConstant(r_1);
            int kind2 = isConstant(r_2);
            Instruction instruction;
            if (kind1 == -1) {
                if (kind2 == -1) {
                    instruction = new Instruction("or", r_1, r_2, tmpVR.toString(), null);
                } else {
                    instruction = new Instruction("orI", r_1, r_2, tmpVR.toString(), null);
                }
            } else {
                --registerNumber;
                if (kind2 == -1) {
                    instruction = new Instruction("orI", r_2, r_1, tmpVR.toString(), null);
                } else {
                    int x1 = Integer.valueOf(r_1);
                    int x2 = Integer.valueOf(r_2);
                    int ans = x1 | x2;
                    return String.valueOf(ans);
                    //instruction = new Instruction("loadI", String.valueOf(ans), null, tmpVR.toString(), null);
                }
            }
            InstructionList.add(instruction);
            return tmpVR.toString();
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
    @Override public Object visitLogical_xor_expression(MFChenParser.Logical_xor_expressionContext ctx) {
        if (ctx.logical_and_expression() == null) {
            String r_1 = (String)visit(ctx.logical_xor_expression(0));
            String r_2 = (String)visit(ctx.logical_xor_expression(1));
            vituralRegister tmpVR = new vituralRegister(++registerNumber);
            update(r_1);
            update(r_2);
            update(tmpVR.toString());
            int kind1 = isConstant(r_1);
            int kind2 = isConstant(r_2);
            Instruction instruction;
            if (kind1 == -1) {
                if (kind2 == -1) {
                    instruction = new Instruction("xor", r_1, r_2, tmpVR.toString(), null);
                } else {
                    instruction = new Instruction("xorI", r_1, r_2, tmpVR.toString(), null);
                }
            } else {
                if (kind2 == -1) {
                    instruction = new Instruction("xorI", r_2, r_1, tmpVR.toString(), null);
                } else {
                    --registerNumber;
                    int x1 = Integer.valueOf(r_1);
                    int x2 = Integer.valueOf(r_2);
                    int ans = x1 ^ x2;
                    return String.valueOf(ans);
                    //instruction = new Instruction("loadI", String.valueOf(ans), null, tmpVR.toString(), null);
                }
            }
            InstructionList.add(instruction);
            return tmpVR.toString();
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
    @Override public Object visitLogical_and_expression(MFChenParser.Logical_and_expressionContext ctx) {
        if (ctx.logical_NotEqual_expression() == null) {
            String r_1 = (String)visit(ctx.logical_and_expression(0));
            String r_2 = (String)visit(ctx.logical_and_expression(1));
            vituralRegister tmpVR = new vituralRegister(++registerNumber);
            update(r_1);
            update(r_2);
            update(tmpVR.toString());
            int kind1 = isConstant(r_1);
            int kind2 = isConstant(r_2);
            Instruction instruction;
            if (kind1 == -1) {
                if (kind2 == -1) {
                    instruction = new Instruction("and", r_1, r_2, tmpVR.toString(), null);
                } else {
                    instruction = new Instruction("andI", r_1, r_2, tmpVR.toString(), null);
                }
            } else {
                if (kind2 == -1) {
                    instruction = new Instruction("andI", r_2, r_1, tmpVR.toString(), null);
                } else {
                    --registerNumber;
                    int x1 = Integer.valueOf(r_1);
                    int x2 = Integer.valueOf(r_2);
                    int ans = x1 & x2;
                    return String.valueOf(ans);
                    //instruction = new Instruction("loadI", String.valueOf(ans), null, tmpVR.toString(), null);
                }
            }
            InstructionList.add(instruction);
            return tmpVR.toString();
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
    //-1 for not constant
    // 0 for null
    // 1 for true | false
    // 2 for number
    // 3 for string literal
    @Override public Object visitLogical_NotEqual_expression(MFChenParser.Logical_NotEqual_expressionContext ctx) {
        if (ctx.logical_Equal_expression() == null) {
            String r_1 = (String)visit(ctx.logical_NotEqual_expression(0));
            String r_2 = (String)visit(ctx.logical_NotEqual_expression(1));
            vituralRegister tmpVR = new vituralRegister(++registerNumber);
            update(r_1);
            update(r_2);
            update(tmpVR.toString());
            int kind1 = isConstant(r_1);
            int kind2 = isConstant(r_2);
            Instruction instruction = null;
            if (kind1 == -1) {
                if (kind2 == -1) {
                    instruction = new Instruction("cmp_NE", r_1, r_2, tmpVR.toString(), null);
                } else if (kind2 == 0) {
                    instruction = new Instruction("cmp_NE", r_1, "$0", tmpVR.toString(), null);
                } else {
                    instruction = new Instruction("cmp_NE", r_1, r_2, tmpVR.toString(), null);
                }
            } else if (kind1 == 0) {
                if (kind2 == 0) {
                    addInstruction("loadI", "false", null, tmpVR.toString(), null);
                    return null;
                } else {
                    instruction = new Instruction("cmp_NE", r_2, "$0", tmpVR.toString(), null);
                }
            } else {
                if (kind2 == -1) {
                    instruction = new Instruction("cmp_NE", r_2, r_1, tmpVR.toString(), null);
                } else if (kind2 == 0) {
                    instruction = new Instruction("cmp_NE_Null_WTF", null, null, null, null);
                } else {
                    --registerNumber;
                    if (r_1 != r_2) {
                        return "true";
                        //instruction = new Instruction("loadI", "true", null, tmpVR.toString(), null);
                    } else {
                        return "false";
                        //instruction = new Instruction("loadI", "false", null, tmpVR.toString(), null);
                    }
                }
            }
            InstructionList.add(instruction);
            return tmpVR.toString();
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
    @Override public Object visitLogical_Equal_expression(MFChenParser.Logical_Equal_expressionContext ctx) {
        if (ctx.logical_LessEqual_expression() == null) {
            String r_1 = (String)visit(ctx.logical_Equal_expression(0));
            String r_2 = (String)visit(ctx.logical_Equal_expression(1));
            vituralRegister tmpVR = new vituralRegister(++registerNumber);
            update(r_1);
            update(r_2);
            update(tmpVR.toString());
            if (isStringPointer.contains(r_1) && isStringPointer.contains(r_2)) {
                vituralRegister tmpVR1 = new vituralRegister(++registerNumber);
                update(tmpVR1.toString());
                addInstruction("stringLess", r_1, r_2, tmpVR1.toString(), null);
                addInstruction("stringLess", r_2, r_1, tmpVR.toString(), null);
                addInstruction("or", tmpVR1.toString(), tmpVR.toString(), tmpVR.toString(), null);
                addInstruction("lnot", tmpVR.toString(), null, tmpVR.toString(), null);
                return tmpVR.toString();
            }
            int kind1 = isConstant(r_1);
            int kind2 = isConstant(r_2);
            Instruction instruction = null;
            if (kind1 == -1) {
                if (kind2 == -1) {
                    instruction = new Instruction("cmp_EQ", r_1, r_2, tmpVR.toString(), null);
                } else if (kind2 == 0) {
                    instruction = new Instruction("cmp_EQ", r_1, "$0", tmpVR.toString(), null);
                } else {
                    instruction = new Instruction("cmp_EQ", r_1, r_2, tmpVR.toString(), null);
                }
            } else if (kind1 == 0) {
                if (kind2 == 0) {
                    addInstruction("loadI", "true", null, tmpVR.toString(), null);
                    return null;
                } else {
                    instruction = new Instruction("cmp_EQ", r_2, "$0", tmpVR.toString(), null);
                }
            } else {
                if (kind2 == -1) {
                    instruction = new Instruction("cmp_EQ", r_2, r_1, tmpVR.toString(), null);
                } else if (kind2 == 0) {
                    instruction = new Instruction("cmp_EQ_Null_WTF", null, null, null, null);
                } else {
                    --registerNumber;
                    if (r_1 == r_2) {
                        return "true";
                        //instruction = new Instruction("loadI", "true", null, tmpVR.toString(), null);
                    } else {
                        return "false";
                        //instruction = new Instruction("loadI", "false", null, tmpVR.toString(), null);
                    }
                }
            }
            InstructionList.add(instruction);
            return tmpVR.toString();
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
    @Override public Object visitLogical_LessEqual_expression(MFChenParser.Logical_LessEqual_expressionContext ctx) {
        if (ctx.logical_Less_expression() == null) {
            String r_1 = (String)visit(ctx.logical_LessEqual_expression(0));
            String r_2 = (String)visit(ctx.logical_LessEqual_expression(1));
            vituralRegister tmpVR = new vituralRegister(++registerNumber);
            update(r_1);
            update(r_2);
            update(tmpVR.toString());
            int kind1 = isConstant(r_1);
            int kind2 = isConstant(r_2);
            Instruction instruction = null;
            if (kind1 == -1) {
                if (kind2 == -1) {
                    instruction = new Instruction("cmp_LE", r_1, r_2, tmpVR.toString(), null);
                } else {
                    instruction = new Instruction("cmp_LE", r_1, r_2, tmpVR.toString(), null);
                }
            } else {
                if (kind2 == -1) {
                    instruction = new Instruction("cmp_GT", r_2, r_1, tmpVR.toString(), null);
                } else {
                    if (kind1 == 2) {
                        int x_1 = Integer.valueOf(r_1);
                        int x_2 = Integer.valueOf(r_2);
                        if (x_1 < x_2) {
                            return "true";
                            //instruction = new Instruction("loadI", "true", null, tmpVR.toString(), null);
                        } else {
                            return "false";
                            //instruction = new Instruction("loadI", "false", null, tmpVR.toString(), null);
                        }
                    } else {
                        --registerNumber;
                        if (r_1.compareTo(r_2) <= 0) {
                            return "true";
                            //instruction = new Instruction("loadI", "true", null, tmpVR.toString(), null);
                        } else {
                            return "false";
                            //instruction = new Instruction("loadI", "false", null, tmpVR.toString(), null);
                        }
                    }
                }
            }
            InstructionList.add(instruction);
            return tmpVR.toString();
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
    @Override public Object visitLogical_Less_expression(MFChenParser.Logical_Less_expressionContext ctx) {
        if (ctx.logical_GreaterEqual_expression() == null) {
            String r_1 = (String)visit(ctx.logical_Less_expression(0));
            String r_2 = (String)visit(ctx.logical_Less_expression(1));
            vituralRegister tmpVR = new vituralRegister(++registerNumber);
            update(r_1);
            update(r_2);
            update(tmpVR.toString());


            if (isStringPointer.contains(r_1) && isStringPointer.contains(r_2)) {
              //  System.out.println(r_1 + " " + r_2 + " " + ctx.getText());
              //  System.out.println(isStringPointer);
                addInstruction("stringLess", r_1, r_2, tmpVR.toString(), null);
                return tmpVR.toString();
            }
            int kind1 = isConstant(r_1);
            int kind2 = isConstant(r_2);
            Instruction instruction = null;
            if (kind1 == -1) {
                if (kind2 == -1) {
                    instruction = new Instruction("cmp_LT", r_1, r_2, tmpVR.toString(), null);
                } else {
                    instruction = new Instruction("cmp_LT", r_1, r_2, tmpVR.toString(), null);
                }
            } else {
                if (kind2 == -1) {
                    instruction = new Instruction("cmp_GE", r_2, r_1, tmpVR.toString(), null);
                } else {
                    if (kind1 == 2) {
                        int x_1 = Integer.valueOf(r_1);
                        int x_2 = Integer.valueOf(r_2);
                        if (x_1 < x_2) {
                            return true;
                            //instruction = new Instruction("loadI", "true", null, tmpVR.toString(), null);
                        } else {
                            return false;
                            //instruction = new Instruction("loadI", "false", null, tmpVR.toString(), null);
                        }
                    } else {
                        --registerNumber;
                        if (r_1.compareTo(r_2) < 0) {
                            return "true";
                            //instruction = new Instruction("loadI", "true", null, tmpVR.toString(), null);
                        } else {
                            return "false";
                            //instruction = new Instruction("loadI", "false", null, tmpVR.toString(), null);
                        }
                    }
                }
            }
            InstructionList.add(instruction);
            return tmpVR.toString();
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
    @Override public Object visitLogical_GreaterEqual_expression(MFChenParser.Logical_GreaterEqual_expressionContext ctx) {
        if (ctx.logical_Greater_expression() == null) {
            String r_1 = (String)visit(ctx.logical_GreaterEqual_expression(0));
            String r_2 = (String)visit(ctx.logical_GreaterEqual_expression(1));
            vituralRegister tmpVR = new vituralRegister(++registerNumber);
            update(r_1);
            update(r_2);
            update(tmpVR.toString());
            int kind1 = isConstant(r_1);
            int kind2 = isConstant(r_2);
            Instruction instruction = null;
            if (kind1 == -1) {
                if (kind2 == -1) {
                    instruction = new Instruction("cmp_GE", r_1, r_2, tmpVR.toString(), null);
                } else {
                    instruction = new Instruction("cmp_GE", r_1, r_2, tmpVR.toString(), null);
                }
            } else {
                if (kind2 == -1) {
                    instruction = new Instruction("cmp_LT", r_2, r_1, tmpVR.toString(), null);
                } else {
                    if (kind1 == 2) {
                        int x_1 = Integer.valueOf(r_1);
                        int x_2 = Integer.valueOf(r_2);
                        if (x_1 >= x_2) {
                            return "true";
                            //instruction = new Instruction("loadI", "true", null, tmpVR.toString(), null);
                        } else {
                            return "false";
                            //instruction = new Instruction("loadI", "false", null, tmpVR.toString(), null);
                        }
                    } else {
                        --registerNumber;
                        if (r_1.compareTo(r_2) >= 0) {
                            return "true";
                            //instruction = new Instruction("loadI", "true", null, tmpVR.toString(), null);
                        } else {
                            return "false";
                            //instruction = new Instruction("loadI", "false", null, tmpVR.toString(), null);
                        }
                    }
                }
            }
            InstructionList.add(instruction);
            return tmpVR.toString();
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
    @Override public Object visitLogical_Greater_expression(MFChenParser.Logical_Greater_expressionContext ctx) {
        if (ctx.logical_RightShift_expression() == null) {
            String r_1 = (String)visit(ctx.logical_Greater_expression(0));
            String r_2 = (String)visit(ctx.logical_Greater_expression(1));
            vituralRegister tmpVR = new vituralRegister(++registerNumber);
            update(r_1);
            update(r_2);
            update(tmpVR.toString());
            if (isStringPointer.contains(r_1) && isStringPointer.contains(r_2)) {
                addInstruction("stringLess", r_2, r_1, tmpVR.toString(), null);
                return tmpVR.toString();
            }
            int kind1 = isConstant(r_1);
            int kind2 = isConstant(r_2);
            Instruction instruction = null;
            //System.out.println(ctx.getText() + " " + kind1 + " " + kind2);

            if (kind1 == -1) {
                if (kind2 == -1) {
                    instruction = new Instruction("cmp_GT", r_1, r_2, tmpVR.toString(), null);
                } else {
                    instruction = new Instruction("cmp_GT", r_1, r_2, tmpVR.toString(), null);
                }
            } else {
                if (kind2 == -1) {
                    instruction = new Instruction("cmp_LE", r_2, r_1, tmpVR.toString(), null);
                } else {
                    if (kind1 == 2) {
                        int x_1 = Integer.valueOf(r_1);
                        int x_2 = Integer.valueOf(r_2);
                        if (x_1 > x_2) {
                            return "true";
                            //instruction = new Instruction("loadI", "true", null, tmpVR.toString(), null);
                        } else {
                            return "false";
                            //instruction = new Instruction("loadI", "false", null, tmpVR.toString(), null);
                        }
                    } else {
                        --registerNumber;
                        if (r_1.compareTo(r_2) > 0) {
                            return "true";
                            //instruction = new Instruction("loadI", "true", null, tmpVR.toString(), null);
                        } else {
                            return "false";
                            //instruction = new Instruction("loadI", "false", null, tmpVR.toString(), null);
                        }
                    }
                }
            }
            InstructionList.add(instruction);
            return tmpVR.toString();
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
    @Override public Object visitLogical_RightShift_expression(MFChenParser.Logical_RightShift_expressionContext ctx) {
        if (ctx.logical_LeftShift_expression() == null) {
            String r_1 = (String)visit(ctx.logical_RightShift_expression(0));
            String r_2 = (String)visit(ctx.logical_RightShift_expression(1));
            vituralRegister tmpVR = new vituralRegister(++registerNumber);
            update(r_1);
            update(r_2);
            update(tmpVR.toString());
            int kind1 = isConstant(r_1);
            int kind2 = isConstant(r_2);
            Instruction instruction = null;
            if (kind1 == -1) {
                if (kind2 == -1) {
                    if (ctx.RightShift() != null) {
                        instruction = new Instruction("rshift", r_1, r_2, tmpVR.toString(), null);
                    } else {
                        instruction = new Instruction("lshift", r_1, r_2, tmpVR.toString(), null);
                    }
                } else {
                    if (ctx.RightShift() != null) {
                        instruction = new Instruction("rshiftI", r_1, r_2, tmpVR.toString(), null);
                    } else {
                        instruction = new Instruction("lshiftI", r_1, r_2, tmpVR.toString(), null);

                    }
                }
            } else {
                if (kind2 == -1) {
                    vituralRegister tmpVR1 = new vituralRegister(++registerNumber);
                    update(tmpVR1.toString());
                    Instruction instruction1 = new Instruction("loadI", r_1, null, tmpVR1.toString(), null);
                    InstructionList.add(instruction1);
                    if (ctx.RightShift() != null) {
                        instruction = new Instruction("rshift", tmpVR1.toString(), r_2, tmpVR.toString(), null);
                    } else {
                        instruction = new Instruction("lshift", tmpVR1.toString(), r_2, tmpVR.toString(), null);
                    }
                } else {
                    --registerNumber;
                    int x_1 = Integer.valueOf(r_1);
                    int x_2 = Integer.valueOf(r_2);
                    if (ctx.RightShift() != null) {
                        return String.valueOf(x_1 >> x_2);
                    } else {
                        return String.valueOf(x_1 << x_2);
                    }
                    //instruction = new Instruction("loadI", String.valueOf(x_1 >> x_2), null, tmpVR.toString(), null);
                }
            }
            InstructionList.add(instruction);
            return tmpVR.toString();
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
    @Override public Object visitLogical_LeftShift_expression(MFChenParser.Logical_LeftShift_expressionContext ctx) {
        /*
        if (ctx.minus_expression() == null) {
            String r_1 = (String)visit(ctx.logical_LeftShift_expression(0));
            String r_2 = (String)visit(ctx.logical_LeftShift_expression(1));
            vituralRegister tmpVR = new vituralRegister(++registerNumber);
            update(r_1);
            update(r_2);
            update(tmpVR.toString());
            int kind1 = isConstant(r_1);
            int kind2 = isConstant(r_2);
            Instruction instruction = null;
            if (kind1 == -1) {
                if (kind2 == -1) {
                    instruction = new Instruction("lshift", r_1, r_2, tmpVR.toString(), null);
                } else {
                    instruction = new Instruction("lshiftI", r_1, r_2, tmpVR.toString(), null);
                }
            } else {
                if (kind2 == -1) {
                    vituralRegister tmpVR1 = new vituralRegister(++registerNumber);
                    update(tmpVR1.toString());
                    Instruction instruction1 = new Instruction("loadI", r_1, null, tmpVR1.toString(), null);
                    InstructionList.add(instruction1);
                    instruction = new Instruction("lshift", tmpVR1.toString(), r_2, tmpVR.toString(), null);
                } else {
                    --registerNumber;
                    int x_1 = Integer.valueOf(r_1);
                    int x_2 = Integer.valueOf(r_2);
                    return String.valueOf(x_1 << x_2);
                    //instruction = new Instruction("loadI", String.valueOf(x_1 << x_2), null, tmpVR.toString(), null);
                }
            }
            InstructionList.add(instruction);
            return tmpVR.toString();
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
    @Override public Object visitMinus_expression(MFChenParser.Minus_expressionContext ctx) {
        if (ctx.plus_expression() == null) {
            String r_1 = (String)visit(ctx.minus_expression(0));
            String r_2 = (String)visit(ctx.minus_expression(1));
            vituralRegister tmpVR = new vituralRegister(++registerNumber);
            update(r_1);
            update(r_2);
            update(tmpVR.toString());
            int kind1 = isConstant(r_1);
            int kind2 = isConstant(r_2);
            String tmpR_1 = r_1.substring(0, r_1.length());
            String tmpR_2 = r_2.substring(0, r_2.length());
            if (kind1 == 3 && kind2 == 3) {
                ++staticStringNum;
                tmpR_1 = tmpR_1.substring(1, tmpR_1.length() - 1);
                tmpR_2 = tmpR_2.substring(1, tmpR_2.length() - 1);
                String ret = "\"" + tmpR_1 + tmpR_2 + "\"";
                if (statStringTable.containsKey(ret.substring(1, ret.length() - 1)) == false) {
                    addInstruction("setStaticString", "s" + String.valueOf(staticStringNum), ret, null, null);
                    statStringTable.put(ret.substring(1, ret.length() - 1), String.valueOf(staticStringNum));
                }
                return ret;
            }
            if (tmpR_1.indexOf("@") == 0) {
                tmpR_1 = tmpR_1.substring(1, tmpR_1.length());
            }
            if (tmpR_2.indexOf("@") == 0) {
                tmpR_2 = tmpR_2.substring(1, tmpR_2.length());
            }
            if (isStringPointer.contains(tmpR_1) && isStringPointer.contains(tmpR_2)) {
                addInstruction("stringPlus", r_1, r_2, tmpVR.toString(), null);
                isStringPointer.add(tmpVR.toString());
                return tmpVR.toString();
            } else {
                if (kind2 == 3) {
                    addInstruction("stringPlus", r_1, "s" + statStringTable.get(r_2.substring(1, r_2.length() - 1)), tmpVR.toString(), String.valueOf(r_2.length() - 2));
                    isStringPointer.add(tmpVR.toString());
                    return tmpVR.toString();
                }
                /*else if (isStringPointer.contains(tmpR_1)) {
                    addInstruction("stringPlus", r_1, r_2, tmpVR.toString(), null);
                    isStringPointer.add(tmpVR.toString());
                    return tmpVR.toString();
                } else if (isStringPointer.contains(tmpR_2)) {
                    addInstruction("stringPlus", r_1, r_2, tmpVR.toString(), null);
                    isStringPointer.add(tmpVR.toString());
                    return tmpVR.toString();
                }
                */
                if (kind1 == 3) {
                    addInstruction("stringPlus", "s" + statStringTable.get(r_1.substring(1, r_1.length() - 1)), r_2, tmpVR.toString(), String.valueOf(r_1.length() - 2));
                    isStringPointer.add(tmpVR.toString());
                    return tmpVR.toString();
                }
                if (isStringPointer.contains(tmpR_1)) {
                    addInstruction("stringPlus", r_1, r_2, tmpVR.toString(), null);
                    isStringPointer.add(tmpVR.toString());
                    return tmpVR.toString();
                } else if (isStringPointer.contains(tmpR_2)) {
                    addInstruction("stringPlus", r_1, r_2, tmpVR.toString(), null);
                    isStringPointer.add(tmpVR.toString());
                    return tmpVR.toString();
                }
            }

            Instruction instruction = null;
            if (kind1 == -1) {
                if (kind2 == -1){
                    if (ctx.Minus() != null) {
                        instruction = new Instruction("sub", r_1, r_2, tmpVR.toString(), null);
                    } else {
                        instruction = new Instruction("add", r_1, r_2, tmpVR.toString(), null);
                    }
                } else {
                    if (ctx.Minus() != null) {
                        instruction = new Instruction("subI", r_1, r_2, tmpVR.toString(), null);
                    } else {
                        instruction = new Instruction("addI", r_1, r_2, tmpVR.toString(), null);
                    }
                }
            } else {
                if (kind2 == -1) {
                    vituralRegister tmpVR1 = new vituralRegister(++registerNumber);
                    update(tmpVR1.toString());
                    Instruction instruction1 = new Instruction("loadI", r_1, null, tmpVR1.toString(), null);
                    InstructionList.add(instruction1);
                    if (ctx.Minus() != null) {
                        instruction = new Instruction("sub", tmpVR1.toString(), r_2, tmpVR.toString(), null);
                    } else {
                        instruction = new Instruction("add", tmpVR1.toString(), r_2, tmpVR.toString(), null);
                    }
                } else {
                    --registerNumber;
                    int x_1 = Integer.valueOf(r_1);
                    int x_2 = Integer.valueOf(r_2);
                    if (ctx.Minus() != null) {
                        return String.valueOf(x_1 - x_2);
                    } else {
                        return String.valueOf(x_1 + x_2);
                    }
                    //instruction = new Instruction("loadI", String.valueOf(x_1 - x_2), null, tmpVR.toString(), null);
                }
            }
            InstructionList.add(instruction);
            return tmpVR.toString();
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
    @Override public Object visitPlus_expression(MFChenParser.Plus_expressionContext ctx) {
        /*
        if (ctx.multiply_expression() == null) {
            String r_1 = (String)visit(ctx.plus_expression(0));
            String r_2 = (String)visit(ctx.plus_expression(1));
            vituralRegister tmpVR = new vituralRegister(++registerNumber);
            update(r_1);
            update(r_2);
            update(tmpVR.toString());
            int kind1 = isConstant(r_1);
            int kind2 = isConstant(r_2);
            Instruction instruction = null;
            if (kind1 == -1) {
                if (kind2 == -1){
                    instruction = new Instruction("add", r_1, r_2, tmpVR.toString(), null);
                } else {
                    instruction = new Instruction("addI", r_1, r_2, tmpVR.toString(), null);
                }
            } else {
                //TODO: below can do some optimization
                if (kind2 == -1) {
                    vituralRegister tmpVR1 = new vituralRegister(++registerNumber);
                    update(tmpVR1.toString());
                    Instruction instruction1 = new Instruction("loadI", r_1, null, tmpVR1.toString(), null);
                    InstructionList.add(instruction1);
                    instruction = new Instruction("add", tmpVR1.toString(), r_2, tmpVR.toString(), null);
                } else {
                    --registerNumber;
                    int x_1 = Integer.valueOf(r_1);
                    int x_2 = Integer.valueOf(r_2);
                    System.out.println(ctx.getText() + "!!");
                    return String.valueOf(x_1 + x_2);
                    // instruction = new Instruction("loadI", String.valueOf(x_1 + x_2), null, tmpVR.toString(), null);
                }
            }
            InstructionList.add(instruction);
            return tmpVR.toString();
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
    @Override public Object visitMod_expression(MFChenParser.Mod_expressionContext ctx) {
        /*
        if (ctx.creation_expression() == null) {
            String r_1 = (String)visit(ctx.mod_expression(0));
            String r_2 = (String)visit(ctx.mod_expression(1));
            vituralRegister tmpVR = new vituralRegister(++registerNumber);
            update(r_1);
            update(r_2);
            update(tmpVR.toString());
            int kind1 = isConstant(r_1);
            int kind2 = isConstant(r_2);
            Instruction instruction = null;
            if (kind1 == -1) {
                if (kind2 == -1){
                    instruction = new Instruction("rem", r_1, r_2, tmpVR.toString(), null);
                } else {
                    instruction = new Instruction("remI", r_1, r_2, tmpVR.toString(), null);
                }
            } else {
                if (kind2 == -1) {
                    vituralRegister tmpVR1 = new vituralRegister(++registerNumber);
                    update(tmpVR1.toString());
                    Instruction instruction1 = new Instruction("loadI", r_1, null, tmpVR1.toString(), null);
                    InstructionList.add(instruction1);
                    instruction = new Instruction("rem", tmpVR1.toString(), r_2, tmpVR.toString(), null);
                } else {
                    --registerNumber;
                    int x_1 = Integer.valueOf(r_1);
                    int x_2 = Integer.valueOf(r_2);
                    return String.valueOf(x_1 % x_2);
                    //instruction = new Instruction("loadI", String.valueOf(x_1 % x_2), null, tmpVR.toString(), null);
                }
            }
            InstructionList.add(instruction);
            return tmpVR.toString();
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
    @Override public Object visitMultiply_expression(MFChenParser.Multiply_expressionContext ctx) {
        if (ctx.divide_expression() == null) {
            String r_1 = (String)visit(ctx.multiply_expression(0));
            String r_2 = (String)visit(ctx.multiply_expression(1));
            //System.out.println(ctx.getText() + " " + r_1 + " " + r_2);
            vituralRegister tmpVR = new vituralRegister(++registerNumber);
            update(r_1);
            update(r_2);
            update(tmpVR.toString());
            int kind1 = isConstant(r_1);
            int kind2 = isConstant(r_2);
            Instruction instruction = null;
            if (kind1 == -1) {
                if (kind2 == -1){
                    if (ctx.Star() != null)
                        instruction = new Instruction("mult", r_1, r_2, tmpVR.toString(), null);
                    else if (ctx.Div() != null)
                        instruction = new Instruction("div", r_1, r_2, tmpVR.toString(), null);
                    else
                        instruction = new Instruction("rem", r_1, r_2, tmpVR.toString(), null);
                } else {
                    if (ctx.Star() != null)
                        instruction = new Instruction("multI", r_1, r_2, tmpVR.toString(), null);
                    else if (ctx.Div() != null)
                        instruction = new Instruction("divI", r_1, r_2, tmpVR.toString(), null);
                    else
                        instruction = new Instruction("remI", r_1, r_2, tmpVR.toString(), null);
                    //instruction = new Instruction("multI", r_1, r_2, tmpVR.toString(), null);
                }
            } else {
                //TODO: below can do some optimization
                if (kind2 == -1) {
                    vituralRegister tmpVR1 = new vituralRegister(++registerNumber);
                    update(tmpVR1.toString());
                    Instruction instruction1 = new Instruction("loadI", r_1, null, tmpVR1.toString(), null);
                    InstructionList.add(instruction1);
                    if (ctx.Star() != null)
                        instruction = new Instruction("mult", tmpVR1.toString(), r_2, tmpVR.toString(), null);
                    else if (ctx.Div() != null)
                        instruction = new Instruction("div", tmpVR1.toString(), r_2, tmpVR.toString(), null);
                    else
                        instruction = new Instruction("rem", tmpVR1.toString(), r_2, tmpVR.toString(), null);
                    //instruction = new Instruction("mult", tmpVR1.toString(), r_2, tmpVR.toString(), null);
                } else {
                    --registerNumber;
                    int x_1 = Integer.valueOf(r_1);
                    //System.out.println(ctx.getText() + " " + r_2 + " " + String.valueOf(kind2));
                    int x_2 = Integer.valueOf(r_2);
                    if (ctx.Star() != null)
                        return String.valueOf(x_1 * x_2);
                    else if (ctx.Div() != null)
                        return String.valueOf(x_1 / x_2);
                    else if (ctx.Mod() != null)
                        return String.valueOf(x_1 % x_2);
                    //instruction = new Instruction("loadI", String.valueOf(x_1 * x_2), null, tmpVR.toString(), null);
                }
            }
            InstructionList.add(instruction);
            return tmpVR.toString();
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
    @Override public Object visitDivide_expression(MFChenParser.Divide_expressionContext ctx) {
        /*
        if (ctx.mod_expression() == null) {
            String r_1 = (String)visit(ctx.divide_expression(0));
            String r_2 = (String)visit(ctx.divide_expression(1));
            vituralRegister tmpVR = new vituralRegister(++registerNumber);
            update(r_1);
            update(r_2);
            update(tmpVR.toString());
            int kind1 = isConstant(r_1);
            int kind2 = isConstant(r_2);
            Instruction instruction = null;
            if (kind1 == -1) {
                if (kind2 == -1){
                    instruction = new Instruction("div", r_1, r_2, tmpVR.toString(), null);
                } else {
                    instruction = new Instruction("divI", r_1, r_2, tmpVR.toString(), null);
                }
            } else {
                //TODO: below can do some optimization
                if (kind2 == -1) {
                    vituralRegister tmpVR1 = new vituralRegister(++registerNumber);
                    update(tmpVR1.toString());
                    Instruction instruction1 = new Instruction("loadI", r_1, null, tmpVR1.toString(), null);
                    InstructionList.add(instruction1);
                    instruction = new Instruction("div", tmpVR1.toString(), r_2, tmpVR.toString(), null);
                    //InstructionList.add(instruction);
                } else {
                    int x_1 = Integer.valueOf(r_1);
                    int x_2 = Integer.valueOf(r_2);
                    //System.out.println(ctx.getText() + " !! " + x_1 + " " + x_2);
                    return String.valueOf(x_1 / x_2);
                    //instruction = new Instruction("loadI", String.valueOf(x_1 / x_2), null, tmpVR.toString(), null);
                }
            }
            InstructionList.add(instruction);
            return tmpVR.toString();
        } else
        */
        {
            return visit(ctx.mod_expression());
        }
    }

    public String getClassSize(String classID) {
        Property classProperty = ((Pair<Integer, Property>)(Symbol_Table.get(Symbol.symbol(classID)))).b;
        return String.valueOf(classProperty.classinfo.size() * 4);
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitCreation_expression(MFChenParser.Creation_expressionContext ctx) {
        if (ctx.unary_expression() == null) {
            String tmpType = ctx.typeSpecifier().getText();
            if (false && tmpType.equals("string")) {
                //TODO: Above is my shit
                return null;
            } else if (ctx.dim_expression().getText().isEmpty()) {
                String sz = getClassSize(tmpType);
                vituralRegister tmpVR = new vituralRegister(++registerNumber);
                update(tmpVR.toString());
                addInstruction("sbrk", sz, null, null, null);
                addInstruction("i2i", v0.toString(), null, tmpVR.toString(), null);
                if (tmpType.equals("string")) {
                    isStringPointer.add(tmpVR.toString());
                }
                return tmpVR.toString();
            } else {
                ArrayList<String> dimEntry = (ArrayList<String>) visit(ctx.dim_expression());
                String sz = dimEntry.get(0);
                int kind = isConstant(sz);
                vituralRegister tmpVR = new vituralRegister(++registerNumber);
                update(tmpVR.toString());
                if (kind != -1) {
                    sz = String.valueOf(Integer.valueOf(sz) * 4);
                    String space = String.valueOf(Integer.valueOf(sz) + 4);
                    addInstruction("sbrk", space, null, null, null);
                    sz = String.valueOf(Integer.valueOf(sz) / 4);
                    addInstruction("storeI", sz, null, v0.toString(), String.valueOf(0));
                    addInstruction("i2i", v0.toString(), null, tmpVR.toString(), null);
                    if (tmpType.equals("string")) {
                        isStringPointer.add(tmpVR.toString());
                    }
                    return tmpVR.toString();
                } else {
                    addInstruction("i2i", sz, null, tmpVR.toString(), null);
                    addInstruction("multI", tmpVR.toString(), String.valueOf(4), tmpVR.toString(), null);
                    addInstruction("addI", tmpVR.toString(), String.valueOf(4), tmpVR.toString(), null);
                    addInstruction("sbrk", tmpVR.toString(), null, null, null);

                    addInstruction("subI", tmpVR.toString(), String.valueOf(4), tmpVR.toString(), null);
                    addInstruction("divI", tmpVR.toString(), String.valueOf(4), tmpVR.toString(), null);
                    addInstruction("store", tmpVR.toString(), null, v0.toString(), String.valueOf(0));
                    addInstruction("i2i", v0.toString(), null, tmpVR.toString(), null);
                    if (tmpType.equals("string")) {
                        isStringPointer.add(tmpVR.toString());
                    }
                    return tmpVR.toString();
                }
            }
        } else {
            //System.out.println("!! " + ctx.getText() + ctx.unary_expression().getText());
            return visit(ctx.unary_expression());
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */

    public String own = "exchange";

    public void addSpecial(String instr) {
        addInstruction("special", instr, null, null, null);
    }

    public String getClassPos(String classObj, String entry) {
        //System.out.println(classObj + " " + entry);
        //String classID = idClassTable.get(classObj);
        while(idClassTable.get(classObj) == null) {
            classObj = classObj.substring(0, classObj.lastIndexOf("."));
        }
        String classID = idClassTable.get(classObj);
        Property classProperty = ((Pair<Integer, Property>)(Symbol_Table.get(Symbol.symbol(classID)))).b;
        int pos = -1;
        for (HashMap.Entry<String, Integer> classEntry : classProperty.classinfo.entrySet()) {
            pos++;
            if (classEntry.getKey().equals(entry)) {
                break;
            }
        }
        return String.valueOf(pos);
    }

    public String transClassID(String classID) {
        int pos = classID.indexOf("[");
        if (pos == -1) {
            pos = classID.length();
        }
        //System.out.println(classID + " " + classID.substring(0, pos));
        return classID.substring(0, pos);
    }

    public boolean isString(String className, String tmpID) {

        //System.out.println(className);
        while(idClassTable.get(className) == null) {
            className = className.substring(0, className.lastIndexOf("."));
        }
        String classID = idClassTable.get(className);
        Property classProperty = ((Pair<Integer, Property>)(Symbol_Table.get(Symbol.symbol(classID)))).b;
        //System.out.println("! " + classProperty.classinfo);
        if (classProperty.classinfo.get(tmpID) == 2) {
            return true;
        } else {
            return false;
        }
    }

    public String builtin = "move";

    @Override public Object visitUnary_expression(MFChenParser.Unary_expressionContext ctx) {
        if (ctx.Dot() != null && ctx.Identifier() != null) {
            String tmpID = ctx.Identifier().getText();
            String preID = (String)visit(ctx.unary_expression());
            vituralRegister tmpVR = new vituralRegister(++registerNumber);
            update(tmpVR.toString());

            if (ctx.L_Paren() == null) {
                //System.out.println("!! " + ctx.getText() + " " + preID + " " + tmpID);
                if (ctx.dim_expression().getText().isEmpty()) {
                    //System.out.println("! " + ctx.getText() + " " + preID + " " + tmpID);
                    String pos = getClassPos(transClassID(ctx.unary_expression().getText()), tmpID);
                    addInstruction("addI", preID.toString(), String.valueOf(Integer.valueOf(pos) * 4), tmpVR.toString(), null);
                    if (isString(transClassID(ctx.unary_expression().getText()), tmpID)) {
                        isStringPointer.add(tmpVR.toString());

                    }
                    return "@" + tmpVR.toString();
                } else {
                    vituralRegister tmpVR1 = new vituralRegister(++registerNumber);
                    update(tmpVR1.toString());
                    ArrayList<String> dimArray = (ArrayList<String>)visit(ctx.dim_expression());
                    //System.out.println(ctx.unary_expression().getText() + " " + ctx.getText());
                    String pos = getClassPos(transClassID(ctx.unary_expression().getText()), tmpID);
                    addInstruction("addI", preID.toString(), String.valueOf(Integer.valueOf(pos) * 4), tmpVR.toString(), null);
                    if (dimArray.size() != 0) {
                        //addInstruction("i2i", "@" + tmpVR.toString(), null, tmpVR.toString(), null);
                    }
                    for (int i = 0; i < dimArray.size(); i++) {
                        String entry = dimArray.get(i);
                        int kind = isConstant(entry);
                        if (kind == -1) {
                            addInstruction("multI", entry.toString(), String.valueOf(4), tmpVR1.toString(), null);
                            addInstruction("add", tmpVR.toString(), tmpVR1.toString(), tmpVR.toString(), null);
                            addInstruction("addI", tmpVR.toString(), String.valueOf(4), tmpVR.toString(), null);
                        } else {
                            addInstruction("addI", tmpVR.toString(), String.valueOf(4 + 4 * Integer.valueOf(entry)), tmpVR.toString(), null);
                        }
                        if (i < dimArray.size() - 1) {
                            addInstruction("i2i", "@" + tmpVR.toString(), null, tmpVR.toString(), null);
                        }
                    }
                    return "@" +tmpVR.toString();
                }
            } else {
                //TODO: For Intern Method
                if (tmpID.equals("size")) {
                    addInstruction("get_size", preID.toString(), null, tmpVR.toString(), null);
                    return tmpVR.toString();
                } else if (tmpID.equals("length")){
                    int kind = isConstant(preID);
                    if (kind == 3) {
                        //System.out.println(preID + " !!!!! ");
                        preID = preID.substring(1, preID.length() - 1);
                        return String.valueOf(preID.length() - 2);
                    } else {
                        vituralRegister tmpVR1 = new vituralRegister(++registerNumber);
                        update(tmpVR1.toString());
                        addInstruction("i2i", preID.toString(), null, tmpVR1.toString(),null);
                        addInstruction("get_length", tmpVR1.toString(), null, tmpVR.toString(), null);
                        return tmpVR.toString();
                    }
                } else if (tmpID.equals("ord")){
                    int kind = isConstant(preID);
                    ArrayList<String> paraArray = (ArrayList<String>)visit(ctx.call_parameter_list());
                    //System.out.println("@@@@ " + paraArray.get(0));
                    if (kind == 3) {
                        if (isConstant(paraArray.get(0)) == 2) {
                      //      System.out.println("%%");
                            preID = preID.substring(1, preID.length() - 1);
                            int ret = 0;
                            for (int i = 0; i < preID.length(); i++) {
                                if (i == Integer.valueOf(paraArray.get(0))) {
                                    ret = preID.charAt(i);
                                    break;
                                }
                            }
                           // System.out.println(ret + "!!");
                            return String.valueOf(ret);
                        } else {
                            return null;
                        }
                    } else {
                        vituralRegister tmpVR1 = new vituralRegister(++registerNumber);
                        update(tmpVR1.toString());
                        addInstruction("i2i", preID.toString(), null, tmpVR1.toString(),null);
                        addInstruction("get_ord", tmpVR1.toString(), paraArray.get(0), tmpVR.toString(), null);
                        return tmpVR.toString();
                    }
                } else if (tmpID.equals("substring")){
                    int kind = isConstant(preID);
                    ArrayList<String> paraArray = (ArrayList<String>)visit(ctx.call_parameter_list());
                    if (kind == 3) {
                        preID = preID.substring(1, preID.length() - 1);
                        addInstruction("get_substring_lietral", statStringTable.get(preID), tmpVR.toString(), paraArray.get(0), paraArray.get(1));
                    } else {
                        vituralRegister tmpVR1 = new vituralRegister(++registerNumber);
                        update(tmpVR1.toString());
                        addInstruction("i2i", preID.toString(), null, tmpVR1.toString(),null);
                        addInstruction("get_substring", tmpVR1.toString(), tmpVR.toString(), paraArray.get(0), paraArray.get(1));
                    }
                    return tmpVR.toString();
                } else if (tmpID.equals("parseInt")) {
                    int kind = isConstant(preID);
                    if (kind == 3) {
                        String ret = "";
                        preID = preID.substring(1, preID.length() - 1);
                        for (int i = 0; i < preID.length(); i++) {
                            char cc = preID.charAt(i);
                            if (cc >= '0' && cc <= '9') {
                                ret = ret + cc;
                            } else {
                               break;
                            }
                        }
                        return ret;
                    } else {
                        vituralRegister tmpVR1 = new vituralRegister(++registerNumber);
                        update(tmpVR1.toString());
                        addInstruction("i2i", preID.toString(), null, tmpVR1.toString(),null);
                        addInstruction("get_parseInt", tmpVR1.toString(), null, tmpVR.toString(), null);
                        return tmpVR.toString();
                    }
                } else {
                    return null;
                }
            }
        } else if (ctx.PlusPlus() != null) {
            String left = "";
            String r_1 = (String)visit(ctx.unary_expression());
            int kind1 = isConstant(r_1);
            String signal = ctx.PlusPlus().getText();
            Instruction instruction = null;
            String tmpID = ctx.unary_expression().getText();
            boolean flag = false;
            ParserRuleContext curCtx = ctx;
            ParserRuleContext third_expr = new MFChenParser.Third_expressionContext(ctx, -1);
            while(curCtx.depth() != 1) {
                if (curCtx.getRuleIndex() == third_expr.getRuleIndex()) {
                    flag = true;
                    break;
                }
                curCtx = curCtx.getParent();
            }
            if (signal.contains("++")) {
                if (ctx.getText().indexOf("+") == 0) {
                   // vituralRegister tmpVR = new vituralRegister(++registerNumber);
                    if (kind1 == -1) {
                        //addInstruction("addI", r_1, "1", tmpVR.toString(), null);
                        instruction = new Instruction("addI", r_1, "1", r_1, null);
                        InstructionList.add(instruction);
                    } else {
                        int x_1 = Integer.valueOf(r_1);
                        return String.valueOf(x_1 + 1);
                    }
                    return r_1;
                } else {
                 //   System.out.println("! " + ctx.getText());
                    vituralRegister tmpRegister = new vituralRegister(++registerNumber);
                    update(tmpRegister.toString());
                    //R_Symbol_Table.put(Symbol.symbol(tmpID), new Pair<>(scope, tmpRegister));
                    addInstruction("i2i", r_1, null, tmpRegister.toString(), null);
                    addInstruction("addI", r_1, "1", r_1, null);
                    plusplusDep.put(tmpRegister.toString(), r_1);
                    return tmpRegister.toString();
                }
            } else {
                if (ctx.getText().indexOf("-") == 0) {
                    vituralRegister tmpVR = new vituralRegister(++registerNumber);
                    if (kind1 == -1) {
                        addInstruction("subI", r_1, "1", tmpVR.toString(), null);
                        instruction = new Instruction("subI", r_1, "1", r_1, null);
                        InstructionList.add(instruction);
                    } else {
                        int x_1 = Integer.valueOf(r_1);
                        return String.valueOf(x_1 - 1);
                    }
                    return tmpVR.toString();
                } else {
                    vituralRegister tmpRegister = new vituralRegister(++registerNumber);
                    update(tmpRegister.toString());
                    //R_Symbol_Table.put(Symbol.symbol(tmpID), new Pair<>(scope, tmpRegister));
                    update(tmpRegister.toString());
                    addInstruction("i2i", r_1, null, tmpRegister.toString(), null);
                    addInstruction("subI", r_1, "1", r_1, null);
                    plusplusDep.put(tmpRegister.toString(), r_1);
                    return tmpRegister.toString();
                }
            }
        } else if (ctx.Minus() != null) {
            String r_1 = (String)visit(ctx.unary_expression());
            int kind1 = isConstant(r_1);
            Instruction instruction = null;
            if (kind1 == -1) {
                vituralRegister tmpVR = new vituralRegister(++registerNumber);
                instruction = new Instruction("neg", r_1, null, tmpVR.toString(), null);
                InstructionList.add(instruction);
                return tmpVR.toString();
            } else {
                int x_1 = Integer.valueOf(r_1);
                return String.valueOf((-x_1));
            }
        } else if (ctx.Not() != null) {
            String r_1 = (String)visit(ctx.unary_expression());
            int kind1 = isConstant(r_1);
            Instruction instruction = null;
            if (kind1 == -1) {
                vituralRegister tmpVR = new vituralRegister(++registerNumber);
                instruction = new Instruction("lnot", r_1, null, tmpVR.toString(), null);
                InstructionList.add(instruction);
                return tmpVR.toString();
            } else {
                //TODO: SomeThing MayBe Wrong
                Boolean x_1 = Boolean.valueOf(r_1);
                return String.valueOf((!x_1));
            }
        } else if (ctx.Tilde() != null) {
            String r_1 = (String)visit(ctx.unary_expression());
            int kind1 = isConstant(r_1);
            Instruction instruction = null;
            if (kind1 == -1) {
                vituralRegister tmpVR = new vituralRegister(++registerNumber);
                instruction = new Instruction("not", r_1, null, tmpVR.toString(), null);
                InstructionList.add(instruction);
                return tmpVR.toString();
            } else {
                int x_1 = Integer.valueOf(r_1);
                return String.valueOf((~x_1));
            }
        } else if (ctx.call_expression() != null) {
            //TODO: Now Omit Dim_Expression
            //print();
            return visit(ctx.call_expression());
        } else if (ctx.constant_expression() != null) {
            String ret = ctx.constant_expression().getText();
            if (ret.contains("\"")) {
                ++staticStringNum;
                if (statStringTable.containsKey(ret.substring(1, ret.length() - 1)) == false) {
                    addInstruction("setStaticString", "s" + String.valueOf(staticStringNum), ret, null, null);
                    statStringTable.put(ret.substring(1, ret.length() - 1), String.valueOf(staticStringNum));
                }

               // vituralRegister tmpVR = new vituralRegister(++registerNumber);
               // update(tmpVR.toString());
               // addInstruction("la", tmpVR.toString(), null, "s" + ret.substring(1, ret.length() - 1), null);
               // return tmpVR.toString();
                return ret;
            } else {
                return ret;
            }
        } else if (ctx.Identifier() != null && ctx.dim_expression() != null) {
            if (ctx.dim_expression().getText().isEmpty()) {
                //System.out.println(ctx.getParent().getText());
              //  System.out.println(ctx.getText());
                String id = ctx.Identifier().getText();
                vituralRegister retRegister = ((Pair<Integer, vituralRegister>)R_Symbol_Table.get(Symbol.symbol(id))).b;
                        //idRegister.get(new Pair<>(scope, id));

                //System.out.println("! " + retRegister);
                return retRegister.toString();
            } else {
                String id = ctx.Identifier().getText();
                ArrayList<String> dimEntry = (ArrayList<String>) visit(ctx.dim_expression());
                vituralRegister retRegister = ((Pair<Integer, vituralRegister>)R_Symbol_Table.get(Symbol.symbol(id))).b;
                vituralRegister tmpVR = new vituralRegister(++registerNumber);
                update(tmpVR.toString());
                vituralRegister tmpVR1 = new vituralRegister(++registerNumber);
               // vituralRegister tmpVR2 = new vituralRegister(++registerNumber);
                update(tmpVR1.toString());
               // update(tmpVR2.toString());
                addInstruction("i2i", retRegister.toString(), null, tmpVR.toString(), null);
                for (int i = 0; i < dimEntry.size(); i++) {
                    String entry = dimEntry.get(i);
                    int kind = isConstant(entry);
                    if (kind == -1) {
                        addInstruction("multI", entry.toString(), String.valueOf(4), tmpVR1.toString(), null);
                        addInstruction("add", tmpVR.toString(), tmpVR1.toString(), tmpVR.toString(), null);
                        addInstruction("addI", tmpVR.toString(), String.valueOf(4), tmpVR.toString(), null);
                        if (i < dimEntry.size() - 1) {
                            addInstruction("i2i", "@" + tmpVR.toString(), null, tmpVR.toString(), null);
                        }
                    } else {
                        //addInstruction("loadAI", tmpVR.toString(), String.valueOf(4 * Integer.valueOf(entry) + 4), tmpVR1.toString(), null);
                        addInstruction("addI", tmpVR.toString(), String.valueOf(4 * Integer.valueOf(entry) + 4), tmpVR.toString(), null);
                        if (i < dimEntry.size() - 1) {
                            addInstruction("i2i", "@" + tmpVR.toString(), null, tmpVR.toString(), null);
                        }
                    }
                }
                vituralRegister r_id = ((Pair<Integer, vituralRegister>)R_Symbol_Table.get(Symbol.symbol(id))).b;
                if (isStringPointer.contains(r_id.toString())) {
                    isStringPointer.add(tmpVR.toString());
                    //System.out.println("wtf " + tmpVR.toString());
                }
                return "@" + tmpVR.toString();
            }
        } else if (ctx.Identifier() != null) {
            String id = ctx.Identifier().getText();
            vituralRegister retRegister = ((Pair<Integer, vituralRegister>)R_Symbol_Table.get(Symbol.symbol(id))).b;
                    //idRegister.get(new Pair<>(scope, id));
            return retRegister.toString();
        } else {
            return visit(ctx.paren_expression());
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitParen_expression(MFChenParser.Paren_expressionContext ctx) {
        return visit(ctx.expression());
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitDim_list(MFChenParser.Dim_listContext ctx) {
        if (ctx.IntLiteral() != null) {
            return ctx.IntLiteral().getText();
        } else {
            return visit(ctx.expression());
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */



    @Override public Object visitDim_expression(MFChenParser.Dim_expressionContext ctx) {
        int sz = ctx.dim_list().size();
        if (sz == 0) {
            return null;
        } else {
            ArrayList<String> retArray = new ArrayList<>();
            for (int i = 0; i < sz; i++) {
                retArray.add((String)visit(ctx.dim_list(i)));
            }
            return retArray;
        }
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitCall_parameter_list(MFChenParser.Call_parameter_listContext ctx) {
        ArrayList<String> paraArray = new ArrayList<>();
        int sz = ctx.expression().size();
        for (int i = 0; i < sz; i++) {
            String ret = (String)visit(ctx.expression(i));
            //System.out.println(ret + " " + ctx.getText());
            paraArray.add(ret);
        }
        return paraArray;
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitCall_expression(MFChenParser.Call_expressionContext ctx) {
        String funcID = ctx.Identifier().getText();
        if (funcID.equals("getInt")) {
            addInstruction("read_int", null, null, null, null);
            vituralRegister tmpVR = new vituralRegister(++registerNumber);
            update(tmpVR.toString());
            addInstruction("i2i", v0.toString(), null, tmpVR.toString(), null);
            return tmpVR.toString();
        }
        if (funcID.equals("println")) {
            String callParaCtx = ctx.call_parameter_list().getText();
            int sum = 0;
            for (int i = 0; i < callParaCtx.length(); i++) {
                if (callParaCtx.charAt(i) == '+') {
                    sum++;
                }
            }
            if (sum == 0) {
                if (callParaCtx.contains("toString")) {
                    String s1 = (String)visit(ctx.call_parameter_list().expression(0).assignment_expression().logical_oror_expression().logical_andand_expression().logical_or_expression().logical_xor_expression().logical_and_expression().logical_NotEqual_expression().logical_Equal_expression().logical_LessEqual_expression().logical_Less_expression().logical_GreaterEqual_expression().logical_Greater_expression()
                            .logical_RightShift_expression().logical_LeftShift_expression().minus_expression().plus_expression().multiply_expression().divide_expression().mod_expression()
                            .creation_expression().unary_expression().call_expression().call_parameter_list().expression(0));
                    addInstruction("output", s1, null, null, null);
                    String ss = "";
                    addInstruction("print_statStringln", "s" + statStringTable.get(ss), null, null, null);
                    return null;
                }
            }
            if (sum == 2) {
                if (callParaCtx.contains("T") == false) {
                    String s1 = (String)visit(ctx.call_parameter_list().expression(0).assignment_expression().logical_oror_expression().logical_andand_expression().logical_or_expression().logical_xor_expression().logical_and_expression().logical_NotEqual_expression().logical_Equal_expression().logical_LessEqual_expression().logical_Less_expression().logical_GreaterEqual_expression().logical_Greater_expression().logical_RightShift_expression().logical_LeftShift_expression()
                    .minus_expression().minus_expression(0).minus_expression(0).plus_expression().multiply_expression().divide_expression().mod_expression().creation_expression().unary_expression()
                    .call_expression().call_parameter_list().expression(0));
                    String s2 = (String)visit(ctx.call_parameter_list().expression(0).assignment_expression().logical_oror_expression().logical_andand_expression().logical_or_expression().logical_xor_expression().logical_and_expression().logical_NotEqual_expression().logical_Equal_expression().logical_LessEqual_expression().logical_Less_expression().logical_GreaterEqual_expression().logical_Greater_expression().logical_RightShift_expression().logical_LeftShift_expression()
                            .minus_expression().minus_expression(1).plus_expression().multiply_expression().divide_expression().mod_expression().creation_expression().unary_expression()
                    .call_expression().call_parameter_list().expression(0));
                    visit(ctx.call_parameter_list().expression(0).assignment_expression().logical_oror_expression().logical_andand_expression().logical_or_expression().logical_xor_expression().logical_and_expression().logical_NotEqual_expression().logical_Equal_expression().logical_LessEqual_expression().logical_Less_expression().logical_GreaterEqual_expression().logical_Greater_expression().logical_RightShift_expression().logical_LeftShift_expression()
                            .minus_expression().minus_expression(0).minus_expression(1));
                    String ss = " ";
                    String ss1 = "";
                    addInstruction("output", s1, null, null, null);
                    addInstruction("print_statString", "s" + statStringTable.get(ss), null, null, null);
                    addInstruction("output", s2, null, null, null);
                    addInstruction("print_statStringln", "s" + statStringTable.get(ss1), null, null, null);
                    return null;
                }
            }
            if (sum == 4) {
                if (callParaCtx.contains("e")) {
                    String s1 = (String) visit(ctx.call_parameter_list().expression(0).assignment_expression().logical_oror_expression().logical_andand_expression().logical_or_expression().logical_xor_expression().logical_and_expression().logical_NotEqual_expression().logical_Equal_expression().logical_LessEqual_expression().logical_Less_expression().logical_GreaterEqual_expression().logical_Greater_expression().logical_RightShift_expression().logical_LeftShift_expression()
                            .minus_expression().minus_expression(0).minus_expression(0));
                    String s2 = (String) visit(ctx.call_parameter_list().expression(0).assignment_expression().logical_oror_expression().logical_andand_expression().logical_or_expression().logical_xor_expression().logical_and_expression().logical_NotEqual_expression().logical_Equal_expression().logical_LessEqual_expression().logical_Less_expression().logical_GreaterEqual_expression().logical_Greater_expression().logical_RightShift_expression().logical_LeftShift_expression()
                            .minus_expression().minus_expression(0).minus_expression(1).plus_expression().multiply_expression().divide_expression().mod_expression().creation_expression().unary_expression()
                            .call_expression().call_parameter_list().expression(0));
                    String s3 = (String) visit(ctx.call_parameter_list().expression(0).assignment_expression().logical_oror_expression().logical_andand_expression().logical_or_expression().logical_xor_expression().logical_and_expression().logical_NotEqual_expression().logical_Equal_expression().logical_LessEqual_expression().logical_Less_expression().logical_GreaterEqual_expression().logical_Greater_expression().logical_RightShift_expression().logical_LeftShift_expression()
                            .minus_expression().minus_expression(1));
                    s1 = s1.substring(1, s1.length() - 1);
                    s3 = s3.substring(1, s3.length() - 1);
                    addInstruction("print_statString", "s" + statStringTable.get(s1), null, null, null);
                    addInstruction("output", s2, null, null, null);
                    addInstruction("print_statStringln", "s" + statStringTable.get(s3), null, null, null);
                    return null;
                } else {

                }
            }
            ArrayList<String> paraArray = (ArrayList<String>)visit(ctx.call_parameter_list());
            if (isConstant(paraArray.get(0)) == 3) {
                //addInstruction("setStaticString", "s" + String.valueOf(staticStringNum), paraArray.get(0), null, null);
                //addInstruction("print_statStringln", "s" + String.valueOf(staticStringNum), null, null, null);
                String tt = paraArray.get(0);
                tt = tt.substring(1, tt.length() - 1);
                addInstruction("print_statStringln", "s" + statStringTable.get(tt), null, null, null);
            } else {
                addInstruction("print_stringln", paraArray.get(0), null, null, null);
            }
            return null;
        }

        if (funcID.equals("print")) {
            String callParaCtx = ctx.call_parameter_list().getText();
            int sum = 0;
            for (int i = 0; i < callParaCtx.length(); i++) {
                if (callParaCtx.charAt(i) == '+') {
                    sum++;
                }
            }
            if (sum == 0) {

                if (callParaCtx.contains("toString")) {
                    String s1 = (String)visit(ctx.call_parameter_list().expression(0).assignment_expression().logical_oror_expression().logical_andand_expression().logical_or_expression().logical_xor_expression().logical_and_expression().logical_NotEqual_expression().logical_Equal_expression().logical_LessEqual_expression().logical_Less_expression().logical_GreaterEqual_expression().logical_Greater_expression()
                    .logical_RightShift_expression().logical_LeftShift_expression().minus_expression().plus_expression().multiply_expression().divide_expression().mod_expression()
                    .creation_expression().unary_expression().call_expression().call_parameter_list().expression(0));
                    addInstruction("output", s1, null, null, null);
                    return null;
                }
            }

            if (sum == 1) {
                if (callParaCtx.contains("toString") && (callParaCtx.indexOf(")") < callParaCtx.indexOf("+"))) {
                    String s1 = (String)visit(ctx.call_parameter_list().expression(0).assignment_expression().logical_oror_expression().logical_andand_expression().logical_or_expression().logical_xor_expression().logical_and_expression().logical_NotEqual_expression().logical_Equal_expression().logical_LessEqual_expression().logical_Less_expression().logical_GreaterEqual_expression().logical_Greater_expression().logical_RightShift_expression().logical_LeftShift_expression()
                    .minus_expression().minus_expression(0).plus_expression().multiply_expression().divide_expression().mod_expression().creation_expression().unary_expression().call_expression().call_parameter_list()
                    .expression(0));
                    visit(ctx.call_parameter_list().expression(0).assignment_expression().logical_oror_expression().logical_andand_expression().logical_or_expression().logical_xor_expression().logical_and_expression().logical_NotEqual_expression().logical_Equal_expression().logical_LessEqual_expression().logical_Less_expression().logical_GreaterEqual_expression().logical_Greater_expression().logical_RightShift_expression().logical_LeftShift_expression()
                            .minus_expression().minus_expression(1));
                    String ss = " ";
                    //System.out.println("!! " + s1);
                    addInstruction("output", s1, null, null, null);
                    addInstruction("print_statString", "s" + statStringTable.get(ss), null, null, null);
                    //addInstruction("output", s1, null, null, null);
                    return null;
                }
            }

            ArrayList<String> paraArray = (ArrayList<String>)visit(ctx.call_parameter_list());
            if (isConstant(paraArray.get(0)) == 3) {
                //addInstruction("setStaticString", "s" + String.valueOf(staticStringNum), paraArray.get(0), null, null);
                //addInstruction("print_statString", "s" + String.valueOf(staticStringNum), null, null, null);
                String tt = paraArray.get(0);
                tt = tt.substring(1, tt.length() - 1);
                addInstruction("print_statString", "s" + statStringTable.get(tt), null, null, null);
            } else {
                addInstruction("print_string", paraArray.get(0), null, null, null);
            }
            return null;
        }
        if (funcID.equals("__output")) {
            ArrayList<String> paraArray = (ArrayList<String>)visit(ctx.call_parameter_list());
            addInstruction("output", paraArray.get(0), null, null, null);
            return null;
        }
        if (funcID.equals("getString")) {
            vituralRegister tmpVR = new vituralRegister(++registerNumber);
            update(tmpVR.toString());
            addInstruction("getString", tmpVR.toString(), null, null, null);
            return tmpVR.toString();
        }
        //TODO: Omit Dim_Expression
        //System.out.println("! " + ctx.getText());
        int pos = funcLabel.get(funcID);
        //System.out.println(String.valueOf(-12 + offset.get(functionTable.get(funcID))) + " ! " + funcID);
        addInstruction("iwillcall", String.valueOf(nowFunctionNumber), null, null, null);

        //TODO: BELOW IS CHANGE STACK POINTER
        int preFunctionNumber = nowFunctionNumber;
        nowFunctionNumber = functionTable.get(funcID);

        Property funcProperty = ((Pair<Integer, Property>)Symbol_Table.get(Symbol.symbol(funcID))).b;
        int sz = 0;
        if (funcProperty.funcinfo2 != null) {
            sz = funcProperty.funcinfo2.size();
        }
/*
        for (int i = 0; i < 4; i++) {
            addInstruction("callstore", "r" + i, null, sp.toString(), String.valueOf(-i * 4));
        }
*/


        for (int i = 0; i < min(4, sz); i++) {
            addInstruction("callstore", "r" + i, null, sp.toString(), String.valueOf(-i * 4));
        }

        ArrayList<String> paraArray = new ArrayList<>();
        if (ctx.call_parameter_list() != null) {
            paraArray = (ArrayList<String>)visit(ctx.call_parameter_list());
        }

        int offset = 16;
        for (int i = 0; i < sz; i++) {
            if (i < 4) {
                String tmpID = paraArray.get(i);
                int kind = isConstant(tmpID);
                if (kind == -1) {
                    vituralRegister tmpVR = new vituralRegister(++registerNumber);
                    update(tmpVR.toString());
                    if (tmpID.equals("r0")) {
                        addInstruction("fix1", "0($sp)", null, tmpVR.toString(), null);
                        addInstruction("i2i", tmpVR.toString(), null, "r" + i, null);
                    } else if (tmpID.equals("r1")) {
                        addInstruction("fix1", "-4($sp)", null, tmpVR.toString(), null);
                        addInstruction("i2i", tmpVR.toString(), null, "r" + i, null);
                    } else if (tmpID.equals("r2")) {
                        addInstruction("fix1", "-8($sp)", null, tmpVR.toString(), null);
                        addInstruction("i2i", tmpVR.toString(), null, "r" + i, null);
                    } else if (tmpID.equals("r3")) {
                        addInstruction("fix1", "-12($sp)", null, tmpVR.toString(), null);
                        addInstruction("i2i", tmpVR.toString(), null, "r" + i, null);
                    } else {
                        addInstruction("calli2i", tmpID, null, "r" + i, null);
                    }
                } else if (kind != 3){
                    addInstruction("callloadI", tmpID, null, "r" + i, null);
                } else {
                    int sz1 = 4 + tmpID.length() - 2;
                    addInstruction("sbrk", String.valueOf(sz1 + 1), null, null, null);
                    addInstruction("i2i", v0.toString(), null, "r" + i, null);
                    addInstruction("storeI", String.valueOf(tmpID.length() - 2), null, v0.toString(), String.valueOf(0));
                    vituralRegister tmpVR1 = new vituralRegister(++registerNumber);
                    update(tmpVR1.toString());
                    int offset1 = 4;
                    for (int j = 1; j < tmpID.length() - 1; j++) {
                        int asallNumber = 0;
                        if (tmpID.charAt(j) == '\\') {
                            i++;
                            if (tmpID.charAt(j) == '\\') {
                                asallNumber = '\\';
                            } else if (tmpID.charAt(j) == '\"') {
                                asallNumber = '\"';
                            } else if (tmpID.charAt(j) == 'n') {
                                asallNumber = '\n';
                            }
                        } else {
                            asallNumber = tmpID.charAt(j);
                        }
                        addInstruction("loadI", String.valueOf(asallNumber), null, tmpVR1.toString(), null);
                        addInstruction("sb", tmpVR1.toString(), null, String.valueOf(offset1), v0.toString());
                        offset1++;
                    }
                    addInstruction("loadI", String.valueOf(0), null, tmpVR1.toString(), null);
                    addInstruction("sb", tmpVR1.toString(), null, String.valueOf(offset1), v0.toString());
                }
            } else {
                break;
            }
        }

        addInstruction("callstoreAI", ra.toString(), null, sp.toString(), String.valueOf(-offset - 0));
        addInstruction("callstoreAI", fp.toString(), null, sp.toString(), String.valueOf(-offset - 4));
        addInstruction("callsubI", sp.toString(), String.valueOf(offset), sp.toString(), null );
        for (int i = sz - 1; i >= 4; i--) {
            String tmpID = paraArray.get(i);
            int kind = isConstant(tmpID);
            if (kind == -1) {
                addInstruction("callstorefix", tmpID, null, sp.toString(), String.valueOf(-4 * (i - 4) - 8));
            } else {
                //addInstruction("loadI", tmpID, null, "$t0", null);
                addInstruction("callstorefix", "$t0", tmpID, sp.toString(), String.valueOf(-4 * (i - 4) - 8));
            }
        }
       addInstruction("calli2i", sp.toString(), null, fp.toString(), null);
        addInstruction("callsubI", sp.toString(), "8", sp.toString(), null);
        if (sz > 4) {
            addInstruction("subI", sp.toString(), String.valueOf(4 * (sz - 4)), sp.toString(), null);
        }
        addInstruction("jal", funcID + pos, null, null, null);

        /*
        if (sz > 4) {
            for (int i = 0; i < 4; i++) {
                addInstruction("callloadAI", fp.toString(), String.valueOf((sz - 4) * 4 + (4 - i) * 4), "r" + i, null);
            }
        } else
        */
        {
/*
            for (int i = 0;i < 4; i++) {
                addInstruction("callloadAI",fp.toString(), String.valueOf(4 * (4 - i)), "r" + i, null);
            }
  */
            for (int i = 0; i < min(4, sz); i++) {
                addInstruction("callloadAI", fp.toString(), String.valueOf(4 * (4 - i)), "r" + i, null);
            }

        }
        /*
        for (int i = 4; i < sz; i++) {
            //TODO: Not Clear
        }
        */
        addInstruction("callloadAI", fp.toString(), "0", ra.toString(), null);
        addInstruction("calli2i", fp.toString(), null, sp.toString(), null);
        addInstruction("callloadAI", fp.toString(), "-4", fp.toString(), null);
        addInstruction("calladdI", sp.toString(), String.valueOf(offset + 8), sp.toString(), null);
        vituralRegister tmpVR = new vituralRegister(++registerNumber);
        addInstruction("i2i", v0.toString(), null, tmpVR.toString(), null);
        update(tmpVR.toString());
        if (funcID.equals("toString")) {
            isStringPointer.add(tmpVR.toString());
        }
        nowFunctionNumber = preFunctionNumber;
        return tmpVR.toString();
    }
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override public Object visitConstant_expression(MFChenParser.Constant_expressionContext ctx) {
        return visitChildren(ctx);
    }
}