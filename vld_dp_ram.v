
`timescale 1 ns / 10 ps  // time-unit = 1 ns, precision = 10 ps

module vld_dp_ram #(
    parameter integer DATA_WIDTH = 32,
    parameter integer ADDR_WIDTH = 12
) (
    input                       clk_a,
    input                       wr_en_a,
    input                       addr_a_vld,
    input      [ADDR_WIDTH-1:0] addr_a,
    input      [DATA_WIDTH-1:0] din_a,
    output reg                  dout_a_vld,
    output     [DATA_WIDTH-1:0] dout_a,
    input                       clk_b,
    input                       wr_en_b,
    input                       addr_b_vld,
    input      [ADDR_WIDTH-1:0] addr_b,
    input      [DATA_WIDTH-1:0] din_b,
    output reg                  dout_b_vld,
    output     [DATA_WIDTH-1:0] dout_b
);

    initial begin
        dout_a_vld = 1'b0;
        dout_b_vld = 1'b0;
    end

    always @(posedge clk_a) begin
        dout_a_vld <= addr_a_vld;
    end

    always @(posedge clk_a) begin
        dout_b_vld <= addr_b_vld;
    end

    dp_ram #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) dp_ram_inst (
        .clk_a  (clk_a),
        .wr_en_a(wr_en_a),
        .addr_a (addr_a),
        .din_a  (din_a),
        .dout_a (dout_a),
        .clk_b  (clk_b),
        .wr_en_b(wr_en_b),
        .addr_b (addr_b),
        .din_b  (din_b),
        .dout_b (dout_b)
    );

endmodule
