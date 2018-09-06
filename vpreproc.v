`define MACRO_NAME MACRO_TEXT
    `define MACRO_NUM 4'hab69

some other line

`define MACRO_STR "hello"

`ifdef MACRO_NAME
module A();
endmodule
    `ifndef MACRO_STR
        int x;
    `endif
`elsif MACRO_NUM
`include "some_dir/some_file.ext"
module B();
endmodule
`else
`timescale 100ns/1ps
module C();
endmodule
`endif
`undef MACRO_NAME
`reset_all