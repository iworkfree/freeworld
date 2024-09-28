
`timescale 1 ns / 10 ps  // time-unit = 1 ns, precision = 10 ps

module dp_ram #(
    parameter integer DATA_WIDTH = 36,
    parameter integer ADDR_WIDTH = 10
) (
    input                       clk_a,
    input                       wr_en_a,
    input      [ADDR_WIDTH-1:0] addr_a,
    input      [DATA_WIDTH-1:0] din_a,
    output reg [DATA_WIDTH-1:0] dout_a,
    input                       clk_b,
    input                       wr_en_b,
    input      [ADDR_WIDTH-1:0] addr_b,
    input      [DATA_WIDTH-1:0] din_b,
    output reg [DATA_WIDTH-1:0] dout_b
);

    localparam integer MEM_SIZE = (2 ** ADDR_WIDTH);
    /* verilator lint_off MULTIDRIVEN */
    reg [DATA_WIDTH-1:0] memory[MEM_SIZE];

    always @(posedge clk_a) begin
        if (wr_en_a) memory[addr_a] <= din_a;
        dout_a <= memory[addr_a];
    end

    always @(posedge clk_b) begin
        if (wr_en_b) memory[addr_b] <= din_b;
        dout_b <= memory[addr_b];
    end

endmodule
