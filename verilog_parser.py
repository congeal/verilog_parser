from lark import Lark, Transformer, v_args

src = """module pipe_pal
#(param, /* some comment */ localparam)
(a, b, c); /* multi-line
comment */ 444;
333; //expression
assign a_wire = (3+4)*2 + 4 - 1;
endmodule"""

with open('verilog.lark') as f:
    expr_grammar = f.read()
parser = Lark(expr_grammar, parser='lalr')
print(parser.parse(src).pretty())
