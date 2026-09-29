class decode_in_transaction extends uvm_sequence_item;
    `uvm_object_utils(decode_in_transaction)

    
    rand bit [15:0] instruction;
    rand bit [15:0] npc_in;

    constraint valid_opcode_c {
        instruction[15:12] != 4'b1101;
    }

    function new(string name = "decode_in_transaction");
        super.new(name);
    endfunction

    virtual function string convert2string();
        return $sformatf("INSTR: 16'h%04x (Opcode: 4'b%04b) | NPC_IN: 16'h%04x", 
                          instruction, instruction[15:12], npc_in);
    endfunction

    virtual function void wave_view(int transaction_viewing_stream_h);
        int transaction_view_h; 
        
        `uvm_info("[WAVE_VIEW]", $sformatf("Transaction: %s", convert2string()), UVM_HIGH)
        
        transaction_view_h = $begin_transaction(transaction_viewing_stream_h, "decode_in_transaction", $realtime);$add_attribute(transaction_view_h, instruction, "instruction");
        $add_attribute(transaction_view_h, npc_in, "npc_in");
        
        $end_transaction(transaction_view_h, $realtime);$free_transaction(transaction_view_h);
    endfunction

endclass
