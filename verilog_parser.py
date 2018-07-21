from lark import Lark, Transformer, v_args

src = """module pipe_pal
#(param, /*some comment*/ localparam)
(a, b, c); /* multi-line
comment */ 444;
333; //expression
assign a_wire = (3+4)*2 + 4 - 1;
assign b_wire = a_wire << 2;
assign c_wire = -a**2;
assign d_wire = a_wire < b_wire;
assign e_wire = a_wire !== b_wire;
assign f_wire = a || b ? (b ? 1 : 0) : (c ? 0 : 1);
endmodule"""

with open('verilog.lark') as f:
    expr_grammar = f.read()
parser = Lark(expr_grammar, parser='lalr')
print(parser.parse(src).pretty())
