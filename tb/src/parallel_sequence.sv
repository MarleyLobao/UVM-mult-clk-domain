class parallel_sequence extends uvm_sequence#(uvm_sequence_item);
  `uvm_object_utils(parallel_sequence)

  sequence_in seq_in;
  sequence_rb seq_rb;

  uvm_component comp;

  sequencer sqr_in;
  sequencer_rb sqr_rb;

  function new(string name="parallel_sequence");
    super.new(name);
  endfunction: new

  virtual task pre_body;
    comp = uvm_top.find("*.env_h.mst.sqr");
    if (comp == null) begin
      `uvm_fatal("RUNALL SEQUENCE IN", "Failed to get the sequencer");
    end
    if (!$cast(sqr_in, comp)) begin
      `uvm_fatal("RUNALL SEQUENCE IN", "Failed to cast from uvm_component.");
    end

    comp = uvm_top.find("*.env_h.mst_rb.sqr");
    if (comp == null) begin
      `uvm_fatal("RUNALL SEQUENCE RB", "Failed to get the sequencer");
    end
    if (!$cast(sqr_rb, comp)) begin
      `uvm_fatal("RUNALL SEQUENCE RB", "Failed to cast from uvm_component.");
    end

    seq_in = sequence_in::type_id::create("seq_in");
    seq_rb = sequence_rb::type_id::create("seq_rb");
  endtask: pre_body

  virtual task body;
    fork
      seq_in.start(sqr_in);
      seq_rb.start(sqr_rb);
    join
  endtask: body
endclass: parallel_sequence
