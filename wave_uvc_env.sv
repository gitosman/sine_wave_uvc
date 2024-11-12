class wave_uvc_env extends uvm_env;

	`uvm_component_utils(wave_uvc_env)

	function new(string name = "wave_uvc_env", uvm_component parent);
		super.new(name, parent);
	endfunction

	wave_uvc_agent agent;

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		agent = new("agent", this);
	endfunction
	
endclass
