module mainDec_tb();
reg [6:0]op;
reg zero;
wire RegWrite,MemWrite,ResultSrc,ALUSrc,PCSrc,Branch;
wire [1:0] ImmSrc,ALUOp;

mainDec dut(
    .op(op),
    .zero(zero),
    .RegWrite(RegWrite),
    .MemWrite(MemWrite),
    .ResultSrc(ResultSrc),
    .ALUSrc(ALUSrc),
    .ImmSrc(ImmSrc),
    .ALUOp(ALUOp),
    .PCSrc(PCSrc),
    .Branch(Branch)
);

initial begin
    op<=7'b0000011;
    zero<=0;
    #10

    op<=7'b0100011;
    zero<=0;
    #10

    op<=7'b0110011;
    zero<=0;
    #10

    op<=7'b1100011;
    zero<=0;
    #10
    $finish;

end

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0);
end
endmodule