class base_test extends uvm_test;
  `uvm_component_utils(base_test)

  env env_h;
  virtual_sequence virtual_seq;

  function new(string name, uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_h = env::type_id::create("env_h", this);
    virtual_seq = virtual_sequence::type_id::create("virtual_seq", this);
  endfunction

  virtual function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    uvm_top.print_topology();
  endfunction

  virtual task run_phase(uvm_phase phase);
    virtual_seq.start(null);
  endtask: run_phase
endclass
