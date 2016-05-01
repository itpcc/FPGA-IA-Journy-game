`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:35:34 04/22/2016 
// Design Name: 
// Module Name:    vgagame 
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
      module vgagame(clk, vga_h_sync, vga_v_sync, vga_R, vga_G, vga_B,up, down,left,right,shoot,test,reset );
input clk;
output vga_h_sync, vga_v_sync, vga_R, vga_G, vga_B;
input up, down,left,right;
input shoot;
output reg test;
input reset;
wire inDisplayArea;
wire [9:0] CounterX;
wire [8:0] CounterY;
reg dead=0; //check dead
wire temp;
wire enemyActive1;
wire enemyActive2;
wire enemyActive3;
wire enemyActive4;
wire enemyActive5;
wire enemyActive6;
wire enemyActive7;
wire enemyActive8;
wire enemyActive9;
wire enemyActive10;


hvsync_generator syncgen(.clk(clk), .vga_h_sync(vga_h_sync), .vga_v_sync(vga_v_sync), 
  .inDisplayArea(inDisplayArea), .CounterX(CounterX), .CounterY(CounterY));
/////////////////////////////////////////////////////////////////////////////////
reg [8:0] charPositionX=320;
reg [8:0] charPositionY=240;
reg [1:0] charPo =0;
////////////////////////////////////////////////////////////////////////////////// Divider
reg [21:0] count= 0;
reg clk50=0;
always @(posedge clk)
	begin 
		if(count==22'd200000)
		begin
		count <=22'b0;
		clk50 <= ~clk50;
		end
		else
		
		 count <= count +22'd1;
		 
	end


reg [21:0] count24= 0;
reg clk24=0;
always @(posedge clk)
	begin 
		if(count24==22'd100000)
		begin
		count24 <=22'b0;
		clk24 <= ~clk24;
		end
		else
		
		 count24 <= count24 +22'd1;
		 
	end
	always @ (posedge clk)
	begin
	if(reset==1)
	begin
	dead<=0;

	
	end
	if(temp==1)
	dead<=1;
	
	end

///////////////////////////////////////////////////////////////////////////////rand
reg [7:0] num = 'd2;
reg [31:0] ran = 32'b01000101011101100111010001010110;
integer ranResult;
reg [7:0] clkCnt = 'd0;
always @(posedge clk) begin 
		
		ranResult = ran[num[6:3]+:8]; //https://electronics.stackexchange.com/questions/74277/what-is-this-operator-called-as-in-verilog
		num <= {num[6:0], num[7]^num[5]}+ranResult+clkCnt;
		clkCnt = clkCnt + 1;
	end
/////////////////////////////////////////////////////////////////////////////// charposition

always @(posedge clk50)
begin
	if(reset==1)
	begin
	charPositionX<=320;
	charPositionY<=240;
	end
	if(up==0 && charPositionY>=0 && reset==0)
	begin
	charPositionY <= charPositionY -1;
	charPo <= 2'd0;
	end
	if(down==0 && charPositionY<=480 && reset==0)
	begin
	charPositionY <= charPositionY +1;
	charPo <= 2'd1;
	end
	if(left==0 && charPositionX<=640&& reset==0)
	begin
	charPositionX <= charPositionX -1;
	charPo <= 2'd2;
	end
	if(right==0 && charPositionX>=0)
	begin
	charPositionX <= charPositionX + 1;
	charPo <= 2'd3;
	end
	
end


wire border = (CounterX[9:3]==0) || (CounterX[9:3]==79) || (CounterY[8:3]==0) || (CounterY[8:3]==59);

//////////////////////////////////////////////////////////////////////////////////
wire [2:0] rgbchar,rgbenemy,rgb;
wire [2:0] rgbBullet1,rgbBullet2,rgbBullet3,rgbBullet4,rgbBullet5;
wire [2:0]rgbEn1,rgbEn2,rgbEn3,rgbEn4,rgbEn5,rgbEn6,rgbEn7,rgbEn8,rgbEn9,rgbEn10;
wire isBullet1,isBullet2,isBullet3,isBullet4,isBullet5;
wire[4:0] Mag;
wire Bulletexist1,Bulletexist2,Bulletexist3,Bulletexist4,Bulletexist5,hit1,hit2,hit3,hit4,hit5;
wire [9:0]BulletX1,BulletX2,BulletX3,BulletX4,BulletX5,enemyPositionX1,enemyPositionX2,enemyPositionX3,enemyPositionX4,enemyPositionX5,enemyPositionX6,enemyPositionX7,enemyPositionX8,enemyPositionX9,enemyPositionX10;
wire [8:0]BulletY1,BulletY2,BulletY3,BulletY4,BulletY5,enemyPositionY1,enemyPositionY2,enemyPositionY3,enemyPositionY4,enemyPositionY5,enemyPositionY6,enemyPositionY7,enemyPositionY8,enemyPositionY9,enemyPositionY10;
wire R_Score_on,G_Score_on,B_Score_on;
drawMainCharacter drawChar(clk,charPositionX,charPositionY,CounterX,CounterY,rgbchar);
ChangeBullet org(shoot,isBullet1,isBullet2,isBullet3,isBullet4,isBullet5,Mag);
bulletPosition Bullet1(clk,clk24,CounterX,CounterY,charPositionX,charPositionY,charPo,shoot,hit1,0,Mag,reset,isBullet1,Bulletexist1,BulletX1,BulletY1);
bulletPosition Bullet2(clk,clk24,CounterX,CounterY,charPositionX,charPositionY,charPo,shoot,hit2,1,Mag,reset,isBullet2,Bulletexist2,BulletX2,BulletY2);
bulletPosition Bullet3(clk,clk24,CounterX,CounterY,charPositionX,charPositionY,charPo,shoot,hit3,2,Mag,reset,isBullet3,Bulletexist3,BulletX3,BulletY3);
bulletPosition Bullet4(clk,clk24,CounterX,CounterY,charPositionX,charPositionY,charPo,shoot,hit4,3,Mag,reset,isBullet4,Bulletexist4,BulletX4,BulletY4);
bulletPosition Bullet5(clk,clk24,CounterX,CounterY,charPositionX,charPositionY,charPo,shoot,hit5,4,Mag,reset,isBullet5,Bulletexist5,BulletX5,BulletY5);

drawBullet BulletDraw1(clk,BulletX1,BulletY1,CounterX,CounterY,rgbBullet1);
drawBullet BulletDraw2(clk,BulletX2,BulletY2,CounterX,CounterY,rgbBullet2);
drawBullet BulletDraw3(clk,BulletX3,BulletY3,CounterX,CounterY,rgbBullet3);
drawBullet BulletDraw4(clk,BulletX4,BulletY4,CounterX,CounterY,rgbBullet4);
drawBullet BulletDraw5(clk,BulletX5,BulletY5,CounterX,CounterY,rgbBullet5);

enemyPosition en1(clk,clk50,enemyActive1,num,1,reset,enemyPositionX1,enemyPositionY1);
enemyPosition en2(clk,clk50,enemyActive2,num,2,reset,enemyPositionX2,enemyPositionY2);
enemyPosition en3(clk,clk50,enemyActive3,num,3,reset,enemyPositionX3,enemyPositionY3);
enemyPosition en4(clk,clk50,enemyActive4,num,4,reset,enemyPositionX4,enemyPositionY4);
enemyPosition en5(clk,clk50,enemyActive5,num,5,reset,enemyPositionX5,enemyPositionY5);
enemyPosition en6(clk,clk50,enemyActive6,num,6,reset,enemyPositionX6,enemyPositionY6);
enemyPosition en7(clk,clk50,enemyActive7,num,7,reset,enemyPositionX7,enemyPositionY7);
enemyPosition en8(clk,clk50,enemyActive8,num,8,reset,enemyPositionX8,enemyPositionY8);
enemyPosition en9(clk,clk50,enemyActive9,num,9,reset,enemyPositionX9,enemyPositionY9);
enemyPosition en10(clk,clk50,enemyActive10,num,10,reset,enemyPositionX10,enemyPositionY10);
drawEnemy DrawEn1(clk,enemyPositionX1,enemyPositionY1,CounterX,CounterY,rgbEn1);
drawEnemy DrawEn2(clk,enemyPositionX2,enemyPositionY2,CounterX,CounterY,rgbEn2);
drawEnemy DrawEn3(clk,enemyPositionX3,enemyPositionY3,CounterX,CounterY,rgbEn3);
drawEnemy DrawEn4(clk,enemyPositionX4,enemyPositionY4,CounterX,CounterY,rgbEn4);
drawEnemy DrawEn5(clk,enemyPositionX5,enemyPositionY5,CounterX,CounterY,rgbEn5);
drawEnemy DrawEn6(clk,enemyPositionX6,enemyPositionY6,CounterX,CounterY,rgbEn6);
drawEnemy DrawEn7(clk,enemyPositionX7,enemyPositionY7,CounterX,CounterY,rgbEn7);
drawEnemy DrawEn8(clk,enemyPositionX8,enemyPositionY8,CounterX,CounterY,rgbEn8);
drawEnemy DrawEn9(clk,enemyPositionX9,enemyPositionY9,CounterX,CounterY,rgbEn9);
drawEnemy DrawEn10(clk,enemyPositionX10,enemyPositionY10,CounterX,CounterY,rgbEn10);
wire R_Score_off,G_Score_off,B_Score_off;
DrawScore Score(clk,reset,CounterX,CounterY,charPositionX,charPositionY,enemyPositionX1,enemyPositionX2,enemyPositionX3,enemyPositionX4,enemyPositionX5,enemyPositionX6,enemyPositionX7,enemyPositionX8,enemyPositionX9,enemyPositionX10,enemyPositionY1,enemyPositionY2,enemyPositionY3,enemyPositionY4,enemyPositionY5,enemyPositionY6,enemyPositionY7,enemyPositionY8,enemyPositionY9,enemyPositionY10,BulletX1,BulletX2,BulletX3,BulletX4,BulletX5,BulletY1,BulletY2,BulletY3,BulletY4,BulletY5,enemyActive1,enemyActive2,enemyActive3,enemyActive4,enemyActive5,enemyActive6,enemyActive7,enemyActive8,enemyActive9,enemyActive10,hit1,hit2,hit3,hit4,hit5,R_Score_on,G_Score_on,B_Score_on,R_Score_off,G_Score_off,B_Score_off,temp);
drawGameover over(clk,CounterX,CounterY,rgb);
///////////////////////////////////////////////////////////////////////////////////

wire R = border |rgbchar[0] |rgbBullet1[0]|rgbBullet2[0]|rgbBullet3[0]|rgbBullet4[0]|rgbBullet5[0]|rgbEn1[0]|rgbEn2[1]|rgbEn3[2]|rgbEn4[0]|rgbEn5[0]|rgbEn6[0]|rgbEn7[0]|rgbEn8[0]|rgbEn9[2]|rgbEn10[2] |R_Score_on;
wire G = border  | rgbchar[1]|rgbBullet1[1]|rgbBullet2[1]|rgbBullet3[1]|rgbBullet4[1]|rgbBullet5[1]|rgbEn1[1]|rgbEn2[2]|rgbEn3[1]|rgbEn4[0]|rgbEn5[1]|rgbEn6[0] |rgbEn7[1]|rgbEn8[0]|rgbEn9[0]|rgbEn10[1]| G_Score_on;
wire B = border | rgbchar[2] |rgbBullet1[2]|rgbBullet2[2]|rgbBullet3[2]|rgbBullet4[2]|rgbBullet5[2]|rgbEn1[2]|rgbEn2[0]|rgbEn3[0]|rgbEn4[1]|rgbEn5[1]||rgbEn6[2]|rgbEn7[0]|rgbEn8[1]|rgbEn9[2]|rgbEn10[2]| B_Score_on;
wire   R1=rgb[0]|R_Score_off;
wire	G1=rgb[1]|G_Score_off;
wire	B1=rgb[2]|B_Score_off;
reg vga_R, vga_G, vga_B;
always @(posedge clk)
begin
	test<=isBullet1;
	
	if(dead==1)begin 
	
	vga_R <= R1 & inDisplayArea;
	vga_G <= G1 & inDisplayArea;
	vga_B <= B1 & inDisplayArea;
	end
	if(dead==0)begin
	vga_R <= R & inDisplayArea;
	vga_G <= G & inDisplayArea;
	vga_B <= B & inDisplayArea;
	end
end

endmodule
