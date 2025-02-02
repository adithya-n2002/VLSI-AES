module new_invmixcol(in,out);
input [0:127] in;
output [0:127] out;
mod_row1 r1(in[0:7],in[8:15],in[16:23],in[24:31],out[0:7]);
mod_row1 r2(in[32:39],in[40:47],in[48:55],in[56:63],out[32:39]);
mod_row1 r3(in[64:71],in[72:79],in[80:87],in[88:95],out[64:71]);
mod_row1 r4(in[96:103],in[104:111],in[112:119],in[120:127],out[96:103]);

mod_row1 s1(in[8:15],in[16:23],in[24:31],in[0:7],out[8:15]);
mod_row1 s2(in[40:47],in[48:55],in[56:63],in[32:39],out[40:47]);
mod_row1 s3(in[72:79],in[80:87],in[88:95],in[64:71],out[72:79]);
mod_row1 s4(in[104:111],in[112:119],in[120:127],in[96:103],out[104:111]);

mod_row1 t1(in[16:23],in[24:31],in[0:7],in[8:15],out[16:23]);
mod_row1 t2(in[48:55],in[56:63],in[32:39],in[40:47],out[48:55]);
mod_row1 t3(in[80:87],in[88:95],in[64:71],in[72:79],out[80:87]);
mod_row1 t4(in[112:119],in[120:127],in[96:103],in[104:111],out[112:119]);

mod_row1 u1(in[24:31],in[0:7],in[8:15],in[16:23],out[24:31]);
mod_row1 u2(in[56:63],in[32:39],in[40:47],in[48:55],out[56:63]);
mod_row1 u3(in[88:95],in[64:71],in[72:79],in[80:87],out[88:95]);
mod_row1 u4(in[120:127],in[96:103],in[104:111],in[112:119],out[120:127]);
endmodule

module mod_row1(i1,i2,i3,i4,out);
input [0:7]i1,i2,i3,i4;
output reg[0:7]out;
wire [0:11]w1,w2,w3,w4,w5;
wire [0:11]t1,t2,t3,t4;

assign t1={4'b 0000,i1};
assign t2={4'b 0000,i2};
assign t3={4'b 0000,i3};
assign t4={4'b 0000,i4};

reg [0:11]w6;
assign w1= (t1<<3)^(t1<<2)^(t1<<1);
assign w2= (t2)^(t2<<3)^(t2<<1);
assign w3= (t3)^(t3<<3)^(t3<<2);
assign w4= (t4)^(t4<<3);

assign w5=w1^w2^w3^w4;
always @*
begin
case(w5[0:3])
4'b 0000: out=w5[4:11];
4'b 0001: begin w6=w5^12'h 11b; out=w6[4:11]; end 
4'b 0010: begin w6=w5^12'h 236; out=w6[4:11]; end
4'b 0011: begin w6=w5^12'h 32d; out=w6[4:11]; end
4'b 0100: begin w6=w5^12'h 46c; out=w6[4:11]; end
4'b 0101: begin w6=w5^12'h 577; out=w6[4:11]; end
4'b 0110: begin w6=w5^12'h 65a; out=w6[4:11]; end
4'b 0111: begin w6=w5^12'h 741; out=w6[4:11]; end
4'b 1000: begin w6=w5^12'h 8d8; out=w6[4:11]; end
4'b 1001: begin w6=w5^12'h 9c3; out=w6[4:11]; end
4'b 1010: begin w6=w5^12'h aee; out=w6[4:11]; end
4'b 1011: begin w6=w5^12'h bf5; out=w6[4:11]; end
4'b 1100: begin w6=w5^12'h cb4; out=w6[4:11]; end
4'b 1101: begin w6=w5^12'h daf; out=w6[4:11]; end
4'b 1110: begin w6=w5^12'h e82; out=w6[4:11]; end
4'b 1111: begin w6=w5^12'h f99; out=w6[4:11]; end
endcase
end
endmodule 
