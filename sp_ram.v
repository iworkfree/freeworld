
`timescale 1 ns / 10 ps  // time-unit = 1 ns, precision = 10 ps

module sp_ram #(
    parameter integer DATA_WIDTH = 72,
    parameter integer ADDR_WIDTH = 10
) (
    input                       clk,
    input                       wr_en,
    input      [ADDR_WIDTH-1:0] addr,
    input      [DATA_WIDTH-1:0] din,
    output reg [DATA_WIDTH-1:0] dout
);

    localparam integer MEM_SIZE = (2 ** ADDR_WIDTH);
    reg [DATA_WIDTH-1:0] memory[0:MEM_SIZE-1];

    always @(posedge clk) begin
        if (wr_en) memory[addr] <= din;
        dout <= memory[addr];
    end
endmodule