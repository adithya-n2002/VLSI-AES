module mod_subbytes(clk,data,val,s_data_out);
  input clk;
  input [7:0] val;
  input [127:0]data;
  output  reg [127:0]s_data_out;
  wire [127:0] tmp_out,val_out;
 
  sbox1 q0(data[127:120],tmp_out[127:120] );
  sbox1 q1( data[119:112],tmp_out[119:112] );
  sbox1 q2( data[111:104],tmp_out[111:104] );
  sbox1 q3( data[103:96],tmp_out[103:96] );
  
  sbox1 q4( data[95:88],tmp_out[95:88] );
  sbox1 q5( data[87:80],tmp_out[87:80] );
  sbox1 q6( data[79:72],tmp_out[79:72] );
  sbox1 q7( data[71:64],tmp_out[71:64] );
  
  sbox1 q8( data[63:56],tmp_out[63:56] );
  sbox1 q9( data[55:48],tmp_out[55:48] );
  sbox1 q10(data[47:40],tmp_out[47:40] );
  sbox1 q11(data[39:32],tmp_out[39:32] );
  
  sbox1 q12(data[31:24],tmp_out[31:24] );
  sbox1 q13(data[23:16],tmp_out[23:16] );
  sbox1 q14(data[15:8],tmp_out[15:8] );
  sbox1 q15(data[7:0],tmp_out[7:0] );
	
  assign val_out[127:120] = tmp_out[127:120] ^ val;
  assign val_out[119:112] = tmp_out[119:112] ^ val;
  assign val_out[111:104] = tmp_out[111:104] ^ val;
  assign val_out[103:96] = tmp_out[103:96] ^ val;
  
  assign val_out[95:88] = tmp_out[95:88] ^ val;
  assign val_out[87:80] = tmp_out[87:80] ^ val;
  assign val_out[79:72] = tmp_out[79:72] ^ val;
  assign val_out[71:64] = tmp_out[71:64] ^ val;
  
  assign val_out[63:56] = tmp_out[63:56] ^ val;
  assign val_out[55:48] = tmp_out[55:48] ^ val;
  assign val_out[47:40] = tmp_out[47:40] ^ val;
  assign val_out[39:32] = tmp_out[39:32] ^ val;
  
  assign val_out[31:24] = tmp_out[31:24] ^ val;
  assign val_out[23:16] = tmp_out[23:16] ^ val;
  assign val_out[15:8] = tmp_out[15:8] ^ val;
  assign val_out[7:0] = tmp_out[7:0] ^ val;
  
  always@*
  begin
  s_data_out<=val_out;
  end
endmodule 