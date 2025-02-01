module mod1_encryption(clk,data_in,key,data_out);
input clk;
input [127:0] data_in,key;
output  [127:0] data_out;

wire [127:0] key_s,key_s0,key_s1,key_s2,key_s3,key_s4,key_s5,key_s6,key_s7,key_s8,key_s9;
wire [127:0]r_data_out,r0_data_out,r1_data_out,r2_data_out,r3_data_out,r4_data_out,r5_data_out,r6_data_out,r7_data_out,r8_data_out,r9_data_out;

assign r_data_out=data_in^key_s;


key_gen1 a0( clk,key, key_s,key_s0,key_s1,key_s2,key_s3,key_s4,key_s5,key_s6,key_s7,key_s8,key_s9);
mod_encry_round r0(clk,r_data_out,key_s0,r0_data_out);
mod_encry_round r1(clk,r0_data_out,key_s1,r1_data_out);
mod_encry_round r2(clk,r1_data_out,key_s2,r2_data_out);
mod_encry_round r3(clk,r2_data_out,key_s3,r3_data_out);
mod_encry_round r4(clk,r3_data_out,key_s4,r4_data_out);
mod_encry_round r5(clk,r4_data_out,key_s5,r5_data_out);
mod_encry_round r6(clk,r5_data_out,key_s6,r6_data_out);
mod_encry_round r7(clk,r6_data_out,key_s7,r7_data_out);
mod_encry_round r8(clk,r7_data_out,key_s8,r8_data_out);
last_mod_encry_round r9(clk,r8_data_out,key_s9,r9_data_out);

assign data_out=r9_data_out;
endmodule


module testbench();
reg clk=1;
reg [127:0]in,key;
wire [127:0]out;
reg [127:0] mem [39:0];
initial $readmemh("AES partitioned with hex values.txt",mem);
integer k,fd;
mod1_encryption mod1e(clk,in,key,out);
always #1 clk = ~clk;
initial 
begin
key = 128'h 5468617473206d79204b756e67204675;

fd= $fopen("AES encrypted with hex values (01.02.2025).txt","w");
for(k=0;k<40;k=k+1)
begin 
in=mem[k];
#10 $fdisplayh(fd,out);
 $display("%h",out);
end
#10 $fclose(fd);
/*in = 128'h 747964664f6e2b492809284566747760;
#40 $display("%h", out);
in = 128'h 747964664f6e2b492808284466757761;
#40 $display("%h", out);
in = 128'h 747964664f6e2b492809284566747762;
#40 $display("%h", out);
in = 128'h 747964664f6e2b492808284466757763;
#40 $display("%h", out);
in = 128'h 747964664f6e2b49280d284566747764;
#40 $display("%h", out);
in = 128'h 747964664f6e2b49280c284466757765;
#40 $display("%h", out);
in = 128'h 747964664f6e2b49280d284566747766;
#40 $display("%h", out);
in = 128'h 747964664f6e2b49280c284466757767;
#40 $display("%h", out);
in = 128'h 747964664f6e2b492809284566747768;
#40 $display("%h", out);
in = 128'h 747964664f6e2b492808284466757769;
#40 $display("%h", out);
in = 128'h 747964664f6e2b49280928456674776a;
#40 $display("%h", out);
in = 128'h 747964664f6e2b49280828446675776b;
#40 $display("%h", out);
in = 128'h 747964664f6e2b49280d28456674776c;
#40 $display("%h", out);
in = 128'h 747964664f6e2b49280c28446675776d;
#40 $display("%h", out);
in = 128'h 747964664f6e2b49280d28456674776e;
#40 $display("%h", out);
in = 128'h 747964664f6e2b49280c28446675776f;
#40 $display("%h", out);*/
#100 $finish;
end
endmodule
