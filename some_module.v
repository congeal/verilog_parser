module pipe_pal
#(parameter W_DATA=32, localparam W_ADDR = 16)
(input a, b,
 input [W_DATA-1:0] c, d); /* multi-line
    comment */ parameter XX = 3;
    localparam [W_DATA-1:0] XY = 4;
    assign a_wire = (3+4)*2 + 4 - 1;
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
    assign m_wire = {3{a_wire[1:0]}};
    assign {a, b} = 3;
    assign n_wire = afunc(3 +4, a);

    reg avar;
    reg bvar, cvar[2:0];
    integer k;
    wire aa;
    wire [4:0] awire;
    reg [3:0] areg;

    always @*
    begin
        c = a + b;
        empty_task;
    end
    
    always @(posedge i_clk, negedge resetn)
        q_c <= q_c + 1;

    function [W_DATA-1:0] afunc(input [W_DATA-1:0] a, b);
    reg bff[1:0];
    reg arf, dd;
    integer k;
    bff = a * 3;
    endfunction

    function bfunc(input [W_DATA-1:0] a, b);
    begin
        bff = a * 3;
        if(c)
            afunc = a+b;
        else if(a)
            afunc = 3;
    end
    endfunction

    task empty_task;
    endtask

    initial
    begin: init
        s = 3 + 4;
        fork: name
            a = 1;
            empty_task;
        join
    end

    initial
        empty_task;

    initial
        forever #1
            clk = ~clk;

    initial
    begin
        repeat (a+1)
            empty_task;
        while(i<3)
            i = i+1;
        for(i=0;i<3;i=i+1)
            empty_task;
    end

    always @(*)
    begin
        case(a)
        1:
            a = 1;
        3:
        begin
            if(k)
                c = 3;
            else if(sa)
                c = 1;
            else begin
                c = 2;
            end
            a = 2;
        end
        default:
            a = 0;
        endcase
    end

    some_submodule u_instance(a, .b(b), .c(c[3:0]));
endmodule
