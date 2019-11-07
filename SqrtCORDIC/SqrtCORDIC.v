module SqrtCORDIC(input         Start,
                  input         clk,
						input  [31:0] InpNum,
						output [23:0] Result,
                  output reg    Stop);


/// D A T A   U N I T   variables

wire        init;
wire        gatedClk;
wire        le;
wire [23:0] added;
wire [23:0] addOrNot;
wire [47:0] squared;
wire [31:0] squaredRestr;

reg [23:0] OneShReg;
reg [23:0] Sqrt;
reg [31:0] InputReg;

assign gatedClk = clk & ~Stop;


/// C O N T R O L   U N I T   variables

reg [4:0] ctr;


/// D A T A   U N I T   definition

assign added        = OneShReg + Sqrt;
assign squared      = added * added;
assign squaredRestr = squared >> 16;
assign le           = (squaredRestr <= InputReg) ? 1'b1  : 1'b0;
assign addOrNot     = (le == 1)                  ? added : Sqrt;
assign Result       = Sqrt;

always@(negedge gatedClk)
begin
   OneShReg <= (init == 1'b1) ? (24'b1 << 23) : (OneShReg >>> 1);
   Sqrt     <= (init == 1'b1) ? 24'b0         : addOrNot;
   InputReg <= (init == 1'b1) ? InpNum        : InputReg;
end


/// C O N T R O L   U N I T   definition

assign init = Start;

always@(posedge clk)
if (Start == 1'b1)
   begin
	ctr  <= 5'b0;
	Stop <= 1'b0;
	end
else
   if (ctr >= 5'd23)
	begin
	ctr  <= ctr;
	Stop <= 1'b1;
	end
	else
	begin
	ctr  <= ctr + 5'b1;
	Stop <= 1'b0;
   end


endmodule
