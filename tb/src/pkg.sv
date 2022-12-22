package pkg;
  `include "uvm_macros.svh"
  import uvm_pkg::*;

  `include "../src/agent/transaction_in.sv"
  `include "../src/agent/transaction_out.sv"
  `include "../src/rb_agent/transaction_rb.sv"

  typedef uvm_sequencer#(transaction_in) sequencer;
  typedef uvm_sequencer#(transaction_rb) sequencer_rb;

  `include "../src/agent/sequence_in.sv"
  `include "../src/agent/driver.sv"
  `include "../src/agent/monitor.sv"
  `include "../src/agent/agent.sv"
  
  `include "../src/rb_agent/sequence_rb.sv"
  `include "../src/rb_agent/driver_rb.sv"
  `include "../src/rb_agent/monitor_rb.sv"
  `include "../src/rb_agent/agent_rb.sv"
  
  `include "../src/refmod.sv"
  `include "../src/coverage.sv"
  `include "../src/scoreboard.sv"
  `include "../src/env.sv"

  `include "../src/parallel_sequence.sv"
  
  `include "../src/base_test.sv"
  `include "../src/parallel_test.sv"
endpackage
