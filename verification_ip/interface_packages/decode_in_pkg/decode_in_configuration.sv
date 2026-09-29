class decode_in_configuration extends uvm_object;
    
    `uvm_object_utils(decode_in_configuration)

    virtual decode_in_if vif;

    function new(string name = "decode_in_configuration");
        super.new(name);
    endfunction

    virtual function string convert2string();
        return $sformatf("decode_in_configuration: BFM Interface is %s", 
                         (vif == null) ? "NOT CONNECTED" : "CONNECTED");
    endfunction

endclass
