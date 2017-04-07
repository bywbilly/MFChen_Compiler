package MFChen.MIPS;

import MFChen.IR.Instruction;

import java.io.File;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by bywbilly on 16/4/26.
 */
public class excitedTranslate{
    public ArrayList<Instruction> ILOCLIST;

    public ArrayList<String> globalRegister = new ArrayList<>();

    public ArrayList<mipsInstruction> mipsList = new ArrayList<>();

    public HashMap<String, Integer> registerTable = new HashMap<>();
    public ArrayList<Integer> offsetList = new ArrayList<>();

    public int stackSize = 0;

    public int maxOffset = 0;

    public ArrayList<Integer> nowOffset;
    public int tottalStringPlus = 0;
    public int getStringNum = 0;
    public int subStringNum = 0;
    public int stringLessNum = 0;
    public int parseIntNum = 0;
    public int stringGreaterNum = 0;
    public int stringEqualNum = 0;

    public HashMap<String, String> registerAllocate;

    public void getAllocate(HashMap<String, String> _registerAllocate) {
        this.registerAllocate = _registerAllocate;
    }

    public void Init(ArrayList<Instruction> _ILOCLIST, HashMap<String, Integer> _registerTable, ArrayList<String> _globalRegister, ArrayList<Integer> _maxOffset) {
        ILOCLIST = _ILOCLIST;
        registerTable = _registerTable;
        globalRegister = _globalRegister;
        nowOffset = _maxOffset;
       // System.out.println(globalRegister);
    }

    public void print(Writer output) throws IOException{
        try
        {
            File f = new File("MFChen/test.s");
            f.delete();
        }
        catch (Exception e)
        {

        }
        // addInstruction("Label", "main", null, null, null);
       // Writer output = new FileWriter("MFChen/test.s", true);
        output.write(".data\n");

        for (String entry : globalRegister) {
            output.write(entry + ":" + "\t" + ".space\t" + "4\n");
        }
        output.write("_buffer" + ":\t" + ".word" + " 0\n");
        output.write("NEWLINE:  .asciiz\t \"\\n\" \n");
        for (mipsInstruction entry : mipsList) {
            if (entry.opCode.equals("setStaticString")) {
                output.write(entry.source1 + ":\t" + ".asciiz\t" + entry.source2 + "\n");
                output.write(entry.source1 + "ln" + ":\t" + ".asciiz\t" + entry.source2.substring(0, entry.source2.length() - 1) + "\\n\"" + "\n");
            }
        }

        output.write(".text  \n");

        int triger = 0;
        ArrayList<mipsInstruction> globalInstruction = new ArrayList<>();
        for (int i = 0; i < mipsList.size(); i++) {
            mipsInstruction entry = mipsList.get(i);
            if (entry.opCode.equals("beginGlobal")) {
                triger ^= 1;
            } else if (entry.opCode.equals("endGlobal")) {
                triger ^= 1;
            } else {
                if (triger == 1) {
                    globalInstruction.add(entry);
                }
            }
        }

        boolean[] uselessBoolean = new boolean[mipsList.size()];
        for (int i = 0; i < mipsList.size(); i++) {
            uselessBoolean[i] = false;
        }

        for (int i = 0;i < mipsList.size(); i++) {
            mipsInstruction entry = mipsList.get(i);
            if (entry.opCode.equals("b")) {
                mipsInstruction nxtInstruction = mipsList.get(i + 1);
                if (nxtInstruction.opCode.equals("Label") && nxtInstruction.source1.equals(entry.source1)) {
                    mipsList.remove(i);
                }
            }
        }

        boolean flag = false;
        HashMap<String, String> mm = new HashMap<>();
        ArrayList<String> uselessLabel = new ArrayList<>();
        do{
            flag = false;
            mm.clear();
            String exchangeLabel = "";
            for (int i = 0; i < mipsList.size(); i++) {
                mipsInstruction entry = mipsList.get(i);
                if (entry.opCode.equals("Label")) {
                    if (uselessLabel.contains(entry.source1)) {
                        continue;
                    }
                    mipsInstruction nxtEntry = mipsList.get(i + 1);
                    if (uselessLabel.contains(nxtEntry.source1)) {
                        continue;
                    }
                    if (nxtEntry.opCode.equals("Label")) {
                        mm.put(entry.source1, nxtEntry.source1);
                        uselessLabel.add(entry.source1);
                        flag = true;
                        exchangeLabel = entry.source1;
                        //System.out.println("$$ " + entry.toString() + " " + nxtEntry.toString());
                        break;
                    }
                }
            }
            if (flag) {
                for (int i = 0; i < mipsList.size(); i++) {
                    mipsInstruction entry = mipsList.get(i);
                    if (entry.opCode.equals("bne") || entry.opCode.equals("beq")) {
                        if (entry.target1.equals(exchangeLabel)) {
                            entry.target1 = mm.get(exchangeLabel);
                        }
                    }
                    if (entry.opCode.equals("b")) {
                        if (entry.source1.equals(exchangeLabel)) {
                            entry.source1 = mm.get(exchangeLabel);
                        }
                    }
                }
            }
        }while(flag == true);

        for (int i = 0; i < mipsList.size(); i++) {
            //System.out.println(entry);
            mipsInstruction entry = mipsList.get(i);
            if (entry.opCode.equals("setStaticString")) {
                continue;
            }
            if (entry.opCode.equals("beginGlobal")) {
                int pos = i;
                for (int j = i;j < mipsList.size(); j++) {
                    if (mipsList.get(j).opCode.equals("endGlobal")) {
                        pos = j;
                        break;
                    }
                }
                i = pos;
            } else {
                if (entry.opCode.equals("lw")) {
                    mipsInstruction preEntry = mipsList.get(i - 1);
                    if (preEntry.opCode.equals("sw")) {
                        //System.out.println("!!");
                        if ((preEntry.source1.equals(entry.source1)) && (preEntry.target1.equals(entry.target1))) {
                            continue;
                        }
                    }
                }
                // TODO: BELOW MAYBE DANGEROUS
                if (entry.opCode.equals("lw")) {
                    mipsInstruction nxtEntry = mipsList.get(i + 1);
                    if (nxtEntry.opCode.equals("li") || nxtEntry.opCode.equals("lw")) {
                        //System.out.println("!!");
                        if ((nxtEntry.source1.equals(entry.source1)) && (nxtEntry.target1.contains(nxtEntry.source1) == false)) {
                            //System.out.println(entry);
                            //System.out.println(nxtEntry);
                            continue;
                        }
                    }
                }

                if (entry.opCode.equals("bne")) {
                    String true_label = entry.target1;
                    mipsInstruction nxtInstruction = mipsList.get(i + 2);
                    if (nxtInstruction.opCode.equals("Label") && nxtInstruction.source1.equals(true_label)) {
                        continue;
                    }
                } else {
                    if (entry.opCode.equals("beq")) {
                        String false_label = entry.target1;
                        mipsInstruction nxtInstruction = mipsList.get(i + 1);
                        if (nxtInstruction.opCode.equals("Label") && nxtInstruction.source1.equals(false_label)) {
                            continue;
                        }
                    }
                }
                /*
                if (entry.opCode.equals("b")) {
                    mipsInstruction nxtInstruction = mipsList.get(i + 1);
                    if (nxtInstruction.opCode.equals("Label") && nxtInstruction.source1.equals(entry.source1)) {
                        continue;
                    }
                }
                */
                if (entry.opCode.equals("Label") && uselessLabel.contains(entry.source1)) {
                   // System.out.println("! " + entry.toString());
                    continue;
                }
                output.write(entry.toString());
                if (entry.opCode.equals("Label") && entry.source1.equals("main")) {
                    //System.out.println("!!! " + entry.toString());
                    for (mipsInstruction globalInstr : globalInstruction) {
                        output.write(globalInstr.toString());
                    }
                }
            }
        }
        output.close();
    }

