package test;

import MFChen.parser.MFChenLexer;
import MFChen.parser.MFChenParser;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.junit.Test;

import java.io.*;

import static junit.framework.TestCase.fail;

/**
 * Created by bywbilly on 16/4/5.
 */
public class grammar_test {
    public boolean Run_test(File src) throws IOException
    {
        try {
            InputStream inputcode = new FileInputStream(src);
            OutputStream output = System.out;
            ANTLRInputStream input = new ANTLRInputStream(inputcode);
            MFChenLexer lexer = new MFChenLexer(input);
            CommonTokenStream tokens = new CommonTokenStream(lexer);
            MFChenParser parser = new MFChenParser(tokens);
            ParseTree tree = parser.program();
            if(parser.getNumberOfSyntaxErrors() != 0)
            {
                System.out.println("fuck" + src.getName());
                fail();
                System.exit(1);
            }
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
            System.exit(1);
        }
        return true;
    }
    @Test
    public void grammar_test() throws IOException {
        for(File x : new File("Test/test/passed").listFiles())
        {
            if(!(x.isFile() && x.getName().endsWith("mx"))) continue;
            if(Run_test(x))
            {
                System.out.println("Accepted");
            }
            else
            {
                System.out.println("Wrong Answer on test: " + x.getName());
                return;
            }
        }
        for(File x : new File("Test/test/compile_error").listFiles())
        {
            if(!(x.isFile() && x.getName().endsWith("mx"))) continue;
            if(Run_test(x))
            {
                System.out.println("Accepted" + x.getName());
            }
            else
            {
                System.out.println("Wrong Answer on test: " + x.getName());
                return;
            }
        }
    }
}
