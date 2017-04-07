package MFChen.Environment;

import java.util.HashMap;

/**
 * Created by bywbilly on 16/3/30.
 */
public class Transform {
    public HashMap<String, Integer> typeName;

    Transform(){
        typeName = new HashMap<>();
        typeName.put("int", 1);
        typeName.put("bool", 3);
        typeName.put("string", 2);
        typeName.put("void", 4);
    }
}
