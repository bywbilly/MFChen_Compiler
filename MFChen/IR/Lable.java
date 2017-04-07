package MFChen.IR;

/**
 * Created by bywbilly on 16/4/23.
 */
public class Lable {
    public int uID;
    public String name;

    public Lable(int _uID, String name) {
        this.uID = _uID;
        this.name = name;
    }

    public String toString() {
        return name + uID;
    }
}
