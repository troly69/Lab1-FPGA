module Lab3(input clk, input key1,
				output led1, output buzzer);
reg [25:0] cnt = 0;
reg enable = 0, old_key = 1;

always @ (posedge clk) begin
	cnt <= cnt+1;
	old_key <= key1;
	if (old_key & ~key1) enable <= ~enable;
end

assign led1 = ~(enable & cnt[24]);
assign buzzer = enable & cnt[14];

endmodule