module drawBullet(
	input clk,
	input wire [9:0] characterPositionX,
	input wire [8:0] characterPositionY,
	input wire [9:0] drawingPositionX,
	input wire [8:0] drawingPositionY,
	output reg [2:0] rgb
);
	reg [9:0] x;
	reg [9:0] y;
	initial begin
		x = 'd0;
		y = 'd0;
	end

	always @(posedge clk) begin
		x <= (drawingPositionX - characterPositionX + 8);
		y <= (drawingPositionY - characterPositionY + 11);
		if(x==6 && y==1) begin	rgb <= 3'b100;	end
		else if(x==7 && y==1) begin	rgb <= 3'b100;	end
		else if(x==8 && y==1) begin	rgb <= 3'b100;	end
		else if(x==9 && y==1) begin	rgb <= 3'b100;	end
		else if(x==10 && y==1) begin	rgb <= 3'b100;	end
		else if(x==6 && y==2) begin	rgb <= 3'b100;	end
		else if(x==7 && y==2) begin	rgb <= 3'b110;	end
		else if(x==8 && y==2) begin	rgb <= 3'b100;	end
		else if(x==9 && y==2) begin	rgb <= 3'b100;	end
		else if(x==10 && y==2) begin	rgb <= 3'b100;	end
		else if(x==11 && y==2) begin	rgb <= 3'b100;	end
		else if(x==12 && y==2) begin	rgb <= 3'b100;	end
		else if(x==6 && y==3) begin	rgb <= 3'b100;	end
		else if(x==7 && y==3) begin	rgb <= 3'b110;	end
		else if(x==8 && y==3) begin	rgb <= 3'b110;	end
		else if(x==9 && y==3) begin	rgb <= 3'b110;	end
		else if(x==10 && y==3) begin	rgb <= 3'b110;	end
		else if(x==11 && y==3) begin	rgb <= 3'b100;	end
		else if(x==12 && y==3) begin	rgb <= 3'b100;	end
		else if(x==13 && y==3) begin	rgb <= 3'b100;	end
		else if(x==6 && y==4) begin	rgb <= 3'b100;	end
		else if(x==7 && y==4) begin	rgb <= 3'b110;	end
		else if(x==8 && y==4) begin	rgb <= 3'b100;	end
		else if(x==9 && y==4) begin	rgb <= 3'b100;	end
		else if(x==10 && y==4) begin	rgb <= 3'b110;	end
		else if(x==11 && y==4) begin	rgb <= 3'b110;	end
		else if(x==12 && y==4) begin	rgb <= 3'b110;	end
		else if(x==13 && y==4) begin	rgb <= 3'b100;	end
		else if(x==6 && y==5) begin	rgb <= 3'b100;	end
		else if(x==7 && y==5) begin	rgb <= 3'b110;	end
		else if(x==8 && y==5) begin	rgb <= 3'b100;	end
		else if(x==9 && y==5) begin	rgb <= 3'b100;	end
		else if(x==10 && y==5) begin	rgb <= 3'b110;	end
		else if(x==11 && y==5) begin	rgb <= 3'b110;	end
		else if(x==12 && y==5) begin	rgb <= 3'b110;	end
		else if(x==13 && y==5) begin	rgb <= 3'b100;	end
		else if(x==6 && y==6) begin	rgb <= 3'b100;	end
		else if(x==7 && y==6) begin	rgb <= 3'b110;	end
		else if(x==8 && y==6) begin	rgb <= 3'b100;	end
		else if(x==9 && y==6) begin	rgb <= 3'b100;	end
		else if(x==10 && y==6) begin	rgb <= 3'b100;	end
		else if(x==11 && y==6) begin	rgb <= 3'b100;	end
		else if(x==12 && y==6) begin	rgb <= 3'b100;	end
		else if(x==13 && y==6) begin	rgb <= 3'b100;	end
		else if(x==6 && y==7) begin	rgb <= 3'b100;	end
		else if(x==7 && y==7) begin	rgb <= 3'b110;	end
		else if(x==8 && y==7) begin	rgb <= 3'b100;	end
		else if(x==9 && y==7) begin	rgb <= 3'b100;	end
		else if(x==6 && y==8) begin	rgb <= 3'b100;	end
		else if(x==7 && y==8) begin	rgb <= 3'b110;	end
		else if(x==8 && y==8) begin	rgb <= 3'b100;	end
		else if(x==9 && y==8) begin	rgb <= 3'b100;	end
		else if(x==6 && y==9) begin	rgb <= 3'b100;	end
		else if(x==7 && y==9) begin	rgb <= 3'b110;	end
		else if(x==8 && y==9) begin	rgb <= 3'b100;	end
		else if(x==9 && y==9) begin	rgb <= 3'b100;	end
		else if(x==6 && y==10) begin	rgb <= 3'b100;	end
		else if(x==7 && y==10) begin	rgb <= 3'b110;	end
		else if(x==8 && y==10) begin	rgb <= 3'b100;	end
		else if(x==9 && y==10) begin	rgb <= 3'b100;	end
		else if(x==1 && y==11) begin	rgb <= 3'b100;	end
		else if(x==2 && y==11) begin	rgb <= 3'b100;	end
		else if(x==3 && y==11) begin	rgb <= 3'b100;	end
		else if(x==4 && y==11) begin	rgb <= 3'b100;	end
		else if(x==5 && y==11) begin	rgb <= 3'b100;	end
		else if(x==6 && y==11) begin	rgb <= 3'b100;	end
		else if(x==7 && y==11) begin	rgb <= 3'b110;	end
		else if(x==8 && y==11) begin	rgb <= 3'b100;	end
		else if(x==9 && y==11) begin	rgb <= 3'b100;	end
		else if(x==1 && y==12) begin	rgb <= 3'b100;	end
		else if(x==2 && y==12) begin	rgb <= 3'b100;	end
		else if(x==3 && y==12) begin	rgb <= 3'b100;	end
		else if(x==4 && y==12) begin	rgb <= 3'b100;	end
		else if(x==5 && y==12) begin	rgb <= 3'b100;	end
		else if(x==6 && y==12) begin	rgb <= 3'b100;	end
		else if(x==7 && y==12) begin	rgb <= 3'b110;	end
		else if(x==8 && y==12) begin	rgb <= 3'b100;	end
		else if(x==9 && y==12) begin	rgb <= 3'b100;	end
		else if(x==1 && y==13) begin	rgb <= 3'b110;	end
		else if(x==2 && y==13) begin	rgb <= 3'b110;	end
		else if(x==3 && y==13) begin	rgb <= 3'b110;	end
		else if(x==4 && y==13) begin	rgb <= 3'b110;	end
		else if(x==5 && y==13) begin	rgb <= 3'b110;	end
		else if(x==6 && y==13) begin	rgb <= 3'b111;	end
		else if(x==7 && y==13) begin	rgb <= 3'b110;	end
		else if(x==8 && y==13) begin	rgb <= 3'b100;	end
		else if(x==9 && y==13) begin	rgb <= 3'b100;	end
		else if(x==1 && y==14) begin	rgb <= 3'b110;	end
		else if(x==2 && y==14) begin	rgb <= 3'b110;	end
		else if(x==3 && y==14) begin	rgb <= 3'b110;	end
		else if(x==4 && y==14) begin	rgb <= 3'b110;	end
		else if(x==5 && y==14) begin	rgb <= 3'b110;	end
		else if(x==6 && y==14) begin	rgb <= 3'b111;	end
		else if(x==7 && y==14) begin	rgb <= 3'b110;	end
		else if(x==8 && y==14) begin	rgb <= 3'b100;	end
		else if(x==9 && y==14) begin	rgb <= 3'b100;	end
		else if(x==1 && y==15) begin	rgb <= 3'b110;	end
		else if(x==2 && y==15) begin	rgb <= 3'b110;	end
		else if(x==3 && y==15) begin	rgb <= 3'b110;	end
		else if(x==4 && y==15) begin	rgb <= 3'b110;	end
		else if(x==5 && y==15) begin	rgb <= 3'b110;	end
		else if(x==6 && y==15) begin	rgb <= 3'b111;	end
		else if(x==7 && y==15) begin	rgb <= 3'b110;	end
		else if(x==8 && y==15) begin	rgb <= 3'b100;	end
		else if(x==9 && y==15) begin	rgb <= 3'b100;	end
		else if(x==1 && y==16) begin	rgb <= 3'b110;	end
		else if(x==2 && y==16) begin	rgb <= 3'b110;	end
		else if(x==3 && y==16) begin	rgb <= 3'b110;	end
		else if(x==4 && y==16) begin	rgb <= 3'b110;	end
		else if(x==5 && y==16) begin	rgb <= 3'b110;	end
		else if(x==6 && y==16) begin	rgb <= 3'b110;	end
		else if(x==7 && y==16) begin	rgb <= 3'b110;	end
		else if(x==8 && y==16) begin	rgb <= 3'b100;	end
		else if(x==9 && y==16) begin	rgb <= 3'b100;	end
		else if(x==1 && y==17) begin	rgb <= 3'b110;	end
		else if(x==2 && y==17) begin	rgb <= 3'b110;	end
		else if(x==3 && y==17) begin	rgb <= 3'b110;	end
		else if(x==4 && y==17) begin	rgb <= 3'b110;	end
		else if(x==5 && y==17) begin	rgb <= 3'b110;	end
		else if(x==6 && y==17) begin	rgb <= 3'b110;	end
		else if(x==7 && y==17) begin	rgb <= 3'b110;	end
		else if(x==8 && y==17) begin	rgb <= 3'b100;	end
		else if(x==9 && y==17) begin	rgb <= 3'b100;	end
		else if(x==1 && y==18) begin	rgb <= 3'b100;	end
		else if(x==2 && y==18) begin	rgb <= 3'b100;	end
		else if(x==3 && y==18) begin	rgb <= 3'b100;	end
		else if(x==4 && y==18) begin	rgb <= 3'b100;	end
		else if(x==5 && y==18) begin	rgb <= 3'b100;	end
		else if(x==6 && y==18) begin	rgb <= 3'b100;	end
		else if(x==7 && y==18) begin	rgb <= 3'b100;	end
		else if(x==8 && y==18) begin	rgb <= 3'b100;	end
		else if(x==1 && y==19) begin	rgb <= 3'b100;	end
		else if(x==2 && y==19) begin	rgb <= 3'b100;	end
		else if(x==3 && y==19) begin	rgb <= 3'b100;	end
		else if(x==4 && y==19) begin	rgb <= 3'b100;	end
		else if(x==5 && y==19) begin	rgb <= 3'b100;	end
		else if(x==6 && y==19) begin	rgb <= 3'b100;	end
		else if(x==7 && y==19) begin	rgb <= 3'b100;	end
		else begin rgb <= 3'b000; end// Width: 14, Height: 20 From: C:/Users/ITPCC/OneDrive/Documents/CPE223/Gun/music_note.png
	end
endmodule
