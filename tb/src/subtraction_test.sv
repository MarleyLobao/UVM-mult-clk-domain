class subtraction_test extends base_test;
  `uvm_component_utils(subtraction_test)
  
  function new(string name, uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
   sequence_in::type_id::set_type_override(sequence_subtraction::get_type());
   super.build_phase(phase);
  endfunction : build_phase
endclass