`timescale 1ns / 1ps

module SRam(input clk,rst,wr,rd, input[1:0]add , inout[15:0] dout);
reg[15:0]mem[3:0];//memory
reg[15:0]data;
integer i;
 
 
 always @(posedge clk)begin
 
 if(rst)
 for(i = 0; i<=3; i = i+1) begin
 mem[i] = 0;
 end
 else if(wr && !rd)begin
  mem[add] = data;
 end
 else if(rd && !wr) begin
 data = mem[add];

 end
 
 end








endmodule

