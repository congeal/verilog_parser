from lark import Lark, Transformer, v_args

src = """module pipe_pal
#(param, /*some comment*/ localparam)
(a, b, c); /* multi-line
comment */ assign a_wire = (3+4)*2 + 4 - 1;
assign b_wire = a_wire << 2; //expression
assign c_wire = -a**2;
assign d_wire = a_wire < b_wire;
assign e_wire = a_wire !== b_wire;
assign f_wire = a || b ? (b ? 1 : 0) : (c ? 0 : 1);
assign g_wire = 8'sb110Z_011x;
assign h_wire = 'h1234_abcd_ef69;
assign i_wire = 3.14 + .5;
assign j_wire = 3.14e10;

always @*
    c = a + b;

always @(posedge i_clk, negedge resetn)
    q_c <= q_c + 1;
endmodule"""

with open('verilog.lark') as f:
    expr_grammar = f.read()
parser = Lark(expr_grammar, parser='lalr')
print(parser.parse(src).pretty())
