interface decode_in_if(input logic clock, input logic reset);
    logic        enable_decode;
    logic [15:0] dout;
    logic [15:0] npc_in;
 
    task drive_instruction(input logic [15:0] instruction_data, input logic [15:0] next_pc);
        @(posedge clock);
        enable_decode <= 1'b1;
        dout          <= instruction_data;
        npc_in        <= next_pc;
    endtask

    task clear_bus();
        @(posedge clock);
        enable_decode <= 1'b0;
        dout          <= 16'h0000;
        npc_in        <= 16'h0000;
    endtask
endinterface
