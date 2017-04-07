package MFChen.IR;

/**
 * Created by bywbilly on 16/4/22.
 */
public class vituralRegister {
    public int uID;

    vituralRegister(int _uID) {
        uID = _uID;
    }

    public String toString() {
        return "r" + uID;
    }
}
