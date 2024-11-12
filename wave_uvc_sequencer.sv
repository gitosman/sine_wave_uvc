class wave_uvc_sequencer extends uvm_sequencer #(wave_uvc_packet);
	`uvm_component_utils(wave_uvc_sequencer)

	function new(string name="wave_uvc_sequencer", uvm_component parent);
		super.new(name, parent);
	endfunction

endclass
