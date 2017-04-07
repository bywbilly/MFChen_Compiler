package MFChen.IR;

/**
 * Created by bywbilly on 16/4/19.
 */
public class Instruction {

    public String opCode;
    public String source1, source2;
    public String target1, target2;

    public Instruction(String _opCode, String _source1, String _source2, String _target1, String _target2) {
        this.opCode  = _opCode;
        this.source1 = _source1;
        this.source2 = _source2;
        this.target1 = _target1;
        this.target2 = _target2;
    }

    public String toString() {
        String ret = opCode;
        ret += " ";
        if (source1 != null) {
            ret += source1;
        }
        ret += " ";
        if (source2 != null) {
            ret += source2;
        }
        ret += " ";
        if (target1 != null) {
            ret += target1;
        }
        ret += " ";
        if (target2 != null) {
            ret += target2;
        }
        return ret;
    }
}
