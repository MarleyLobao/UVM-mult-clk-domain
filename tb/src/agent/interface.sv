interface interface_if(input clk, rst);
    logic [15:0] data_i;
    logic  [1:0] reg_sel;
    logic  [1:0] instru;
    logic        valid_i;
    logic [31:0] data_o;
    logic 		 valid_o;
    
    clocking cb @(posedge clk);
        default input #1ps output #0.625ns;

        input data_o, valid_o;
        output data_i, valid_i, instru, reg_sel;
    endclocking

    modport mst(input clk, rst, clocking cb);
    modport slv(input clk, rst, data_i, valid_i, reg_sel, output data_o, valid_o);
endinterface
