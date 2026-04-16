`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:46:07 01/22/2026 
// Design Name: 
// Module Name:    counter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module counter(
	input clock,
	input [1:0] reset,
	input enable,
	output reg [3:0] counters
	);
	
	reg [28:0] clock_divider;

	initial begin
		clock_divider <= 0;
		counters <= 4'b0000;
	end

	always @(posedge clock) begin
		if (reset == 2'b01) begin
			counters <= 4'b0000;
		end
		else if (reset == 2'b11) begin
			counters <= 4'b0000;
		end 
		else if (reset == 2'b10) begin
			counters <= 4'b0000;
		end
		
		if (~enable) begin
			counters <= 4'b0000;
		end
		
		clock_divider <= clock_divider + 1;
      if (clock_divider == 250000000) begin // Ajustado para melhorar estabilidade
			if (enable) begin
				if (counters <= 4'b1001) begin
					counters <= counters + 4'b0001;
				end
			end
			clock_divider <= 0;
      end
	end
endmodule