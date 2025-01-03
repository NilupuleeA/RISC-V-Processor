module AdderBEQ(
    input logic [31:0] Addr,
    input logic [31:0] Extended_imm,
    output logic [31:0] NextAddr
);

    assign NextAddr = Addr + (Extended_imm<<1);
endmodule
