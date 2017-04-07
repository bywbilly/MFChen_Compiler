package MFChen.MIPS;

/**
 * Created by bywbilly on 16/4/26.
 */
public class mipsInstruction {
    public String opCode;
    public String source1, source2;
    public String target1, target2;

    public String newLine = " \n";
    public String comma   = ", " ;

    public mipsInstruction(String _opCode, String _source1, String _source2, String _target1, String _target2) {
        this.opCode  = _opCode;
        this.source1 = _source1;
        this.source2 = _source2;
        this.target1 = _target1;
        this.target2 = _target2;
    }

    public String toString() {
        String ret = "";
        if (opCode.equals("Label")) {
            String labelName = source1;
            /*
            if (labelName.length() >= 4 && labelName.substring(0, 4).equals("main")) {
                ret += "main: " + newLine;
            } else
            */
            {
                ret += source1 + ":"  + newLine;
            }
        } else {
            ret = opCode + " ";
            if (source1 != null) {
                ret += source1;
            }
            if (source2 != null) {
                ret += comma + source2;
            }
            if (target1 != null) {
                ret += comma + target1;
            }
            if (target2 != null) {
                ret += comma + target2;
            }
            ret += newLine;
        }
        return ret;
    }
}
