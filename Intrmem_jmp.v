`timescale 1ns / 1ps
module Intrmem_jmp(
		input CLK,  
		input [31:0] instruction ,
		output reg[2:0] Instruction_type, 
		output  reg[3:0] Dataprocessing_instr_type,
		output reg[1:0] Memory_instr_type,
		output reg[1:0] Jump_instr_type
    );

			always@(posedge CLK)
				begin
					case (instruction[27:26])
						2'b00 : begin
							Instruction_type = 1;
							end
						2'b01 : begin
							Instruction_type = 2;
							end
						2'b11 : begin
							Instruction_type = 3;
							end
						default: begin
							Instruction_type = 0;
							end
					endcase
				end
			always@(posedge CLK)
				begin
					case (instruction[27:26])
						2'b00 : begin
							if (instruction[25] == 1)
								Dataprocessing_instr_type = 1;
							else if(instruction[4] == 0)
								Dataprocessing_instr_type = 2;
							else if((instruction[4]==1)&&(instruction[7]==0))
								Dataprocessing_instr_type = 3;
							else if((instruction[24]==0)&&(instruction[7:4] == 9))
								Dataprocessing_instr_type = 4;
							else
								Dataprocessing_instr_type = 0;
						end
						
						2'b01 : begin
							if (instruction[25] ==0)
								Memory_instr_type <= 1;
							else if((instruction[4] ==1) && (instruction[25]==1))
								Memory_instr_type <= 2;	
							else
								Memory_instr_type <=0;
						end
						
					   2'b10 : begin
							/*case(instruction[24]
								2'b00 : begin
									Jump_instr_type <= 1;
								end
								
								2'b01 : begin
									Jump_instr_type <=2;
								end
								default : begin
									Jump_intsr_type <= 0;
								end
							endcase
						end*/
						if(instruction[24] == 0)
							Jump_instr_type <= 1;
						else if(instruction[24] == 1)
							Jump_instr_type <= 2;
						else 
							Jump_instr_type <=0;
						end
					default: begin
						Dataprocessing_instr_type = 0;
						end
				endcase
			end

endmodule
