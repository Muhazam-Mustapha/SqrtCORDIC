`timescale 1ms/1us
`define CapBin $fdisplay(SimDataBin, " %b     %b   %b %b   %b",    sr.Start, sr.clk, sr.OneShReg, sr.Sqrt,           sr.Stop)
`define CapDec $fdisplay(SimDataDec, " %b     %b   %b %9.6f   %b", sr.Start, sr.clk, sr.OneShReg, sr.Sqrt/(2.0**16), sr.Stop)

module Testbench();

reg  [31:0] num;
reg         clk ;
reg         start;
wire [23:0] result;
wire        stop;

initial

begin: SimBlock

   integer SimDataBin;
   integer SimDataDec;
   SimDataBin = $fopen ("SimDataBin.txt","w");
   SimDataDec = $fopen ("SimDataDec.txt","w");
   $fdisplay(SimDataBin, "Start clk       Shift Register              Result           Stop " );
   $fdisplay(SimDataDec, "Start clk       Shift Register        Result  Stop " );
   
   num = 2000.45 * 2**16;
   
   start = 0; clk = 0; #1; `CapBin; `CapDec;
   start = 1; clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
   start = 0; clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
              clk = 0; #1; `CapBin; `CapDec;
              clk = 1; #1; `CapBin; `CapDec;
   
   $fclose(SimDataBin);
   $fclose(SimDataDec);
   $finish;
end

SqrtCORDIC sr(.Start(start),
              .clk(clk),
			  .InpNum(num),
			  .Result(),
              .Stop());

endmodule
