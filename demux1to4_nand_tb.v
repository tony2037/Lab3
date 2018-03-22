/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2018 Spring ---------------------- //
// ---------------------- Editor: Hsieh Hsien-Hua (Henry) -------- //
// ---------------------- Version : v.1.00  ---------------------- //
// ---------------------- Date : 2018.02    ---------------------- //
// ---------------------- 1to4 demultiplexer  -------------------- // 
/////////////////////////////////////////////////////////////////////

`timescale 1ns/10ps
`include "demux1to4_nand.v"

module demux1to4_tb;

reg [1:0] Sel;
reg       D;
wire      Y0;
wire      Y1;
wire      Y2;
wire      Y3;

demux1to4_nand demux (.Y0(Y0), .Y1(Y1), .Y2(Y2), .Y3(Y3), .Sel(Sel), .D(D));

initial begin
	$monitor($time, " Sel = %d, D = %d, Y0 = %d, Y1 = %d, Y2 = %d, Y3 = %d", Sel, D, Y0, Y1, Y2, Y3);
end

initial begin
    Sel = 2'b00; D = 0;
#10              D = 1;
#10 Sel = 2'b01; D = 0;
#10              D = 1;
#10 Sel = 2'b10; D = 0;
#10              D = 1;
#10 Sel = 2'b11; D = 0;
#10              D = 1;
#10 $finish;
end

initial begin
	`ifdef FSDB
	$fsdbDumpfile("demux1to4.fsdb");
	$fsdbDumpvars;
	`endif
  #10000 $finish;
end

endmodule
