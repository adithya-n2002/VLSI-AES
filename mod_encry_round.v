module mod_encry_round(clk,data_in,key_in,data_out);
input clk;
input [127:0]data_in,key_in;
output [127:0] data_out;

wire [127:0]sub_data_out,shift_data_out,mix_data_out; 
wire [7:0] val;
assign val = key_in[7:0];

mod_subbytes mods(clk,data_in,val,sub_data_out);
shiftrows1 a2(sub_data_out,shift_data_out);
new_mixcol a3(shift_data_out,mix_data_out);

assign data_out=mix_data_out^key_in;
endmodule
