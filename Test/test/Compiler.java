package test;

import MFChen.Main;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

import java.io.*;
import java.util.ArrayList;
import java.util.Collection;

import static org.junit.Assert.fail;

@RunWith(Parameterized.class)
public class Compiler {
    private String mxFile;

    public Compiler(String mxFile) {
        this.mxFile = mxFile;
    }

    @Parameterized.Parameters
    public static Collection<Object[]> data() {
        Collection<Object[]> parameters = new ArrayList<>();
        for (File file : new File("data/test/final/mx/").listFiles()) {
            if (file.isFile() && file.getName().endsWith(".mx")) {
                parameters.add(new Object[]{"data/test/final/mx/" + file.getName()});
            }
        }

        return parameters;
    }

    @Test
    public void testPass() throws Exception {
        System.out.print(mxFile);

        String sFile = mxFile.replace("mx/", "s/").replace(".mx", ".s");
        String inFile = mxFile.replace("mx/", "in/").replace(".mx", ".in");
        String outFile = mxFile.replace("mx/", "out/").replace(".mx", ".out");
        String ansFile = mxFile.replace("mx/", "ans/").replace(".mx", ".ans");
        String limFile = mxFile.replace("mx/", "lim/").replace(".mx", ".lim");

        new Main().compile(new FileInputStream(mxFile), new FileOutputStream(sFile));

        Process process = Runtime.getRuntime().exec(String.format("lib/spim -lstack 100000000 -stat -file %s", sFile));

        try {
            BufferedReader input = new BufferedReader(new InputStreamReader(new FileInputStream(inFile)));
            PrintStream output = new PrintStream(process.getOutputStream());
            for (String line; (line = input.readLine()) != null; output.println(line)) ;
            output.flush();
        } catch (Exception e) {
        }

        process.waitFor();

        try {
            BufferedReader input = new BufferedReader(new InputStreamReader(process.getInputStream()));
            PrintStream output = new PrintStream(new FileOutputStream(outFile));
            for (String line; (line = input.readLine()) != null; ) {
                if (!line.startsWith("Loaded")) {
                    output.println(line);
                }
            }
        } catch (FileNotFoundException e) {
        }

        int limit = Integer.MAX_VALUE;
        try {
            BufferedReader input = new BufferedReader(new InputStreamReader(new FileInputStream(limFile)));
            limit = Integer.parseInt(input.readLine());
        } catch (FileNotFoundException e) {
        }

        int all = Integer.MAX_VALUE;
        try {
            BufferedReader input = new BufferedReader(new InputStreamReader(process.getErrorStream()));
            for (String line; (line = input.readLine()) != null; ) {
                if (line.startsWith("[Statistics]\t")) {
                    line = line.replace("[Statistics]\tAll:\t", "").replaceAll("\t", "\n");
                    all = Integer.parseInt(line.substring(0, line.indexOf("\n")));
                    System.out.println("\t" + all);
                }
            }
        } catch (FileNotFoundException e) {
        }

        try {
            BufferedReader output = new BufferedReader(new InputStreamReader(new FileInputStream(outFile)));
            BufferedReader answer = new BufferedReader(new InputStreamReader(new FileInputStream(ansFile)));
            while (true) {
                String line1 = output.readLine();
                String line2 = answer.readLine();
                if (line1 == null && line2 == null) {
                    break;
                }
                if (line1 == null || line2 == null || !line1.equals(line2)) {
                    System.err.println("output: " + line1);
                    System.err.println("answer: " + line2);
                    fail("Wrong answer!");
                }
            }
        } catch (FileNotFoundException e) {
            System.err.println("No answer file!");
        }

        if (all > limit) {
            fail("Limit exceeded!");
        }
    }
}