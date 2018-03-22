/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2018 Spring ---------------------- //
// ---------------------- Editor: Hsieh Hsien-Hua (Henry) -------- //
// ---------------------- Version : v.1.00  ---------------------- //
// ---------------------- Date : 2018.02    ---------------------- //
// ---------------------- 1to4 demultiplexer  -------------------- // 
/////////////////////////////////////////////////////////////////////

// include demux1to2
`include "demux1to2.v"
`include "demux1to4.v"

// Module name and I/O port
module demux1to7 (Y0, Y1, Y2, Y3, Y4, Y5, Y6, Sel, D); 
 
// Input ports declaration
input [2:0] Sel;
input       D;

// Output ports declaration
output      Y0;
output      Y1;
output      Y2;
output      Y3;
output      Y4;
output      Y5;
output      Y6;

// Internal wires declaration
wire        a0;
wire        a1;
wire        a2;
wire        a3;


// Hierarchical structure
demux1to4 demux0 (.Y0(a0), .Y1(a1), .Y2(a2), .Y3(a3), .Sel(Sel[1:0]), .D(D));
demux1to2 demux1 (.Y0(a0), .Y1(a4), .Sel(Sel[2]), .D(a0));
demux1to2 demux2 (.Y0(a1), .Y1(a5), .Sel(Sel[2]), .D(a1));
demux1to2 demux3 (.Y0(a2), .Y1(a6), .Sel(Sel[2]), .D(a2));
demux1to2 demux4 (.Y0(a3), .Y1(a6), .Sel(Sel[2]), .D(a3));
endmodule

