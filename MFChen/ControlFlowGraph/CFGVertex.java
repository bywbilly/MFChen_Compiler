package MFChen.ControlFlowGraph;

import MFChen.IR.Instruction;

import java.util.ArrayList;

/**
 * Created by bywbilly on 16/5/8.
 */
public class CFGVertex {
    public int uID;
    public int begin;
    public int end;

    public ArrayList<Instruction> CFGInstrList = new ArrayList<>();

    public String toString() {
        String ret = "";
        ret += begin + "\n";
        for (Instruction entry : CFGInstrList) {
            ret += entry.toString();
            ret += "\n";
        }
        ret += end + "\n";
        return ret;
    }
}