    public void addInstruction(String opCode, String s1, String s2, String t1, String t2) {
        mipsInstruction mipsInstr = new mipsInstruction(opCode, s1, s2, t1, t2);
        mipsList.add(mipsInstr);
    }

    public String getRNum(String Rdest) {
        if (Rdest.indexOf("r") == -1) {
            return Rdest;
        }
        if (registerAllocate.containsKey(Rdest)) {
            return address(Rdest);
        }
        if (trans(Rdest) != "!") {
            return trans(Rdest);
        }
        if (globalRegister.contains(Rdest)) {
            return Rdest;
        }
        if (registerTable.get(Rdest) == null) {
           //
            // System.out.println(Rdest + " !!!!!");
            return null;
        } else {
            if (Rdest.contains("@")) {
             //System.out.println("wtf " + Rdest);
                return null;
            }
            int tmpOffset = registerTable.get(Rdest);
            //nowOffset = max(nowOffset, -tmpOffset + 4);
            //System.out.println(Rdest + " " + String.valueOf(tmpOffset));
            //nowOffset = max(nowOffset, 4);
            return String.valueOf(tmpOffset) + pfp;
        }
        /*
        Rdest = Rdest.substring(1, Rdest.length());
        int cnt = Integer.valueOf(Rdest) - 9;
        //System.out.println(Rdest + " " + String.valueOf(cnt));
        int offset = 0;
        for (int i = 0; i < cnt; i++) {
            offset -= 4;
        }
        if (offset == 0) {
            return "0";
        } else {
            maxOffset = max(maxOffset, -(offset + stackSize));
            return String.valueOf(offset + stackSize);
        }
        */
    }

    public String sp = "$sp";
    public String fp = "$fp";
    public String syscall = "syscall";
    public String a0 = "$a0";
    public String a1 = "$a1";
    public String v0 = "$v0";
    public String t0 = "$t0";
    public String t1 = "$t1";
    public String t2 = "$t2";
    public String pfp = "($fp)";
    public String psp = "($sp)";
    public String ra = "$ra";
    public String zero = "$zero";
    public String s0 = "$s0";
    public String s1 = "$s1";
    public String s2 = "$s2";
    public String s3 = "$s3";
    public String s4 = "$s4";
    public String s5 = "$s5";
    public String s6 = "$s6";
    public String s7 = "$s7";
    public String t3 = "$t3";


    public String trans(String str) {
        if (registerAllocate.containsKey(str)) {
            return registerAllocate.get(str);
        }
        if (str.equals("r0")) {
            return a0;
        } else if (str.equals("r1")) {
            return "$a1";
        } else if (str.equals("r2")) {
            return "$a2";
        } else if (str.equals("r3")) {
            return "$a3";
        } else if (str.equals("r4")) {
            return v0;
        } else if (str.equals("r5")) {
            return "$v1";
        } else if (str.equals("r6")) {
            return fp;
        } else if (str.equals("r7")) {
            return sp;
        } else if (str.equals("r8")) {
            return ra;
        } else {
            return "!";
        }
    }

    public int ordNum = 0;

    public String address(String str) {
        return "(" + str + ")";
    }

    public String change(String str,int pos,int kind) {

        if (registerAllocate.containsKey(str)) {
            return registerAllocate.get(str);
        }
        if (globalRegister.contains(str)) {
            addInstruction("lw", "$t" + String.valueOf(pos), null, str, null);
            return "$t" + String.valueOf(pos);
        }

        if (str.indexOf("r") == -1) {
            if (str.equals("true")) {
                str = "1";
            } else if (str.equals("false") || str.equals("null")){
                str = "0";
            }
            return str;
        } else {
            if (str.contains("@")) {
                addInstruction("lw", "$t" + String.valueOf(pos), null, getRNum(str.substring(1, str.length())), null);
                /*
                if (kind == 1) {
                    addInstruction("lw", "$t" + String.valueOf(pos + 3), null, address("$t" + String.valueOf(pos)), null);
                }
                */
                return "$t" + String.valueOf(pos);
            }
            if (trans(str) != "!") {
                //TODO: MAYBE A BIG BUG
                return trans(str);
            } else {
                //System.out.println("! " + str);
                if (kind == 1) {
                    addInstruction("lw", "$t" + String.valueOf(pos), null, getRNum(str), null);
                } else {
                    //  System.out.println(str);
                    //  System.out.println("lw " + pos + " " + getRNum(str));
                }
                return "$t" + String.valueOf(pos);
            }
        }
    }

    public void Translate() {
        for (int i = 0; i < ILOCLIST.size(); i++) {
            Instruction instr = ILOCLIST.get(i);
            //System.out.println("! " + instr);
            if (instr.opCode.equals("beginGlobal")) {
                addInstruction("beginGlobal", null, null, null, null);
            }
            if (instr.opCode.equals("endGlobal")) {
                addInstruction("endGlobal", null, null, null, null  );
            }
            if (instr.opCode.equals("Label")) {
                String labelName = instr.source1;
                //System.out.println(labelName);
                if (labelName.length() >= 4 && labelName.substring(0, 4).equals("main")) {
                    addInstruction("Label", "main", null, null, null);
                    addInstruction("move", "$fp", null, "$sp", null);
                } else {
                    addInstruction("Label", labelName, null, null, null);
                }
            }

            if (instr.opCode.equals("sb")) {
                String Rdest =  instr.target2;
                String Rsrc  =  instr.source1;
                String offset = instr.target1;
                String t_0   = change(Rsrc, 0, 1);
                addInstruction("sb", t_0, null, offset + address(trans(Rdest)), null);
            }

            if (instr.opCode.equals("loadI")) {
                String Rsrc = instr.target1;
                String Imm   = instr.source1;
                if (Imm.equals("true")) {
                    Imm = "1";
                } else if (Imm.equals("false")) {
                    Imm = "0";
                } else if (Imm.equals("null")) {
                    Imm = "0";
                }
/*
                if (Rdest.contains("@")) {
                    addInstruction("li", t0, null, Imm, null);
                    addInstruction("lw", t1, null, getRNum(Rdest.substring(1, Rdest.length())), null);
                    addInstruction("sw", t0, null, "(" + t1 +")", null);
                    continue;
                }
*/
                if (Rsrc.contains("@") == false) {
                    String t_0 = change(Rsrc, 0, 0);
                    addInstruction("li", t_0, null, Imm, null);
                    if (trans(Rsrc) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rsrc), null);
                    }
                } else {
                    //String r_0 = change(Rdest, 0);
                    addInstruction("li", "$t6", null, Imm, null);
                    addInstruction("sw", "$t6", null, address(t0), null);

                }
                /*
                addInstruction("li", "$t0", null, Imm, null);
                if (Rdest.equals("r4")) {
                    addInstruction("li", v0, null, Imm, null);
                } else {
                    String Roffset = getRNum(Rdest);
                    addInstruction("sw", "$t0", null, Roffset + pfp, null);

                }
                */
            }

