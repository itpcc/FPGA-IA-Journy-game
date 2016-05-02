# FPGA "IA Journy" game

Verilog code for very simple gun(music note)-shooting game by button and VGA screen.

This programs is for CPE223 Digital system design, KMUTT.

## Project member

1. Mr. Rachasak Ragkamnerd 57070501075
2. Mr. Suttiwat Songboonkaew 57070501079

[CPE KMUTT](http://cpe.kmutt.ac.th)

## Screenshot

Uploading

## How to use Verilog file

1. Install [Xilinx ISE](http://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/design-tools.html).
2. Create new project,
3. Set `vgagame.v` as top module.
..- Dont forget to add another `.v` files into project.
4. Configure pin network. (see `net.ucf` which used for APEX FPGA Discovery-III XC3S200 for example)
5. Implement project into binary file.
6. Upload binary file into FPGA board.
7. Connect VGA breakout to board. (see [VGA Pong project](http://www.fpga4fun.com/PongGame.html) for wiring and creating instruction.)
8. Initial program
9. Enjoy!

## image2verilog-*.py

![Example using those script: left--Scrpit console, middle--module code result, top right--original image, bottom right--expected output image](https://raw.githubusercontent.com/itpcc/FPGA-IA-Journy-game/master/image2verilog-example.png "Example screenshot using those script")

Those `image2verilog-[type].py`	are Python 2.7 script for generating 3-bits RGB image drawing module. (Maybe) easy to use!

### 5 step to use

1. run `py image2verilog-[type].py` (`color` -- color and separate command in each pixel, `bw` -- black white and group same color, colorgroup -- same as `bw` but 3-bits RGB)
2. Choose input image (Typical image format which supported by Python PIL)
3. Name output filename. (You can use `{w}` for image width and `{h}` for image height.)
4. Name output module name.
5. Wait and see! :v
