
`timescale 1 ns / 10 ps  // time-unit = 1 ns, precision = 10 ps

module dp_rom #(
    parameter integer DATA_WIDTH = 36,
    parameter integer ADDR_WIDTH = 10,
    parameter MEM_INIT = "mem_init.mem"  // verilog_lint: waive explicit-parameter-storage-type
) (
    input                       clk_a,
    input      [ADDR_WIDTH-1:0] addr_a,
    output reg [DATA_WIDTH-1:0] dout_a,
    input                       clk_b,
    input      [ADDR_WIDTH-1:0] addr_b,
    output reg [DATA_WIDTH-1:0] dout_b
);

    localparam integer MEM_SIZE = (2 ** ADDR_WIDTH);
    reg [DATA_WIDTH-1:0] memory[0:MEM_SIZE-1];

    initial begin
        $readmemh(MEM_INIT, memory);
    end

    always @(posedge clk_a) begin
        dout_a <= memory[addr_a];
    end

    always @(posedge clk_b) begin
        dout_b <= memory[addr_b];
    end

endmodule
