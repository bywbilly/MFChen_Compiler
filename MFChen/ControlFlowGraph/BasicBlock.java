package MFChen.ControlFlowGraph;

import MFChen.IR.Instruction;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by bywbilly on 16/5/8.
 */
public class BasicBlock {
    public HashMap<Integer, Integer> Edge = new HashMap<>();
    public HashMap<Integer, Integer> lineToBasicBlock = new HashMap<>();
    public ArrayList<CFGVertex> BlockList = new ArrayList<>();

    public int cnt = 0;
    public ArrayList<Instruction> ILOCList;

    public void Init(ArrayList<Instruction> _ILOCList) {
        this.ILOCList = _ILOCList;
    }

    public void getBasicBlock() {
        CFGVertex nowVertex = new CFGVertex();
        nowVertex.begin = 0;
        nowVertex.uID = cnt++;
        for (int i = 0; i < ILOCList.size(); i++) {
            Instruction entry = ILOCList.get(i);
            lineToBasicBlock.put(i, cnt);
            nowVertex.CFGInstrList.add(entry);
            if (entry.opCode.equals("jump") || entry.opCode.equals("jal") || entry.opCode.equals("jr") || entry.opCode.equals("cbr")) {
                nowVertex.end = i;
                BlockList.add(nowVertex);
                nowVertex = new CFGVertex();
                nowVertex.begin = i + 1;
                nowVertex.uID = cnt++;
                continue;
            }
        }
    }

    public void print() {
        for (CFGVertex entry : BlockList) {
            System.out.println(entry);
        }
    }
}
