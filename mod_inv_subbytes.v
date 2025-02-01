module mod_inv_subbytes(clk,in,val,s_data_out);
input clk;
input [0:127] in;
input [0:7] val;
output reg[0:127] s_data_out;
wire [0:127] val_out;
wire [0:127] out;

  assign val_out[120:127] = in[120:127] ^ val;
  assign val_out[112:119] = in[112:119] ^ val;
  assign val_out[104:111] = in[104:111] ^ val;
  assign val_out[96:103] = in[96:103] ^ val;
  
  assign val_out[88:95] = in[88:95] ^ val;
  assign val_out[80:87] = in[80:87] ^ val;
  assign val_out[72:79] = in[72:79] ^ val;
  assign val_out[64:71] = in[64:71] ^ val;
  
  assign val_out[56:63] = in[56:63] ^ val;
  assign val_out[48:55] = in[48:55] ^ val;
  assign val_out[40:47] = in[40:47] ^ val;
  assign val_out[32:39] = in[32:39] ^ val;
  
  assign val_out[24:31] = in[24:31] ^ val;
  assign val_out[16:23] = in[16:23] ^ val;
  assign val_out[8:15] = in[8:15] ^ val;
  assign val_out[0:7] = in[0:7] ^ val;

inv_sbox sb5(val_out[0:3],val_out[4:7],out[0:7]);
inv_sbox sb6(val_out[8:11],val_out[12:15],out[8:15]);
inv_sbox sb7(val_out[16:19],val_out[20:23],out[16:23]);
inv_sbox sb8(val_out[24:27],val_out[28:31],out[24:31]);
inv_sbox sb9(val_out[32:35],val_out[36:39],out[32:39]);
inv_sbox sb10(val_out[40:43],val_out[44:47],out[40:47]);
inv_sbox sb11(val_out[48:51],val_out[52:55],out[48:55]);
inv_sbox sb12(val_out[56:59],val_out[60:63],out[56:63]);
inv_sbox sb13(val_out[64:67],val_out[68:71],out[64:71]);
inv_sbox sb14(val_out[72:75],val_out[76:79],out[72:79]);
inv_sbox sb15(val_out[80:83],val_out[84:87],out[80:87]);
inv_sbox sb16(val_out[88:91],val_out[92:95],out[88:95]);
inv_sbox sb17(val_out[96:99],val_out[100:103],out[96:103]);
inv_sbox sb18(val_out[104:107],val_out[108:111],out[104:111]);
inv_sbox sb19(val_out[112:115],val_out[116:119],out[112:119]);
inv_sbox sb20(val_out[120:123],val_out[124:127],out[120:127]);

  
always@(posedge clk)
  begin
  s_data_out<=out;
  end
endmodule


/*module testbench();
reg clk=0;
reg [127:0]val_out;
reg [7:0] val;
wire [127:0]in;
mod_inv_subbytes s(clk,val_out,val,in);
always #1 clk=~clk;
initial
begin
val_out = 128'h 63f2c9fac9f2c963fe637d823026d4d4;
val = 8'h ff;
#40 $finish;
end
endmodule */