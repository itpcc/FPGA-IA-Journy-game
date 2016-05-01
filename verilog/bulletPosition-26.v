`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:26:09 04/28/2016 
// Design Name: 
// Module Name:    bulletPosition 
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
module bulletPosition(
	input clk,
	input frameClk,
	input wire [9:0] drawingPositionX,
	input wire [8:0] drawingPositionY,	
	input wire [9:0] characterPositionX,
	input wire [8:0] characterPositionY,
	input wire [1:0] characterDirection,
	input _isBulletFire,
	input isHitEnemy,
	input wire [4:0] bulletID,
	input wire [4:0] shootingBulletID,
	input reset,
	output reg isBulletShooting,
	output reg isBulletExistInScreen,
	output reg [9:0] bulletPositionX,
	output reg [8:0] bulletPositionY
);
	
	reg [1:0] bulletDirection;
	reg [9:0] diffPositionX;
	reg [8:0] diffPositionY; 
	reg recentBulletFire;
	initial begin
		bulletPositionX   =  'd0;
		bulletPositionY   =  'd0;
		bulletDirection   = 2'b00;
		isBulletShooting  = 1'b0;
		diffPositionX     =  'd0;
		diffPositionY     =  'd0;
		recentBulletFire  = 1'b0;
	end

	always @(posedge frameClk) begin
		if (reset == 1'b1) begin
			bulletPositionX   <=  'd0;
			bulletPositionY   <=  'd0;
			isBulletShooting  <= 1'b0;
			recentBulletFire  <= 1'b0;
		end else begin
			if (recentBulletFire == 0 && _isBulletFire == 0) begin // Button is active-low
				if (bulletID == shootingBulletID) begin
					bulletPositionX  <= characterPositionX;
					bulletPositionY  <= characterPositionY;
					bulletDirection  <= characterDirection;
					recentBulletFire <= 1'b1;
					isBulletShooting <= 1'b1;				
				end
			end else if(
				isBulletShooting == 1'b1 &&
				isHitEnemy       == 1'b0 && 
				bulletPositionX > 0 && bulletPositionX < 600 && bulletPositionY > 0 && bulletPositionY < 440
			) begin
				case(bulletDirection)
					2'b00: begin //to north
						bulletPositionY <= bulletPositionY - 1;
					end
					2'b01: begin //to south
						bulletPositionY <= bulletPositionY + 1;
					end
					2'b10: begin //to north
						bulletPositionX <= bulletPositionX - 1;
					end
					2'b11: begin //to north
						bulletPositionX <= bulletPositionX + 1;
					end
				endcase
			end else begin
				bulletPositionX   <=  'd0;
				bulletPositionY   <=  'd0;
				isBulletShooting  <= 1'b0;
				recentBulletFire  <= 1'b0;
			end
		end
	end

	always @(posedge clk) begin
		diffPositionX <= bulletPositionX + 3 + 1 - drawingPositionX;
		diffPositionY <= bulletPositionY + 3 + 1 - drawingPositionY;
		if (reset == 1'b1) begin
		 	isBulletExistInScreen <= 1'b0;
		end else if (diffPositionX > 0 && diffPositionX < 7 && diffPositionY > 0 && diffPositionY < 7) begin
			isBulletExistInScreen <= 1'b1;
		end else begin
			isBulletExistInScreen <= 1'b0;
		end
	end
endmodule
