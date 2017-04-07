// Generated from MFChen.g4 by ANTLR 4.5.2
package MFChen.parser;
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class MFChenLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.5.2", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		Break=1, Class=2, Continue=3, Const=4, Else=5, For=6, If=7, Int=8, New=9, 
		Null=10, Return=11, String=12, Void=13, While=14, Bool=15, L_Paren=16, 
		R_Paren=17, L_Bracket=18, R_Bracket=19, L_Brace=20, R_Brace=21, Less=22, 
		LessEqual=23, Greater=24, GreaterEqual=25, LeftShift=26, RightShift=27, 
		Plus=28, PlusPlus=29, Minus=30, MinusMinus=31, Star=32, Div=33, Mod=34, 
		And=35, Or=36, AndAnd=37, OrOr=38, Caret=39, Not=40, Tilde=41, Colon=42, 
		Semi=43, Comma=44, Assign=45, Equal=46, NotEqual=47, Dot=48, LogicalConstant=49, 
		IntLiteral=50, Identifier=51, IntegerConstant=52, StringLiteral=53, Constant=54, 
		WhiteSpace=55, Comment=56, Length=57, Substring=58, Parseint=59, Ord=60, 
		Size=61;
	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	public static final String[] ruleNames = {
		"Break", "Class", "Continue", "Const", "Else", "For", "If", "Int", "New", 
		"Null", "Return", "String", "Void", "While", "Bool", "L_Paren", "R_Paren", 
		"L_Bracket", "R_Bracket", "L_Brace", "R_Brace", "Less", "LessEqual", "Greater", 
		"GreaterEqual", "LeftShift", "RightShift", "Plus", "PlusPlus", "Minus", 
		"MinusMinus", "Star", "Div", "Mod", "And", "Or", "AndAnd", "OrOr", "Caret", 
		"Not", "Tilde", "Colon", "Semi", "Comma", "Assign", "Equal", "NotEqual", 
		"Dot", "LogicalConstant", "Digit", "IntLiteral", "Nondigit", "Identifier", 
		"NonzeroDigit", "IntegerConstant", "Sign", "StringLiteral", "EscapSequence", 
		"Constant", "WhiteSpace", "Comment", "Length", "Substring", "Parseint", 
		"Ord", "Size"
	};

	private static final String[] _LITERAL_NAMES = {
		null, "'break'", "'class'", "'continue'", "'const'", "'else'", "'for'", 
		"'if'", "'int'", "'new'", "'null'", "'return'", "'string'", "'void'", 
		"'while'", "'bool'", "'('", "')'", "'['", "']'", "'{'", "'}'", "'<'", 
		"'<='", "'>'", "'>='", "'<<'", "'>>'", "'+'", null, "'-'", "'--'", "'*'", 
		"'/'", "'%'", "'&'", "'|'", "'&&'", "'||'", "'^'", "'!'", "'~'", "':'", 
		"';'", "','", "'='", "'=='", "'!='", "'.'", null, null, null, null, null, 
		null, null, null, "'length'", "'substring'", "'parseInt'", "'ord'", "'size'"
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, "Break", "Class", "Continue", "Const", "Else", "For", "If", "Int", 
		"New", "Null", "Return", "String", "Void", "While", "Bool", "L_Paren", 
		"R_Paren", "L_Bracket", "R_Bracket", "L_Brace", "R_Brace", "Less", "LessEqual", 
		"Greater", "GreaterEqual", "LeftShift", "RightShift", "Plus", "PlusPlus", 
		"Minus", "MinusMinus", "Star", "Div", "Mod", "And", "Or", "AndAnd", "OrOr", 
		"Caret", "Not", "Tilde", "Colon", "Semi", "Comma", "Assign", "Equal", 
		"NotEqual", "Dot", "LogicalConstant", "IntLiteral", "Identifier", "IntegerConstant", 
		"StringLiteral", "Constant", "WhiteSpace", "Comment", "Length", "Substring", 
		"Parseint", "Ord", "Size"
	};
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}


	public MFChenLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "MFChen.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public String[] getModeNames() { return modeNames; }

	@Override
	public ATN getATN() { return _ATN; }

	public static final String _serializedATN =
		"\3\u0430\ud6d1\u8206\uad2d\u4417\uaef1\u8d80\uaadd\2?\u0195\b\1\4\2\t"+
		"\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13"+
		"\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31\t\31"+
		"\4\32\t\32\4\33\t\33\4\34\t\34\4\35\t\35\4\36\t\36\4\37\t\37\4 \t \4!"+
		"\t!\4\"\t\"\4#\t#\4$\t$\4%\t%\4&\t&\4\'\t\'\4(\t(\4)\t)\4*\t*\4+\t+\4"+
		",\t,\4-\t-\4.\t.\4/\t/\4\60\t\60\4\61\t\61\4\62\t\62\4\63\t\63\4\64\t"+
		"\64\4\65\t\65\4\66\t\66\4\67\t\67\48\t8\49\t9\4:\t:\4;\t;\4<\t<\4=\t="+
		"\4>\t>\4?\t?\4@\t@\4A\tA\4B\tB\4C\tC\3\2\3\2\3\2\3\2\3\2\3\2\3\3\3\3\3"+
		"\3\3\3\3\3\3\3\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\5\3\5\3\5\3\5\3\5"+
		"\3\5\3\6\3\6\3\6\3\6\3\6\3\7\3\7\3\7\3\7\3\b\3\b\3\b\3\t\3\t\3\t\3\t\3"+
		"\n\3\n\3\n\3\n\3\13\3\13\3\13\3\13\3\13\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3"+
		"\r\3\r\3\r\3\r\3\r\3\r\3\r\3\16\3\16\3\16\3\16\3\16\3\17\3\17\3\17\3\17"+
		"\3\17\3\17\3\20\3\20\3\20\3\20\3\20\3\21\3\21\3\22\3\22\3\23\3\23\3\24"+
		"\3\24\3\25\3\25\3\26\3\26\3\27\3\27\3\30\3\30\3\30\3\31\3\31\3\32\3\32"+
		"\3\32\3\33\3\33\3\33\3\34\3\34\3\34\3\35\3\35\3\36\3\36\3\36\3\36\5\36"+
		"\u00fc\n\36\3\37\3\37\3 \3 \3 \3!\3!\3\"\3\"\3#\3#\3$\3$\3%\3%\3&\3&\3"+
		"&\3\'\3\'\3\'\3(\3(\3)\3)\3*\3*\3+\3+\3,\3,\3-\3-\3.\3.\3/\3/\3/\3\60"+
		"\3\60\3\60\3\61\3\61\3\62\3\62\3\62\3\62\3\62\3\62\3\62\3\62\3\62\5\62"+
		"\u0132\n\62\3\63\3\63\3\64\6\64\u0137\n\64\r\64\16\64\u0138\3\65\3\65"+
		"\3\66\3\66\3\66\7\66\u0140\n\66\f\66\16\66\u0143\13\66\3\67\3\67\38\6"+
		"8\u0148\n8\r8\168\u0149\39\39\3:\3:\3:\7:\u0151\n:\f:\16:\u0154\13:\3"+
		":\3:\3;\3;\3;\3<\3<\3<\3<\5<\u015f\n<\3=\6=\u0162\n=\r=\16=\u0163\3=\3"+
		"=\3>\3>\3>\3>\7>\u016c\n>\f>\16>\u016f\13>\3>\3>\3?\3?\3?\3?\3?\3?\3?"+
		"\3@\3@\3@\3@\3@\3@\3@\3@\3@\3@\3A\3A\3A\3A\3A\3A\3A\3A\3A\3B\3B\3B\3B"+
		"\3C\3C\3C\3C\3C\3\u0152\2D\3\3\5\4\7\5\t\6\13\7\r\b\17\t\21\n\23\13\25"+
		"\f\27\r\31\16\33\17\35\20\37\21!\22#\23%\24\'\25)\26+\27-\30/\31\61\32"+
		"\63\33\65\34\67\359\36;\37= ?!A\"C#E$G%I&K\'M(O)Q*S+U,W-Y.[/]\60_\61a"+
		"\62c\63e\2g\64i\2k\65m\2o\66q\2s\67u\2w8y9{:};\177<\u0081=\u0083>\u0085"+
		"?\3\2\t\3\2\62;\5\2C\\aac|\3\2\63;\4\2--//\b\2$$^^ddppttvv\5\2\13\f\17"+
		"\17\"\"\4\2\f\f\17\17\u019c\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3"+
		"\2\2\2\2\13\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2\2\2\2\23\3\2\2\2"+
		"\2\25\3\2\2\2\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2\2\2\35\3\2\2\2\2\37"+
		"\3\2\2\2\2!\3\2\2\2\2#\3\2\2\2\2%\3\2\2\2\2\'\3\2\2\2\2)\3\2\2\2\2+\3"+
		"\2\2\2\2-\3\2\2\2\2/\3\2\2\2\2\61\3\2\2\2\2\63\3\2\2\2\2\65\3\2\2\2\2"+
		"\67\3\2\2\2\29\3\2\2\2\2;\3\2\2\2\2=\3\2\2\2\2?\3\2\2\2\2A\3\2\2\2\2C"+
		"\3\2\2\2\2E\3\2\2\2\2G\3\2\2\2\2I\3\2\2\2\2K\3\2\2\2\2M\3\2\2\2\2O\3\2"+
		"\2\2\2Q\3\2\2\2\2S\3\2\2\2\2U\3\2\2\2\2W\3\2\2\2\2Y\3\2\2\2\2[\3\2\2\2"+
		"\2]\3\2\2\2\2_\3\2\2\2\2a\3\2\2\2\2c\3\2\2\2\2g\3\2\2\2\2k\3\2\2\2\2o"+
		"\3\2\2\2\2s\3\2\2\2\2w\3\2\2\2\2y\3\2\2\2\2{\3\2\2\2\2}\3\2\2\2\2\177"+
		"\3\2\2\2\2\u0081\3\2\2\2\2\u0083\3\2\2\2\2\u0085\3\2\2\2\3\u0087\3\2\2"+
		"\2\5\u008d\3\2\2\2\7\u0093\3\2\2\2\t\u009c\3\2\2\2\13\u00a2\3\2\2\2\r"+
		"\u00a7\3\2\2\2\17\u00ab\3\2\2\2\21\u00ae\3\2\2\2\23\u00b2\3\2\2\2\25\u00b6"+
		"\3\2\2\2\27\u00bb\3\2\2\2\31\u00c2\3\2\2\2\33\u00c9\3\2\2\2\35\u00ce\3"+
		"\2\2\2\37\u00d4\3\2\2\2!\u00d9\3\2\2\2#\u00db\3\2\2\2%\u00dd\3\2\2\2\'"+
		"\u00df\3\2\2\2)\u00e1\3\2\2\2+\u00e3\3\2\2\2-\u00e5\3\2\2\2/\u00e7\3\2"+
		"\2\2\61\u00ea\3\2\2\2\63\u00ec\3\2\2\2\65\u00ef\3\2\2\2\67\u00f2\3\2\2"+
		"\29\u00f5\3\2\2\2;\u00fb\3\2\2\2=\u00fd\3\2\2\2?\u00ff\3\2\2\2A\u0102"+
		"\3\2\2\2C\u0104\3\2\2\2E\u0106\3\2\2\2G\u0108\3\2\2\2I\u010a\3\2\2\2K"+
		"\u010c\3\2\2\2M\u010f\3\2\2\2O\u0112\3\2\2\2Q\u0114\3\2\2\2S\u0116\3\2"+
		"\2\2U\u0118\3\2\2\2W\u011a\3\2\2\2Y\u011c\3\2\2\2[\u011e\3\2\2\2]\u0120"+
		"\3\2\2\2_\u0123\3\2\2\2a\u0126\3\2\2\2c\u0131\3\2\2\2e\u0133\3\2\2\2g"+
		"\u0136\3\2\2\2i\u013a\3\2\2\2k\u013c\3\2\2\2m\u0144\3\2\2\2o\u0147\3\2"+
		"\2\2q\u014b\3\2\2\2s\u014d\3\2\2\2u\u0157\3\2\2\2w\u015e\3\2\2\2y\u0161"+
		"\3\2\2\2{\u0167\3\2\2\2}\u0172\3\2\2\2\177\u0179\3\2\2\2\u0081\u0183\3"+
		"\2\2\2\u0083\u018c\3\2\2\2\u0085\u0190\3\2\2\2\u0087\u0088\7d\2\2\u0088"+
		"\u0089\7t\2\2\u0089\u008a\7g\2\2\u008a\u008b\7c\2\2\u008b\u008c\7m\2\2"+
		"\u008c\4\3\2\2\2\u008d\u008e\7e\2\2\u008e\u008f\7n\2\2\u008f\u0090\7c"+
		"\2\2\u0090\u0091\7u\2\2\u0091\u0092\7u\2\2\u0092\6\3\2\2\2\u0093\u0094"+
		"\7e\2\2\u0094\u0095\7q\2\2\u0095\u0096\7p\2\2\u0096\u0097\7v\2\2\u0097"+
		"\u0098\7k\2\2\u0098\u0099\7p\2\2\u0099\u009a\7w\2\2\u009a\u009b\7g\2\2"+
		"\u009b\b\3\2\2\2\u009c\u009d\7e\2\2\u009d\u009e\7q\2\2\u009e\u009f\7p"+
		"\2\2\u009f\u00a0\7u\2\2\u00a0\u00a1\7v\2\2\u00a1\n\3\2\2\2\u00a2\u00a3"+
		"\7g\2\2\u00a3\u00a4\7n\2\2\u00a4\u00a5\7u\2\2\u00a5\u00a6\7g\2\2\u00a6"+
		"\f\3\2\2\2\u00a7\u00a8\7h\2\2\u00a8\u00a9\7q\2\2\u00a9\u00aa\7t\2\2\u00aa"+
		"\16\3\2\2\2\u00ab\u00ac\7k\2\2\u00ac\u00ad\7h\2\2\u00ad\20\3\2\2\2\u00ae"+
		"\u00af\7k\2\2\u00af\u00b0\7p\2\2\u00b0\u00b1\7v\2\2\u00b1\22\3\2\2\2\u00b2"+
		"\u00b3\7p\2\2\u00b3\u00b4\7g\2\2\u00b4\u00b5\7y\2\2\u00b5\24\3\2\2\2\u00b6"+
		"\u00b7\7p\2\2\u00b7\u00b8\7w\2\2\u00b8\u00b9\7n\2\2\u00b9\u00ba\7n\2\2"+
		"\u00ba\26\3\2\2\2\u00bb\u00bc\7t\2\2\u00bc\u00bd\7g\2\2\u00bd\u00be\7"+
		"v\2\2\u00be\u00bf\7w\2\2\u00bf\u00c0\7t\2\2\u00c0\u00c1\7p\2\2\u00c1\30"+
		"\3\2\2\2\u00c2\u00c3\7u\2\2\u00c3\u00c4\7v\2\2\u00c4\u00c5\7t\2\2\u00c5"+
		"\u00c6\7k\2\2\u00c6\u00c7\7p\2\2\u00c7\u00c8\7i\2\2\u00c8\32\3\2\2\2\u00c9"+
		"\u00ca\7x\2\2\u00ca\u00cb\7q\2\2\u00cb\u00cc\7k\2\2\u00cc\u00cd\7f\2\2"+
		"\u00cd\34\3\2\2\2\u00ce\u00cf\7y\2\2\u00cf\u00d0\7j\2\2\u00d0\u00d1\7"+
		"k\2\2\u00d1\u00d2\7n\2\2\u00d2\u00d3\7g\2\2\u00d3\36\3\2\2\2\u00d4\u00d5"+
		"\7d\2\2\u00d5\u00d6\7q\2\2\u00d6\u00d7\7q\2\2\u00d7\u00d8\7n\2\2\u00d8"+
		" \3\2\2\2\u00d9\u00da\7*\2\2\u00da\"\3\2\2\2\u00db\u00dc\7+\2\2\u00dc"+
		"$\3\2\2\2\u00dd\u00de\7]\2\2\u00de&\3\2\2\2\u00df\u00e0\7_\2\2\u00e0("+
		"\3\2\2\2\u00e1\u00e2\7}\2\2\u00e2*\3\2\2\2\u00e3\u00e4\7\177\2\2\u00e4"+
		",\3\2\2\2\u00e5\u00e6\7>\2\2\u00e6.\3\2\2\2\u00e7\u00e8\7>\2\2\u00e8\u00e9"+
		"\7?\2\2\u00e9\60\3\2\2\2\u00ea\u00eb\7@\2\2\u00eb\62\3\2\2\2\u00ec\u00ed"+
		"\7@\2\2\u00ed\u00ee\7?\2\2\u00ee\64\3\2\2\2\u00ef\u00f0\7>\2\2\u00f0\u00f1"+
		"\7>\2\2\u00f1\66\3\2\2\2\u00f2\u00f3\7@\2\2\u00f3\u00f4\7@\2\2\u00f48"+
		"\3\2\2\2\u00f5\u00f6\7-\2\2\u00f6:\3\2\2\2\u00f7\u00f8\7-\2\2\u00f8\u00fc"+
		"\7-\2\2\u00f9\u00fa\7/\2\2\u00fa\u00fc\7/\2\2\u00fb\u00f7\3\2\2\2\u00fb"+
		"\u00f9\3\2\2\2\u00fc<\3\2\2\2\u00fd\u00fe\7/\2\2\u00fe>\3\2\2\2\u00ff"+
		"\u0100\7/\2\2\u0100\u0101\7/\2\2\u0101@\3\2\2\2\u0102\u0103\7,\2\2\u0103"+
		"B\3\2\2\2\u0104\u0105\7\61\2\2\u0105D\3\2\2\2\u0106\u0107\7\'\2\2\u0107"+
		"F\3\2\2\2\u0108\u0109\7(\2\2\u0109H\3\2\2\2\u010a\u010b\7~\2\2\u010bJ"+
		"\3\2\2\2\u010c\u010d\7(\2\2\u010d\u010e\7(\2\2\u010eL\3\2\2\2\u010f\u0110"+
		"\7~\2\2\u0110\u0111\7~\2\2\u0111N\3\2\2\2\u0112\u0113\7`\2\2\u0113P\3"+
		"\2\2\2\u0114\u0115\7#\2\2\u0115R\3\2\2\2\u0116\u0117\7\u0080\2\2\u0117"+
		"T\3\2\2\2\u0118\u0119\7<\2\2\u0119V\3\2\2\2\u011a\u011b\7=\2\2\u011bX"+
		"\3\2\2\2\u011c\u011d\7.\2\2\u011dZ\3\2\2\2\u011e\u011f\7?\2\2\u011f\\"+
		"\3\2\2\2\u0120\u0121\7?\2\2\u0121\u0122\7?\2\2\u0122^\3\2\2\2\u0123\u0124"+
		"\7#\2\2\u0124\u0125\7?\2\2\u0125`\3\2\2\2\u0126\u0127\7\60\2\2\u0127b"+
		"\3\2\2\2\u0128\u0129\7v\2\2\u0129\u012a\7t\2\2\u012a\u012b\7w\2\2\u012b"+
		"\u0132\7g\2\2\u012c\u012d\7h\2\2\u012d\u012e\7c\2\2\u012e\u012f\7n\2\2"+
		"\u012f\u0130\7u\2\2\u0130\u0132\7g\2\2\u0131\u0128\3\2\2\2\u0131\u012c"+
		"\3\2\2\2\u0132d\3\2\2\2\u0133\u0134\t\2\2\2\u0134f\3\2\2\2\u0135\u0137"+
		"\5e\63\2\u0136\u0135\3\2\2\2\u0137\u0138\3\2\2\2\u0138\u0136\3\2\2\2\u0138"+
		"\u0139\3\2\2\2\u0139h\3\2\2\2\u013a\u013b\t\3\2\2\u013bj\3\2\2\2\u013c"+
		"\u0141\5i\65\2\u013d\u0140\5i\65\2\u013e\u0140\5e\63\2\u013f\u013d\3\2"+
		"\2\2\u013f\u013e\3\2\2\2\u0140\u0143\3\2\2\2\u0141\u013f\3\2\2\2\u0141"+
		"\u0142\3\2\2\2\u0142l\3\2\2\2\u0143\u0141\3\2\2\2\u0144\u0145\t\4\2\2"+
		"\u0145n\3\2\2\2\u0146\u0148\5e\63\2\u0147\u0146\3\2\2\2\u0148\u0149\3"+
		"\2\2\2\u0149\u0147\3\2\2\2\u0149\u014a\3\2\2\2\u014ap\3\2\2\2\u014b\u014c"+
		"\t\5\2\2\u014cr\3\2\2\2\u014d\u0152\7$\2\2\u014e\u0151\5u;\2\u014f\u0151"+
		"\13\2\2\2\u0150\u014e\3\2\2\2\u0150\u014f\3\2\2\2\u0151\u0154\3\2\2\2"+
		"\u0152\u0153\3\2\2\2\u0152\u0150\3\2\2\2\u0153\u0155\3\2\2\2\u0154\u0152"+
		"\3\2\2\2\u0155\u0156\7$\2\2\u0156t\3\2\2\2\u0157\u0158\7^\2\2\u0158\u0159"+
		"\t\6\2\2\u0159v\3\2\2\2\u015a\u015f\5o8\2\u015b\u015f\5s:\2\u015c\u015f"+
		"\5c\62\2\u015d\u015f\5\25\13\2\u015e\u015a\3\2\2\2\u015e\u015b\3\2\2\2"+
		"\u015e\u015c\3\2\2\2\u015e\u015d\3\2\2\2\u015fx\3\2\2\2\u0160\u0162\t"+
		"\7\2\2\u0161\u0160\3\2\2\2\u0162\u0163\3\2\2\2\u0163\u0161\3\2\2\2\u0163"+
		"\u0164\3\2\2\2\u0164\u0165\3\2\2\2\u0165\u0166\b=\2\2\u0166z\3\2\2\2\u0167"+
		"\u0168\7\61\2\2\u0168\u0169\7\61\2\2\u0169\u016d\3\2\2\2\u016a\u016c\n"+
		"\b\2\2\u016b\u016a\3\2\2\2\u016c\u016f\3\2\2\2\u016d\u016b\3\2\2\2\u016d"+
		"\u016e\3\2\2\2\u016e\u0170\3\2\2\2\u016f\u016d\3\2\2\2\u0170\u0171\b>"+
		"\2\2\u0171|\3\2\2\2\u0172\u0173\7n\2\2\u0173\u0174\7g\2\2\u0174\u0175"+
		"\7p\2\2\u0175\u0176\7i\2\2\u0176\u0177\7v\2\2\u0177\u0178\7j\2\2\u0178"+
		"~\3\2\2\2\u0179\u017a\7u\2\2\u017a\u017b\7w\2\2\u017b\u017c\7d\2\2\u017c"+
		"\u017d\7u\2\2\u017d\u017e\7v\2\2\u017e\u017f\7t\2\2\u017f\u0180\7k\2\2"+
		"\u0180\u0181\7p\2\2\u0181\u0182\7i\2\2\u0182\u0080\3\2\2\2\u0183\u0184"+
		"\7r\2\2\u0184\u0185\7c\2\2\u0185\u0186\7t\2\2\u0186\u0187\7u\2\2\u0187"+
		"\u0188\7g\2\2\u0188\u0189\7K\2\2\u0189\u018a\7p\2\2\u018a\u018b\7v\2\2"+
		"\u018b\u0082\3\2\2\2\u018c\u018d\7q\2\2\u018d\u018e\7t\2\2\u018e\u018f"+
		"\7f\2\2\u018f\u0084\3\2\2\2\u0190\u0191\7u\2\2\u0191\u0192\7k\2\2\u0192"+
		"\u0193\7|\2\2\u0193\u0194\7g\2\2\u0194\u0086\3\2\2\2\16\2\u00fb\u0131"+
		"\u0138\u013f\u0141\u0149\u0150\u0152\u015e\u0163\u016d\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}