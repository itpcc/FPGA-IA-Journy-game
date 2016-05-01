`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:41:38 05/01/2016 
// Design Name: 
// Module Name:    reset 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module reset(
    input reset,
	 input clk,
	output reg dead,
	output reg isBullet1,
	output reg isBullet2,
	output reg isBullet3,
	output reg isBullet4,
	output reg isBullet5,
	output reg enemyActive1,
	output reg enemyActive2,
	output reg enemyActive3,
	output reg enemyActive4,
	output reg enemyActive5,
	output reg enemyActive6
	 
    );
always @ (posedge clk)
begin
	if(reset==1)
	begin
	dead=1'b0;
	isBullet1<=1'b0;
	isBullet2<=1'b0;
	isBullet3<=1'b0;
	isBullet4<=1'b0;
	isBullet5<=1'b0;
	enemyActive1<=1'b0;
	enemyActive2<=1'b0;
	enemyActive3<=1'b0;
	enemyActive4<=1'b0;
	enemyActive5<=1'b0;
	enemyActive6<=1'b0;

	end
end

endmodule
