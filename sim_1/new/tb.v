`timescale 1ns / 1ps

module tb;

reg clk = 1;
reg wr = 0;
reg rd = 1;
reg rst = 1;
reg [1:0]add;

SRam r1(.clk(clk), .wr(wr),.rd(rd),.rst(rst),.add(add));

always #25 clk = ~clk;

initial begin

#50 ; wr = 1; rd = 0;  rst = 0 ; add = 2'b01; r1.data= 16'ha00f;
#50 ; wr = 1; rd = 0;  rst = 0 ; add = 2'b10; r1.data= 16'hffff;
#50 ; wr = 1; rd = 0;  rst = 0 ; add = 2'b11; r1.data= 16'h000f;
#50 ; wr = 1; rd = 0;  rst = 0 ; add = 2'b00; r1.data= 16'h4321;


#50 ; wr = 0; rd = 1;  rst = 0 ; add = 2'b01;
$display("dout at mem 0 = %h", r1.mem[1] );
#50 ; wr = 0; rd = 1;  rst = 0 ; add = 2'b10;
$display("dout at mem 0 = %h", r1.mem[2] ); 
#50 ; wr = 0; rd = 1;  rst = 0 ; add = 2'b11; 
$display("dout at mem 0 = %h", r1.mem[3] ); 
$finish;


end


endmodule