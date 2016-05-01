`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:17:51 04/23/2014 
// Design Name: 
// Module Name:    DrawScore 
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
module DrawScore(input  Clks,
						input Reset,
						input [9:0] CounterX,
						input [8:0] CounterY,
						input [9:0] charPositionX,
						input [8:0] charPositionY,
						input [9:0] enemyPositionX1,
						input [9:0] enemyPositionX2,
						input [9:0] enemyPositionX3,
						input [9:0] enemyPositionX4,
						input [9:0] enemyPositionX5,
						input [9:0] enemyPositionX6,
						input [9:0] enemyPositionX7,
						input [9:0] enemyPositionX8,
						input [9:0] enemyPositionX9,
						input [9:0] enemyPositionX10,
						input [8:0] enemyPositionY1,
						input [8:0] enemyPositionY2,
						input [8:0] enemyPositionY3,
						input [8:0] enemyPositionY4,
						input [8:0] enemyPositionY5,
						input [8:0] enemyPositionY6,
						input [8:0] enemyPositionY7,
						input [8:0] enemyPositionY8,
						input [8:0] enemyPositionY9,
						input [8:0] enemyPositionY10,
						input [9:0] BulletX1,
						input [9:0] BulletX2,
						input [9:0] BulletX3,
						input [9:0] BulletX4,
						input [9:0] BulletX5,
						input [8:0] BulletY1,
						input [8:0] BulletY2,
						input [8:0] BulletY3,
						input [8:0] BulletY4,
						input [8:0] BulletY5,
						output reg enemyActive1,
						output reg enemyActive2,
						output reg enemyActive3,
						output reg enemyActive4,
						output reg enemyActive5,
						output reg enemyActive6,
						output reg enemyActive7,
						output reg enemyActive8,
						output reg enemyActive9,
						output reg enemyActive10,
						output reg hit1,
						output reg hit2,
						output reg hit3,
						output reg hit4,
						output reg hit5,
						output reg R_Score_on,
						output reg G_Score_on,
						output reg B_Score_on,
						output reg R_Score_off,
						output reg G_Score_off,
						output reg B_Score_off,
						output reg  dead);

//////////////////////////////////////////////////////////////////////////////////
reg [15:0] ScorePositionX = 600;
reg [15:0] ScorePositionY = 10;
wire char = (CounterX<=charPositionX+24) && (CounterX>=charPositionX-24) && (CounterY>=charPositionY-24)&& (CounterY<=charPositionY+24);
wire bullet1 =(CounterX<=BulletX1+6) && (CounterX>=BulletX1-6) && (CounterY>=BulletY1-9)&& (CounterY<=BulletY1+9);
wire bullet2 =(CounterX<=BulletX2+6) && (CounterX>=BulletX2-6) && (CounterY>=BulletY2-9)&& (CounterY<=BulletY2+9);
wire bullet3 =(CounterX<=BulletX3+6) && (CounterX>=BulletX3-6) && (CounterY>=BulletY3-9)&& (CounterY<=BulletY3+9);
wire bullet4 =(CounterX<=BulletX4+6) && (CounterX>=BulletX4-6) && (CounterY>=BulletY4-9)&& (CounterY<=BulletY4+9);
wire bullet5 =(CounterX<=BulletX5+6) && (CounterX>=BulletX5-6) && (CounterY>=BulletY5-9)&& (CounterY<=BulletY5+9);
wire enemy1 = (CounterX<=enemyPositionX1+14) && (CounterX>=enemyPositionX1-14) && (CounterY>=enemyPositionY1-14)&& (CounterY<=enemyPositionY1+14);
wire enemy2 = (CounterX<=enemyPositionX2+14) && (CounterX>=enemyPositionX2-14) && (CounterY>=enemyPositionY2-14)&& (CounterY<=enemyPositionY2+14);
wire enemy3 = (CounterX<=enemyPositionX3+14) && (CounterX>=enemyPositionX3-14) && (CounterY>=enemyPositionY3-14)&& (CounterY<=enemyPositionY3+14);
wire enemy4 = (CounterX<=enemyPositionX4+14) && (CounterX>=enemyPositionX4-14) && (CounterY>=enemyPositionY4-14)&& (CounterY<=enemyPositionY4+14);
wire enemy5 = (CounterX<=enemyPositionX5+14) && (CounterX>=enemyPositionX5-14) && (CounterY>=enemyPositionY5-14)&& (CounterY<=enemyPositionY5+14);
wire enemy6 = (CounterX<=enemyPositionX6+14) && (CounterX>=enemyPositionX6-14) && (CounterY>=enemyPositionY6-14)&& (CounterY<=enemyPositionY6+14);
wire enemy7 = (CounterX<=enemyPositionX7+14) && (CounterX>=enemyPositionX7-14) && (CounterY>=enemyPositionY7-14)&& (CounterY<=enemyPositionY7+14);
wire enemy8 = (CounterX<=enemyPositionX8+14) && (CounterX>=enemyPositionX8-14) && (CounterY>=enemyPositionY8-14)&& (CounterY<=enemyPositionY8+14);
wire enemy9 = (CounterX<=enemyPositionX9+14) && (CounterX>=enemyPositionX9-14) && (CounterY>=enemyPositionY9-14)&& (CounterY<=enemyPositionY9+14);
wire enemy10 = (CounterX<=enemyPositionX10+14) && (CounterX>=enemyPositionX10-14) && (CounterY>=enemyPositionY10-14)&& (CounterY<=enemyPositionY10+14);
integer Ten = 0;
integer Unit = 0;
reg [29:0]count;
reg ZeroBlack,ZeroWhite,OneBlack,OneWhite,TwoBlack,TwoWhite,ThreeBlack,ThreeWhite,FourBlack,FourWhite,FiveBlack,FiveWhite,SixBlack,SixWhite,SevenBlack,SevenWhite,EightBlack,EightWhite,NineBlack,NineWhite;
reg ScoreWhiteUnit,ScoreBlackUnit,ScoreWhiteTen,ScoreBlackTen;


always @ (posedge Clks)
begin
if (Reset)
begin
ScorePositionX <= 600;
ScorePositionY <= 10;
Ten <= 0;
Unit <= 0;
dead<=0;
enemyActive1<=1;
			enemyActive2<=1;
			enemyActive3<=1;
			enemyActive4<=1;
			enemyActive5<=1;
			enemyActive6<=1;
			enemyActive7<=0;
			enemyActive8<=0;
			enemyActive9<=0;
			enemyActive10<=0;
			hit1<=0;hit2<=0;hit3<=0;hit4<=0;hit5<=0;

end


///////////////// edit here
if (dead==0)
begin			
	if(bullet1 & enemy1)
	begin
	enemyActive1<=0;
	hit1<=1;
 	end
	if(bullet2 & enemy1)
	begin
		enemyActive1<=0;
		hit2<=1;		
	end
if(bullet3 & enemy1)
	begin
		enemyActive1<=0;
		hit3<=1;
 	end
if(bullet4 & enemy1)
begin
 enemyActive1<=0;
 hit4<=1;
 
 			

end
if(bullet5 & enemy1)
begin
 enemyActive1<=0;
 hit5<=1;


end
/////////////  enmemy2
if(bullet1 & enemy2)
begin
 enemyActive2<=0;
 hit1<=1;
 
 			
end
if(bullet2 & enemy2)
begin
 enemyActive2<=0;
 hit2<=1;
 
 			
end
if(bullet3 & enemy2)
begin
 enemyActive2<=0;
 hit3<=1;
 
 			
end
if(bullet4 & enemy2)
begin
 enemyActive2<=0;
 hit4<=1;
 
 			
end
if(bullet5 & enemy2)
begin
 enemyActive2<=0;
 hit5<=1;

 			
end
///////////////////////// 3
if(bullet1 & enemy3)
begin
 enemyActive3<=0;
 hit1<=1;
 
 			
end 
if(bullet2 & enemy3)
begin
 enemyActive3<=0;
 hit2<=1;
 
 			 
end
if(bullet3 & enemy3)
begin
 enemyActive3<=0;
 hit3<=1;
 
 			
end
if(bullet4&enemy3)
begin
 enemyActive3<=0;
 hit4<=1;
 
 			
end
if(bullet5&enemy3)
begin
 enemyActive3<=0;
 hit5<=1;
 
 			

end
/////////////////////////4
if(bullet1&enemy4)
begin
 enemyActive4<=0;
 hit1<=1;
 
 			
end
if(bullet2&enemy4)
begin
 enemyActive4<=0;
 hit2<=1;
 
 			end
if(bullet3&enemy4)
begin
 enemyActive4<=0;
 hit3<=1;
 
 			
end
if(bullet4&enemy4)
begin
 enemyActive4<=0;
 hit4<=1;
 
end
if(bullet5&enemy4)
begin
 enemyActive4<=0;
 hit5<=1;
 
end
/////////////////////////
if(bullet1&enemy5)
begin
 enemyActive5<=0;
 hit1<=1;
 end
if(bullet2&enemy5)
begin
 enemyActive5<=0;
 hit2<=1;
 end
if(bullet3&enemy5)
begin
 enemyActive5<=0;
 hit3<=1;
 end
if(bullet4&enemy5)
begin
 enemyActive5<=0;
 hit4<=1;
 end
if(bullet5&enemy5)
begin
 enemyActive5<=0;
 hit5<=1;
 end
/////////////////////////
if(bullet1&enemy6)
begin
 enemyActive6<=0;
 hit1<=1;
 end
if(bullet2&enemy6)
begin
 enemyActive6<=0;
 hit2<=1;
 end
if(bullet3&enemy6)
begin
 enemyActive6<=0;
 hit3<=1;
 end
if(bullet4&enemy6)
begin
 enemyActive6<=0;
 hit4<=1;
 end
if(bullet5&enemy6)
begin
 enemyActive6<=0;
 hit5<=1;
 end
end
/////////////////////////

	/*if(hit1 | hit2 | hit3 | hit4 | hit5)
		begin
				if (Unit == 9)
				begin
				Ten <= Ten + 1;
				Unit <= 0;
				end
			else if (Ten == 10) begin  Ten <= 0; Unit <= Unit + 1; end
			else Unit <= Unit + 1;
			
			
		end*/
		if(dead==0)begin
		if(count==29'd100000000)
		begin
		count <=29'b0;
			
			
		if (Unit == 9)
				begin
				Ten <= Ten + 1;
				Unit <= 0;
				enemyActive2<=1;
				enemyActive3<=1;
				enemyActive4<=1;
				enemyActive5<=1;
				enemyActive6<=1;
				if (Ten>=1)
				begin enemyActive7<=1;enemyActive8<=1;end
				if (Ten>=2)
				begin enemyActive9<=1;enemyActive10<=1;end
				end
			else if (Ten == 10) begin  Ten <= 0; Unit <= Unit + 1; end
			else Unit <= Unit + 1;
			
		end
		else
			count <= count +29'd1;
	end

			
			if (dead == 1)
				begin 
	ScorePositionY <= 185;
	ScorePositionX <= 320;

				end
		if(char&enemy1 | char&enemy2| char&enemy3| char&enemy4| char&enemy5| char&enemy6| char&enemy7| char&enemy8| char&enemy9| char&enemy10)
				begin
					dead<=1;
				end
end

/////////////////////////////////////////////////////////////////////////////////
always @ (Clks)
begin

case (Unit)
0 : begin

ScoreBlackUnit <= (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+10*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)

||	    (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);

ScoreWhiteUnit <=  (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||	    (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+4*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+10*3)
||	    (CounterX>=ScorePositionX+3+5*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+10*3)

||	    (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3);

end
1 : begin

ScoreBlackUnit <= (CounterX>=ScorePositionX+3+2*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)

||          (CounterX>=ScorePositionX+3+2*3) && (CounterX<=ScorePositionX+3+3*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX+3+7*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||          (CounterX>=ScorePositionX+3+2*3) && (CounterX<=ScorePositionX+3+4*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX+3+7*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)

||          (CounterX>=ScorePositionX+3+3*3) && (CounterX<=ScorePositionX+3+4*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+7*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+13*3)

||	    (CounterX>=ScorePositionX+3+3*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);

ScoreWhiteUnit <=  (CounterX>=ScorePositionX+3+3*3) && (CounterX<=ScorePositionX+3+7*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||	    (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+7*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+13*3);

end
2 : begin
ScoreBlackUnit <= (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)

||	    (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);


ScoreWhiteUnit <= (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||          (CounterX>=ScorePositionX+3+5*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)

||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)

||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+4*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)

||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3);
end
3 : begin
ScoreBlackUnit <= (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)

||	    (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);


ScoreWhiteUnit <= (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||          (CounterX>=ScorePositionX+3+5*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)

||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)

||          (CounterX>=ScorePositionX+3+5*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)

||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3);

////////////////////////////////////
end
4 : begin
ScoreBlackUnit <= (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+6*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)

||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)

||	    (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);


ScoreWhiteUnit <= (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+4*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+9*3)

||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+6*3) && (CounterY<=ScorePositionY+9*3)

||          (CounterX>=ScorePositionX+3+5*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3);

////////////////////////////////////////
end
5 : begin
ScoreBlackUnit <= (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)
||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||	    (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);
ScoreWhiteUnit <= (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+4*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX+3+5*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3);
end
6 : begin
ScoreBlackUnit <= (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)
||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||	    (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);
ScoreWhiteUnit <= (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+4*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+4*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX+3+5*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3);
end
7 : begin
ScoreBlackUnit <= (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)
||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||	    (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);
ScoreWhiteUnit <= (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX+3+5*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+13*3);
end
8 : begin
ScoreBlackUnit <= (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)
||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||	    (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);
ScoreWhiteUnit <= (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+4*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+5*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3);
end
9 : begin
ScoreBlackUnit <= (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)
||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||	    (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);
ScoreWhiteUnit <= (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+4*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX+3+5*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3);

end
endcase

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (Ten > 0)
case (Ten)
0 : begin

ScoreBlackTen <= (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+10*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)

||	    (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);

ScoreWhiteTen <=  (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||	    (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+4*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+10*3)
||	    (CounterX>=ScorePositionX-30+5*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+10*3)

||	    (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3);

end
1 : begin

ScoreBlackTen <= (CounterX>=ScorePositionX-30+2*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)

||          (CounterX>=ScorePositionX-30+2*3) && (CounterX<=ScorePositionX-30+3*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX-30+7*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||          (CounterX>=ScorePositionX-30+2*3) && (CounterX<=ScorePositionX-30+4*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX-30+7*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)

||          (CounterX>=ScorePositionX-30+3*3) && (CounterX<=ScorePositionX-30+4*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+7*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+13*3)

||	    (CounterX>=ScorePositionX-30+3*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);

ScoreWhiteTen <=  (CounterX>=ScorePositionX-30+3*3) && (CounterX<=ScorePositionX-30+7*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||	    (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+7*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+13*3);

end
2 : begin
ScoreBlackTen <= (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)

||	    (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);


ScoreWhiteTen <= (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||          (CounterX>=ScorePositionX-30+5*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)

||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)

||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+4*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)

||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3);
end
3 : begin
ScoreBlackTen <= (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)

||	    (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);


ScoreWhiteTen <= (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||          (CounterX>=ScorePositionX-30+5*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)

||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)

||          (CounterX>=ScorePositionX-30+5*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)

||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3);

////////////////////////////////////
end
4 : begin
ScoreBlackTen <= (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+6*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)

||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)

||	    (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);


ScoreWhiteTen <= (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+4*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+9*3)

||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+6*3) && (CounterY<=ScorePositionY+9*3)

||          (CounterX>=ScorePositionX-30+5*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3);

////////////////////////////////////////
end
5 : begin
ScoreBlackTen <= (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)
||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||	    (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);
ScoreWhiteTen <= (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+4*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX-30+5*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3);
end
6 : begin
ScoreBlackTen <= (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)
||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||	    (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);
ScoreWhiteTen <= (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+4*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+4*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX-30+5*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3);
end
7 : begin
ScoreBlackTen <= (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)
||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||	    (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);
ScoreWhiteTen <= (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX-30+5*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+13*3);
end
8 : begin
ScoreBlackTen <= (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)
||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||	    (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);
ScoreWhiteTen <= (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+4*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+5*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3);
end
9 : begin
ScoreBlackTen <= (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)
||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||	    (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);
ScoreWhiteTen <= (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+4*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX-30+5*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3);

end
endcase

R_Score_on =   ScoreWhiteUnit | ScoreWhiteTen;
G_Score_on =	ScoreWhiteUnit | ScoreWhiteTen;
B_Score_on =	ScoreWhiteUnit | ScoreWhiteTen;

R_Score_off =  ScoreBlackUnit | ScoreBlackTen;
G_Score_off =  ScoreBlackUnit | ScoreBlackTen;
B_Score_off =  ScoreBlackUnit | ScoreBlackTen;

end
endmodule
