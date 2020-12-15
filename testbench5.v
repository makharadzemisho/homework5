`timescale 1ns / 1ps

module testbench5;

	// Inputs
	reg CLK;
	reg [31:0] instruction;

	// Outputs
	wire [2:0] Instruction_type;
	wire [3:0] Dataprocessing_instr_type;
	wire [1:0] Memory_instr_type;
	wire [1:0] Jump_instr_type;

	// Instantiate the Unit Under Test (UUT)
	Intrmem_jmp uut (
		.CLK(CLK), 
		.instruction(instruction), 
		.Instruction_type(Instruction_type), 
		.Dataprocessing_instr_type(Dataprocessing_instr_type), 
		.Memory_instr_type(Memory_instr_type), 
		.Jump_instr_type(Jump_instr_type)
	);

always #5 CLK=!CLK;
	initial begin
		// Initialize Inputs
		instruction =0;
		CLK = 0;

		// Wait 100 ns for global reset to finish
		#50;
	instruction[25]=1;
		#5;
		instruction[25]=0;
		instruction[4]=0;
		#5;
		instruction[4]=1;
		#5;
		instruction[7:4]=9;
		#5;
		instruction[27:26]=1;
		#5;
		instruction[25]=0;
		#5;
		instruction[25]=1;
		instruction[4]=1;
		#5;
		instruction[27:26]=2;
		#5;
		instruction[24]=0;
		#5;
		instruction[24]=1;
		#5
		instruction = 0;
      
      
	end
      
endmodule

