from lark import Lark, Transformer, v_args

with open('verilog.lark') as f:
    expr_grammar = f.read()
parser = Lark(expr_grammar, parser='lalr')
with open('some_module.v') as f:
    print(parser.parse(f.read()).pretty())
