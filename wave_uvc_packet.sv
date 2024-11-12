class wave_uvc_packet extends uvm_sequence_item;
	
	rand real amplitude;
	rand real offset;
	rand real phase;
	rand real frequency;
	int duration = 1_000_000; //ns
	
	constraint amp_const {amplitude > 50; amplitude < 100;}
	constraint offset_const {offset == 1;}
	constraint frequency_const {frequency > 200; frequency < 250;}
	constraint phase_const {phase == 1;}
	
	function new(string name = "wave_uvc_packet");
		super.new(name);
	endfunction

	`uvm_object_utils_begin(wave_uvc_packet)
		`uvm_field_real(amplitude, UVM_ALL_ON)
		`uvm_field_real(offset, UVM_ALL_ON)
		`uvm_field_real(phase, UVM_ALL_ON)
		`uvm_field_real(frequency, UVM_ALL_ON)
	`uvm_object_utils_end

endclass

