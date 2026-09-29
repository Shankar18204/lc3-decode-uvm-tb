module hdl_top;
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    // System Signals
    bit clock;
    bit reset;

    // Generate 50MHz clock  
    initial begin
        clock = 0;
        forever #10 clock = ~clock;
    end

    initial begin
        reset = 1;
        #25 reset = 0;
    end

    decode_in_if in_if(.clock(clock), .reset(reset));


    initial begin
        uvm_config_db#(virtual decode_in_if)::set(null, "*", "decode_in_vif", in_if);
    end

endmodule
