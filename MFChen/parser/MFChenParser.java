// Generated from MFChen.g4 by ANTLR 4.5.2
package MFChen.parser;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class MFChenParser extends Parser {
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
	public static final int
		RULE_program = 0, RULE_class_declaration = 1, RULE_typeSpecifier = 2, 
		RULE_member_declaration_list = 3, RULE_func_declaration = 4, RULE_parameter_list = 5, 
		RULE_block_statement = 6, RULE_statement_list = 7, RULE_var_decl_stmt = 8, 
		RULE_statement = 9, RULE_jump_statement = 10, RULE_selection_statement = 11, 
		RULE_iteration_statement = 12, RULE_first_expression = 13, RULE_second_expression = 14, 
		RULE_third_expression = 15, RULE_expression_statement = 16, RULE_expression = 17, 
		RULE_assignment_expression = 18, RULE_logical_oror_expression = 19, RULE_logical_andand_expression = 20, 
		RULE_logical_or_expression = 21, RULE_logical_xor_expression = 22, RULE_logical_and_expression = 23, 
		RULE_logical_NotEqual_expression = 24, RULE_logical_Equal_expression = 25, 
		RULE_logical_LessEqual_expression = 26, RULE_logical_Less_expression = 27, 
		RULE_logical_GreaterEqual_expression = 28, RULE_logical_Greater_expression = 29, 
		RULE_logical_RightShift_expression = 30, RULE_logical_LeftShift_expression = 31, 
		RULE_minus_expression = 32, RULE_plus_expression = 33, RULE_mod_expression = 34, 
		RULE_multiply_expression = 35, RULE_divide_expression = 36, RULE_creation_expression = 37, 
		RULE_unary_expression = 38, RULE_paren_expression = 39, RULE_dim_list = 40, 
		RULE_dim_expression = 41, RULE_call_parameter_list = 42, RULE_call_expression = 43, 
		RULE_constant_expression = 44;
	public static final String[] ruleNames = {
		"program", "class_declaration", "typeSpecifier", "member_declaration_list", 
		"func_declaration", "parameter_list", "block_statement", "statement_list", 
		"var_decl_stmt", "statement", "jump_statement", "selection_statement", 
		"iteration_statement", "first_expression", "second_expression", "third_expression", 
		"expression_statement", "expression", "assignment_expression", "logical_oror_expression", 
		"logical_andand_expression", "logical_or_expression", "logical_xor_expression", 
		"logical_and_expression", "logical_NotEqual_expression", "logical_Equal_expression", 
		"logical_LessEqual_expression", "logical_Less_expression", "logical_GreaterEqual_expression", 
		"logical_Greater_expression", "logical_RightShift_expression", "logical_LeftShift_expression", 
		"minus_expression", "plus_expression", "mod_expression", "multiply_expression", 
		"divide_expression", "creation_expression", "unary_expression", "paren_expression", 
		"dim_list", "dim_expression", "call_parameter_list", "call_expression", 
		"constant_expression"
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

	@Override
	public String getGrammarFileName() { return "MFChen.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public MFChenParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}
	public static class ProgramContext extends ParserRuleContext {
		public List<Class_declarationContext> class_declaration() {
			return getRuleContexts(Class_declarationContext.class);
		}
		public Class_declarationContext class_declaration(int i) {
			return getRuleContext(Class_declarationContext.class,i);
		}
		public List<Func_declarationContext> func_declaration() {
			return getRuleContexts(Func_declarationContext.class);
		}
		public Func_declarationContext func_declaration(int i) {
			return getRuleContext(Func_declarationContext.class,i);
		}
		public List<Var_decl_stmtContext> var_decl_stmt() {
			return getRuleContexts(Var_decl_stmtContext.class);
		}
		public Var_decl_stmtContext var_decl_stmt(int i) {
			return getRuleContext(Var_decl_stmtContext.class,i);
		}
		public ProgramContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_program; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitProgram(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ProgramContext program() throws RecognitionException {
		ProgramContext _localctx = new ProgramContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_program);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(95);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << Class) | (1L << Int) | (1L << String) | (1L << Void) | (1L << Bool) | (1L << Identifier))) != 0)) {
				{
				setState(93);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,0,_ctx) ) {
				case 1:
					{
					setState(90);
					class_declaration();
					}
					break;
				case 2:
					{
					setState(91);
					func_declaration();
					}
					break;
				case 3:
					{
					setState(92);
					var_decl_stmt();
					}
					break;
				}
				}
				setState(97);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Class_declarationContext extends ParserRuleContext {
		public TerminalNode Class() { return getToken(MFChenParser.Class, 0); }
		public TerminalNode Identifier() { return getToken(MFChenParser.Identifier, 0); }
		public TerminalNode L_Brace() { return getToken(MFChenParser.L_Brace, 0); }
		public TerminalNode R_Brace() { return getToken(MFChenParser.R_Brace, 0); }
		public Member_declaration_listContext member_declaration_list() {
			return getRuleContext(Member_declaration_listContext.class,0);
		}
		public Class_declarationContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_class_declaration; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitClass_declaration(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Class_declarationContext class_declaration() throws RecognitionException {
		Class_declarationContext _localctx = new Class_declarationContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_class_declaration);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(98);
			match(Class);
			setState(99);
			match(Identifier);
			setState(100);
			match(L_Brace);
			setState(102);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << Int) | (1L << String) | (1L << Bool) | (1L << Identifier))) != 0)) {
				{
				setState(101);
				member_declaration_list();
				}
			}

			setState(104);
			match(R_Brace);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class TypeSpecifierContext extends ParserRuleContext {
		public TerminalNode Identifier() { return getToken(MFChenParser.Identifier, 0); }
		public List<TerminalNode> L_Bracket() { return getTokens(MFChenParser.L_Bracket); }
		public TerminalNode L_Bracket(int i) {
			return getToken(MFChenParser.L_Bracket, i);
		}
		public List<TerminalNode> R_Bracket() { return getTokens(MFChenParser.R_Bracket); }
		public TerminalNode R_Bracket(int i) {
			return getToken(MFChenParser.R_Bracket, i);
		}
		public TypeSpecifierContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_typeSpecifier; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitTypeSpecifier(this);
			else return visitor.visitChildren(this);
		}
	}

	public final TypeSpecifierContext typeSpecifier() throws RecognitionException {
		TypeSpecifierContext _localctx = new TypeSpecifierContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_typeSpecifier);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(106);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << Int) | (1L << String) | (1L << Bool) | (1L << Identifier))) != 0)) ) {
			_errHandler.recoverInline(this);
			} else {
				consume();
			}
			setState(111);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,3,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(107);
					match(L_Bracket);
					setState(108);
					match(R_Bracket);
					}
					} 
				}
				setState(113);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,3,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Member_declaration_listContext extends ParserRuleContext {
		public TypeSpecifierContext typeSpecifier() {
			return getRuleContext(TypeSpecifierContext.class,0);
		}
		public TerminalNode Identifier() { return getToken(MFChenParser.Identifier, 0); }
		public TerminalNode Semi() { return getToken(MFChenParser.Semi, 0); }
		public Member_declaration_listContext member_declaration_list() {
			return getRuleContext(Member_declaration_listContext.class,0);
		}
		public Member_declaration_listContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_member_declaration_list; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitMember_declaration_list(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Member_declaration_listContext member_declaration_list() throws RecognitionException {
		Member_declaration_listContext _localctx = new Member_declaration_listContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_member_declaration_list);
		try {
			setState(123);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,4,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(114);
				typeSpecifier();
				setState(115);
				match(Identifier);
				setState(116);
				match(Semi);
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(118);
				typeSpecifier();
				setState(119);
				match(Identifier);
				setState(120);
				match(Semi);
				setState(121);
				member_declaration_list();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Func_declarationContext extends ParserRuleContext {
		public TypeSpecifierContext typeSpecifier() {
			return getRuleContext(TypeSpecifierContext.class,0);
		}
		public TerminalNode Identifier() { return getToken(MFChenParser.Identifier, 0); }
		public TerminalNode L_Paren() { return getToken(MFChenParser.L_Paren, 0); }
		public TerminalNode R_Paren() { return getToken(MFChenParser.R_Paren, 0); }
		public Block_statementContext block_statement() {
			return getRuleContext(Block_statementContext.class,0);
		}
		public Parameter_listContext parameter_list() {
			return getRuleContext(Parameter_listContext.class,0);
		}
		public TerminalNode Void() { return getToken(MFChenParser.Void, 0); }
		public Func_declarationContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_func_declaration; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitFunc_declaration(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Func_declarationContext func_declaration() throws RecognitionException {
		Func_declarationContext _localctx = new Func_declarationContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_func_declaration);
		int _la;
		try {
			setState(142);
			switch (_input.LA(1)) {
			case Int:
			case String:
			case Bool:
			case Identifier:
				enterOuterAlt(_localctx, 1);
				{
				setState(125);
				typeSpecifier();
				setState(126);
				match(Identifier);
				setState(127);
				match(L_Paren);
				setState(129);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << Int) | (1L << String) | (1L << Bool) | (1L << Identifier))) != 0)) {
					{
					setState(128);
					parameter_list();
					}
				}

				setState(131);
				match(R_Paren);
				setState(132);
				block_statement();
				}
				break;
			case Void:
				enterOuterAlt(_localctx, 2);
				{
				setState(134);
				match(Void);
				setState(135);
				match(Identifier);
				setState(136);
				match(L_Paren);
				setState(138);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << Int) | (1L << String) | (1L << Bool) | (1L << Identifier))) != 0)) {
					{
					setState(137);
					parameter_list();
					}
				}

				setState(140);
				match(R_Paren);
				setState(141);
				block_statement();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Parameter_listContext extends ParserRuleContext {
		public TypeSpecifierContext typeSpecifier() {
			return getRuleContext(TypeSpecifierContext.class,0);
		}
		public TerminalNode Identifier() { return getToken(MFChenParser.Identifier, 0); }
		public TerminalNode Comma() { return getToken(MFChenParser.Comma, 0); }
		public Parameter_listContext parameter_list() {
			return getRuleContext(Parameter_listContext.class,0);
		}
		public Parameter_listContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_parameter_list; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitParameter_list(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Parameter_listContext parameter_list() throws RecognitionException {
		Parameter_listContext _localctx = new Parameter_listContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_parameter_list);
		try {
			setState(152);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,8,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(144);
				typeSpecifier();
				setState(145);
				match(Identifier);
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(147);
				typeSpecifier();
				setState(148);
				match(Identifier);
				setState(149);
				match(Comma);
				setState(150);
				parameter_list();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Block_statementContext extends ParserRuleContext {
		public TerminalNode L_Brace() { return getToken(MFChenParser.L_Brace, 0); }
		public TerminalNode R_Brace() { return getToken(MFChenParser.R_Brace, 0); }
		public Statement_listContext statement_list() {
			return getRuleContext(Statement_listContext.class,0);
		}
		public Block_statementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_block_statement; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitBlock_statement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Block_statementContext block_statement() throws RecognitionException {
		Block_statementContext _localctx = new Block_statementContext(_ctx, getState());
		enterRule(_localctx, 12, RULE_block_statement);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(154);
			match(L_Brace);
			setState(156);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << Break) | (1L << Continue) | (1L << For) | (1L << If) | (1L << Int) | (1L << New) | (1L << Null) | (1L << Return) | (1L << String) | (1L << While) | (1L << Bool) | (1L << L_Paren) | (1L << L_Brace) | (1L << PlusPlus) | (1L << Minus) | (1L << Not) | (1L << Tilde) | (1L << Semi) | (1L << LogicalConstant) | (1L << IntLiteral) | (1L << Identifier) | (1L << StringLiteral))) != 0)) {
				{
				setState(155);
				statement_list();
				}
			}

			setState(158);
			match(R_Brace);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Statement_listContext extends ParserRuleContext {
		public StatementContext statement() {
			return getRuleContext(StatementContext.class,0);
		}
		public Statement_listContext statement_list() {
			return getRuleContext(Statement_listContext.class,0);
		}
		public Statement_listContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_statement_list; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitStatement_list(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Statement_listContext statement_list() throws RecognitionException {
		Statement_listContext _localctx = new Statement_listContext(_ctx, getState());
		enterRule(_localctx, 14, RULE_statement_list);
		try {
			setState(164);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,10,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(160);
				statement();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(161);
				statement();
				setState(162);
				statement_list();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Var_decl_stmtContext extends ParserRuleContext {
		public TypeSpecifierContext typeSpecifier() {
			return getRuleContext(TypeSpecifierContext.class,0);
		}
		public TerminalNode Identifier() { return getToken(MFChenParser.Identifier, 0); }
		public TerminalNode Semi() { return getToken(MFChenParser.Semi, 0); }
		public TerminalNode Assign() { return getToken(MFChenParser.Assign, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public Var_decl_stmtContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_var_decl_stmt; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitVar_decl_stmt(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Var_decl_stmtContext var_decl_stmt() throws RecognitionException {
		Var_decl_stmtContext _localctx = new Var_decl_stmtContext(_ctx, getState());
		enterRule(_localctx, 16, RULE_var_decl_stmt);
		try {
			setState(176);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,11,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(166);
				typeSpecifier();
				setState(167);
				match(Identifier);
				setState(168);
				match(Semi);
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(170);
				typeSpecifier();
				setState(171);
				match(Identifier);
				setState(172);
				match(Assign);
				setState(173);
				expression();
				setState(174);
				match(Semi);
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class StatementContext extends ParserRuleContext {
		public Block_statementContext block_statement() {
			return getRuleContext(Block_statementContext.class,0);
		}
		public Expression_statementContext expression_statement() {
			return getRuleContext(Expression_statementContext.class,0);
		}
		public Selection_statementContext selection_statement() {
			return getRuleContext(Selection_statementContext.class,0);
		}
		public Iteration_statementContext iteration_statement() {
			return getRuleContext(Iteration_statementContext.class,0);
		}
		public Jump_statementContext jump_statement() {
			return getRuleContext(Jump_statementContext.class,0);
		}
		public Var_decl_stmtContext var_decl_stmt() {
			return getRuleContext(Var_decl_stmtContext.class,0);
		}
		public TerminalNode Semi() { return getToken(MFChenParser.Semi, 0); }
		public StatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_statement; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitStatement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final StatementContext statement() throws RecognitionException {
		StatementContext _localctx = new StatementContext(_ctx, getState());
		enterRule(_localctx, 18, RULE_statement);
		try {
			setState(185);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,12,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(178);
				block_statement();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(179);
				expression_statement();
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(180);
				selection_statement();
				}
				break;
			case 4:
				enterOuterAlt(_localctx, 4);
				{
				setState(181);
				iteration_statement();
				}
				break;
			case 5:
				enterOuterAlt(_localctx, 5);
				{
				setState(182);
				jump_statement();
				}
				break;
			case 6:
				enterOuterAlt(_localctx, 6);
				{
				setState(183);
				var_decl_stmt();
				}
				break;
			case 7:
				enterOuterAlt(_localctx, 7);
				{
				setState(184);
				match(Semi);
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Jump_statementContext extends ParserRuleContext {
		public TerminalNode Return() { return getToken(MFChenParser.Return, 0); }
		public TerminalNode Semi() { return getToken(MFChenParser.Semi, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public TerminalNode Break() { return getToken(MFChenParser.Break, 0); }
		public TerminalNode Continue() { return getToken(MFChenParser.Continue, 0); }
		public Jump_statementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_jump_statement; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitJump_statement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Jump_statementContext jump_statement() throws RecognitionException {
		Jump_statementContext _localctx = new Jump_statementContext(_ctx, getState());
		enterRule(_localctx, 20, RULE_jump_statement);
		int _la;
		try {
			setState(196);
			switch (_input.LA(1)) {
			case Return:
				enterOuterAlt(_localctx, 1);
				{
				setState(187);
				match(Return);
				setState(189);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << New) | (1L << Null) | (1L << L_Paren) | (1L << PlusPlus) | (1L << Minus) | (1L << Not) | (1L << Tilde) | (1L << LogicalConstant) | (1L << IntLiteral) | (1L << Identifier) | (1L << StringLiteral))) != 0)) {
					{
					setState(188);
					expression();
					}
				}

				setState(191);
				match(Semi);
				}
				break;
			case Break:
				enterOuterAlt(_localctx, 2);
				{
				setState(192);
				match(Break);
				setState(193);
				match(Semi);
				}
				break;
			case Continue:
				enterOuterAlt(_localctx, 3);
				{
				setState(194);
				match(Continue);
				setState(195);
				match(Semi);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Selection_statementContext extends ParserRuleContext {
		public TerminalNode If() { return getToken(MFChenParser.If, 0); }
		public TerminalNode L_Paren() { return getToken(MFChenParser.L_Paren, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public TerminalNode R_Paren() { return getToken(MFChenParser.R_Paren, 0); }
		public List<StatementContext> statement() {
			return getRuleContexts(StatementContext.class);
		}
		public StatementContext statement(int i) {
			return getRuleContext(StatementContext.class,i);
		}
		public TerminalNode Else() { return getToken(MFChenParser.Else, 0); }
		public Selection_statementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_selection_statement; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitSelection_statement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Selection_statementContext selection_statement() throws RecognitionException {
		Selection_statementContext _localctx = new Selection_statementContext(_ctx, getState());
		enterRule(_localctx, 22, RULE_selection_statement);
		try {
			setState(212);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,15,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(198);
				match(If);
				setState(199);
				match(L_Paren);
				setState(200);
				expression();
				setState(201);
				match(R_Paren);
				setState(202);
				statement();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(204);
				match(If);
				setState(205);
				match(L_Paren);
				setState(206);
				expression();
				setState(207);
				match(R_Paren);
				setState(208);
				statement();
				setState(209);
				match(Else);
				setState(210);
				statement();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Iteration_statementContext extends ParserRuleContext {
		public TerminalNode While() { return getToken(MFChenParser.While, 0); }
		public TerminalNode L_Paren() { return getToken(MFChenParser.L_Paren, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public TerminalNode R_Paren() { return getToken(MFChenParser.R_Paren, 0); }
		public StatementContext statement() {
			return getRuleContext(StatementContext.class,0);
		}
		public TerminalNode For() { return getToken(MFChenParser.For, 0); }
		public First_expressionContext first_expression() {
			return getRuleContext(First_expressionContext.class,0);
		}
		public List<TerminalNode> Semi() { return getTokens(MFChenParser.Semi); }
		public TerminalNode Semi(int i) {
			return getToken(MFChenParser.Semi, i);
		}
		public Second_expressionContext second_expression() {
			return getRuleContext(Second_expressionContext.class,0);
		}
		public Third_expressionContext third_expression() {
			return getRuleContext(Third_expressionContext.class,0);
		}
		public Iteration_statementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_iteration_statement; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitIteration_statement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Iteration_statementContext iteration_statement() throws RecognitionException {
		Iteration_statementContext _localctx = new Iteration_statementContext(_ctx, getState());
		enterRule(_localctx, 24, RULE_iteration_statement);
		try {
			setState(230);
			switch (_input.LA(1)) {
			case While:
				enterOuterAlt(_localctx, 1);
				{
				setState(214);
				match(While);
				setState(215);
				match(L_Paren);
				setState(216);
				expression();
				setState(217);
				match(R_Paren);
				setState(218);
				statement();
				}
				break;
			case For:
				enterOuterAlt(_localctx, 2);
				{
				setState(220);
				match(For);
				setState(221);
				match(L_Paren);
				setState(222);
				first_expression();
				setState(223);
				match(Semi);
				setState(224);
				second_expression();
				setState(225);
				match(Semi);
				setState(226);
				third_expression();
				setState(227);
				match(R_Paren);
				setState(228);
				statement();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class First_expressionContext extends ParserRuleContext {
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public First_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_first_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitFirst_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final First_expressionContext first_expression() throws RecognitionException {
		First_expressionContext _localctx = new First_expressionContext(_ctx, getState());
		enterRule(_localctx, 26, RULE_first_expression);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(233);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << New) | (1L << Null) | (1L << L_Paren) | (1L << PlusPlus) | (1L << Minus) | (1L << Not) | (1L << Tilde) | (1L << LogicalConstant) | (1L << IntLiteral) | (1L << Identifier) | (1L << StringLiteral))) != 0)) {
				{
				setState(232);
				expression();
				}
			}

			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Second_expressionContext extends ParserRuleContext {
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public Second_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_second_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitSecond_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Second_expressionContext second_expression() throws RecognitionException {
		Second_expressionContext _localctx = new Second_expressionContext(_ctx, getState());
		enterRule(_localctx, 28, RULE_second_expression);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(236);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << New) | (1L << Null) | (1L << L_Paren) | (1L << PlusPlus) | (1L << Minus) | (1L << Not) | (1L << Tilde) | (1L << LogicalConstant) | (1L << IntLiteral) | (1L << Identifier) | (1L << StringLiteral))) != 0)) {
				{
				setState(235);
				expression();
				}
			}

			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Third_expressionContext extends ParserRuleContext {
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public Third_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_third_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitThird_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Third_expressionContext third_expression() throws RecognitionException {
		Third_expressionContext _localctx = new Third_expressionContext(_ctx, getState());
		enterRule(_localctx, 30, RULE_third_expression);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(239);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << New) | (1L << Null) | (1L << L_Paren) | (1L << PlusPlus) | (1L << Minus) | (1L << Not) | (1L << Tilde) | (1L << LogicalConstant) | (1L << IntLiteral) | (1L << Identifier) | (1L << StringLiteral))) != 0)) {
				{
				setState(238);
				expression();
				}
			}

			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Expression_statementContext extends ParserRuleContext {
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public TerminalNode Semi() { return getToken(MFChenParser.Semi, 0); }
		public Expression_statementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_expression_statement; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitExpression_statement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Expression_statementContext expression_statement() throws RecognitionException {
		Expression_statementContext _localctx = new Expression_statementContext(_ctx, getState());
		enterRule(_localctx, 32, RULE_expression_statement);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(241);
			expression();
			setState(242);
			match(Semi);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ExpressionContext extends ParserRuleContext {
		public Assignment_expressionContext assignment_expression() {
			return getRuleContext(Assignment_expressionContext.class,0);
		}
		public ExpressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitExpression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ExpressionContext expression() throws RecognitionException {
		ExpressionContext _localctx = new ExpressionContext(_ctx, getState());
		enterRule(_localctx, 34, RULE_expression);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(244);
			assignment_expression(0);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Assignment_expressionContext extends ParserRuleContext {
		public Logical_oror_expressionContext logical_oror_expression() {
			return getRuleContext(Logical_oror_expressionContext.class,0);
		}
		public List<Assignment_expressionContext> assignment_expression() {
			return getRuleContexts(Assignment_expressionContext.class);
		}
		public Assignment_expressionContext assignment_expression(int i) {
			return getRuleContext(Assignment_expressionContext.class,i);
		}
		public TerminalNode Assign() { return getToken(MFChenParser.Assign, 0); }
		public Assignment_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_assignment_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitAssignment_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Assignment_expressionContext assignment_expression() throws RecognitionException {
		return assignment_expression(0);
	}

	private Assignment_expressionContext assignment_expression(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		Assignment_expressionContext _localctx = new Assignment_expressionContext(_ctx, _parentState);
		Assignment_expressionContext _prevctx = _localctx;
		int _startState = 36;
		enterRecursionRule(_localctx, 36, RULE_assignment_expression, _p);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			{
			setState(247);
			logical_oror_expression(0);
			}
			_ctx.stop = _input.LT(-1);
			setState(254);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,20,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					{
					_localctx = new Assignment_expressionContext(_parentctx, _parentState);
					pushNewRecursionContext(_localctx, _startState, RULE_assignment_expression);
					setState(249);
					if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
					setState(250);
					match(Assign);
					setState(251);
					assignment_expression(2);
					}
					} 
				}
				setState(256);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,20,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class Logical_oror_expressionContext extends ParserRuleContext {
		public Logical_andand_expressionContext logical_andand_expression() {
			return getRuleContext(Logical_andand_expressionContext.class,0);
		}
		public List<Logical_oror_expressionContext> logical_oror_expression() {
			return getRuleContexts(Logical_oror_expressionContext.class);
		}
		public Logical_oror_expressionContext logical_oror_expression(int i) {
			return getRuleContext(Logical_oror_expressionContext.class,i);
		}
		public TerminalNode OrOr() { return getToken(MFChenParser.OrOr, 0); }
		public Logical_oror_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_logical_oror_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitLogical_oror_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Logical_oror_expressionContext logical_oror_expression() throws RecognitionException {
		return logical_oror_expression(0);
	}

	private Logical_oror_expressionContext logical_oror_expression(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		Logical_oror_expressionContext _localctx = new Logical_oror_expressionContext(_ctx, _parentState);
		Logical_oror_expressionContext _prevctx = _localctx;
		int _startState = 38;
		enterRecursionRule(_localctx, 38, RULE_logical_oror_expression, _p);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			{
			setState(258);
			logical_andand_expression(0);
			}
			_ctx.stop = _input.LT(-1);
			setState(265);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,21,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					{
					_localctx = new Logical_oror_expressionContext(_parentctx, _parentState);
					pushNewRecursionContext(_localctx, _startState, RULE_logical_oror_expression);
					setState(260);
					if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
					setState(261);
					match(OrOr);
					setState(262);
					logical_oror_expression(2);
					}
					} 
				}
				setState(267);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,21,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class Logical_andand_expressionContext extends ParserRuleContext {
		public Logical_or_expressionContext logical_or_expression() {
			return getRuleContext(Logical_or_expressionContext.class,0);
		}
		public List<Logical_andand_expressionContext> logical_andand_expression() {
			return getRuleContexts(Logical_andand_expressionContext.class);
		}
		public Logical_andand_expressionContext logical_andand_expression(int i) {
			return getRuleContext(Logical_andand_expressionContext.class,i);
		}
		public TerminalNode AndAnd() { return getToken(MFChenParser.AndAnd, 0); }
		public Logical_andand_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_logical_andand_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitLogical_andand_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Logical_andand_expressionContext logical_andand_expression() throws RecognitionException {
		return logical_andand_expression(0);
	}

	private Logical_andand_expressionContext logical_andand_expression(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		Logical_andand_expressionContext _localctx = new Logical_andand_expressionContext(_ctx, _parentState);
		Logical_andand_expressionContext _prevctx = _localctx;
		int _startState = 40;
		enterRecursionRule(_localctx, 40, RULE_logical_andand_expression, _p);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			{
			setState(269);
			logical_or_expression(0);
			}
			_ctx.stop = _input.LT(-1);
			setState(276);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,22,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					{
					_localctx = new Logical_andand_expressionContext(_parentctx, _parentState);
					pushNewRecursionContext(_localctx, _startState, RULE_logical_andand_expression);
					setState(271);
					if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
					setState(272);
					match(AndAnd);
					setState(273);
					logical_andand_expression(2);
					}
					} 
				}
				setState(278);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,22,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class Logical_or_expressionContext extends ParserRuleContext {
		public Logical_xor_expressionContext logical_xor_expression() {
			return getRuleContext(Logical_xor_expressionContext.class,0);
		}
		public List<Logical_or_expressionContext> logical_or_expression() {
			return getRuleContexts(Logical_or_expressionContext.class);
		}
		public Logical_or_expressionContext logical_or_expression(int i) {
			return getRuleContext(Logical_or_expressionContext.class,i);
		}
		public TerminalNode Or() { return getToken(MFChenParser.Or, 0); }
		public Logical_or_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_logical_or_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitLogical_or_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Logical_or_expressionContext logical_or_expression() throws RecognitionException {
		return logical_or_expression(0);
	}

	private Logical_or_expressionContext logical_or_expression(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		Logical_or_expressionContext _localctx = new Logical_or_expressionContext(_ctx, _parentState);
		Logical_or_expressionContext _prevctx = _localctx;
		int _startState = 42;
		enterRecursionRule(_localctx, 42, RULE_logical_or_expression, _p);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			{
			setState(280);
			logical_xor_expression(0);
			}
			_ctx.stop = _input.LT(-1);
			setState(287);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,23,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					{
					_localctx = new Logical_or_expressionContext(_parentctx, _parentState);
					pushNewRecursionContext(_localctx, _startState, RULE_logical_or_expression);
					setState(282);
					if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
					setState(283);
					match(Or);
					setState(284);
					logical_or_expression(3);
					}
					} 
				}
				setState(289);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,23,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class Logical_xor_expressionContext extends ParserRuleContext {
		public Logical_and_expressionContext logical_and_expression() {
			return getRuleContext(Logical_and_expressionContext.class,0);
		}
		public List<Logical_xor_expressionContext> logical_xor_expression() {
			return getRuleContexts(Logical_xor_expressionContext.class);
		}
		public Logical_xor_expressionContext logical_xor_expression(int i) {
			return getRuleContext(Logical_xor_expressionContext.class,i);
		}
		public TerminalNode Caret() { return getToken(MFChenParser.Caret, 0); }
		public Logical_xor_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_logical_xor_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitLogical_xor_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Logical_xor_expressionContext logical_xor_expression() throws RecognitionException {
		return logical_xor_expression(0);
	}

	private Logical_xor_expressionContext logical_xor_expression(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		Logical_xor_expressionContext _localctx = new Logical_xor_expressionContext(_ctx, _parentState);
		Logical_xor_expressionContext _prevctx = _localctx;
		int _startState = 44;
		enterRecursionRule(_localctx, 44, RULE_logical_xor_expression, _p);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			{
			setState(291);
			logical_and_expression(0);
			}
			_ctx.stop = _input.LT(-1);
			setState(298);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,24,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					{
					_localctx = new Logical_xor_expressionContext(_parentctx, _parentState);
					pushNewRecursionContext(_localctx, _startState, RULE_logical_xor_expression);
					setState(293);
					if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
					setState(294);
					match(Caret);
					setState(295);
					logical_xor_expression(3);
					}
					} 
				}
				setState(300);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,24,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class Logical_and_expressionContext extends ParserRuleContext {
		public Logical_NotEqual_expressionContext logical_NotEqual_expression() {
			return getRuleContext(Logical_NotEqual_expressionContext.class,0);
		}
		public List<Logical_and_expressionContext> logical_and_expression() {
			return getRuleContexts(Logical_and_expressionContext.class);
		}
		public Logical_and_expressionContext logical_and_expression(int i) {
			return getRuleContext(Logical_and_expressionContext.class,i);
		}
		public TerminalNode And() { return getToken(MFChenParser.And, 0); }
		public Logical_and_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_logical_and_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitLogical_and_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Logical_and_expressionContext logical_and_expression() throws RecognitionException {
		return logical_and_expression(0);
	}

	private Logical_and_expressionContext logical_and_expression(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		Logical_and_expressionContext _localctx = new Logical_and_expressionContext(_ctx, _parentState);
		Logical_and_expressionContext _prevctx = _localctx;
		int _startState = 46;
		enterRecursionRule(_localctx, 46, RULE_logical_and_expression, _p);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			{
			setState(302);
			logical_NotEqual_expression(0);
			}
			_ctx.stop = _input.LT(-1);
			setState(309);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,25,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					{
					_localctx = new Logical_and_expressionContext(_parentctx, _parentState);
					pushNewRecursionContext(_localctx, _startState, RULE_logical_and_expression);
					setState(304);
					if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
					setState(305);
					match(And);
					setState(306);
					logical_and_expression(3);
					}
					} 
				}
				setState(311);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,25,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class Logical_NotEqual_expressionContext extends ParserRuleContext {
		public Logical_Equal_expressionContext logical_Equal_expression() {
			return getRuleContext(Logical_Equal_expressionContext.class,0);
		}
		public List<Logical_NotEqual_expressionContext> logical_NotEqual_expression() {
			return getRuleContexts(Logical_NotEqual_expressionContext.class);
		}
		public Logical_NotEqual_expressionContext logical_NotEqual_expression(int i) {
			return getRuleContext(Logical_NotEqual_expressionContext.class,i);
		}
		public TerminalNode NotEqual() { return getToken(MFChenParser.NotEqual, 0); }
		public Logical_NotEqual_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_logical_NotEqual_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitLogical_NotEqual_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Logical_NotEqual_expressionContext logical_NotEqual_expression() throws RecognitionException {
		return logical_NotEqual_expression(0);
	}

	private Logical_NotEqual_expressionContext logical_NotEqual_expression(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		Logical_NotEqual_expressionContext _localctx = new Logical_NotEqual_expressionContext(_ctx, _parentState);
		Logical_NotEqual_expressionContext _prevctx = _localctx;
		int _startState = 48;
		enterRecursionRule(_localctx, 48, RULE_logical_NotEqual_expression, _p);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			{
			setState(313);
			logical_Equal_expression(0);
			}
			_ctx.stop = _input.LT(-1);
			setState(320);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,26,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					{
					_localctx = new Logical_NotEqual_expressionContext(_parentctx, _parentState);
					pushNewRecursionContext(_localctx, _startState, RULE_logical_NotEqual_expression);
					setState(315);
					if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
					setState(316);
					match(NotEqual);
					setState(317);
					logical_NotEqual_expression(3);
					}
					} 
				}
				setState(322);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,26,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class Logical_Equal_expressionContext extends ParserRuleContext {
		public Logical_LessEqual_expressionContext logical_LessEqual_expression() {
			return getRuleContext(Logical_LessEqual_expressionContext.class,0);
		}
		public List<Logical_Equal_expressionContext> logical_Equal_expression() {
			return getRuleContexts(Logical_Equal_expressionContext.class);
		}
		public Logical_Equal_expressionContext logical_Equal_expression(int i) {
			return getRuleContext(Logical_Equal_expressionContext.class,i);
		}
		public TerminalNode Equal() { return getToken(MFChenParser.Equal, 0); }
		public Logical_Equal_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_logical_Equal_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitLogical_Equal_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Logical_Equal_expressionContext logical_Equal_expression() throws RecognitionException {
		return logical_Equal_expression(0);
	}

	private Logical_Equal_expressionContext logical_Equal_expression(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		Logical_Equal_expressionContext _localctx = new Logical_Equal_expressionContext(_ctx, _parentState);
		Logical_Equal_expressionContext _prevctx = _localctx;
		int _startState = 50;
		enterRecursionRule(_localctx, 50, RULE_logical_Equal_expression, _p);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			{
			setState(324);
			logical_LessEqual_expression(0);
			}
			_ctx.stop = _input.LT(-1);
			setState(331);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,27,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					{
					_localctx = new Logical_Equal_expressionContext(_parentctx, _parentState);
					pushNewRecursionContext(_localctx, _startState, RULE_logical_Equal_expression);
					setState(326);
					if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
					setState(327);
					match(Equal);
					setState(328);
					logical_Equal_expression(3);
					}
					} 
				}
				setState(333);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,27,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class Logical_LessEqual_expressionContext extends ParserRuleContext {
		public Logical_Less_expressionContext logical_Less_expression() {
			return getRuleContext(Logical_Less_expressionContext.class,0);
		}
		public List<Logical_LessEqual_expressionContext> logical_LessEqual_expression() {
			return getRuleContexts(Logical_LessEqual_expressionContext.class);
		}
		public Logical_LessEqual_expressionContext logical_LessEqual_expression(int i) {
			return getRuleContext(Logical_LessEqual_expressionContext.class,i);
		}
		public TerminalNode LessEqual() { return getToken(MFChenParser.LessEqual, 0); }
		public Logical_LessEqual_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_logical_LessEqual_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitLogical_LessEqual_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Logical_LessEqual_expressionContext logical_LessEqual_expression() throws RecognitionException {
		return logical_LessEqual_expression(0);
	}

	private Logical_LessEqual_expressionContext logical_LessEqual_expression(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		Logical_LessEqual_expressionContext _localctx = new Logical_LessEqual_expressionContext(_ctx, _parentState);
		Logical_LessEqual_expressionContext _prevctx = _localctx;
		int _startState = 52;
		enterRecursionRule(_localctx, 52, RULE_logical_LessEqual_expression, _p);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			{
			setState(335);
			logical_Less_expression(0);
			}
			_ctx.stop = _input.LT(-1);
			setState(342);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,28,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					{
					_localctx = new Logical_LessEqual_expressionContext(_parentctx, _parentState);
					pushNewRecursionContext(_localctx, _startState, RULE_logical_LessEqual_expression);
					setState(337);
					if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
					setState(338);
					match(LessEqual);
					setState(339);
					logical_LessEqual_expression(3);
					}
					} 
				}
				setState(344);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,28,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class Logical_Less_expressionContext extends ParserRuleContext {
		public Logical_GreaterEqual_expressionContext logical_GreaterEqual_expression() {
			return getRuleContext(Logical_GreaterEqual_expressionContext.class,0);
		}
		public List<Logical_Less_expressionContext> logical_Less_expression() {
			return getRuleContexts(Logical_Less_expressionContext.class);
		}
		public Logical_Less_expressionContext logical_Less_expression(int i) {
			return getRuleContext(Logical_Less_expressionContext.class,i);
		}
		public TerminalNode Less() { return getToken(MFChenParser.Less, 0); }
		public Logical_Less_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_logical_Less_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitLogical_Less_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Logical_Less_expressionContext logical_Less_expression() throws RecognitionException {
		return logical_Less_expression(0);
	}

	private Logical_Less_expressionContext logical_Less_expression(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		Logical_Less_expressionContext _localctx = new Logical_Less_expressionContext(_ctx, _parentState);
		Logical_Less_expressionContext _prevctx = _localctx;
		int _startState = 54;
		enterRecursionRule(_localctx, 54, RULE_logical_Less_expression, _p);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			{
			setState(346);
			logical_GreaterEqual_expression(0);
			}
			_ctx.stop = _input.LT(-1);
			setState(353);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,29,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					{
					_localctx = new Logical_Less_expressionContext(_parentctx, _parentState);
					pushNewRecursionContext(_localctx, _startState, RULE_logical_Less_expression);
					setState(348);
					if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
					setState(349);
					match(Less);
					setState(350);
					logical_Less_expression(3);
					}
					} 
				}
				setState(355);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,29,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class Logical_GreaterEqual_expressionContext extends ParserRuleContext {
		public Logical_Greater_expressionContext logical_Greater_expression() {
			return getRuleContext(Logical_Greater_expressionContext.class,0);
		}
		public List<Logical_GreaterEqual_expressionContext> logical_GreaterEqual_expression() {
			return getRuleContexts(Logical_GreaterEqual_expressionContext.class);
		}
		public Logical_GreaterEqual_expressionContext logical_GreaterEqual_expression(int i) {
			return getRuleContext(Logical_GreaterEqual_expressionContext.class,i);
		}
		public TerminalNode GreaterEqual() { return getToken(MFChenParser.GreaterEqual, 0); }
		public Logical_GreaterEqual_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_logical_GreaterEqual_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitLogical_GreaterEqual_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Logical_GreaterEqual_expressionContext logical_GreaterEqual_expression() throws RecognitionException {
		return logical_GreaterEqual_expression(0);
	}

	private Logical_GreaterEqual_expressionContext logical_GreaterEqual_expression(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		Logical_GreaterEqual_expressionContext _localctx = new Logical_GreaterEqual_expressionContext(_ctx, _parentState);
		Logical_GreaterEqual_expressionContext _prevctx = _localctx;
		int _startState = 56;
		enterRecursionRule(_localctx, 56, RULE_logical_GreaterEqual_expression, _p);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			{
			setState(357);
			logical_Greater_expression(0);
			}
			_ctx.stop = _input.LT(-1);
			setState(364);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,30,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					{
					_localctx = new Logical_GreaterEqual_expressionContext(_parentctx, _parentState);
					pushNewRecursionContext(_localctx, _startState, RULE_logical_GreaterEqual_expression);
					setState(359);
					if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
					setState(360);
					match(GreaterEqual);
					setState(361);
					logical_GreaterEqual_expression(3);
					}
					} 
				}
				setState(366);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,30,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class Logical_Greater_expressionContext extends ParserRuleContext {
		public Logical_RightShift_expressionContext logical_RightShift_expression() {
			return getRuleContext(Logical_RightShift_expressionContext.class,0);
		}
		public List<Logical_Greater_expressionContext> logical_Greater_expression() {
			return getRuleContexts(Logical_Greater_expressionContext.class);
		}
		public Logical_Greater_expressionContext logical_Greater_expression(int i) {
			return getRuleContext(Logical_Greater_expressionContext.class,i);
		}
		public TerminalNode Greater() { return getToken(MFChenParser.Greater, 0); }
		public Logical_Greater_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_logical_Greater_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitLogical_Greater_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Logical_Greater_expressionContext logical_Greater_expression() throws RecognitionException {
		return logical_Greater_expression(0);
	}

	private Logical_Greater_expressionContext logical_Greater_expression(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		Logical_Greater_expressionContext _localctx = new Logical_Greater_expressionContext(_ctx, _parentState);
		Logical_Greater_expressionContext _prevctx = _localctx;
		int _startState = 58;
		enterRecursionRule(_localctx, 58, RULE_logical_Greater_expression, _p);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			{
			setState(368);
			logical_RightShift_expression(0);
			}
			_ctx.stop = _input.LT(-1);
			setState(375);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,31,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					{
					_localctx = new Logical_Greater_expressionContext(_parentctx, _parentState);
					pushNewRecursionContext(_localctx, _startState, RULE_logical_Greater_expression);
					setState(370);
					if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
					setState(371);
					match(Greater);
					setState(372);
					logical_Greater_expression(3);
					}
					} 
				}
				setState(377);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,31,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class Logical_RightShift_expressionContext extends ParserRuleContext {
		public Logical_LeftShift_expressionContext logical_LeftShift_expression() {
			return getRuleContext(Logical_LeftShift_expressionContext.class,0);
		}
		public List<Logical_RightShift_expressionContext> logical_RightShift_expression() {
			return getRuleContexts(Logical_RightShift_expressionContext.class);
		}
		public Logical_RightShift_expressionContext logical_RightShift_expression(int i) {
			return getRuleContext(Logical_RightShift_expressionContext.class,i);
		}
		public TerminalNode RightShift() { return getToken(MFChenParser.RightShift, 0); }
		public TerminalNode LeftShift() { return getToken(MFChenParser.LeftShift, 0); }
		public Logical_RightShift_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_logical_RightShift_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitLogical_RightShift_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Logical_RightShift_expressionContext logical_RightShift_expression() throws RecognitionException {
		return logical_RightShift_expression(0);
	}

	private Logical_RightShift_expressionContext logical_RightShift_expression(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		Logical_RightShift_expressionContext _localctx = new Logical_RightShift_expressionContext(_ctx, _parentState);
		Logical_RightShift_expressionContext _prevctx = _localctx;
		int _startState = 60;
		enterRecursionRule(_localctx, 60, RULE_logical_RightShift_expression, _p);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			{
			setState(379);
			logical_LeftShift_expression();
			}
			_ctx.stop = _input.LT(-1);
			setState(386);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,32,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					{
					_localctx = new Logical_RightShift_expressionContext(_parentctx, _parentState);
					pushNewRecursionContext(_localctx, _startState, RULE_logical_RightShift_expression);
					setState(381);
					if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
					setState(382);
					_la = _input.LA(1);
					if ( !(_la==LeftShift || _la==RightShift) ) {
					_errHandler.recoverInline(this);
					} else {
						consume();
					}
					setState(383);
					logical_RightShift_expression(3);
					}
					} 
				}
				setState(388);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,32,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class Logical_LeftShift_expressionContext extends ParserRuleContext {
		public Minus_expressionContext minus_expression() {
			return getRuleContext(Minus_expressionContext.class,0);
		}
		public Logical_LeftShift_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_logical_LeftShift_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitLogical_LeftShift_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Logical_LeftShift_expressionContext logical_LeftShift_expression() throws RecognitionException {
		Logical_LeftShift_expressionContext _localctx = new Logical_LeftShift_expressionContext(_ctx, getState());
		enterRule(_localctx, 62, RULE_logical_LeftShift_expression);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(389);
			minus_expression(0);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Minus_expressionContext extends ParserRuleContext {
		public Plus_expressionContext plus_expression() {
			return getRuleContext(Plus_expressionContext.class,0);
		}
		public List<Minus_expressionContext> minus_expression() {
			return getRuleContexts(Minus_expressionContext.class);
		}
		public Minus_expressionContext minus_expression(int i) {
			return getRuleContext(Minus_expressionContext.class,i);
		}
		public TerminalNode Minus() { return getToken(MFChenParser.Minus, 0); }
		public TerminalNode Plus() { return getToken(MFChenParser.Plus, 0); }
		public Minus_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_minus_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitMinus_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Minus_expressionContext minus_expression() throws RecognitionException {
		return minus_expression(0);
	}

	private Minus_expressionContext minus_expression(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		Minus_expressionContext _localctx = new Minus_expressionContext(_ctx, _parentState);
		Minus_expressionContext _prevctx = _localctx;
		int _startState = 64;
		enterRecursionRule(_localctx, 64, RULE_minus_expression, _p);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			{
			setState(392);
			plus_expression();
			}
			_ctx.stop = _input.LT(-1);
			setState(399);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,33,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					{
					_localctx = new Minus_expressionContext(_parentctx, _parentState);
					pushNewRecursionContext(_localctx, _startState, RULE_minus_expression);
					setState(394);
					if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
					setState(395);
					_la = _input.LA(1);
					if ( !(_la==Plus || _la==Minus) ) {
					_errHandler.recoverInline(this);
					} else {
						consume();
					}
					setState(396);
					minus_expression(3);
					}
					} 
				}
				setState(401);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,33,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class Plus_expressionContext extends ParserRuleContext {
		public Multiply_expressionContext multiply_expression() {
			return getRuleContext(Multiply_expressionContext.class,0);
		}
		public Plus_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_plus_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitPlus_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Plus_expressionContext plus_expression() throws RecognitionException {
		Plus_expressionContext _localctx = new Plus_expressionContext(_ctx, getState());
		enterRule(_localctx, 66, RULE_plus_expression);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(402);
			multiply_expression(0);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Mod_expressionContext extends ParserRuleContext {
		public Creation_expressionContext creation_expression() {
			return getRuleContext(Creation_expressionContext.class,0);
		}
		public Mod_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_mod_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitMod_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Mod_expressionContext mod_expression() throws RecognitionException {
		Mod_expressionContext _localctx = new Mod_expressionContext(_ctx, getState());
		enterRule(_localctx, 68, RULE_mod_expression);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(404);
			creation_expression();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Multiply_expressionContext extends ParserRuleContext {
		public Divide_expressionContext divide_expression() {
			return getRuleContext(Divide_expressionContext.class,0);
		}
		public List<Multiply_expressionContext> multiply_expression() {
			return getRuleContexts(Multiply_expressionContext.class);
		}
		public Multiply_expressionContext multiply_expression(int i) {
			return getRuleContext(Multiply_expressionContext.class,i);
		}
		public TerminalNode Star() { return getToken(MFChenParser.Star, 0); }
		public TerminalNode Mod() { return getToken(MFChenParser.Mod, 0); }
		public TerminalNode Div() { return getToken(MFChenParser.Div, 0); }
		public Multiply_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_multiply_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitMultiply_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Multiply_expressionContext multiply_expression() throws RecognitionException {
		return multiply_expression(0);
	}

	private Multiply_expressionContext multiply_expression(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		Multiply_expressionContext _localctx = new Multiply_expressionContext(_ctx, _parentState);
		Multiply_expressionContext _prevctx = _localctx;
		int _startState = 70;
		enterRecursionRule(_localctx, 70, RULE_multiply_expression, _p);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			{
			setState(407);
			divide_expression();
			}
			_ctx.stop = _input.LT(-1);
			setState(414);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,34,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					{
					_localctx = new Multiply_expressionContext(_parentctx, _parentState);
					pushNewRecursionContext(_localctx, _startState, RULE_multiply_expression);
					setState(409);
					if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
					setState(410);
					_la = _input.LA(1);
					if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << Star) | (1L << Div) | (1L << Mod))) != 0)) ) {
					_errHandler.recoverInline(this);
					} else {
						consume();
					}
					setState(411);
					multiply_expression(3);
					}
					} 
				}
				setState(416);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,34,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class Divide_expressionContext extends ParserRuleContext {
		public Mod_expressionContext mod_expression() {
			return getRuleContext(Mod_expressionContext.class,0);
		}
		public Divide_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_divide_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitDivide_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Divide_expressionContext divide_expression() throws RecognitionException {
		Divide_expressionContext _localctx = new Divide_expressionContext(_ctx, getState());
		enterRule(_localctx, 72, RULE_divide_expression);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(417);
			mod_expression();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Creation_expressionContext extends ParserRuleContext {
		public TerminalNode New() { return getToken(MFChenParser.New, 0); }
		public TypeSpecifierContext typeSpecifier() {
			return getRuleContext(TypeSpecifierContext.class,0);
		}
		public Dim_expressionContext dim_expression() {
			return getRuleContext(Dim_expressionContext.class,0);
		}
		public Unary_expressionContext unary_expression() {
			return getRuleContext(Unary_expressionContext.class,0);
		}
		public Creation_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_creation_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitCreation_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Creation_expressionContext creation_expression() throws RecognitionException {
		Creation_expressionContext _localctx = new Creation_expressionContext(_ctx, getState());
		enterRule(_localctx, 74, RULE_creation_expression);
		try {
			setState(424);
			switch (_input.LA(1)) {
			case New:
				enterOuterAlt(_localctx, 1);
				{
				setState(419);
				match(New);
				setState(420);
				typeSpecifier();
				setState(421);
				dim_expression();
				}
				break;
			case Null:
			case L_Paren:
			case PlusPlus:
			case Minus:
			case Not:
			case Tilde:
			case LogicalConstant:
			case IntLiteral:
			case Identifier:
			case StringLiteral:
				enterOuterAlt(_localctx, 2);
				{
				setState(423);
				unary_expression(0);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Unary_expressionContext extends ParserRuleContext {
		public TerminalNode PlusPlus() { return getToken(MFChenParser.PlusPlus, 0); }
		public Unary_expressionContext unary_expression() {
			return getRuleContext(Unary_expressionContext.class,0);
		}
		public TerminalNode Minus() { return getToken(MFChenParser.Minus, 0); }
		public TerminalNode Not() { return getToken(MFChenParser.Not, 0); }
		public TerminalNode Tilde() { return getToken(MFChenParser.Tilde, 0); }
		public Call_expressionContext call_expression() {
			return getRuleContext(Call_expressionContext.class,0);
		}
		public Dim_expressionContext dim_expression() {
			return getRuleContext(Dim_expressionContext.class,0);
		}
		public Constant_expressionContext constant_expression() {
			return getRuleContext(Constant_expressionContext.class,0);
		}
		public TerminalNode Identifier() { return getToken(MFChenParser.Identifier, 0); }
		public Paren_expressionContext paren_expression() {
			return getRuleContext(Paren_expressionContext.class,0);
		}
		public TerminalNode Dot() { return getToken(MFChenParser.Dot, 0); }
		public TerminalNode L_Paren() { return getToken(MFChenParser.L_Paren, 0); }
		public TerminalNode R_Paren() { return getToken(MFChenParser.R_Paren, 0); }
		public Call_parameter_listContext call_parameter_list() {
			return getRuleContext(Call_parameter_listContext.class,0);
		}
		public Unary_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_unary_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitUnary_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Unary_expressionContext unary_expression() throws RecognitionException {
		return unary_expression(0);
	}

	private Unary_expressionContext unary_expression(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		Unary_expressionContext _localctx = new Unary_expressionContext(_ctx, _parentState);
		Unary_expressionContext _prevctx = _localctx;
		int _startState = 76;
		enterRecursionRule(_localctx, 76, RULE_unary_expression, _p);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(443);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,36,_ctx) ) {
			case 1:
				{
				setState(427);
				match(PlusPlus);
				setState(428);
				unary_expression(10);
				}
				break;
			case 2:
				{
				setState(429);
				match(Minus);
				setState(430);
				unary_expression(8);
				}
				break;
			case 3:
				{
				setState(431);
				match(Not);
				setState(432);
				unary_expression(7);
				}
				break;
			case 4:
				{
				setState(433);
				match(Tilde);
				setState(434);
				unary_expression(6);
				}
				break;
			case 5:
				{
				setState(435);
				call_expression();
				setState(436);
				dim_expression();
				}
				break;
			case 6:
				{
				setState(438);
				constant_expression();
				}
				break;
			case 7:
				{
				setState(439);
				match(Identifier);
				setState(440);
				dim_expression();
				}
				break;
			case 8:
				{
				setState(441);
				match(Identifier);
				}
				break;
			case 9:
				{
				setState(442);
				paren_expression();
				}
				break;
			}
			_ctx.stop = _input.LT(-1);
			setState(460);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,40,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					setState(458);
					_errHandler.sync(this);
					switch ( getInterpreter().adaptivePredict(_input,39,_ctx) ) {
					case 1:
						{
						_localctx = new Unary_expressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_unary_expression);
						setState(445);
						if (!(precpred(_ctx, 11))) throw new FailedPredicateException(this, "precpred(_ctx, 11)");
						setState(446);
						match(Dot);
						setState(447);
						match(Identifier);
						setState(448);
						dim_expression();
						setState(454);
						_errHandler.sync(this);
						switch ( getInterpreter().adaptivePredict(_input,38,_ctx) ) {
						case 1:
							{
							setState(449);
							match(L_Paren);
							setState(451);
							_la = _input.LA(1);
							if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << New) | (1L << Null) | (1L << L_Paren) | (1L << PlusPlus) | (1L << Minus) | (1L << Not) | (1L << Tilde) | (1L << LogicalConstant) | (1L << IntLiteral) | (1L << Identifier) | (1L << StringLiteral))) != 0)) {
								{
								setState(450);
								call_parameter_list();
								}
							}

							setState(453);
							match(R_Paren);
							}
							break;
						}
						}
						break;
					case 2:
						{
						_localctx = new Unary_expressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_unary_expression);
						setState(456);
						if (!(precpred(_ctx, 9))) throw new FailedPredicateException(this, "precpred(_ctx, 9)");
						setState(457);
						match(PlusPlus);
						}
						break;
					}
					} 
				}
				setState(462);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,40,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class Paren_expressionContext extends ParserRuleContext {
		public TerminalNode L_Paren() { return getToken(MFChenParser.L_Paren, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public TerminalNode R_Paren() { return getToken(MFChenParser.R_Paren, 0); }
		public Paren_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_paren_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitParen_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Paren_expressionContext paren_expression() throws RecognitionException {
		Paren_expressionContext _localctx = new Paren_expressionContext(_ctx, getState());
		enterRule(_localctx, 78, RULE_paren_expression);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(463);
			match(L_Paren);
			setState(464);
			expression();
			setState(465);
			match(R_Paren);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Dim_listContext extends ParserRuleContext {
		public TerminalNode IntLiteral() { return getToken(MFChenParser.IntLiteral, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public Dim_listContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_dim_list; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitDim_list(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Dim_listContext dim_list() throws RecognitionException {
		Dim_listContext _localctx = new Dim_listContext(_ctx, getState());
		enterRule(_localctx, 80, RULE_dim_list);
		try {
			setState(469);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,41,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(467);
				match(IntLiteral);
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(468);
				expression();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Dim_expressionContext extends ParserRuleContext {
		public List<TerminalNode> L_Bracket() { return getTokens(MFChenParser.L_Bracket); }
		public TerminalNode L_Bracket(int i) {
			return getToken(MFChenParser.L_Bracket, i);
		}
		public List<Dim_listContext> dim_list() {
			return getRuleContexts(Dim_listContext.class);
		}
		public Dim_listContext dim_list(int i) {
			return getRuleContext(Dim_listContext.class,i);
		}
		public List<TerminalNode> R_Bracket() { return getTokens(MFChenParser.R_Bracket); }
		public TerminalNode R_Bracket(int i) {
			return getToken(MFChenParser.R_Bracket, i);
		}
		public Dim_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_dim_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitDim_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Dim_expressionContext dim_expression() throws RecognitionException {
		Dim_expressionContext _localctx = new Dim_expressionContext(_ctx, getState());
		enterRule(_localctx, 82, RULE_dim_expression);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(477);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,42,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(471);
					match(L_Bracket);
					setState(472);
					dim_list();
					setState(473);
					match(R_Bracket);
					}
					} 
				}
				setState(479);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,42,_ctx);
			}
			setState(484);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,43,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(480);
					match(L_Bracket);
					setState(481);
					match(R_Bracket);
					}
					} 
				}
				setState(486);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,43,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Call_parameter_listContext extends ParserRuleContext {
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public List<TerminalNode> Comma() { return getTokens(MFChenParser.Comma); }
		public TerminalNode Comma(int i) {
			return getToken(MFChenParser.Comma, i);
		}
		public Call_parameter_listContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_call_parameter_list; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitCall_parameter_list(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Call_parameter_listContext call_parameter_list() throws RecognitionException {
		Call_parameter_listContext _localctx = new Call_parameter_listContext(_ctx, getState());
		enterRule(_localctx, 84, RULE_call_parameter_list);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(492);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,44,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(487);
					expression();
					setState(488);
					match(Comma);
					}
					} 
				}
				setState(494);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,44,_ctx);
			}
			setState(495);
			expression();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Call_expressionContext extends ParserRuleContext {
		public TerminalNode Identifier() { return getToken(MFChenParser.Identifier, 0); }
		public Dim_expressionContext dim_expression() {
			return getRuleContext(Dim_expressionContext.class,0);
		}
		public TerminalNode L_Paren() { return getToken(MFChenParser.L_Paren, 0); }
		public TerminalNode R_Paren() { return getToken(MFChenParser.R_Paren, 0); }
		public Call_parameter_listContext call_parameter_list() {
			return getRuleContext(Call_parameter_listContext.class,0);
		}
		public Call_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_call_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitCall_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Call_expressionContext call_expression() throws RecognitionException {
		Call_expressionContext _localctx = new Call_expressionContext(_ctx, getState());
		enterRule(_localctx, 86, RULE_call_expression);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(497);
			match(Identifier);
			setState(498);
			dim_expression();
			setState(499);
			match(L_Paren);
			setState(501);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << New) | (1L << Null) | (1L << L_Paren) | (1L << PlusPlus) | (1L << Minus) | (1L << Not) | (1L << Tilde) | (1L << LogicalConstant) | (1L << IntLiteral) | (1L << Identifier) | (1L << StringLiteral))) != 0)) {
				{
				setState(500);
				call_parameter_list();
				}
			}

			setState(503);
			match(R_Paren);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Constant_expressionContext extends ParserRuleContext {
		public TerminalNode Null() { return getToken(MFChenParser.Null, 0); }
		public TerminalNode IntLiteral() { return getToken(MFChenParser.IntLiteral, 0); }
		public TerminalNode StringLiteral() { return getToken(MFChenParser.StringLiteral, 0); }
		public TerminalNode LogicalConstant() { return getToken(MFChenParser.LogicalConstant, 0); }
		public Constant_expressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_constant_expression; }
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MFChenVisitor ) return ((MFChenVisitor<? extends T>)visitor).visitConstant_expression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final Constant_expressionContext constant_expression() throws RecognitionException {
		Constant_expressionContext _localctx = new Constant_expressionContext(_ctx, getState());
		enterRule(_localctx, 88, RULE_constant_expression);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(505);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << Null) | (1L << LogicalConstant) | (1L << IntLiteral) | (1L << StringLiteral))) != 0)) ) {
			_errHandler.recoverInline(this);
			} else {
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public boolean sempred(RuleContext _localctx, int ruleIndex, int predIndex) {
		switch (ruleIndex) {
		case 18:
			return assignment_expression_sempred((Assignment_expressionContext)_localctx, predIndex);
		case 19:
			return logical_oror_expression_sempred((Logical_oror_expressionContext)_localctx, predIndex);
		case 20:
			return logical_andand_expression_sempred((Logical_andand_expressionContext)_localctx, predIndex);
		case 21:
			return logical_or_expression_sempred((Logical_or_expressionContext)_localctx, predIndex);
		case 22:
			return logical_xor_expression_sempred((Logical_xor_expressionContext)_localctx, predIndex);
		case 23:
			return logical_and_expression_sempred((Logical_and_expressionContext)_localctx, predIndex);
		case 24:
			return logical_NotEqual_expression_sempred((Logical_NotEqual_expressionContext)_localctx, predIndex);
		case 25:
			return logical_Equal_expression_sempred((Logical_Equal_expressionContext)_localctx, predIndex);
		case 26:
			return logical_LessEqual_expression_sempred((Logical_LessEqual_expressionContext)_localctx, predIndex);
		case 27:
			return logical_Less_expression_sempred((Logical_Less_expressionContext)_localctx, predIndex);
		case 28:
			return logical_GreaterEqual_expression_sempred((Logical_GreaterEqual_expressionContext)_localctx, predIndex);
		case 29:
			return logical_Greater_expression_sempred((Logical_Greater_expressionContext)_localctx, predIndex);
		case 30:
			return logical_RightShift_expression_sempred((Logical_RightShift_expressionContext)_localctx, predIndex);
		case 32:
			return minus_expression_sempred((Minus_expressionContext)_localctx, predIndex);
		case 35:
			return multiply_expression_sempred((Multiply_expressionContext)_localctx, predIndex);
		case 38:
			return unary_expression_sempred((Unary_expressionContext)_localctx, predIndex);
		}
		return true;
	}
	private boolean assignment_expression_sempred(Assignment_expressionContext _localctx, int predIndex) {
		switch (predIndex) {
		case 0:
			return precpred(_ctx, 2);
		}
		return true;
	}
	private boolean logical_oror_expression_sempred(Logical_oror_expressionContext _localctx, int predIndex) {
		switch (predIndex) {
		case 1:
			return precpred(_ctx, 2);
		}
		return true;
	}
	private boolean logical_andand_expression_sempred(Logical_andand_expressionContext _localctx, int predIndex) {
		switch (predIndex) {
		case 2:
			return precpred(_ctx, 2);
		}
		return true;
	}
	private boolean logical_or_expression_sempred(Logical_or_expressionContext _localctx, int predIndex) {
		switch (predIndex) {
		case 3:
			return precpred(_ctx, 2);
		}
		return true;
	}
	private boolean logical_xor_expression_sempred(Logical_xor_expressionContext _localctx, int predIndex) {
		switch (predIndex) {
		case 4:
			return precpred(_ctx, 2);
		}
		return true;
	}
	private boolean logical_and_expression_sempred(Logical_and_expressionContext _localctx, int predIndex) {
		switch (predIndex) {
		case 5:
			return precpred(_ctx, 2);
		}
		return true;
	}
	private boolean logical_NotEqual_expression_sempred(Logical_NotEqual_expressionContext _localctx, int predIndex) {
		switch (predIndex) {
		case 6:
			return precpred(_ctx, 2);
		}
		return true;
	}
	private boolean logical_Equal_expression_sempred(Logical_Equal_expressionContext _localctx, int predIndex) {
		switch (predIndex) {
		case 7:
			return precpred(_ctx, 2);
		}
		return true;
	}
	private boolean logical_LessEqual_expression_sempred(Logical_LessEqual_expressionContext _localctx, int predIndex) {
		switch (predIndex) {
		case 8:
			return precpred(_ctx, 2);
		}
		return true;
	}
	private boolean logical_Less_expression_sempred(Logical_Less_expressionContext _localctx, int predIndex) {
		switch (predIndex) {
		case 9:
			return precpred(_ctx, 2);
		}
		return true;
	}
	private boolean logical_GreaterEqual_expression_sempred(Logical_GreaterEqual_expressionContext _localctx, int predIndex) {
		switch (predIndex) {
		case 10:
			return precpred(_ctx, 2);
		}
		return true;
	}
	private boolean logical_Greater_expression_sempred(Logical_Greater_expressionContext _localctx, int predIndex) {
		switch (predIndex) {
		case 11:
			return precpred(_ctx, 2);
		}
		return true;
	}
	private boolean logical_RightShift_expression_sempred(Logical_RightShift_expressionContext _localctx, int predIndex) {
		switch (predIndex) {
		case 12:
			return precpred(_ctx, 2);
		}
		return true;
	}
	private boolean minus_expression_sempred(Minus_expressionContext _localctx, int predIndex) {
		switch (predIndex) {
		case 13:
			return precpred(_ctx, 2);
		}
		return true;
	}
	private boolean multiply_expression_sempred(Multiply_expressionContext _localctx, int predIndex) {
		switch (predIndex) {
		case 14:
			return precpred(_ctx, 2);
		}
		return true;
	}
	private boolean unary_expression_sempred(Unary_expressionContext _localctx, int predIndex) {
		switch (predIndex) {
		case 15:
			return precpred(_ctx, 11);
		case 16:
			return precpred(_ctx, 9);
		}
		return true;
	}

	public static final String _serializedATN =
		"\3\u0430\ud6d1\u8206\uad2d\u4417\uaef1\u8d80\uaadd\3?\u01fe\4\2\t\2\4"+
		"\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t"+
		"\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31\t\31"+
		"\4\32\t\32\4\33\t\33\4\34\t\34\4\35\t\35\4\36\t\36\4\37\t\37\4 \t \4!"+
		"\t!\4\"\t\"\4#\t#\4$\t$\4%\t%\4&\t&\4\'\t\'\4(\t(\4)\t)\4*\t*\4+\t+\4"+
		",\t,\4-\t-\4.\t.\3\2\3\2\3\2\7\2`\n\2\f\2\16\2c\13\2\3\3\3\3\3\3\3\3\5"+
		"\3i\n\3\3\3\3\3\3\4\3\4\3\4\7\4p\n\4\f\4\16\4s\13\4\3\5\3\5\3\5\3\5\3"+
		"\5\3\5\3\5\3\5\3\5\5\5~\n\5\3\6\3\6\3\6\3\6\5\6\u0084\n\6\3\6\3\6\3\6"+
		"\3\6\3\6\3\6\3\6\5\6\u008d\n\6\3\6\3\6\5\6\u0091\n\6\3\7\3\7\3\7\3\7\3"+
		"\7\3\7\3\7\3\7\5\7\u009b\n\7\3\b\3\b\5\b\u009f\n\b\3\b\3\b\3\t\3\t\3\t"+
		"\3\t\5\t\u00a7\n\t\3\n\3\n\3\n\3\n\3\n\3\n\3\n\3\n\3\n\3\n\5\n\u00b3\n"+
		"\n\3\13\3\13\3\13\3\13\3\13\3\13\3\13\5\13\u00bc\n\13\3\f\3\f\5\f\u00c0"+
		"\n\f\3\f\3\f\3\f\3\f\3\f\5\f\u00c7\n\f\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r"+
		"\3\r\3\r\3\r\3\r\3\r\3\r\5\r\u00d7\n\r\3\16\3\16\3\16\3\16\3\16\3\16\3"+
		"\16\3\16\3\16\3\16\3\16\3\16\3\16\3\16\3\16\3\16\5\16\u00e9\n\16\3\17"+
		"\5\17\u00ec\n\17\3\20\5\20\u00ef\n\20\3\21\5\21\u00f2\n\21\3\22\3\22\3"+
		"\22\3\23\3\23\3\24\3\24\3\24\3\24\3\24\3\24\7\24\u00ff\n\24\f\24\16\24"+
		"\u0102\13\24\3\25\3\25\3\25\3\25\3\25\3\25\7\25\u010a\n\25\f\25\16\25"+
		"\u010d\13\25\3\26\3\26\3\26\3\26\3\26\3\26\7\26\u0115\n\26\f\26\16\26"+
		"\u0118\13\26\3\27\3\27\3\27\3\27\3\27\3\27\7\27\u0120\n\27\f\27\16\27"+
		"\u0123\13\27\3\30\3\30\3\30\3\30\3\30\3\30\7\30\u012b\n\30\f\30\16\30"+
		"\u012e\13\30\3\31\3\31\3\31\3\31\3\31\3\31\7\31\u0136\n\31\f\31\16\31"+
		"\u0139\13\31\3\32\3\32\3\32\3\32\3\32\3\32\7\32\u0141\n\32\f\32\16\32"+
		"\u0144\13\32\3\33\3\33\3\33\3\33\3\33\3\33\7\33\u014c\n\33\f\33\16\33"+
		"\u014f\13\33\3\34\3\34\3\34\3\34\3\34\3\34\7\34\u0157\n\34\f\34\16\34"+
		"\u015a\13\34\3\35\3\35\3\35\3\35\3\35\3\35\7\35\u0162\n\35\f\35\16\35"+
		"\u0165\13\35\3\36\3\36\3\36\3\36\3\36\3\36\7\36\u016d\n\36\f\36\16\36"+
		"\u0170\13\36\3\37\3\37\3\37\3\37\3\37\3\37\7\37\u0178\n\37\f\37\16\37"+
		"\u017b\13\37\3 \3 \3 \3 \3 \3 \7 \u0183\n \f \16 \u0186\13 \3!\3!\3\""+
		"\3\"\3\"\3\"\3\"\3\"\7\"\u0190\n\"\f\"\16\"\u0193\13\"\3#\3#\3$\3$\3%"+
		"\3%\3%\3%\3%\3%\7%\u019f\n%\f%\16%\u01a2\13%\3&\3&\3\'\3\'\3\'\3\'\3\'"+
		"\5\'\u01ab\n\'\3(\3(\3(\3(\3(\3(\3(\3(\3(\3(\3(\3(\3(\3(\3(\3(\3(\5(\u01be"+
		"\n(\3(\3(\3(\3(\3(\3(\5(\u01c6\n(\3(\5(\u01c9\n(\3(\3(\7(\u01cd\n(\f("+
		"\16(\u01d0\13(\3)\3)\3)\3)\3*\3*\5*\u01d8\n*\3+\3+\3+\3+\7+\u01de\n+\f"+
		"+\16+\u01e1\13+\3+\3+\7+\u01e5\n+\f+\16+\u01e8\13+\3,\3,\3,\7,\u01ed\n"+
		",\f,\16,\u01f0\13,\3,\3,\3-\3-\3-\3-\5-\u01f8\n-\3-\3-\3.\3.\3.\2\22&"+
		"(*,.\60\62\64\668:<>BHN/\2\4\6\b\n\f\16\20\22\24\26\30\32\34\36 \"$&("+
		"*,.\60\62\64\668:<>@BDFHJLNPRTVXZ\2\7\6\2\n\n\16\16\21\21\65\65\3\2\34"+
		"\35\4\2\36\36  \3\2\"$\5\2\f\f\63\64\67\67\u020c\2a\3\2\2\2\4d\3\2\2\2"+
		"\6l\3\2\2\2\b}\3\2\2\2\n\u0090\3\2\2\2\f\u009a\3\2\2\2\16\u009c\3\2\2"+
		"\2\20\u00a6\3\2\2\2\22\u00b2\3\2\2\2\24\u00bb\3\2\2\2\26\u00c6\3\2\2\2"+
		"\30\u00d6\3\2\2\2\32\u00e8\3\2\2\2\34\u00eb\3\2\2\2\36\u00ee\3\2\2\2 "+
		"\u00f1\3\2\2\2\"\u00f3\3\2\2\2$\u00f6\3\2\2\2&\u00f8\3\2\2\2(\u0103\3"+
		"\2\2\2*\u010e\3\2\2\2,\u0119\3\2\2\2.\u0124\3\2\2\2\60\u012f\3\2\2\2\62"+
		"\u013a\3\2\2\2\64\u0145\3\2\2\2\66\u0150\3\2\2\28\u015b\3\2\2\2:\u0166"+
		"\3\2\2\2<\u0171\3\2\2\2>\u017c\3\2\2\2@\u0187\3\2\2\2B\u0189\3\2\2\2D"+
		"\u0194\3\2\2\2F\u0196\3\2\2\2H\u0198\3\2\2\2J\u01a3\3\2\2\2L\u01aa\3\2"+
		"\2\2N\u01bd\3\2\2\2P\u01d1\3\2\2\2R\u01d7\3\2\2\2T\u01df\3\2\2\2V\u01ee"+
		"\3\2\2\2X\u01f3\3\2\2\2Z\u01fb\3\2\2\2\\`\5\4\3\2]`\5\n\6\2^`\5\22\n\2"+
		"_\\\3\2\2\2_]\3\2\2\2_^\3\2\2\2`c\3\2\2\2a_\3\2\2\2ab\3\2\2\2b\3\3\2\2"+
		"\2ca\3\2\2\2de\7\4\2\2ef\7\65\2\2fh\7\26\2\2gi\5\b\5\2hg\3\2\2\2hi\3\2"+
		"\2\2ij\3\2\2\2jk\7\27\2\2k\5\3\2\2\2lq\t\2\2\2mn\7\24\2\2np\7\25\2\2o"+
		"m\3\2\2\2ps\3\2\2\2qo\3\2\2\2qr\3\2\2\2r\7\3\2\2\2sq\3\2\2\2tu\5\6\4\2"+
		"uv\7\65\2\2vw\7-\2\2w~\3\2\2\2xy\5\6\4\2yz\7\65\2\2z{\7-\2\2{|\5\b\5\2"+
		"|~\3\2\2\2}t\3\2\2\2}x\3\2\2\2~\t\3\2\2\2\177\u0080\5\6\4\2\u0080\u0081"+
		"\7\65\2\2\u0081\u0083\7\22\2\2\u0082\u0084\5\f\7\2\u0083\u0082\3\2\2\2"+
		"\u0083\u0084\3\2\2\2\u0084\u0085\3\2\2\2\u0085\u0086\7\23\2\2\u0086\u0087"+
		"\5\16\b\2\u0087\u0091\3\2\2\2\u0088\u0089\7\17\2\2\u0089\u008a\7\65\2"+
		"\2\u008a\u008c\7\22\2\2\u008b\u008d\5\f\7\2\u008c\u008b\3\2\2\2\u008c"+
		"\u008d\3\2\2\2\u008d\u008e\3\2\2\2\u008e\u008f\7\23\2\2\u008f\u0091\5"+
		"\16\b\2\u0090\177\3\2\2\2\u0090\u0088\3\2\2\2\u0091\13\3\2\2\2\u0092\u0093"+
		"\5\6\4\2\u0093\u0094\7\65\2\2\u0094\u009b\3\2\2\2\u0095\u0096\5\6\4\2"+
		"\u0096\u0097\7\65\2\2\u0097\u0098\7.\2\2\u0098\u0099\5\f\7\2\u0099\u009b"+
		"\3\2\2\2\u009a\u0092\3\2\2\2\u009a\u0095\3\2\2\2\u009b\r\3\2\2\2\u009c"+
		"\u009e\7\26\2\2\u009d\u009f\5\20\t\2\u009e\u009d\3\2\2\2\u009e\u009f\3"+
		"\2\2\2\u009f\u00a0\3\2\2\2\u00a0\u00a1\7\27\2\2\u00a1\17\3\2\2\2\u00a2"+
		"\u00a7\5\24\13\2\u00a3\u00a4\5\24\13\2\u00a4\u00a5\5\20\t\2\u00a5\u00a7"+
		"\3\2\2\2\u00a6\u00a2\3\2\2\2\u00a6\u00a3\3\2\2\2\u00a7\21\3\2\2\2\u00a8"+
		"\u00a9\5\6\4\2\u00a9\u00aa\7\65\2\2\u00aa\u00ab\7-\2\2\u00ab\u00b3\3\2"+
		"\2\2\u00ac\u00ad\5\6\4\2\u00ad\u00ae\7\65\2\2\u00ae\u00af\7/\2\2\u00af"+
		"\u00b0\5$\23\2\u00b0\u00b1\7-\2\2\u00b1\u00b3\3\2\2\2\u00b2\u00a8\3\2"+
		"\2\2\u00b2\u00ac\3\2\2\2\u00b3\23\3\2\2\2\u00b4\u00bc\5\16\b\2\u00b5\u00bc"+
		"\5\"\22\2\u00b6\u00bc\5\30\r\2\u00b7\u00bc\5\32\16\2\u00b8\u00bc\5\26"+
		"\f\2\u00b9\u00bc\5\22\n\2\u00ba\u00bc\7-\2\2\u00bb\u00b4\3\2\2\2\u00bb"+
		"\u00b5\3\2\2\2\u00bb\u00b6\3\2\2\2\u00bb\u00b7\3\2\2\2\u00bb\u00b8\3\2"+
		"\2\2\u00bb\u00b9\3\2\2\2\u00bb\u00ba\3\2\2\2\u00bc\25\3\2\2\2\u00bd\u00bf"+
		"\7\r\2\2\u00be\u00c0\5$\23\2\u00bf\u00be\3\2\2\2\u00bf\u00c0\3\2\2\2\u00c0"+
		"\u00c1\3\2\2\2\u00c1\u00c7\7-\2\2\u00c2\u00c3\7\3\2\2\u00c3\u00c7\7-\2"+
		"\2\u00c4\u00c5\7\5\2\2\u00c5\u00c7\7-\2\2\u00c6\u00bd\3\2\2\2\u00c6\u00c2"+
		"\3\2\2\2\u00c6\u00c4\3\2\2\2\u00c7\27\3\2\2\2\u00c8\u00c9\7\t\2\2\u00c9"+
		"\u00ca\7\22\2\2\u00ca\u00cb\5$\23\2\u00cb\u00cc\7\23\2\2\u00cc\u00cd\5"+
		"\24\13\2\u00cd\u00d7\3\2\2\2\u00ce\u00cf\7\t\2\2\u00cf\u00d0\7\22\2\2"+
		"\u00d0\u00d1\5$\23\2\u00d1\u00d2\7\23\2\2\u00d2\u00d3\5\24\13\2\u00d3"+
		"\u00d4\7\7\2\2\u00d4\u00d5\5\24\13\2\u00d5\u00d7\3\2\2\2\u00d6\u00c8\3"+
		"\2\2\2\u00d6\u00ce\3\2\2\2\u00d7\31\3\2\2\2\u00d8\u00d9\7\20\2\2\u00d9"+
		"\u00da\7\22\2\2\u00da\u00db\5$\23\2\u00db\u00dc\7\23\2\2\u00dc\u00dd\5"+
		"\24\13\2\u00dd\u00e9\3\2\2\2\u00de\u00df\7\b\2\2\u00df\u00e0\7\22\2\2"+
		"\u00e0\u00e1\5\34\17\2\u00e1\u00e2\7-\2\2\u00e2\u00e3\5\36\20\2\u00e3"+
		"\u00e4\7-\2\2\u00e4\u00e5\5 \21\2\u00e5\u00e6\7\23\2\2\u00e6\u00e7\5\24"+
		"\13\2\u00e7\u00e9\3\2\2\2\u00e8\u00d8\3\2\2\2\u00e8\u00de\3\2\2\2\u00e9"+
		"\33\3\2\2\2\u00ea\u00ec\5$\23\2\u00eb\u00ea\3\2\2\2\u00eb\u00ec\3\2\2"+
		"\2\u00ec\35\3\2\2\2\u00ed\u00ef\5$\23\2\u00ee\u00ed\3\2\2\2\u00ee\u00ef"+
		"\3\2\2\2\u00ef\37\3\2\2\2\u00f0\u00f2\5$\23\2\u00f1\u00f0\3\2\2\2\u00f1"+
		"\u00f2\3\2\2\2\u00f2!\3\2\2\2\u00f3\u00f4\5$\23\2\u00f4\u00f5\7-\2\2\u00f5"+
		"#\3\2\2\2\u00f6\u00f7\5&\24\2\u00f7%\3\2\2\2\u00f8\u00f9\b\24\1\2\u00f9"+
		"\u00fa\5(\25\2\u00fa\u0100\3\2\2\2\u00fb\u00fc\f\4\2\2\u00fc\u00fd\7/"+
		"\2\2\u00fd\u00ff\5&\24\4\u00fe\u00fb\3\2\2\2\u00ff\u0102\3\2\2\2\u0100"+
		"\u00fe\3\2\2\2\u0100\u0101\3\2\2\2\u0101\'\3\2\2\2\u0102\u0100\3\2\2\2"+
		"\u0103\u0104\b\25\1\2\u0104\u0105\5*\26\2\u0105\u010b\3\2\2\2\u0106\u0107"+
		"\f\4\2\2\u0107\u0108\7(\2\2\u0108\u010a\5(\25\4\u0109\u0106\3\2\2\2\u010a"+
		"\u010d\3\2\2\2\u010b\u0109\3\2\2\2\u010b\u010c\3\2\2\2\u010c)\3\2\2\2"+
		"\u010d\u010b\3\2\2\2\u010e\u010f\b\26\1\2\u010f\u0110\5,\27\2\u0110\u0116"+
		"\3\2\2\2\u0111\u0112\f\4\2\2\u0112\u0113\7\'\2\2\u0113\u0115\5*\26\4\u0114"+
		"\u0111\3\2\2\2\u0115\u0118\3\2\2\2\u0116\u0114\3\2\2\2\u0116\u0117\3\2"+
		"\2\2\u0117+\3\2\2\2\u0118\u0116\3\2\2\2\u0119\u011a\b\27\1\2\u011a\u011b"+
		"\5.\30\2\u011b\u0121\3\2\2\2\u011c\u011d\f\4\2\2\u011d\u011e\7&\2\2\u011e"+
		"\u0120\5,\27\5\u011f\u011c\3\2\2\2\u0120\u0123\3\2\2\2\u0121\u011f\3\2"+
		"\2\2\u0121\u0122\3\2\2\2\u0122-\3\2\2\2\u0123\u0121\3\2\2\2\u0124\u0125"+
		"\b\30\1\2\u0125\u0126\5\60\31\2\u0126\u012c\3\2\2\2\u0127\u0128\f\4\2"+
		"\2\u0128\u0129\7)\2\2\u0129\u012b\5.\30\5\u012a\u0127\3\2\2\2\u012b\u012e"+
		"\3\2\2\2\u012c\u012a\3\2\2\2\u012c\u012d\3\2\2\2\u012d/\3\2\2\2\u012e"+
		"\u012c\3\2\2\2\u012f\u0130\b\31\1\2\u0130\u0131\5\62\32\2\u0131\u0137"+
		"\3\2\2\2\u0132\u0133\f\4\2\2\u0133\u0134\7%\2\2\u0134\u0136\5\60\31\5"+
		"\u0135\u0132\3\2\2\2\u0136\u0139\3\2\2\2\u0137\u0135\3\2\2\2\u0137\u0138"+
		"\3\2\2\2\u0138\61\3\2\2\2\u0139\u0137\3\2\2\2\u013a\u013b\b\32\1\2\u013b"+
		"\u013c\5\64\33\2\u013c\u0142\3\2\2\2\u013d\u013e\f\4\2\2\u013e\u013f\7"+
		"\61\2\2\u013f\u0141\5\62\32\5\u0140\u013d\3\2\2\2\u0141\u0144\3\2\2\2"+
		"\u0142\u0140\3\2\2\2\u0142\u0143\3\2\2\2\u0143\63\3\2\2\2\u0144\u0142"+
		"\3\2\2\2\u0145\u0146\b\33\1\2\u0146\u0147\5\66\34\2\u0147\u014d\3\2\2"+
		"\2\u0148\u0149\f\4\2\2\u0149\u014a\7\60\2\2\u014a\u014c\5\64\33\5\u014b"+
		"\u0148\3\2\2\2\u014c\u014f\3\2\2\2\u014d\u014b\3\2\2\2\u014d\u014e\3\2"+
		"\2\2\u014e\65\3\2\2\2\u014f\u014d\3\2\2\2\u0150\u0151\b\34\1\2\u0151\u0152"+
		"\58\35\2\u0152\u0158\3\2\2\2\u0153\u0154\f\4\2\2\u0154\u0155\7\31\2\2"+
		"\u0155\u0157\5\66\34\5\u0156\u0153\3\2\2\2\u0157\u015a\3\2\2\2\u0158\u0156"+
		"\3\2\2\2\u0158\u0159\3\2\2\2\u0159\67\3\2\2\2\u015a\u0158\3\2\2\2\u015b"+
		"\u015c\b\35\1\2\u015c\u015d\5:\36\2\u015d\u0163\3\2\2\2\u015e\u015f\f"+
		"\4\2\2\u015f\u0160\7\30\2\2\u0160\u0162\58\35\5\u0161\u015e\3\2\2\2\u0162"+
		"\u0165\3\2\2\2\u0163\u0161\3\2\2\2\u0163\u0164\3\2\2\2\u01649\3\2\2\2"+
		"\u0165\u0163\3\2\2\2\u0166\u0167\b\36\1\2\u0167\u0168\5<\37\2\u0168\u016e"+
		"\3\2\2\2\u0169\u016a\f\4\2\2\u016a\u016b\7\33\2\2\u016b\u016d\5:\36\5"+
		"\u016c\u0169\3\2\2\2\u016d\u0170\3\2\2\2\u016e\u016c\3\2\2\2\u016e\u016f"+
		"\3\2\2\2\u016f;\3\2\2\2\u0170\u016e\3\2\2\2\u0171\u0172\b\37\1\2\u0172"+
		"\u0173\5> \2\u0173\u0179\3\2\2\2\u0174\u0175\f\4\2\2\u0175\u0176\7\32"+
		"\2\2\u0176\u0178\5<\37\5\u0177\u0174\3\2\2\2\u0178\u017b\3\2\2\2\u0179"+
		"\u0177\3\2\2\2\u0179\u017a\3\2\2\2\u017a=\3\2\2\2\u017b\u0179\3\2\2\2"+
		"\u017c\u017d\b \1\2\u017d\u017e\5@!\2\u017e\u0184\3\2\2\2\u017f\u0180"+
		"\f\4\2\2\u0180\u0181\t\3\2\2\u0181\u0183\5> \5\u0182\u017f\3\2\2\2\u0183"+
		"\u0186\3\2\2\2\u0184\u0182\3\2\2\2\u0184\u0185\3\2\2\2\u0185?\3\2\2\2"+
		"\u0186\u0184\3\2\2\2\u0187\u0188\5B\"\2\u0188A\3\2\2\2\u0189\u018a\b\""+
		"\1\2\u018a\u018b\5D#\2\u018b\u0191\3\2\2\2\u018c\u018d\f\4\2\2\u018d\u018e"+
		"\t\4\2\2\u018e\u0190\5B\"\5\u018f\u018c\3\2\2\2\u0190\u0193\3\2\2\2\u0191"+
		"\u018f\3\2\2\2\u0191\u0192\3\2\2\2\u0192C\3\2\2\2\u0193\u0191\3\2\2\2"+
		"\u0194\u0195\5H%\2\u0195E\3\2\2\2\u0196\u0197\5L\'\2\u0197G\3\2\2\2\u0198"+
		"\u0199\b%\1\2\u0199\u019a\5J&\2\u019a\u01a0\3\2\2\2\u019b\u019c\f\4\2"+
		"\2\u019c\u019d\t\5\2\2\u019d\u019f\5H%\5\u019e\u019b\3\2\2\2\u019f\u01a2"+
		"\3\2\2\2\u01a0\u019e\3\2\2\2\u01a0\u01a1\3\2\2\2\u01a1I\3\2\2\2\u01a2"+
		"\u01a0\3\2\2\2\u01a3\u01a4\5F$\2\u01a4K\3\2\2\2\u01a5\u01a6\7\13\2\2\u01a6"+
		"\u01a7\5\6\4\2\u01a7\u01a8\5T+\2\u01a8\u01ab\3\2\2\2\u01a9\u01ab\5N(\2"+
		"\u01aa\u01a5\3\2\2\2\u01aa\u01a9\3\2\2\2\u01abM\3\2\2\2\u01ac\u01ad\b"+
		"(\1\2\u01ad\u01ae\7\37\2\2\u01ae\u01be\5N(\f\u01af\u01b0\7 \2\2\u01b0"+
		"\u01be\5N(\n\u01b1\u01b2\7*\2\2\u01b2\u01be\5N(\t\u01b3\u01b4\7+\2\2\u01b4"+
		"\u01be\5N(\b\u01b5\u01b6\5X-\2\u01b6\u01b7\5T+\2\u01b7\u01be\3\2\2\2\u01b8"+
		"\u01be\5Z.\2\u01b9\u01ba\7\65\2\2\u01ba\u01be\5T+\2\u01bb\u01be\7\65\2"+
		"\2\u01bc\u01be\5P)\2\u01bd\u01ac\3\2\2\2\u01bd\u01af\3\2\2\2\u01bd\u01b1"+
		"\3\2\2\2\u01bd\u01b3\3\2\2\2\u01bd\u01b5\3\2\2\2\u01bd\u01b8\3\2\2\2\u01bd"+
		"\u01b9\3\2\2\2\u01bd\u01bb\3\2\2\2\u01bd\u01bc\3\2\2\2\u01be\u01ce\3\2"+
		"\2\2\u01bf\u01c0\f\r\2\2\u01c0\u01c1\7\62\2\2\u01c1\u01c2\7\65\2\2\u01c2"+
		"\u01c8\5T+\2\u01c3\u01c5\7\22\2\2\u01c4\u01c6\5V,\2\u01c5\u01c4\3\2\2"+
		"\2\u01c5\u01c6\3\2\2\2\u01c6\u01c7\3\2\2\2\u01c7\u01c9\7\23\2\2\u01c8"+
		"\u01c3\3\2\2\2\u01c8\u01c9\3\2\2\2\u01c9\u01cd\3\2\2\2\u01ca\u01cb\f\13"+
		"\2\2\u01cb\u01cd\7\37\2\2\u01cc\u01bf\3\2\2\2\u01cc\u01ca\3\2\2\2\u01cd"+
		"\u01d0\3\2\2\2\u01ce\u01cc\3\2\2\2\u01ce\u01cf\3\2\2\2\u01cfO\3\2\2\2"+
		"\u01d0\u01ce\3\2\2\2\u01d1\u01d2\7\22\2\2\u01d2\u01d3\5$\23\2\u01d3\u01d4"+
		"\7\23\2\2\u01d4Q\3\2\2\2\u01d5\u01d8\7\64\2\2\u01d6\u01d8\5$\23\2\u01d7"+
		"\u01d5\3\2\2\2\u01d7\u01d6\3\2\2\2\u01d8S\3\2\2\2\u01d9\u01da\7\24\2\2"+
		"\u01da\u01db\5R*\2\u01db\u01dc\7\25\2\2\u01dc\u01de\3\2\2\2\u01dd\u01d9"+
		"\3\2\2\2\u01de\u01e1\3\2\2\2\u01df\u01dd\3\2\2\2\u01df\u01e0\3\2\2\2\u01e0"+
		"\u01e6\3\2\2\2\u01e1\u01df\3\2\2\2\u01e2\u01e3\7\24\2\2\u01e3\u01e5\7"+
		"\25\2\2\u01e4\u01e2\3\2\2\2\u01e5\u01e8\3\2\2\2\u01e6\u01e4\3\2\2\2\u01e6"+
		"\u01e7\3\2\2\2\u01e7U\3\2\2\2\u01e8\u01e6\3\2\2\2\u01e9\u01ea\5$\23\2"+
		"\u01ea\u01eb\7.\2\2\u01eb\u01ed\3\2\2\2\u01ec\u01e9\3\2\2\2\u01ed\u01f0"+
		"\3\2\2\2\u01ee\u01ec\3\2\2\2\u01ee\u01ef\3\2\2\2\u01ef\u01f1\3\2\2\2\u01f0"+
		"\u01ee\3\2\2\2\u01f1\u01f2\5$\23\2\u01f2W\3\2\2\2\u01f3\u01f4\7\65\2\2"+
		"\u01f4\u01f5\5T+\2\u01f5\u01f7\7\22\2\2\u01f6\u01f8\5V,\2\u01f7\u01f6"+
		"\3\2\2\2\u01f7\u01f8\3\2\2\2\u01f8\u01f9\3\2\2\2\u01f9\u01fa\7\23\2\2"+
		"\u01faY\3\2\2\2\u01fb\u01fc\t\6\2\2\u01fc[\3\2\2\2\60_ahq}\u0083\u008c"+
		"\u0090\u009a\u009e\u00a6\u00b2\u00bb\u00bf\u00c6\u00d6\u00e8\u00eb\u00ee"+
		"\u00f1\u0100\u010b\u0116\u0121\u012c\u0137\u0142\u014d\u0158\u0163\u016e"+
		"\u0179\u0184\u0191\u01a0\u01aa\u01bd\u01c5\u01c8\u01cc\u01ce\u01d7\u01df"+
		"\u01e6\u01ee\u01f7";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}