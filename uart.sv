module uart #(
	parameter CLOCKS_PER_PULSE = 5208
)
(
	input logic [7:0] data_in,
	input logic data_en,
	input logic clk,
	input logic rstn,
	output logic tx,
	output logic tx_busy,
	input logic ready_clr,
	input logic rx,
	output logic ready,
	output logic [13:0] display_data_out,
	output logic [13:0] display_data_in
);
	logic [7:0] data_input; 
	logic [7:0] data_output;
	

	transmitter #(.CLOCKS_PER_PULSE(CLOCKS_PER_PULSE)) uart_tx (
		.data_in(data_input),
		.data_en(data_en),
		.clk(clk),
		.rstn(rstn),
		.tx(tx),
		.tx_busy(tx_busy)
	);
	
	receiver #(.CLOCKS_PER_PULSE(CLOCKS_PER_PULSE)) uart_rx (
		.clk(clk),
		.rstn(rstn),
		.ready_clr(ready_clr),
		.rx(rx),
		.ready(ready),
		.data_out(data_output)
	);
	
	hexcoder data_in_converter1 (
    .m(data_input[3:0]),
    .data({display_data_in[6], display_data_in[5], display_data_in[4], display_data_in[3], display_data_in[2], display_data_in[1], display_data_in[0]})
);
	
	hexcoder data_in_converter2 (
    .m(data_input[7:4]),
    .data({display_data_in[13], display_data_in[12], display_data_in[11], display_data_in[10], display_data_in[9], display_data_in[8], display_data_in[7]})
);
	
	
	hexcoder data_out_converter1 (
    .m(data_output[3:0]),
    .data({display_data_out[6], display_data_out[5], display_data_out[4], display_data_out[3], display_data_out[2], display_data_out[1], display_data_out[0]})
);

	hexcoder data_out_converter2 (
    .m(data_output[7:4]),
    .data({display_data_out[13], display_data_out[12], display_data_out[11], display_data_out[10], display_data_out[9], display_data_out[8], display_data_out[7]})
);

	
	assign data_input = {8'b0, data_in};
	
	
endmodule