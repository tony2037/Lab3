/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2018 Spring ---------------------- //
// ---------------------- Editor: Hsieh Hsien-Hua (Henry) -------- //
// ---------------------- Version : v.1.00  ---------------------- //
// ---------------------- Date : 2018.02    ---------------------- //
// ---------------------- 1to2 demultiplexer  -------------------- // 
/////////////////////////////////////////////////////////////////////

// Module name and I/O port
module demux1to2_nand (Y0, Y1, Sel, D);  

// Input ports declaration
input Sel;
input D;

// Output ports declaration
output Y0;
output Y1;

// Internal wires declaration
wire a;
wire b;
wire _S;

// Primitive Instantiation
nand(a, Sel, D);
nand(Y0, a, a);

nand(_S,Sel,Sel);
nand(b, _S, D);
nand(Y1, b, b);


endmodule
