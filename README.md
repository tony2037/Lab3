超大積體電路
===
# VLSI Week1
``
Hardware Descript Language : Verilog
``
[Online compiler for verilog](https://www.tutorialspoint.com/compile_verilog_online.php)
[JDOODLE verilog compiler](https://www.jdoodle.com/execute-verilog-online)

```verilog=
module mux2x1(f,s,s_bar,a,b);
    output f;
    input s, s_bar;
    input a, b;
    wire nand1_out,nand2_out;
    nand(nand1_out,s_bar,a);
    nand(nand2_out,s,b);
    nand(f,nand1_out,nand2_out);
endmodule
```
## Verilog 分成三塊 : Main frame 、 Variable declaration 、 Main body

### Main frame
```verilog=
module mux2x1(f,s,s_bar,a,b):
--
--
--
endmodule
```

### Variable declaration
```verilog=
output f;
input s, s_bar;
input a, b;
wire nand1_out, nand2_out;
```

### Main body
```verilog=
nand(nand1_out,s_bar,a);
nand(nand2_out,s,b);
nand(f,nand1_out,nand2_out);
```

[延伸閱讀 : wire vs reg 的差異](http://www.cnblogs.com/oomusou/archive/2007/10/10/919339.html)
[延伸閱讀 : wire vs reg 的差異](https://www.zhihu.com/question/21021718)

## Basic Language Rule

### Naming
* Case sensitive : 大小寫有別!
* 跟 C 差不多啦

### Number Representation
* May be ...
    * Binary
    * Octonary
    * Decimal
    * Hexadecimal
* Format <size>'<base_format><number>
* Example
    * 4'b1111;-16d255
    * 23456 (32-bit decimal # by default); ‘hc3 (32 bit)
    * 12’b1111_0000_1010

### Primitive Operator
* Most basic functional models of combinational logic gates
* Built in the Verilog

```

| n-Input        |
| ------------- |
| and      | 
| nand     | 
| or       | 
| nor      |
| xor      |
```

###　Module ports
* Oreder sensitive when used
    * Position sensitive
        * AOI M1()

    * Explicitly declared
        *

# VLSI Week2

## Modules
分為四個層次
* Behavior
`
寫演算法
`
* Data flow
`
指名資料處理方式，說明資料如何在registers中儲存與傳送、資料的處理方式
`
* gate-level
`
邏輯匝連接
`
* switch level
`
線路由開關、儲存點組成。我們在這邊要他媽的知道元件特性 幹
`

## 別名 (Instance) OS:感覺就像是C的宣告R
==Verilog 不允許巢狀模組宣告 : 不能在模組A中宣告模組B==

```Verilog=
module ripple_carry_counter(q,clk,reset);
.
.
.

end module
```

```Verilog=
module ripple_carry_counter(q,clk,reset);

output [3:0] q;
input clk, reset;
//模組的三個參數都要說清楚

T_FF tff0(q[0],clk,reset);
T_FF tff1(q[1],clk,reset);
T_FF tff2(q[2],clk,reset);
T_FF tff3(q[3],clk,reset);
//tff0 ... 就是 Instance 啦
end module

module T_FF(q,clk,reset);
output q;
input clk,reset;
wire d;
D_FF dff0(q, d, clk, reset);

not n1(d,q);
endmodule
```

![image alt](https://circuitdigest.com/sites/default/files/inlineimages/T-flip-flop-symbol.png)
![image alt](https://circuitdigest.com/sites/default/files/inlineimages/D-flip-flop-symbol.png)
![image alt](https://www.tutorialspoint.com/digital_circuits/images/circuit_diagram_of_t_flip_flop.jpg)

==感覺就像C的 #define 、 #endefine==

## 模擬 (Components of a Simulation)
* 用一個觸發區塊 (Stimulus Block)
* 就是他媽的 test bench

# VLSI Week3

## 基本概念
* 數字規格
    * 規定長度之數字
        **<size>'<base format><number>**
        ```verilog=
        4'b1111 //定義為 4bits 二進位數字
        12'habc    //定義為 12bits 十六進位數字
        16'd255    //定義為 16bits 十進位數字
        ```
    * 不定長度之數字
        **不定長度之數字不使用<size>規定位元大小，使用==模擬器或硬體內定的規格==(必須大於32bits)**
        **'<base format><number>**
        ```verilog=
        23456 //定義為 32bits 十進位數字
        'hc3 //定義為 32bits 十六進位數字
        'o21    //定義為 32bits 八進位數字
        ```
    
* 資料型態(Data type)
    * 數值組(value set) : **四種數值為準(value level)** **八種強度(Strengths)**
    * 接線(Nets **wire**) Vs. 暫存器(Registers **reg**)
    **wire的default strength 是 Z**
    **Register 不用像wire一樣需要驅動**
    **wire==沒有記憶性== register==有記憶性==**
    **除非給定新的數值否則reg的value會一直維持**
    **wire沒有記憶性=>不能當訊號源**
        ```verilog=
        wire a;    //宣告上面電路中一個接線a
        wire b,c;
        wire d = 1'b0;    //宣告時設定接線d為一固定值0
        ```
        ```verilog=
        reg reset;    //宣告一個變數來持劉(hold)數值
        initial
        begin
           reset = 1'b1;    //初始值為1來重設電路
           #100 reset = 1'b0;    //在100個模擬時間後，設定reset為0
        end
        ```
    
    * 向量(Vectors) Vs. 陣列(Arrays)
        ```verilog=
        wire [7:0] bus;    //8-bits 匯流排
        reg [0:40] virtual_addr;    //向量暫存器變數，41bits寬度虛擬位址
        
        integer count[0:7];    //8個整數組成的陣列
        reg bool[31:0];    //32個一位元布林暫存器變數組成的陣列
        reg [4:0] port_id[0:7];    //8個5位元組成的陣列
        reg [63:0] array_4d [15:0] [7:0] [7:0] [255:0];    //四維陣列
        wire [7:0] w_array2 [5:0]; //六個八位元接線組成的陣列
    
        ```
        
    * 時間(Time) : **$time是系統函數返回系統時間**
    ```Verilog=
    time t;
    initial
        t = $time;    //儲存目前模擬時間
    ```
    
* 系統任務(System Tasks) 和 編譯指令(Compiler Directives)
    * 系統任務(System Tasks)
        * 資訊顯示(Displaying information) Vs. 資訊監視(Monitoring information)
        ```Verilog=
        $display($time);    //顯示目前時間
        --230
        
        //顯示虛擬位址為1fe0000001c 的值和目前時間 200
        reg [0:40] virtual;
        $display("At time %d virtual adderess is %h", $time, virtual_adder);
        --At time 200 virtual address is 1fe0000001c
        ```
        
        ```Verilog=
        // 監視信號clock 與 reset 的值和時間
        // Clock 每5時間單位觸發一次而reset在10時間單位轉為低電位
        initial
        begin
            $monitor($time, "Value of signals clock = %b reset = %b", clock, reset);
        end
        Partial output of the monitor statement:
        -- 0 Value of signals clock = 0 reset = 1
        -- 5 Value of signals clock = 1 reset = 1
        -- 10 Value of signals clock = 0 reset = 0
        ```
        **$monitor 不僅僅是顯示一次而已，而是==每一次信號變化都顯示一次==**
        
        **==每一次僅允許有一個$monitor可以執行==多個使用只有最後一個有效**
        
        * 中止(Stopping) 和 完成(Finishing)模擬
        ```Verilog=
        //終止模擬在100時間單位並檢驗結果
        //在1000時間單位完成模擬
        initial    //模擬時間為0
        begin
        clock = 0;
        reset = 1;
        #100 $stop;    //終止模擬在100時間單位
        #900 $finish;    //在1000時間單位完成模擬
        end
        ```
        
    * 編譯命令(Compiler Directives)
    ```Verilog=
    `define WORD_SIZE 32
    `include header.v
    ```
    
## Testbench : initial、always、posedge clk..etc
* 輸入
* 
* 

```Verilog=
` include Add_half_0_delay.v
module testbench_for_A_module():
    wire sum ,cout;
    reg a, b;
    Add_half_0_delay M1(sum,cout,a,b); //instance a A_moduel
    
    initial
    begin
    # 100 $finish;    //跑個他媽100個時間單位
    end
    
    initial begin
    #10 a = 0; b=0;
    #10 b = 1;
    #10 a = 1;
    #10 b = 0;
    end
endmodule
```

==**initial** Vs. **always**==
==initial==
```
initial
begin
// 程式碼
end
```
1\. 當模擬一開始時會被執行  
2\. 執行到 end 就會結束  
3\. 安排在特定時間執行可用延遲  
4\. 通常用在 test bench 當中。

範例:
==========
```
module ram_with_init(output reg [7:0] q, input [7:0] d,
input [4:0] write_address, read_address, input we, clk);

reg [7:0] mem [0:31];
integer i;

initial begin
for (i = 0; i < 32; i = i + 1)
mem[i] = i[7:0];
end

always @ (posedge clk) begin
  if (we)
    mem[write_address] <= d;
  q <= mem[read_address];
end

endmodule
```
==always==
```
always
begin
// 程式碼
end
```
1\. 當模擬開始後就會被執行  
2\. 執行到 end 之後會重新執行 begin  
3\. 通常用在設計電路時，有時也用在 test bench 當中。

範例：邊緣觸發正反器
==========
```
reg q;

always @(posedge clk)
  q = d;
```


問題
==

1.  真正的電路執行時所有的 always 區塊合成後是同步執行的。
2.  但在跑 Verilog 模擬時，always @(posedge clk) 區塊是以一種順序的方式執行，只是**順序是不一定的**。

舉例而言：以下程式的**執行順序並不一定**，所以模擬的結果值也不一定，因此這是一個糟糕的程式。

```
reg d1, d2, d3, d4;
always @(posedge clk) d2 = d1;
always @(posedge clk) d3 = d2;
always @(posedge clk) d4 = d3;
```

正確的做法

```
reg d1, d2, d3, d4;
always @(posedge clk) begin
  d2 = d1;
  d3 = d2;
  d4 = d3;
end
```

## 組合邏輯

Half_adder
==
```
module Add_half_0_delay(sum, c_out, a, b);
...
endmoduel
```
Full_adder : 由半加器(Half_adder)組成
==
```
module Add_full_0_delay(sum, c_out, a, b, c_in);


Add_half_0_delay M1();
Add_half_0_delay M2();
or M3;
endmodule
```

**ztex點評:阿不就是他媽的class???線在手接著走記得要用vector呦**


# Lab3
[github](https://github.com/tony2037/Lab3)

`
這次LAB3就是要我們搞三個Demux **Demux1to2** **Demux1to4** **Demux1to7**
`
``
喔對了~Demux1to7要搞三種版本喔呵呵
``

## Demux1to2
``
規定我們只能用NAND gate implement Q
``

[設計圖 : Design](https://drive.google.com/file/d/1KaSiU5Xwqkr0QhlmpqAV_ajoXXBvcfHR/view?usp=sharing)

* 小技巧 : Nand(s,s) = not(s)
* sh demux1to2_nand_test.sh

```verilog=
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

```


## Demux1to4
``
Implement Demux1to4 , and you are only allowed to use demux1to2_nand.v you implement above
``

* sh demux1to4_nand_test.sh

[設計圖 : Design](https://drive.google.com/file/d/1-KY4Xs671rZEYAz_9o3GBPabpHHmGGqp/view?usp=sharing)

```verilog=
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
```

## Demux1to7
``
Implement Demux1to7 in three different ways
``

[設計圖 : Design v1](https://drive.google.com/file/d/1IAG5Pt0cMwBCikQxqAqd1EY7kZTFxCXz/view?usp=sharing)

* sh demux1to7_v1_test.sh


```verilog=
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

// Hierarchical structure
demux1to2 demux0 (.Y0(a0), .Y1(a1), .Sel(Sel[2]), .D(D));
demux1to2 demux1 (.Y0(a2), .Y1(Y6), .Sel(Sel[1]), .D(a1));
demux1to2 demux2 (.Y0(Y4), .Y1(Y5), .Sel(Sel[0]), .D(a2));
demux1to4 demux3 (.Y0(Y0), .Y1(Y1), .Y2(Y2), .Y3(Y3), .Sel(Sel[1:0]), .D(a0));
endmodule
```

[設計圖 : Design v2](https://drive.google.com/file/d/1KaSiU5Xwqkr0QhlmpqAV_ajoXXBvcfHR/view?usp=sharing)

* sh demux1to7_v2_test.sh


```verilog=
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


// Hierarchical structure
demux1to2 demux0 (.Y0(a0), .Y1(a1), .Sel(Sel[2]), .D(D));
demux1to4 demux1 (.Y0(Y4), .Y1(Y5), .Y2(Y6), .Y3(Y6), .Sel(Sel[1:0]), .D(a1));
demux1to4 demux2 (.Y0(Y0), .Y1(Y1), .Y2(Y2), .Y3(Y3), .Sel(Sel[1:0]), .D(a0));
endmodule
```

[設計圖 : Design v3](https://drive.google.com/file/d/1tKYY_KFYvj5SWFejGP1E_bfrgiAeiGg7/view?usp=sharing)

* sh demux1to7_v3_test.sh


```verilog=
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
```
