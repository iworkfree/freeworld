
`timescale 1 ns / 10 ps  // time-unit = 1 ns, precision = 10 ps

module dp_uram #(
    parameter integer DATA_WIDTH = 32,
    parameter integer ADDR_WIDTH = 14
) (
    input                       clk,
    input                       wr_en_a,
    input      [ADDR_WIDTH-1:0] addr_a,
    input      [DATA_WIDTH-1:0] din_a,
    input      [ADDR_WIDTH-1:0] addr_b,
    output reg [DATA_WIDTH-1:0] dout_b
);

    reg [DATA_WIDTH-1:0] dout_int;
    reg [DATA_WIDTH-1:0] dout_int_q;

    localparam integer MEM_SIZE = (2 ** ADDR_WIDTH);
    (* ram_style = "ultra" *) reg [DATA_WIDTH-1:0] memory[0:MEM_SIZE-1];

    always @(posedge clk) begin
        if (wr_en_a) memory[addr_a] <= din_a;

        dout_int   <= memory[addr_b];
        dout_int_q <= dout_int;
        dout_b     <= dout_int_q;
    end

endmodule
