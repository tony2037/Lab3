/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2018 Spring ---------------------- //
// ---------------------- Editor: Hsieh Hsien-Hua (Henry) -------- //
// ---------------------- Version : v.1.00  ---------------------- //
// ---------------------- Date : 2018.02    ---------------------- //
// ---------------------- 1to2 demultiplexer  -------------------- // 
/////////////////////////////////////////////////////////////////////

`timescale 1ns/10ps
`include "demux1to2_nand.v"

module demux1to2_tb;

reg Sel;
reg D;
wire Y0;
wire Y1;

demux1to2_nand demux (.Y0(Y0), .Y1(Y1), .Sel(Sel), .D(D));

initial begin
  $monitor($time, " Sel = %d, D = %d, Y0 = %d, Y1 = %d", Sel, D, Y0, Y1);
end

initial begin
	  Sel = 0; D = 0;
#10          D = 1;
#10 Sel = 1; D = 0;
#10          D = 1;
#10 $finish;
end

initial begin
  `ifdef FSDB
  $fsdbDumpfile("demux1to2.fsdb");
  $fsdbDumpvars;
  `endif
  #10000 $finish;
end

endmodule
