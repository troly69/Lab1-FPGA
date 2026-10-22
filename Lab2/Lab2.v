module Lab2 (
	input wire clk,
	input wire key1,
	output wire led1,
	output wire led2,
	output wire led3,
	output wire led4
);

reg [25:0] counter = 0;
reg blink_enable = 0;
reg key_prev = 1;
reg led_state = 0;

always @(posedge clk) begin
	key_prev <= key1;
	
	//S1 is active-low: pressed = 0
	if (key_prev == 1 && key1 == 0)
		blink_enable <= ~blink_enable;
	
	if (blink_enable) begin
		if (counter == 12_500_000) begin
			counter <= 0;
			led_state <= ~led_state;
		end else begin
			counter <= counter + 1;
		end
	end else begin
		counter <= 0;
		led_state <= 0;
	end
end

// LED1 is active-low
assign led1 = ~led_state;
assign led2 = ~led_state;
assign led3 = ~led_state;
assign led4 = ~led_state;

endmodule