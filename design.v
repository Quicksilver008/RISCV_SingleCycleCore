module alu(
input [31:0] A,B,
input [2:0] ALU_controls,
output reg [31:0] Result,
output reg N,Z,C,V
);

wire [31:0] ALU_sum,ALU_and,ALu_or,ALU_zerox,NOT_b,MUX_out;
wire C_out;
assign {C_out,ALU_sum} = A+MUX_out+ALU_controls[0];
assign ALU_and = A & B;
assign ALU_or = A | B;
assign ALU_zerox = {{31{1'b0}},ALU_sum[31]};
assign NOT_b = ~B;
assign MUX_out = (ALU_controls)?NOT_b:B;
always@(*)
begin
case(ALU_controls[2:0])
3'b000 : Result=ALU_sum;
3'b001 : Result=ALU_sum;
3'b010 : Result=ALU_and;
3'b011 : Result=ALU_or;
3'b101 : Result=ALU_zerox;
default : Result=0;
endcase
Z=(!(Result))?1:0;
N=(Result[31])?1:0;
C=(C_out & ~(ALU_controls[1]));
V=(~(ALU_controls[0]^A[31]^B[31]))&(A[31]^ALU_sum[31])&((ALU_controls[1]));
end
endmodule
