class agent_rb extends uvm_agent;
    `uvm_component_utils_begin(agent_rb)
        `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_ALL_ON)
    `uvm_component_utils_end

    sequencer_rb  sqr;
    driver_rb   drv;
    monitor_rb  mon;

    uvm_analysis_port #(transaction_rb) agt_req_port;

    function new(string name = "agent_rb", uvm_component parent = null);
        super.new(name, parent);
        agt_req_port  = new("agt_req_port", this);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        mon = monitor_rb::type_id::create("mon", this);
        sqr = sequencer_rb::type_id::create("sqr", this);
        drv = driver_rb::type_id::create("drv", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        mon.req_port.connect(agt_req_port);
        drv.seq_item_port.connect(sqr.seq_item_export);
    endfunction
endclass: agent_rb
