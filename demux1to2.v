/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2018 Spring ---------------------- //
// ---------------------- Editor: Hsieh Hsien-Hua (Henry) -------- //
// ---------------------- Version : v.1.00  ---------------------- //
// ---------------------- Date : 2018.02    ---------------------- //
// ---------------------- 1to2 demultiplexer  -------------------- // 
/////////////////////////////////////////////////////////////////////

// Module name and I/O port
module demux1to2 (Y0, Y1, Sel, D);  

// Input ports declaration
input Sel;
input D;

// Output ports declaration
output Y0;
output Y1;

// Internal wires declaration
wire a;

// Primitive Instantiation
not(a, Sel);
and(Y0, a, D);
and(Y1, Sel, D);

endmodule
