module Lab3_2(input clk, key1, output reg [7:0] seg, output [3:0] dig, output led);

reg [3:0] n = 0;
reg old = 1;
reg ovf = 0;

assign dig = 4'b1110;
assign led = ~ovf;   // LED activ pe 0 (cum e la majoritatea plăcilor); dacă la tine e activ pe 1, pune: assign led = ovf;

always @(posedge clk) begin
	old <= key1;
	if (old & ~key1) begin
		if (n == 9) begin
			n   <= 0;
			ovf <= ~ovf;   // s-a trecut de 9 -> LED aprins (rămâne aprins)
		end else begin
			n <= n + 1;
		end	
	end
end

always @*
case (n)
	0: seg = 8'hC0; 1: seg = 8'hF9;
	2: seg = 8'hA4; 3: seg = 8'hB0;
	4: seg = 8'h99; 5: seg = 8'h92;
	6: seg = 8'h82; 7: seg = 8'hF8;
	8: seg = 8'h80; 9: seg = 8'h90;
	default: seg = 8'hFF;
endcase

endmodule