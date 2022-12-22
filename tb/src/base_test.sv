class base_test extends uvm_test;
  `uvm_component_utils(base_test)

  env env_h;

  function new(string name, uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_h = env::type_id::create("env_h", this);
  endfunction
endclass