module rlg_out(i,o);
input [127:0]i;
output [127:0]o;
wire [127:0]w;

scl aa(i[15:0],i[31:16],i[47:32],i[63:48],w[15:0],w[31:16],w[47:32],w[63:48]);
scl bb(i[79:64],i[95:80],i[111:96],i[127:112],w[79:64],w[95:80],w[111:96],w[127:112]);
fredkin cc(w[15:0],w[31:16],w[47:32],o[15:0],o[31:16],o[47:32]);
feynman dd(w[63:48],w[79:64],o[63:48],o[79:64]);
fredkin ee(w[95:80],w[111:96],w[127:112],o[95:80],o[111:96],o[127:112]);

endmodule

module scl(a,b,c,d,p,q,r,s);
input [15:0]a,b,c,d;
output [15:0]p,q,r,s;
assign p = a[15:0];
assign q = b[15:0];
assign r = c[15:0];
assign s = ((a[15:0]&(b[15:0]|c[15:0]))^d[15:0]);
endmodule

module fredkin(a,b,c,p,q,r);
input [15:0]a,b,c;
output [15:0]p,q,r;
assign p = a[15:0];
assign q = ((~a[15:0]&b[15:0])|(a[15:0]&c[15:0]));
assign r = ((~a[15:0]&c[15:0])|(a[15:0]&b[15:0]));
endmodule

module feynman(a,b,p,q);
input [15:0]a,b;
output [15:0]p,q;
assign p = a[15:0];
assign q = a[15:0]^b[15:0];
endmodule
