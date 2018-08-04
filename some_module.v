module pipe_pal
#(parameter W_DATA=32, localparam W_ADDR = 16)
(input a, b,
 input [W_DATA-1:0] c); /* multi-line
comment */ assign a_wire = (3+4)*2 + 4 - 1;
assign b_wire = a_wire[3] << 2; //expression
assign c_wire = -a[3:0]**2;
assign d_wire = a_wire < b_wire[1][3:0];
assign e_wire = a_wire !== b_wire;
assign f_wire = a || b ? (b ? 1 : 0) : (c ? 0 : 1);
assign g_wire = 8'sb110Z_011x;
assign h_wire = 'h1234_abcd_ef69;
assign i_wire = 3.14 + .5;
assign j_wire = 3.14e10;
assign k_wire = "hello, world!" + "" + "\"";
assign l_wire = {a_wire[2], d_wire[1:0]};

always @*
begin
    c = a + b;
end
  
always @(posedge i_clk, negedge resetn)
    q_c <= q_c + 1;
endmodule
