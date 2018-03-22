/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2018 Spring ---------------------- //
// ---------------------- Editor: Hsieh Hsien-Hua (Henry) -------- //
// ---------------------- Version : v.1.00  ---------------------- //
// ---------------------- Date : 2018.02    ---------------------- //
// ---------------------- 1to4 demultiplexer  -------------------- // 
/////////////////////////////////////////////////////////////////////

// include demux1to2
`include "demux1to2_nand.v"

// Module name and I/O port
module demux1to4_nand (Y0, Y1, Y2, Y3, Sel, D); 
 
// Input ports declaration
input [1:0] Sel;
input       D;

// Output ports declaration
output      Y0;
output      Y1;
output      Y2;
output      Y3;

// Internal wires declaration
wire        a0;
wire        a1;

// Hierarchical structure
demux1to2_nand demux0 (.Y0(a0), .Y1(a1), .Sel(Sel[1]), .D(D));
demux1to2_nand demux1 (.Y0(Y1), .Y1(Y0), .Sel(Sel[0]), .D(a1));
demux1to2_nand demux2 (.Y0(Y3), .Y1(Y2), .Sel(Sel[0]), .D(a0));
endmodule

