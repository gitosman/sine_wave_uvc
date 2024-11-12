timeunit 1ns;

class wave_uvc_driver extends uvm_driver #(wave_uvc_packet);
	`uvm_component_utils(wave_uvc_driver)

	function new(string name = "wave_uvc_driver", uvm_component parent);
		super.new(name, parent);
	endfunction

	real amplitude, offset, phase_offset, frequency;

	virtual interface wave_uvc_interface vif;

	virtual task run_phase(uvm_phase phase);
		`uvm_info("wave_uvc_driver", "Entering Run Phase", UVM_HIGH)
		fork
			#1 forever begin
				seq_item_port.get_next_item(req);
				this.amplitude = req.amplitude;
				this.offset = req.offset;
				this.phase_offset = req.offset;
				this.frequency = req.frequency;
				#(req.duration)
				seq_item_port.item_done();
			end
			forever begin
			#500ps vif.wave_out = this.amplitude*$sin(2*3.14*this.frequency*$time+this.phase_offset)+this.offset;
			end
		join

	endtask

	function void connect_phase( uvm_phase phase);
	if ( ! uvm_config_db#(virtual interface wave_uvc_interface)::get(
		this, // context
		"", // instance name (empty string)
		"vif", // field name
		vif ) // value
		)
	`uvm_error("NOVIF", "Missing virtual I/F" )
	endfunction

endclass
