module rlg_in(i,o);
input [127:0]i;
output [127:0]o;
wire [127:0]w;

fredkin aa(i[15:0],i[31:16],i[47:32],w[15:0],w[31:16],w[47:32]);
feynman bb(i[63:48],i[79:64],w[63:48],w[79:64]);
fredkin cc(i[95:80],i[111:96],i[127:112],w[95:80],w[111:96],w[127:112]);
scl dd(w[15:0],w[31:16],w[47:32],w[63:48],o[15:0],o[31:16],o[47:32],o[63:48]);
scl ee(w[79:64],w[95:80],w[111:96],w[127:112],o[79:64],o[95:80],o[111:96],o[127:112]);

endmodule

module fredkin(a,b,c,p,q,r);
input [15:0]a,b,c;
output [15:0]p,q,r;
assign p = a[15:0];
assign q = ((~a[15:0]&b[15:0])|(a[15:0]&c[15:0]));
assign r= ((~a[15:0]&c[15:0])|(a[15:0]&b[15:0]));
endmodule

module feynman(a,b,p,q);
input [15:0]a,b;
output [15:0]p,q;
assign p = a[15:0];
assign q = a[15:0]^b[15:0];
endmodule

module scl(a,b,c,d,p,q,r,s);
input [15:0]a,b,c,d;
output [15:0]p,q,r,s;
assign p = a[15:0];
assign q = b[15:0];
assign r = c[15:0];
assign s = ((a[15:0]&(b[15:0]|c[15:0]))^d[15:0]);
endmodule


module testbench();
reg [127:0]i;
wire [127:0]o;
reg [127:0] mem [99:0];
initial $readmemh("50 inputs.txt",mem);
integer k,fd;
rlg_in aa(i[127:0],o[127:0]);
initial
begin
fd= $fopen("50 inputs with rlg.txt","w");
for(k=0;k<100;k=k+1)
begin 
i=mem[k];
#1 $fdisplayh(fd,o);
 $display("%h",o);
end
#1 $fclose(fd);
/*i=128'h 54776f204f6e65204e696e6520547760;
#20 $display("%h",o);
i=128'h 54776f204f6e65204e696e6520547761;
#20 $display("%h",o);
i=128'h 54776f204f6e65204e696e6520547762;
#20 $display("%h",o);
i=128'h 54776f204f6e65204e696e6520547763;
#20 $display("%h",o);
i=128'h 54776f204f6e65204e696e6520547764;
#20 $display("%h",o);
i=128'h 54776f204f6e65204e696e6520547765;
#20 $display("%h",o);
i=128'h 54776f204f6e65204e696e6520547766;
#20 $display("%h",o);
i=128'h 54776f204f6e65204e696e6520547767;
#20 $display("%h",o);
i=128'h 54776f204f6e65204e696e6520547768;
#20 $display("%h",o);
i=128'h 54776f204f6e65204e696e6520547769;
#20 $display("%h",o);
i=128'h 54776f204f6e65204e696e652054776a;
#20 $display("%h",o);
i=128'h 54776f204f6e65204e696e652054776b;
#20 $display("%h",o);
i=128'h 54776f204f6e65204e696e652054776c;
#20 $display("%h",o);
i=128'h 54776f204f6e65204e696e652054776d;
#20 $display("%h",o);
i=128'h 54776f204f6e65204e696e652054776e;
#20 $display("%h",o);
i=128'h 54776f204f6e65204e696e652054776f;
#20 $display("%h",o);
*/
#100 $finish;
end
endmodule
