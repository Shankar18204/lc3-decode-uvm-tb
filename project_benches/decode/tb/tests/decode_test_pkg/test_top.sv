class test_top extends uvm_test;
    `uvm_component_utils(test_top)

    decode_in_agent           agent;
    decode_in_configuration   config_obj;
    decode_in_random_sequence seq;

    function new(string name = "test_top", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);

     
        config_obj = decode_in_configuration::type_id::create("config_obj");

      
        if (!uvm_config_db #(virtual decode_in_if)::get(this, "", "decode_in_vif", config_obj.vif)) begin
            `uvm_fatal("TEST", "Could not get decode_in_vif from database")
        end

        uvm_config_db #(decode_in_configuration)::set(this, "*", "config", config_obj);

        agent = decode_in_agent::type_id::create("agent", this);
    endfunction

    virtual task run_phase(uvm_phase phase);
        seq = decode_in_random_sequence::type_id::create("seq");
        
        phase.raise_objection(this, "Starting Sequence");
        seq.start(agent.sequencer);
        phase.drop_objection(this, "Finished Sequence");
    endtask
endclass