            if (instr.opCode.equals("loadAI")) {
                String Rdest = instr.target1;
                String Rsrc  = instr.source1;
                String Imm   = instr.source2;
                String t_0   = change(Rdest, 0, 0);
                String t_1   = change(Rsrc, 1, 1);
                addInstruction("lw", t_0, null, Imm + "(" + t_1 + ")", null);
            }

            if (instr.opCode.equals("i2i")) {
                String Rdest = instr.target1;
                String Rsrc  = instr.source1;
                //if (Rsrc.equals("r9")) {
                //    addInstruction("www", null, null, null, null);
                //}
                String t_0   = change(Rdest, 0, 0);
                String t_1   = change(Rsrc, 1, 1);
                /*
                if (Rsrc.contains("@")) {
                    if (registerAllocate.containsKey(Rsrc.substring(1, Rsrc.length() - 1))) {
                        addInstruction("lw", t0, null, address(t_0), null);
                    } else {
                        addInstruction("lw", t_0, null, address(t_0), null);
                    }
                }
                */
                if (Rsrc.contains("@")) {
                    addInstruction("lw", t1, null, address(t_1), null);
                }
                if (Rdest.contains("@")) {
                    addInstruction("sw", t1, null, address(t_0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t1, null, getRNum(Rdest), null);
                    } else {
                        addInstruction("move", t_0, null, t1, null);
                    }
                }

                /*
                addInstruction("move", t_0, null, t_1, null);
                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0)   , null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }
                */

            }
            if (instr.opCode.equals("mult")) {
                String Rdest = instr.target1;
                String Rsrc1 = instr.source1;
                String Rsrc2 = instr.source2;
                /*
                addInstruction("lw", t1, null, getRNum(Rsrc1) , null);
                addInstruction("lw", t2, null, getRNum(Rsrc2) , null);
                addInstruction("mul", t0, null, t1, t2);
                addInstruction("sw", t0, null, getRNum(Rdest) , null);
                */
                String t_0 = change(Rdest, 0, 0);
                String t_1 = change(Rsrc1, 1, 1);
                String t_2 = change(Rsrc2, 2, 1);
                addInstruction("mul", t_0, null, t_1, t_2);
                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }
            }
            if (instr.opCode.equals("multI")) {
                //System.out.println(instr + " wtf");
                String Rdest = instr.target1;
                String Rsrc  = instr.source1;
                String Imm   = instr.source2;
                String t_0   = change(Rdest, 0, 0);
                String t_1   = change(Rsrc , 1, 1);
                addInstruction("mul", t_0, null, t_1, Imm);
                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }
            }
            if (instr.opCode.equals("add")) {
                String Rdest = instr.target1;
                String Rsrc1 = instr.source1;
                String Rsrc2 = instr.source2;
                String t_0   = change(Rdest, 0, 0);
                String t_1   = change(Rsrc1, 1, 1);
                String t_2   = change(Rsrc2, 2, 1);
                //System.out.println(Rsrc2 + " " + t_2 + " !!");
                addInstruction("add", t_0, null, t_1, t_2);
                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }
            }
            if (instr.opCode.equals("addI")) {
                String Rsrc  = instr.source1;
                String Imm   = instr.source2;
                String Rdest = instr.target1;
                String t_0   = change(Rdest, 0, 0);
                String t_1   = change(Rsrc , 1, 1);

                addInstruction("add", t_0, null, t_1, Imm);
                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }

            }

            if (instr.opCode.equals("rem")) {
                String Rdest = instr.target1;
                String Rsrc1 = instr.source1;
                String Rsrc2 = instr.source2;
                String t_0   = change(Rdest, 0, 0);
                String t_1   = change(Rsrc1, 1, 1);
                String t_2   = change(Rsrc2, 2, 1);
                /*
                addInstruction("add", t_0, null, t_1, t_2);
                if (trans(Rdest) == "!") {
                    addInstruction("sw", t_0, null, getRNum(Rdest) , null);
                }
                */
                addInstruction("rem", t_0, null, t_1, t_2);
                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }
            }

            if (instr.opCode.equals("remI")) {
                String Rsrc  = instr.source1;
                String Imm   = instr.source2;
                String Rdest = instr.target1;
                String t_0   = change(Rdest, 0, 0);
                String t_1   = change(Rsrc , 1, 1);
                addInstruction("rem", t_0, null, t_1, Imm);
                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }

            }

            if (instr.opCode.equals("sub")) {
                String Rdest = instr.target1;
                String Rsrc1 = instr.source1;
                String Rsrc2 = instr.source2;
                String t_0   = change(Rdest, 0, 0);
                String t_1   = change(Rsrc1, 1, 1);
                String t_2   = change(Rsrc2, 2, 1);
                addInstruction("sub", t_0, null, t_1, t_2);
                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }
            }
            if (instr.opCode.equals("subI")) {
                String Rsrc  = instr.source1;
                String Imm   = instr.source2;
                String Rdest = instr.target1;
                String t_0   = change(Rdest, 0, 0);
                String t_1   = change(Rsrc , 1, 1);
                addInstruction("sub", t_0, null, t_1, Imm);
                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }
            }
            if (instr.opCode.equals("div")) {
                String Rdest = instr.target1;
                String Rsrc1 = instr.source1;
                String Rsrc2 = instr.source2;
                String t_0   = change(Rdest, 0, 0);
                String t_1   = change(Rsrc1, 1, 1);
                String t_2   = change(Rsrc2, 2, 1);

                addInstruction("div", t_0, null, t_1, t_2);
                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }
            }
            if (instr.opCode.equals("divI")) {
                String Rsrc  = instr.source1;
                String Imm   = instr.source2;
                String Rdest = instr.target1;
                String t_0   = change(Rdest, 0, 0);
                String t_1   = change(Rsrc , 1, 1);
                addInstruction("div", t_0, null, t_1, Imm);
                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }
            }
            if (instr.opCode.equals("or")) {
                String Rdest = instr.target1;
                String Rsrc1 = instr.source1;
                String Rsrc2 = instr.source2;
                String t_0   = change(Rdest, 0, 0);
                String t_1   = change(Rsrc1, 1, 1);
                String t_2   = change(Rsrc2, 2, 1);

                addInstruction("or", t_0, null, t_1, t_2);
                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }
            }
            if (instr.opCode.equals("orI")) {
                String Rsrc  = instr.source1;
                String Imm   = instr.source2;
                String Rdest = instr.target1;
                String t_0   = change(Rdest, 0, 0);
                String t_1   = change(Rsrc , 1, 1);
                addInstruction("or", t_0, null, t_1, Imm);
                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }
            }
            if (instr.opCode.equals("and")) {
                String Rdest = instr.target1;
                String Rsrc1 = instr.source1;
                String Rsrc2 = instr.source2;
                String t_0   = change(Rdest, 0, 0);
                String t_1   = change(Rsrc1, 1, 1);
                String t_2   = change(Rsrc2, 2, 1);

                addInstruction("and", t_0, null, t_1, t_2);
                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }
                /*
                addInstruction("lw", t1, null, getRNum(Rsrc1) , null);
                addInstruction("lw", t2, null, getRNum(Rsrc2) , null);
                addInstruction("and", t0, null, t1, t2);
                addInstruction("sw", t0, null, getRNum(Rdest) , null);
                */
            }
            if (instr.opCode.equals("andI")) {
                String Rsrc  = instr.source1;
                String Imm   = instr.source2;
                String Rdest = instr.target1;
                String t_0   = change(Rdest, 0, 0);
                String t_1   = change(Rsrc , 1, 1);
                addInstruction("and", t_0, null, t_1, Imm);
                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }
            }

            if (instr.opCode.equals("cmp_NE")) {
                String Rsrc1 = instr.source1;
                String Rsrc2 = instr.source2;
                String Rdest = instr.target1;
                String t_0   = change(Rdest, 0, 0);
                String t_1   = change(Rsrc1, 1, 1);
                String t_2   = change(Rsrc2, 2, 1);
                addInstruction("sne", t_0, null, t_1, t_2);

                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }

            }
            if (instr.opCode.equals("cmp_LT")) {
                String Rsrc1 = instr.source1;
                String Rsrc2 = instr.source2;
                String Rdest = instr.target1;
                String t_0 = change(Rdest, 0, 0);
                String t_1 = change(Rsrc1, 1, 1);
                String t_2 = change(Rsrc2, 2, 1);
                addInstruction("slt", t_0, null, t_1, t_2);

                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }

                /*
                addInstruction("lw", t1, null, getRNum(Rsrc1) , null);
                if (Rsrc2.indexOf("r") != -1) {
                    addInstruction("lw", t2, null, getRNum(Rsrc2) , null);
                    addInstruction("slt", t0, null, t1, t2);
                } else {
                    addInstruction("slt", t0, null, t1, Rsrc2);
                }
                addInstruction("sw", t0, null, getRNum(Rdest) , null);
                */
            }
            if (instr.opCode.equals("cmp_LE")) {
                String Rsrc1 = instr.source1;
                String Rsrc2 = instr.source2;
                String Rdest = instr.target1;
                //System.out.println(instr + " " + Rsrc1 + " " + trans(Rsrc1) +  "!");
                String t_0 = change(Rdest, 0, 0);
                String t_1 = change(Rsrc1, 1, 1);
                String t_2 = change(Rsrc2, 2, 1);
                addInstruction("sle", t_0, null, t_1, t_2);

                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }

            }
            if (instr.opCode.equals("cmp_GT")) {
                String Rsrc1 = instr.source1;
                String Rsrc2 = instr.source2;
                String Rdest = instr.target1;
                //System.out.println(instr + " " + Rsrc1 + " " + trans(Rsrc1) +  "!");
                String t_0 = change(Rdest, 0, 0);
                String t_1 = change(Rsrc1, 1, 1);
                String t_2 = change(Rsrc2, 2, 1);
                addInstruction("sgt", t_0, null, t_1, t_2);

                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }

            }
            if (instr.opCode.equals("cmp_GE")) {
                String Rsrc1 = instr.source1;
                String Rsrc2 = instr.source2;
                String Rdest = instr.target1;
                //System.out.println(instr + " " + Rsrc1 + " " + trans(Rsrc1) +  "!");
                String t_0 = change(Rdest, 0, 0);
                String t_1 = change(Rsrc1, 1, 1);
                String t_2 = change(Rsrc2, 2, 1);
                addInstruction("sge", t_0, null, t_1, t_2);

                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }

            }
            if (instr.opCode.equals("cmp_EQ")) {
                String Rsrc1 = instr.source1;
                String Rsrc2 = instr.source2;
                String Rdest = instr.target1;
                //System.out.println(instr + " " + Rsrc1 + " " + trans(Rsrc1) +  "!");
                String t_0 = change(Rdest, 0, 0);
                String t_1 = change(Rsrc1, 1, 1);
                String t_2 = change(Rsrc2, 2, 1);
                addInstruction("seq", t_0, null, t_1, t_2);

                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t0, null, getRNum(Rdest), null);
                    }
                }


            }
            if (instr.opCode.equals("cbr")) {
                String LT = instr.target1;
                String LF = instr.target2;
                String Rsrc = instr.source1;
                String t_0  = change(Rsrc, 0, 1);
                //addInstruction("lw", t0, null, getRNum(Rsrc), null);
                addInstruction("bne", t_0, zero, LT, null);
                addInstruction("beq", t_0, zero, LF, null);
                //addInstruction("bne", t0, zero, LT, null);
                //addInstruction("beq", t0, zero, LF, null);
            }
            if (instr.opCode.equals("not")) {
                String Rsrc  = instr.source1;
                String Rdest = instr.target1;
                addInstruction("lw", t0, null, getRNum(Rdest), null);
                addInstruction("lw", t1, null, getRNum(Rsrc ), null);
                addInstruction("not", t0, null, t1, null);
            }
            if (instr.opCode.equals("lnot")) {
                String Rsrc  = instr.source1;
                String Rdest = instr.target1;
                addInstruction("lw", t1, null, getRNum(Rsrc ), null);
                addInstruction("seq", t0, null, t1, zero);
                addInstruction("sw", t0, null, getRNum(Rdest), null);
            }
            if (instr.opCode.equals("jr")) {
                addInstruction("jr", ra, null, null, null);
            }
            if (instr.opCode.equals("jump")) {
                String label = instr.source1;
                addInstruction("b", label, null, null, null);
            }

            if (instr.opCode.equals("jal")) {
                String label = instr.source1;
                //addInstruction("add", sp, null, sp, String.valueOf(maxOffset - 4));
                addInstruction("jal", label, null, null, null);
            }

            if (instr.opCode.equals("iwillcall")) {
              /*
                addInstruction("move", t0, null, a0, null);
                addInstruction("li", v0, "1", null, null);
                addInstruction("move", a0, null, sp, null);
                addInstruction("syscall", null, null, null, null);
                addInstruction("move", a0, null, t0, null);
                addInstruction("li", v0, "4", null, null);
                addInstruction("la", a0, null, "NEWLINE", null);
                addInstruction("syscall", null, null, null, null);
                addInstruction("move", a0, null, t0, null);
               */
                //addInstruction("sub", sp, null, sp, String.valueOf(nowOffset));
                addInstruction("add", sp, null, sp, String.valueOf(-40 + nowOffset.get(Integer.valueOf(instr.source1))));
                // registerTable.beginScope();
                //offsetList.add(nowOffset);
                //nowOffset = 0;
            }

            if (instr.opCode.equals("callstorefix")) {
                String Rsrc   = instr.source1;
                String Imm    = instr.source2;
                String Rdest  = instr.target1;
                String offset = instr.target2;
                if (Imm != null) {
                    addInstruction("li", t0, null, Imm, null);
                    addInstruction("sw", Rsrc, null, offset + address(trans(Rdest)), null);
                } else {
                    String t_0 = change(Rsrc , 0, 1);
                    addInstruction("sw", t_0, null, offset + address(trans(Rdest)), null);
                }
            }

            if (instr.opCode.equals("callstore") || instr.opCode.equals("callstoreAI")) {
                String Rsrc   = instr.source1;
                String Rdest  = instr.target1;
                String offset = instr.target2;
                // offset = String.valueOf(Integer.valueOf(offset) - 4 - maxOffset);
                addInstruction("sw", trans(Rsrc), null, offset + "(" + trans(Rdest) + ")", null);
            }

            if (instr.opCode.equals("calli2i")) {
                String Rsrc  = instr.source1;
                String Rdest = instr.target1;
                String t_0   = change(Rdest, 0, 0);
                String t_1   = change(Rsrc,  1, 1);
                addInstruction("move", t_0, null, t_1, null);
                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }
                /*
                if (trans(Rsrc) == "!") {
                    addInstruction("lw", trans(Rdest), null, getRNum(Rsrc), null);
                } else {
                    addInstruction("move", trans(Rdest), null, trans(Rsrc), null);
                }
                */
            }

            if (instr.opCode.equals("callsubI")) {
                String Rdest = instr.target1;
                String Rsrc  = instr.source1;
                String Imm   = instr.source2;
                addInstruction("sub", trans(Rdest), null, trans(Rsrc), Imm);
            }

            if (instr.opCode.equals("callloadI")) {
                String Rdest = instr.target1;
                String Imm   = instr.source1;
                addInstruction("li", trans(Rdest), null, Imm, null);
            }

            if (instr.opCode.equals("callloadAI")) {
                String Rdest  = instr.target1;
                String Rsrc   = instr.source1;
                String offset = instr.source2;
                //   offset = String.valueOf(Integer.valueOf(offset) - 4 - maxOffset);
                addInstruction("lw", trans(Rdest), null, offset + "(" + trans(Rsrc) + ")", null);
            }

            if (instr.opCode.equals("calladdI")) {
                String Rdest = instr.target1;
                String Rsrc  = instr.source1;
                String Imm   = instr.source2;
                addInstruction("add", trans(Rdest), null, trans(Rsrc), Imm);
            }

            if (instr.opCode.equals("sbrk")) {
                String space = instr.source1;
                addInstruction("li", v0, null, String.valueOf(9), null);
                addInstruction("move", "$t0", null, a0, null);
                if (space.contains("r") == false) {
                    addInstruction("li", a0, null, space, null);
                } else {
                    String t_1 = change(space, 1, 1);
                    addInstruction("move", a0, null, t_1, null);
                    if (space.contains("@")) {
                        addInstruction("lw", a0, null, address(t1), null);
                    } else {
                        if (trans(space) == "!") {
                            addInstruction("sw", t_1, null, getRNum(space), null);
                        }
                    }
                }
                addInstruction("syscall", null, null, null, null);
                addInstruction("move", a0, null, "$t0", null);
            }

            if (instr.opCode.equals("store")) {
                String Rdest  = instr.target1;
                String offset = instr.target2;
                String Rsrc   = instr.source1;
                //addInstruction("sss1", null, null, null, null);
                String t_0    = change(Rsrc,  0, 1);
                //addInstruction("sss2", null, null, null, null);
                String t_1    = change(Rdest, 1, 0);
                // addInstruction("sss3", null, null, null, null);
                addInstruction("sw", t_0, null, offset + address(t_1), null);
            }

            if (instr.opCode.equals("storeI")) {
                String Imm   = instr.source1;
                String Rdest  = instr.target1;
                String offset = instr.target2;
                String t_0 = change(Rdest, 0, 1);
                addInstruction("li", t1, null, Imm, null);
                addInstruction("sw", t1, null, offset + "(" + t_0 + ")", null);
            }

            if (instr.opCode.equals("la")) {
                addInstruction("la", t0, null, instr.target1, null);
                addInstruction("sw", t0, null, getRNum(instr.source1), null);
            }

            if (instr.opCode.equals("fix1")) {
                String Rdest = instr.target1;
                String Raddr = instr.source1;
                String t_0   = change(Rdest, 0, 0);
                addInstruction("lw", t_0, null, Raddr, null);
                addInstruction("sw", t_0, null, getRNum(Rdest), null);
            }

            if (instr.opCode.equals("read_int")) {
                addInstruction("li", v0, null, "5", null);
                addInstruction("syscall", null, null, null, null);
            }

            if (instr.opCode.equals("getString")) {
                addInstruction("move", s0, null, a0, null);
                addInstruction("move", s1, null, a1, null);
                addInstruction("li", v0, null, String.valueOf(9), null);
                addInstruction("li", a0, null, String.valueOf(260), null);
                addInstruction("syscall", null, null, null, null);



                addInstruction("add", v0, null, v0, String.valueOf(4));
                addInstruction("li", t1, null, String.valueOf(0), null);
                addInstruction("sb", t1, null, address(v0), null);

                addInstruction("move", t0, null, v0, null);
                addInstruction("li", v0, null, String.valueOf(8), null);
                addInstruction("move", a0, null, t0, null);
                addInstruction("li", a1, null, String.valueOf(255), null);
                addInstruction("syscall", null, null, null, null);

                addInstruction("move", t1, null, t0, null);
                addInstruction("li", t2, null, String.valueOf(0), null);
                ++getStringNum;
                addInstruction("Label", "begin_count" + getStringNum, null, null, null);
                addInstruction("lb", t3, null, address(t1), null);
                addInstruction("beqz", t3, "end_count" + getStringNum, null, null);
                addInstruction("add", t1, null, t1, "1");
                addInstruction("add", t2, null, t2, "1");
                addInstruction("b", "begin_count" + getStringNum, null, null, null);
                addInstruction("Label", "end_count" + getStringNum, null, null, null);

                addInstruction("sub", t0, null, t0, String.valueOf(4));
                addInstruction("sw", t2, null, address(t0), null);

                String Rdest = instr.source1;
                String t_1   = change(Rdest, 1, 1);

                if (instr.source1.contains("@")) {
                    addInstruction("sw", t0, null, address(t1), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t0, null, getRNum(Rdest), null);
                    } else {
                        addInstruction("move", trans(Rdest), null, t0, null);
                    }
                }

                addInstruction("move", a0, null, s0, null);
                addInstruction("move", a1, null, s1, null);
            }

            if (instr.opCode.equals("setStaticString")) {
                addInstruction("setStaticString", instr.source1, instr.source2, null, null);
            }

            if (instr.opCode.equals("print_statString")) {
                /*
                String statString = instr.source1;
                addInstruction("li", v0, null, String.valueOf(4), null);
                addInstruction("move", "$t7", null, a0, null);
                addInstruction("la", a0, null, statString, null);
                addInstruction("syscall", null, null, null, null);
                addInstruction("move", a0, null, "$t7", null);
                */
                String statString = instr.source1;
                addInstruction("li", v0, null, String.valueOf(4), null);
                addInstruction("move", "$t7", null, a0, null);
                addInstruction("la", a0, null, statString, null);
                addInstruction("syscall", null, null, null, null);
                addInstruction("move", a0, null, "$t7", null);
            }

            if (instr.opCode.equals("print_statString_ss")) {
                /*
                String statString = instr.source1;
                addInstruction("li", v0, null, String.valueOf(4), null);
                addInstruction("move", "$t7", null, a0, null);
                addInstruction("la", a0, null, statString, null);
                addInstruction("syscall", null, null, null, null);
                addInstruction("move", a0, null, "$t7", null);
                */
                String statString = instr.source1;
                addInstruction("li", v0, null, String.valueOf(4), null);
                addInstruction("la", a0, null, statString, null);
                addInstruction("syscall", null, null, null, null);
            }

            if (instr.opCode.equals("print_statStringln")) {
                String statString = instr.source1;
                addInstruction("li", v0, null, String.valueOf(4), null);
                addInstruction("move", "$t7", null, a0, null);
                addInstruction("la", a0, null, statString + "ln", null);
                addInstruction("syscall", null, null, null, null);
                addInstruction("move", a0, null, "$t7", null);
            }

            if (instr.opCode.equals("print_string")) {
                String Rsrc = instr.source1;
                String t_0  = change(Rsrc, 0, 1);
                addInstruction("move", "$s0", null, t_0, null);
                addInstruction("add", "$s0", null, "$s0", String.valueOf(4));
                addInstruction("li", v0, null, String.valueOf(4), null);
                addInstruction("move", "$t7", null, a0, null);
                addInstruction("move", a0, null, "$s0", null);
                addInstruction("syscall", null, null, null, null);
                addInstruction("move", a0, null, "$t7", null);
            }

            if (instr.opCode.equals("print_string_ss")) {
                String Rsrc = instr.source1;
                String t_0  = change(Rsrc, 0, 1);
                addInstruction("move", "$s0", null, t_0, null);
                addInstruction("add", "$s0", null, "$s0", String.valueOf(4));
                addInstruction("li", v0, null, String.valueOf(4), null);
                addInstruction("move", a0, null, "$s0", null);
                addInstruction("syscall", null, null, null, null);
            }

            if (instr.opCode.equals("print_stringln")) {
                String Rsrc = instr.source1;
                String t_0  = change(Rsrc, 0, 1);
                //  System.out.println(t_0);
                addInstruction("move", "$s0", null, t_0, null);
                addInstruction("add", "$s0", null, "$s0", String.valueOf(4));
                addInstruction("li", v0, null, String.valueOf(4), null);
                addInstruction("move", "$t7", null, a0, null);
                addInstruction("move", a0, null, "$s0", null);
                addInstruction("syscall", null, null, null, null);
                //addInstruction("move", a0, null, "$t7", null);
                addInstruction("li", v0, null, String.valueOf(4), null);
                //addInstruction("move", "$t7", null, a0, null);
                addInstruction("la", a0, null, "NEWLINE", null);
                addInstruction("syscall", null, null, null, null);
                addInstruction("move", a0, null, "$t7", null);

            }
            if (instr.opCode.equals("output")) {
                String Rsrc = instr.source1;
                String t_0  = change(Rsrc, 0, 1);
                addInstruction("move", "$t7", null, a0, null);
                if (t_0.contains("$")) {
                    addInstruction("move", a0, null, t_0, null);
                } else {
                    addInstruction("li", a0, null, t_0, null);
                }
                addInstruction("li", v0, null, String.valueOf(1), null);
                addInstruction("syscall", null, null, null, null);
                addInstruction("move", a0, null, "$t7", null);

            }
            if (instr.opCode.equals("get_size")) {
                String Rsrc  = instr.source1;
                String Rdest = instr.target1;
               /*
                if (Rsrc.contains("@") == false) {
                    Rsrc = "@" + Rsrc;
                }
                */
                String t_0   = change(Rdest, 0, 1);
                String t_1   = change(Rsrc,  1, 1);
                addInstruction("lw", t_1, null, address(t_1), null);
                //System.out.println(Rdest + " " + Rsrc);
                addInstruction("move", t_0, null, t_1, null);
                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }
            }

            if (instr.opCode.equals("get_length")) {
                String Rsrc  = instr.source1;
                String Rdest = instr.target1;
                String t_0   = change(Rdest, 0, 1);
                String t_1   = change(Rsrc,  1, 1);
                addInstruction("lw", t_1, null, address(t_1), null);
                addInstruction("move", t_0, null, t_1, null);
                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }
            }

            if (instr.opCode.equals("get_ord")) {
                String Rsrc  = instr.source1;
                String Rdest = instr.target1;
                String pos   = instr.source2;
                String t_0   = change(Rdest, 0, 1);
                String t_1   = change(Rsrc,  1, 1);
                String t_2   = change(pos,   2, 1);
                //addInstruction("lw", t_1, null, address(t_1), null);
                addInstruction("add", t_1, null, t_1, String.valueOf(4));
                addInstruction("add", t_1, null, t_1, t_2);
                addInstruction("lb", t_0, null, address(t_1), null);
                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }
            }

            if (instr.opCode.equals("neg")) {
                String Rsrc  = instr.source1;
                String Rdest = instr.target1;
                String t_0 = change(Rdest, 0, 1);
                String t_1 = change(Rsrc , 1, 1);
                addInstruction("neg", t_0, null, t_1, null);
                if (Rdest.contains("@")) {
                    addInstruction("sw", t_0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", t_0, null, getRNum(Rdest), null);
                    }
                }

            }

            if (instr.opCode.equals("get_substring_lietral")) {

                addInstruction("move", s0, null, a0, null);

                String Rdest = instr.source2;
                String Rsrc  = instr.source1;
                String L     = instr.target1;
                String R     = instr.target2;
                //String t_1   = change(Rsrc, 1, 1);
                addInstruction("la", t1, null, "s" + Rsrc, null);
                String Lpos  = change(L, 0, 1);
                String Rpos  = change(R, 2, 1);
                addInstruction("move", s0, null, a0, null);

                addInstruction("li", v0, null, String.valueOf(9), null);
                addInstruction("sub", a0, null, Rpos, Lpos);
                addInstruction("move", s1, null, a0, null);
                addInstruction("add", s1, null, s1, "1");
                addInstruction("add", a0, null, a0, "6");
                addInstruction("syscall", null, null, null, null);
                addInstruction("sw", s1, null, address(v0), null);
                addInstruction("move", s4, null, v0, null);
                addInstruction("add", v0, null, v0, String.valueOf(4));

                //addInstruction("add", t1, null, t1, "4");
                addInstruction("add", t1, null, t1, Lpos);
                ++subStringNum;

                addInstruction("li", s5, null, "0", null);
                addInstruction("Label", "begin_substring" + subStringNum, null, null, null);
                addInstruction("lb", s2, null, address(t1), null);
                addInstruction("sb", s2, null, address(v0), null);
                addInstruction("add", t1, null, t1, "1");
                addInstruction("add", v0, null, v0, "1");
                addInstruction("add", s5, null, s5, "1");
                addInstruction("slt", s3, null, s5, s1);
                addInstruction("beqz", s3, null, "end_substring" + subStringNum, null);
                addInstruction("b", "begin_substring" + subStringNum, null, null, null);
                addInstruction("Label", "end_substring" + subStringNum, null, null, null);

                addInstruction("li", s2, null, String.valueOf(0), null);
                addInstruction("sb", s2, null, address(v0), null);

                String t_0 = change(Rdest, 0, 0);
                if (Rdest.contains("@")) {
                    addInstruction("sw", s4, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", s4, null, getRNum(Rdest), null);
                    }
                }

                addInstruction("move", a0, null, s0, null);
            }

            if (instr.opCode.equals("get_substring")) {

                addInstruction("move", s0, null, a0, null);

                String Rdest = instr.source2;
                String Rsrc  = instr.source1;
                String L     = instr.target1;
                String R     = instr.target2;
                String t_1   = change(Rsrc, 1, 1);
                String Lpos  = change(L, 0, 1);
                String Rpos  = change(R, 2, 1);
                addInstruction("move", s0, null, a0, null);

                addInstruction("li", v0, null, String.valueOf(9), null);
                addInstruction("sub", a0, null, Rpos, Lpos);
                addInstruction("move", s1, null, a0, null);
                addInstruction("add", s1, null, s1, "1");
                addInstruction("add", a0, null, a0, "6");
                addInstruction("syscall", null, null, null, null);
                addInstruction("sw", s1, null, address(v0), null);
                addInstruction("move", s4, null, v0, null);
                addInstruction("add", v0, null, v0, String.valueOf(4));

                addInstruction("add", t1, null, t1, "4");
                addInstruction("add", t1, null, t1, Lpos);
                ++subStringNum;

                addInstruction("li", s5, null, "0", null);
                addInstruction("Label", "begin_substring" + subStringNum, null, null, null);
                addInstruction("lb", s2, null, address(t1), null);
                addInstruction("sb", s2, null, address(v0), null);
                addInstruction("add", t1, null, t1, "1");
                addInstruction("add", v0, null, v0, "1");
                addInstruction("add", s5, null, s5, "1");
                addInstruction("slt", s3, null, s5, s1);
                addInstruction("beqz", s3, null, "end_substring" + subStringNum, null);
                addInstruction("b", "begin_substring" + subStringNum, null, null, null);
                addInstruction("Label", "end_substring" + subStringNum, null, null, null);

                addInstruction("li", s2, null, String.valueOf(0), null);
                addInstruction("sb", s2, null, address(v0), null);

                String t_0 = change(Rdest, 0, 0);
                if (Rdest.contains("@")) {
                    addInstruction("sw", s4, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", s4, null, getRNum(Rdest), null);
                    }
                }

                addInstruction("move", a0, null, s0, null);
            }

            if (instr.opCode.equals("stringLess")) {
                String Rdest = instr.target1;
                String Rsrc1 = instr.source1;
                String Rsrc2 = instr.source2;
                String t_0   = change(Rdest, 0, 0);
                String t_1   = change(Rsrc1, 1, 1);
                String t_2   = change(Rsrc2, 2, 1);

                addInstruction("lw", s1, null, address(t_1), null);
                addInstruction("lw", s2, null, address(t_2), null);
                addInstruction("slt", s7, null, s1, s2);
                ++stringLessNum;
                addInstruction("Label", "string_less1" + stringLessNum, null, null, null);
                addInstruction("beqz", s7, null, "string_less2" + stringLessNum, null);
                //s4 = 0 means s1 <= s2 else s1 > s2
                addInstruction("move", s0, null, s1, null);
                addInstruction("li", s4, null, "0", null);
                addInstruction("b", "go_string_less" + stringLessNum, null, null, null);
                addInstruction("Label", "string_less2" + stringLessNum, null, null, null);
                addInstruction("move", s0, null, s2, null);
                addInstruction("li", s4, null, "1", null);
                addInstruction("Label", "go_string_less" + stringLessNum, null, null, null);

                addInstruction("add", t1, null, t1, "4");
                addInstruction("add", t2, null, t2, "4");
                addInstruction("li", s3, null, "0", null);
                addInstruction("Label", "string_less3" + stringLessNum, null, null, null);
                addInstruction("lb", s1, null, address(t1), null);
                addInstruction("lb", s2, null, address(t2), null);

                addInstruction("add", t1, null, t1, "1");
                addInstruction("add", t2, null, t2, "1");
                addInstruction("add", s3, null, s3, "1");
                addInstruction("seq", s7, null, s1, s2);
                addInstruction("slt", s6, null, s3, s0);
                addInstruction("and", s5, null, s7, s6);
                addInstruction("bnez", s5, null, "string_less3" + stringLessNum, null);
                addInstruction("beqz", s6, null, "shit" + stringLessNum, null);

                addInstruction("slt", s7, null, s1, s2);
                addInstruction("bnez", s7, null, "string_true" + stringLessNum, null);
                addInstruction("beqz", s7, null, "string_false" + stringLessNum, null);

                addInstruction("Label", "shit" + stringLessNum, null, null, null);

                addInstruction("bnez", s4, null, "string_false" + stringLessNum, null);

                addInstruction("Label", "string_true" + stringLessNum, null, null, null);
                addInstruction("li", "$t7", null, "1", null);
                addInstruction("b", "save_string_less" + stringLessNum, null, null, null);
                addInstruction("Label", "string_false" + stringLessNum, null, null, null);
                addInstruction("li", "$t7", null, "0", null);
                addInstruction("Label", "save_string_less" + stringLessNum, null, null, null);
                if (Rdest.contains("@")) {
                    addInstruction("sw", "$t7", null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", "$t7", null, getRNum(Rdest), null);
                    }
                }
            }

            if (instr.opCode.equals("get_parseInt")) {
                String Rdest = instr.target1;
                String Rsrc  = instr.source1;
                String t_0   = change(Rdest, 0, 0);
                String t_1   = change(Rsrc,  1, 1);
                addInstruction("li", s2, null, "1", null);
                addInstruction("li", s1, null, "0", null);
                addInstruction("add", t1, null, t1, "4");
                addInstruction("move", t2, null, t1, null);
                ++parseIntNum;
                addInstruction("Label", "_count_num" + parseIntNum, null, null, null);
                addInstruction("lb", s0, null, address(t1), null);
                addInstruction("bgt", s0, "57", "_begin_parseInt" + parseIntNum, null);
                addInstruction("blt", s0, "48", "_begin_parseInt" + parseIntNum, null);
                addInstruction("add", t1, null, t1, "1");
                addInstruction("b", "_count_num" + parseIntNum, null, null, null);

                addInstruction("Label", "_begin_parseInt" + parseIntNum, null, null, null);
                addInstruction("sub", t1, null, t1, "1");

                addInstruction("Label", "_parseInt" + parseIntNum, null, null, null);
                addInstruction("blt", t1, t2, "_finish_parseInt" + parseIntNum, null);
                addInstruction("lb", s0, null, address(t1), null);
                addInstruction("sub", s0, null, s0, "48");
                addInstruction("mul", s0, null, s0, s2);
                addInstruction("add", s1, null, s1, s0);
                addInstruction("mul", s2, null, s2, "10");
                addInstruction("sub", t1, null, t1, "1");
                addInstruction("b", "_parseInt" + parseIntNum, null, null, null);

                addInstruction("Label", "_finish_parseInt" + parseIntNum, null, null, null);
                if (Rdest.contains("@")) {
                    addInstruction("sw", s1, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", s1, null, getRNum(Rdest), null);
                    }
                }
            }

            if (instr.opCode.equals("special")) {
                addInstruction(instr.source1, null, null, null, null);
            }

            if (instr.opCode.equals("special1")) {
                addInstruction("sw", "$t7", null, getRNum(instr.source1), null);
            }

            if (instr.opCode.equals("stringPlus")) {
                String Rsrc1 = instr.source1;
                String Rsrc2 = instr.source2;
                String Rdest = instr.target1;
                String t_0   = change(Rdest, 0, 0);
                String t_1;
                String t_2;
                String length = instr.target2;
                if (Rsrc1.contains("s") == false) {
                    t_1 = change(Rsrc1, 1, 1);
                } else {
                    addInstruction("la", t1, null, Rsrc1, null);
                    t_1 = t1;
                }
                if (Rsrc2.contains("s") == false) {
                    t_2 = change(Rsrc2, 2, 1);
                } else {
                    addInstruction("la", t2, null, Rsrc2, null);
                    t_2 = t2;
                }
                if (Rsrc1.contains("s") == false) {
                    addInstruction("lw", s1, null, address(t_1), null);
                } else {
                    addInstruction("li", s1, null, length, null);
                }

                if (Rsrc2.contains("s") == false) {
                    addInstruction("lw", s2, null, address(t_2), null);
                } else {
                    addInstruction("li", s2, null, length, null);
                }
                addInstruction("add", s0, null, s1, s2);
                addInstruction("add", s0, null, s0, String.valueOf(1));
                addInstruction("li", v0, null, String.valueOf(9), null);
                addInstruction("move", "$t7", null, a0, null);
                addInstruction("move", a0, null, s0, null);
                addInstruction("add", a0, null, a0, String.valueOf(4));
                addInstruction("syscall", null, null, null, null);
                addInstruction("move", a0, null, "$t7", null);
                addInstruction("sub", s0, null, s0, String.valueOf(1));
                addInstruction("sw", s0, null, address(v0), null);
                if (Rdest.contains("@")) {
                    addInstruction("sw", v0, null, address(t0), null);
                } else {
                    if (trans(Rdest) == "!") {
                        addInstruction("sw", v0, null, getRNum(Rdest), null);
                    }
                }
                addInstruction("move", s4, null, v0, null);


                addInstruction("add", s4, null, String.valueOf("3"), null);
                tottalStringPlus++;
                addInstruction("move", s5, null, t_1, null);
                if (Rsrc1.contains("s") == false) {
                    addInstruction("add", s5, null, String.valueOf(3), null);
                } else {
                    addInstruction("sub", s5, null, String.valueOf(1), null);
                }
                addInstruction("li", s3, null, String.valueOf(0), null);
                addInstruction("slt", s6, null, s3, s1);
                addInstruction("bne", s6, zero, "true_for_stringplus1" + tottalStringPlus, null);
                addInstruction("beq", s6, zero, "false_for_stringplus1" + tottalStringPlus, null);
                addInstruction("Label", "true_for_stringplus1" + tottalStringPlus, null, null, null);
                addInstruction("add", s4, null, s4, String.valueOf(1));
                addInstruction("add", s5, null, s5, String.valueOf(1));
                addInstruction("lb" , s7, null, address(s5), null);
                addInstruction("sb" , s7, null, address(s4) , null);
                addInstruction("add", s3, null, s3, String.valueOf(1));
                addInstruction("slt", s6, null, s3, s1);
                addInstruction("bne", s6, zero, "true_for_stringplus1" + tottalStringPlus, null);
                addInstruction("beq", s6, zero, "false_for_stringplus1" + tottalStringPlus, null);
                addInstruction("Label", "false_for_stringplus1" + tottalStringPlus, null, null, null);
                tottalStringPlus++;
                addInstruction("move", s5, null, t_2, null);
                if (Rsrc2.contains("s") == false) {
                    addInstruction("add", s5, null, String.valueOf(3), null);
                } else {
                    addInstruction("sub", s5, null, String.valueOf(1), null);
                }
                addInstruction("li", s3, null, String.valueOf(0), null);
                addInstruction("slt", s6, null, s3, s2);
                addInstruction("bne", s6, zero, "true_for_stringplus1" + tottalStringPlus, null);
                addInstruction("beq", s6, zero, "false_for_stringplus1" + tottalStringPlus, null);
                addInstruction("Label", "true_for_stringplus1" + tottalStringPlus, null, null, null);
                addInstruction("add", s4, null, s4, String.valueOf(1));
                addInstruction("add", s5, null, s5, String.valueOf(1));
                addInstruction("lb" , s7, null, address(s5), null);
                addInstruction("sb" , s7, null, address(s4) , null);
                addInstruction("add", s3, null, s3, String.valueOf(1));
                addInstruction("slt", s6, null, s3, s2);
                addInstruction("bne", s6, zero, "true_for_stringplus1" + tottalStringPlus, null);
                addInstruction("beq", s6, zero, "false_for_stringplus1" + tottalStringPlus, null);
                addInstruction("Label", "false_for_stringplus1" + tottalStringPlus, null, null, null);
                addInstruction("add", s4, null, s4, String.valueOf(1));
                addInstruction("li", s7, null, String.valueOf(0), null);
                addInstruction("sb", s7, null, address(s4), null);
            /*
                addInstruction("move", a0, null, "$t6", null);
                addInstruction("move", ra, null, "$v1", null);
            */
            }
        }


    }

}
