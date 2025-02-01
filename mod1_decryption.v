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

module testbench();
reg clk=0;
reg [127:0]in,key;
wire [127:0]out;
reg [127:0] mem [39:0];
initial $readmemh("AES encrypted with hex values.txt",mem);
integer k,fd;
mod1_decryption mod1d(clk,in,key,out);
always #1 clk = ~clk;
initial 
begin
key = 128'h 5468617473206d79204b756e67204675;

fd= $fopen("AES decrypted with correct key.txt","w");
for(k=0;k<40;k=k+1)
begin 
in=mem[k];
#20 $fdisplayh(fd,out);
end
#10 $fclose(fd);
/*in = 128'h 00b7673821584a9be35c6518d6853dab;
#40 $display("%h", out);
in = 128'h 976b84376b2298c0a09177073c24c8f5;
#40 $display("%h", out);
in = 128'h 0dc9c50e8e9c789b2d4b3ca160cbf0b4;
#40 $display("%h", out);
in = 128'h 47acf656a3ea879a5fe347612fc85de8;
#40 $display("%h", out);
in = 128'h e625c200666f6614071685c6299e81c3;
#40 $display("%h", out);
in = 128'h ecd6373cc895751c6dff772de6b8663f;
#40 $display("%h", out);
in = 128'h 1edc9025ebba668c608fbf2325a5e87a;
#40 $display("%h", out);
in = 128'h 9494daeafebbf15aa18023fb11e57b6c;
#40 $display("%h", out);
in = 128'h 7c81f494de29008ce339fab45e969e60;
#40 $display("%h", out);
in = 128'h d499100de2f726543ef00ee1b9db7383;
#40 $display("%h", out);
in = 128'h 58147f5fff9932dd13936db4be48c274;
#40 $display("%h", out);
in = 128'h 23539252967776757a031c8026ca8174;
#40 $display("%h", out);
in = 128'h d84396782d53ff910576e819fc05f728;
#40 $display("%h", out);
in = 128'h dad7581aada3aa5624658eb096a86927;
#40 $display("%h", out);
in = 128'h b2766b1cf5d70a6735c27d112bad66dc;
#40 $display("%h", out);*/

#100 $finish;
end
endmodule
