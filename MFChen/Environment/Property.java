package MFChen.Environment;

/**
 * Created by bywbilly on 16/3/30.
 */


import java.util.ArrayList;
import java.util.HashMap;

public class Property {

    public int kind; // 0 variable 1 class 2 function 3 left-value 4 return-value
    /*
        For class, it will be -1;
        For function, it will be the mapping number of function return type
     */
    public int typeProperty;
    public HashMap<String, Integer> classinfo;
    public ArrayList<Integer> funcinfo;// for the type of the parameter
    public ArrayList<String> funcinfo2;// for parameter

    Property() {
        this.typeProperty = -1;
        this.kind = -1;
        this.classinfo = null;
        this.funcinfo = null;
        this.funcinfo2 = null;
    }

    Property(int kind, int typeProperty, HashMap<String, Integer> classinfo, ArrayList<Integer> info, ArrayList<String> info2) {
        this.typeProperty = typeProperty;
        this.kind = kind;
        this.classinfo = classinfo;
        this.funcinfo = info;
        this.funcinfo2 = info2;
    }

    public String toString() {
        String ret = "";
        ret += kind;
        ret += "\n";
        ret += typeProperty;
        ret += "\n";
//        ret += classinfo.toString();
        ret += funcinfo.toString();
        return ret;
    }
}
