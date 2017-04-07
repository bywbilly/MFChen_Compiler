package test;

import MFChen.Environment.GetFuncProperty;
import MFChen.Environment.GetTypeProperty;
import MFChen.Environment.TypeCheck;
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
public class Semantic_test {
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
                throw new RuntimeException("Syntax Error");

            GetTypeProperty getTypeProperty = new GetTypeProperty();
            getTypeProperty.visit(tree);

            GetFuncProperty getFuncProperty = new GetFuncProperty();
            getFuncProperty.GetType(getTypeProperty.typeTrans.typeName);

            getFuncProperty.visit(tree);

            TypeCheck typeCheck = new TypeCheck();
            typeCheck.getEnvironment(getFuncProperty.Symbol_Table, getFuncProperty.nameType);

            typeCheck.visit(tree);

        }
        catch (Exception e)
        {
            return false;
        }
        return true;
    }
    @Test
    public void Semantic_tester() throws IOException {
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
                fail();
            }
        }
        System.out.println("-------");
        for(File x : new File("Test/test/compile_error").listFiles())
        {
            if(!(x.isFile() && x.getName().endsWith("mx"))) continue;
            if(!Run_test(x))
            {
                System.out.println("Accepted");
            }
            else
            {
                System.out.println("Wrong Answer on test: " + x.getName());
                fail();
            }
        }
    }
}
