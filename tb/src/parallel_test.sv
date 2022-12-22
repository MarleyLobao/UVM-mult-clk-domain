class parallel_test extends base_test;
  `uvm_component_utils(parallel_test)

  // The test parallel_test was created as an example
  // to run more than one sequence simultaneously,
  // using the concept of virtual sequence.
  // However, other tests can be created in other ways.

  parallel_sequence parallel_seq;

  function new(string name, uvm_component parent = null);
    super.new(name, parent);
    parallel_seq = new("parallel_seq");
  endfunction

  task run_phase(uvm_phase phase);
    parallel_seq.start(null);
  endtask: run_phase

endclass