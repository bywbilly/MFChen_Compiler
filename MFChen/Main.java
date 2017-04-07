package MFChen;

import MFChen.AllocateRegister.naiveRegisterAllocate;
import MFChen.ControlFlowGraph.BasicBlock;
import MFChen.Environment.GetFuncProperty;
import MFChen.Environment.GetTypeProperty;
import MFChen.Environment.TypeCheck;
import MFChen.IR.naiveILOC;
import MFChen.IR.optILOC;
import MFChen.InnerMethod.Prepare;
import MFChen.MIPS.excitedTranslate;
import MFChen.Optimization.optNaiveTranslate;
import MFChen.Optimization.prettyPrint;
import MFChen.parser.MFChenLexer;
import MFChen.parser.MFChenParser;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.*;

public class Main {

	public static int Line = 0;
	public static String code = "";

	private static FileInputStream add_built_in_to_input(InputStream src) throws IOException {
		BufferedReader user = new BufferedReader(new InputStreamReader(src));
		BufferedReader builtin = new BufferedReader(new InputStreamReader(new FileInputStream("MFChen/InnerMethod/built_in.MFChen")));

		BufferedWriter new_src = new BufferedWriter(new FileWriter("MFChen/InnerMethod/.temp.MFChen.swp"));

		Prepare pre = new Prepare();

		String line;
		while((line = builtin.readLine()) != null) {
			new_src.write(line);
			new_src.newLine();
		}
		while((line = user.readLine()) != null) {
			code = code + pre.Pre(line);
			Line++;
			new_src.write(line);
			new_src.newLine();
		}
		new_src.close();
		user.close();
		builtin.close();
		return new FileInputStream(new File("MFChen/InnerMethod/.temp.MFChen.swp"));
	}

	public static void main(String args[]) throws Exception {
		new Main().compile(System.in, System.out);
	}

	public void compile(InputStream file, OutputStream output) throws Exception {
		try {
			//OutputStream output = System.out;
			//ANTLRInputStream input = new ANTLRInputStream(inputcode);

			prettyPrint prettyPrint = new prettyPrint();


			ANTLRInputStream input = new ANTLRInputStream(add_built_in_to_input(file));
			MFChenLexer lexer = new MFChenLexer(input);
			CommonTokenStream tokens = new CommonTokenStream(lexer);
			MFChenParser parser = new MFChenParser(tokens);
			ParseTree tree = parser.program();

			prettyPrint.visit(tree);
			System.out.println("\n");
			prettyPrint.print();

			if(parser.getNumberOfSyntaxErrors() != 0)
				throw new RuntimeException("Syntax Error");

			GetTypeProperty getTypeProperty = new GetTypeProperty();
			getTypeProperty.visit(tree);
			//System.out.println(getTypeProperty.typeTrans.typeName);

			GetFuncProperty getFuncProperty = new GetFuncProperty();
			getFuncProperty.GetType(getTypeProperty.typeTrans.typeName);
			//System.out.println(getFuncProperty.nameType);

			getFuncProperty.visit(tree);

			TypeCheck typeCheck = new TypeCheck();
			typeCheck.getEnvironment(getFuncProperty.Symbol_Table, getFuncProperty.nameType);

			//System.out.println(typeCheck.Symbol_Table.get(Symbol.symbol("mm")));

			typeCheck.visit(tree);
			//System.out.println(getFuncProperty.classType);
			//System.out.println(getFuncProperty.nameType);


			Prepare prepare = new Prepare();
			if (prepare.init(code, Line)) {

				naiveILOC ILOC = new naiveILOC();
				ILOC.getEnvironment(typeCheck.Symbol_Table, typeCheck.nameType);
				ILOC.visit(tree);
				//ILOC.print();

/*
			naiveTranslate naiveMIPS = new naiveTranslate();
			naiveMIPS.Init(ILOC.InstructionList, ILOC.registerTable, ILOC.globalRegister, ILOC.maxOFFSET);

			naiveMIPS.Translate();
			naiveMIPS.print();
*/

				BasicBlock CFG = new BasicBlock();
				CFG.Init(ILOC.InstructionList);
				CFG.getBasicBlock();
				//CFG.print();

				optNaiveTranslate optNaiveTranslate = new optNaiveTranslate();
				optNaiveTranslate.Init(ILOC.InstructionList, ILOC.registerTable, ILOC.globalRegister, ILOC.offset);

				optNaiveTranslate.Translate();
				optNaiveTranslate.print(new PrintWriter(output));
			} else {
				//System.out.print("!!");
				optILOC ILOC = new optILOC();
				ILOC.getEnvironment(typeCheck.Symbol_Table, typeCheck.nameType);
				ILOC.visit(tree);
				//ILOC.print();

				naiveRegisterAllocate naiveRegisterAllocate = new naiveRegisterAllocate();
				naiveRegisterAllocate.Init(ILOC.InstructionList, typeCheck.Symbol_Table);

				naiveRegisterAllocate.Allocate();
				//naiveRegisterAllocate.print();

				excitedTranslate excitedTranslate = new excitedTranslate();
				excitedTranslate.Init(ILOC.InstructionList, ILOC.registerTable, ILOC.globalRegister, ILOC.offset);
				excitedTranslate.getAllocate(naiveRegisterAllocate.registerAllocate);

				excitedTranslate.Translate();
				excitedTranslate.print(new PrintWriter(output));

			}
/*
			LLIRInterpreter IRTest = new LLIRInterpreter(System.in);
			IRTest.run();
			System.out.println(IRTest.getExitcode());
*/
		} catch (Exception e) {
			throw e;
			//System.out.println(e.getMessage());
		}
	}
}
