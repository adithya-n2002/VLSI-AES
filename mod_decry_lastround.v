module mod_decry_lastround(clk,data_in,key_in,val,data_out_last);
input clk;
input [127:0]data_in;
input [127:0]key_in;
input [7:0] val;
output [127:0] data_out_last;
wire [127:0] inv_sub_data_out,inv_shift_data_out;

inv_shift_row s2(data_in,inv_shift_data_out);
mod_inv_subbytes modinvs(clk,inv_shift_data_out,val,inv_sub_data_out);

assign data_out_last = inv_sub_data_out ^ key_in;
endmodule
