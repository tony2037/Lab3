/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2018 Spring ---------------------- //
// ---------------------- Editor: Hsieh Hsien-Hua (Henry) -------- //
// ---------------------- Version : v.1.00  ---------------------- //
// ---------------------- Date : 2018.02    ---------------------- //
// ---------------------- 1to7 demultiplexer  -------------------- // 
/////////////////////////////////////////////////////////////////////

`timescale 1ns/10ps
//include demux1to7 version1
`ifdef v1
	`include "demux1to7_v1.v"
`endif

//include demux1to7 version2
`ifdef v2
	`include "demux1to7_v2.v"
`endif

//include demux1to7 version3
`ifdef v3
	`include "demux1to7_v3.v"
`endif


module demux1to7_tb;
reg [2:0] Sel;
reg       D;
wire      Y0;
wire      Y1;
wire      Y2;
wire      Y3;
wire      Y4;
wire      Y5;
wire      Y6;

demux1to7 demux (.Y0(Y0), .Y1(Y1), .Y2(Y2), .Y3(Y3), .Y4(Y4), .Y5(Y5), .Y6(Y6), .Sel(Sel), .D(D));

//monitor your result
initial begin
	$monitor($time, " Sel = %d, D = %d, Y0 = %d, Y1 = %d, Y2 = %d, Y3 = %d, Y4 = %d, Y5 = %d, Y6 = %d", Sel, D, Y0, Y1, Y2, Y3, Y4, Y5, Y6);
end

//signal
initial begin
//you should implement this part by yourself (Appendix A)
//do not forget $finish !!!
	  Sel = 0; D = 0;
#10          D = 1;
#10 Sel = 1; D = 0;
#10          D = 1;
#10 Sel = 2; D = 0;
#10          D = 1;
#10 Sel = 3; D = 0;
#10          D = 1;
#10 Sel = 4; D = 0;
#10          D = 1;
#10 Sel = 5; D = 0;
#10          D = 1;
#10 Sel = 6; D = 0;
#10          D = 1;
#10 Sel = 7; D = 0;
#10          D = 1;
#10 $finish;
end

//dump waveform
initial begin
	`ifdef FSDB
	$fsdbDumpfile("demux1to7.fsdb");
	$fsdbDumpvars;
	`endif
  #10000 $finish;
end
endmodule
