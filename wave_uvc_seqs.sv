class wave_uvc_seqs extends uvm_sequence #(wave_uvc_packet);
	`uvm_object_utils(wave_uvc_seqs)

	function new(string name = "wave_uvc_seqs");
		super.new(name);
	endfunction

	task body();
		repeat(5) `uvm_do(req)
	endtask

	task pre_body();
		starting_phase.raise_objection(this, get_type_name());
    		`uvm_info(get_type_name(), "raise objection", UVM_HIGH)
  	endtask

  	task post_body();
		starting_phase.drop_objection(this, get_type_name());
    		`uvm_info(get_type_name(), "drop objection", UVM_HIGH)
  	endtask  

endclass

