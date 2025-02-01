module new_mixcol(in,out);
input [0:127] in;
output [0:127] out;
mod_mixrow1 r1(in[0:7],in[8:15],in[16:23],in[24:31],out[0:7]);
mod_mixrow1 r2(in[32:39],in[40:47],in[48:55],in[56:63],out[32:39]);
mod_mixrow1 r3(in[64:71],in[72:79],in[80:87],in[88:95],out[64:71]);
mod_mixrow1 r4(in[96:103],in[104:111],in[112:119],in[120:127],out[96:103]);

mod_mixrow1 s1(in[8:15],in[16:23],in[24:31],in[0:7],out[8:15]);
mod_mixrow1 s2(in[40:47],in[48:55],in[56:63],in[32:39],out[40:47]);
mod_mixrow1 s3(in[72:79],in[80:87],in[88:95],in[64:71],out[72:79]);
mod_mixrow1 s4(in[104:111],in[112:119],in[120:127],in[96:103],out[104:111]);

mod_mixrow1 t1(in[16:23],in[24:31],in[0:7],in[8:15],out[16:23]);
mod_mixrow1 t2(in[48:55],in[56:63],in[32:39],in[40:47],out[48:55]);
mod_mixrow1 t3(in[80:87],in[88:95],in[64:71],in[72:79],out[80:87]);
mod_mixrow1 t4(in[112:119],in[120:127],in[96:103],in[104:111],out[112:119]);

mod_mixrow1 u1(in[24:31],in[0:7],in[8:15],in[16:23],out[24:31]);
mod_mixrow1 u2(in[56:63],in[32:39],in[40:47],in[48:55],out[56:63]);
mod_mixrow1 u3(in[88:95],in[64:71],in[72:79],in[80:87],out[88:95]);
mod_mixrow1 u4(in[120:127],in[96:103],in[104:111],in[112:119],out[120:127]);
endmodule

module mod_mixrow1(i1,i2,i3,i4,out);
input [0:7]i1,i2,i3,i4;
output reg[0:7]out;
wire [0:8]w1,w2,w3,w4,w5;
reg [0:8]w6;
assign w1= {1'b 0,i1} << 1;
assign w2= ({1'b 0,i2} << 1)^{1'b 0,i2};
assign w3= {1'b 0,i3};
assign w4= {1'b 0,i4};

assign w5=w1^w2^w3^w4;
always @*
begin
if(w5[0]==0)
out= w5[1:8];
else
	begin
	w6=w5 ^ 9'b 100011011;
	out = w6[1:8];
	end
end
endmodule 

/*module testbench();
reg [0:127]in;
wire [0:127]out;
new_mixcol nmix(in,out);
initial 
begin
in = 128'h 632fafa2eb93c7209f92abcba0c0302b;
#20 $display("out=%h", out);
#40 $finish; 
end
endmodule*/
