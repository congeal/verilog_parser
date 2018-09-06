from lark import Lark, Transformer, v_args

with open('vpreproc.lark') as f:
    grammar = f.read()
parser = Lark(grammar, parser='lalr')
with open('vpreproc.v') as f:
    print(parser.parse(f.read()).pretty())
