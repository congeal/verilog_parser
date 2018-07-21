from lark import Lark, Transformer, v_args

src = """module pipe_pal
#(param, localparam)
(a, b, c); /* multi-line
comment */ 444;
333; //expression
endmodule"""

with open('verilog.lark') as f:
    expr_grammar = f.read()
parser = Lark(expr_grammar, parser='lalr')
print(parser.parse(src).pretty())
