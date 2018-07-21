from lark import Lark

l = Lark('''start: WORD "," WORD "!"

%import common.WORD
%ignore " "
''')

print(l.parse("Hello, World!"))
