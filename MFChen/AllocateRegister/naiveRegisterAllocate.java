package MFChen.AllocateRegister;

import MFChen.IR.Instruction;
import MFChen.Symbol.Symbol;
import MFChen.Symbol.Table;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.stream.Stream;

/**
 * Created by bywbilly on 16/4/26.
 */
public class naiveRegisterAllocate{
    public ArrayList<Instruction> ILOCList = new ArrayList<>();

    public HashMap<String, String> registerAllocate = new HashMap<>();

    public void print() {
       // System.out.println(registerAllocate);
    }

    public Table Symbol_Table;

    public void Init(ArrayList<Instruction> _ILOCList, Table _Symbol_Table) {
        this.ILOCList = _ILOCList;
        this.Symbol_Table = _Symbol_Table;
    }

    public static <K, V extends Comparable<? super V>> Map<K, V> sortByValue( Map<K, V> map )
    {
        Map<K, V> result = new LinkedHashMap<>();
        Stream<Map.Entry<K, V>> st = map.entrySet().stream();

        st.sorted( Map.Entry.comparingByValue() )
                .forEachOrdered( e -> result.put(e.getKey(), e.getValue()) );

        return result;
    }

    public void Allocate() {

        int triger = 0;
        int cntRegisterNum = 14;
        int nowRegisterNum = -1;

        HashMap<String, Integer> appearTime = new HashMap<>();

        for (int i = 0; i < ILOCList.size(); i++) {
            Instruction entry = ILOCList.get(i);
            if (entry.opCode.equals("beginGlobal")) {
                triger ^= 1;
                continue;
            }
            if (entry.opCode.equals("endGlobal")) {
                triger ^= 1;
                continue;
            }
            if (triger == 1) {
                continue;
            }
            if (i + 1 == ILOCList.size()) {
                if (nowRegisterNum == -1) {
                    nowRegisterNum = 0;
                } else {
                    LinkedHashMap<String, Integer> arrayAppearTime = (LinkedHashMap<String, Integer>)sortByValue(appearTime);
                    int sz = 0;
                   // System.out.println( " ! "+ arrayAppearTime );
                    ArrayList<String> arrayRegister = new ArrayList<>();
                    for (Map.Entry<String, Integer> registerEntry : arrayAppearTime.entrySet()) {
                        String register = registerEntry.getKey();
                        if (Integer.valueOf(register.substring(1, register.length())) < 9 || register.equals("r0")) {
                            continue;
                        }
                        arrayRegister.add(register);
                    }

                    for (int j = arrayRegister.size() - 1; j >= 0; j--) {
                        String tmpVR = arrayRegister.get(j);
                        sz++;
                        if (sz > cntRegisterNum) {
                            break;
                        }
                        int tsz = sz + 3;
                        String Rdest;
                        if (tsz < 10) {
                            Rdest = "$t" + (tsz - 1);
                        } else {
                            Rdest = "$s" + (tsz % 10);
                        }
                        registerAllocate.put(tmpVR, Rdest);
                    }

                    nowRegisterNum = 0;
                    appearTime.clear();
                }
            }
            if (entry.opCode.equals("Label")) {
                String funcID = entry.source1;
                int pos = 0;
                for (int j = 0; j < funcID.length(); j++) {
                    if (funcID.charAt(j) >= '0' && funcID.charAt(j) <= '9') {
                        pos = j;
                        break;
                    }
                }
                funcID = funcID.substring(0, pos);
                if (Symbol_Table.get(Symbol.symbol(funcID)) != null) {
                    if (nowRegisterNum == -1) {
                        nowRegisterNum = 0;
                    } else {
                        LinkedHashMap<String, Integer> arrayAppearTime = (LinkedHashMap<String, Integer>)sortByValue(appearTime);
                        int sz = 0;
                       // System.out.println( " ! " + funcID + arrayAppearTime );
                        ArrayList<String> arrayRegister = new ArrayList<>();
                        for (Map.Entry<String, Integer> registerEntry : arrayAppearTime.entrySet()) {
                            String register = registerEntry.getKey();
                            if (Integer.valueOf(register.substring(1, register.length())) < 9 || register.equals("r0")) {
                                continue;
                            }
                            arrayRegister.add(register);
                        }

                        for (int j = arrayRegister.size() - 1; j >= 0; j--) {
                            String tmpVR = arrayRegister.get(j);
                            sz++;
                            if (sz > cntRegisterNum) {
                                break;
                            }
                            int tsz = sz + 3;
                            String Rdest;
                            if (tsz < 10) {
                                Rdest = "$t" + (tsz - 1);
                            } else {
                                Rdest = "$s" + (tsz % 10);
                            }
                            registerAllocate.put(tmpVR, Rdest);
                        }

                        nowRegisterNum = 0;
                        appearTime.clear();
                    }
                }
            } else {
                String src1 = entry.source1;
                String src2 = entry.source2;
                String tar1 = entry.target1;
                String tar2 = entry.target2;
                if (src1 != null && src1.indexOf("r") == 0) {
                    if (appearTime.containsKey(src1)) {
                        appearTime.replace(src1, appearTime.get(src1) + 1);
                    } else {
                        appearTime.put(src1, 1);
                    }
                }
                if (src2 != null && src2.indexOf("r") == 0) {
                    if (appearTime.containsKey(src2)) {
                        appearTime.replace(src2, appearTime.get(src2) + 1);
                    } else {
                        appearTime.put(src2, 1);
                    }
                }
                if (tar1 != null && tar1.indexOf("r") == 0) {
                    if (appearTime.containsKey(tar1)) {
                        appearTime.replace(tar1, appearTime.get(tar1) + 1);
                    } else {
                        appearTime.put(tar1, 1);
                    }
                }
                if (tar2 != null && tar2.indexOf("r") == 0) {
                    if (appearTime.containsKey(tar2)) {
                        appearTime.replace(tar2, appearTime.get(tar2) + 1);
                    } else {
                        appearTime.put(tar2, 1);
                    }
                }
            }

        }
    }

}
