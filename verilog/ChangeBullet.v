`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:56:31 04/29/2016 
// Design Name: 
// Module Name:    ChangeBullet 
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
module ChangeBullet(
		input shoot,
		input shot1,
		input shot2,
		input shot3,
		input shot4,
		input shot5,
		output reg [4:0] changebullet=0
    );
	
	always @(negedge shoot)
	begin
		if(shot1==0)
			changebullet<=0;
		else if(shot2==0)
			changebullet<=1;
		else if(shot3==0)
			changebullet<=2;
		else if(shot4==0)
			changebullet<=3;
		else if(shot5==0)
			changebullet<=4;
	end

endmodule
