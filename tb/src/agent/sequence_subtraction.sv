class sequence_subtraction extends sequence_in;
    `uvm_object_utils(sequence_subtraction)

    function new(string name="sequence_subtraction");
        super.new(name);
    endfunction: new

    task body;
        forever `uvm_do_with(req, { instru == 2'b01; });
    endtask: body
endclass: sequence_subtraction