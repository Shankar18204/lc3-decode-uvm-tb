class decode_in_coverage extends uvm_subscriber #(decode_in_transaction);
    
    `uvm_component_utils(decode_in_coverage)

    decode_in_transaction tx;

    covergroup opcode_cg;
        option.per_instance = 1;
        
        cp_opcode: coverpoint tx.instruction[15:12] {
            bins invalid_op = {4'b1101}; 
            
            bins valid_ops[] = {[0:12], [14:15]}; 
        }
    endgroup

    function new(string name = "decode_in_coverage", uvm_component parent = null);
        super.new(name, parent);
        opcode_cg = new(); 
    endfunction

    virtual function void write(decode_in_transaction t);
        tx = t;

        opcode_cg.sample();
    endfunction

endclass
