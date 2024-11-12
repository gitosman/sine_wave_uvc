class wave_uvc_agent extends uvm_agent;
	`uvm_component_utils(wave_uvc_agent)

	function new(string name = "wave_uvc_agent", uvm_component parent);
		super.new(name, parent);
	endfunction

	wave_uvc_sequencer sequencer;
	wave_uvc_driver driver;

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		sequencer = new("sequencer", this);
		driver = new("driver", this);
	endfunction

	virtual function void connect_phase(uvm_phase phase);
		if (is_active == UVM_ACTIVE) driver.seq_item_port.connect(sequencer.seq_item_export);
	endfunction

endclass
