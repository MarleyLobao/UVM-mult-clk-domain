interface interface_rb(input clk, rst);
    logic [15:0] data_i;
    logic  [1:0] addr;
    logic        valid_i;
    
    clocking cb_rb @(posedge clk);
        default output #1ps;

        output data_i, valid_i, addr;
    endclocking

    modport mst(input clk, rst, clocking cb_rb);
endinterface
