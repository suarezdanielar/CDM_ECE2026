/*
 * Copyright (c) 2025 James Ross
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

// Yellow and gold trail ramps, black -> bright (RRGGBB, 2 bits per channel)
module palette_rom(
	input  wire [2:0] cid,   // color id = trail brightness, 0 (black) .. 7 (brightest)
	input  wire       pid,   // palette: 0 = yellow (C D M), 1 = gold (E C E)
	output reg  [5:0] color
);
	always @(*) begin
		if (!pid) begin
			case (cid) // yellow
				3'd0:    color = 6'b000000; // black
				3'd1:    color = 6'b010100; // #555500
				3'd2:    color = 6'b010100;
				3'd3:    color = 6'b101000; // #AAAA00
				3'd4:    color = 6'b101000;
				3'd5:    color = 6'b111100; // #FFFF00
				3'd6:    color = 6'b111100;
				default: color = 6'b111100;
			endcase
		end else begin
			case (cid) // gold
				3'd0:    color = 6'b000000; // black
				3'd1:    color = 6'b100100; // #AA5500
				3'd2:    color = 6'b100100; // #AA5500
				3'd3:    color = 6'b100100;
				3'd4:    color = 6'b111000; // #FFAA00
				3'd5:    color = 6'b111000;
				3'd6:    color = 6'b111000;
				default: color = 6'b111000;
			endcase
		end
	end
endmodule