class decode_in_monitor extends uvm_monitor;
    
    `uvm_component_utils(decode_in_monitor)

    
    uvm_analysis_port #(decode_in_transaction) ap;
	
	
    int txn_stream;

    
    virtual function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);
        
        
	txn_stream = $create_transaction_stream("txn_stream", "TVM");
       // txn_stream = $create_transaction_stream({"..", get_full_name(), ".", "txn_stream"}, "TVM");
    endfunction

   
    virtual decode_in_if vif;

    function new(string name = "decode_in_monitor", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        ap = new("ap", this);
        if (vif == null) begin
            `uvm_info("MON", "Virtual interface will be assigned by Agent Config", UVM_HIGH)
        end
    endfunction

	virtual task run_phase(uvm_phase phase);
		decode_in_transaction tx;
        
        forever begin
            
            @(posedge vif.clock);
            
            
            if (vif.enable_decode) begin
          
                tx = decode_in_transaction::type_id::create("tx");
                
                
                tx.instruction = vif.dout;
                tx.npc_in      = vif.npc_in;
                
                `uvm_info("MON", {"Monitored: ", tx.convert2string()}, UVM_HIGH)
                
                
                tx.wave_view(txn_stream); 
                
                
                ap.write(tx);
            end
        end
    endtask

endclass
