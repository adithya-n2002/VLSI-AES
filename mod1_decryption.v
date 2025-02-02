module mod1_decryption(clk,data_in,key,data_out);
input clk;
input [127:0] data_in,key;
output [127:0] data_out;
wire [127:0] key_s,key_s0,key_s1,key_s2,key_s3,key_s4,key_s5,key_s6,key_s7,key_s8,key_s9;
wire [127:0]r_data_out,r0_data_out,r1_data_out,r2_data_out,r3_data_out,r4_data_out,r5_data_out,r6_data_out,r7_data_out,r8_data_out,r9_data_out;

inv_keygen a0( clk,key, key_s,key_s0,key_s1,key_s2,key_s3,key_s4,key_s5,key_s6,key_s7,key_s8,key_s9);

assign r_data_out=data_in^key_s;

mod_decry_round r0(clk,r_data_out,key_s0,key_s[7:0],r0_data_out);
mod_decry_round r1(clk,r0_data_out,key_s1,key_s0[7:0],r1_data_out);
mod_decry_round r2(clk,r1_data_out,key_s2,key_s1[7:0],r2_data_out);
mod_decry_round r3(clk,r2_data_out,key_s3,key_s2[7:0],r3_data_out);
mod_decry_round r4(clk,r3_data_out,key_s4,key_s3[7:0],r4_data_out);
mod_decry_round r5(clk,r4_data_out,key_s5,key_s4[7:0],r5_data_out);
mod_decry_round r6(clk,r5_data_out,key_s6,key_s5[7:0],r6_data_out);
mod_decry_round r7(clk,r6_data_out,key_s7,key_s6[7:0],r7_data_out);
mod_decry_round r8(clk,r7_data_out,key_s8,key_s7[7:0],r8_data_out);
mod_decry_lastround r9(clk,r8_data_out,key_s9,key_s8[7:0],r9_data_out);

assign data_out=r9_data_out;
endmodule
