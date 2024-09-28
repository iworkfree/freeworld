
`timescale 1 ns / 10 ps  // time-unit = 1 ns, precision = 10 ps

module dp_uram_vld #(
    parameter integer DATA_WIDTH = 32,
    parameter integer ADDR_WIDTH = 14
) (
    input                       clk,
    input                       wr_en_a,
    input      [ADDR_WIDTH-1:0] addr_a,
    input      [DATA_WIDTH-1:0] din_a,
    input                       addr_b_vld,
    input      [ADDR_WIDTH-1:0] addr_b,
    output reg                  dout_b_vld,
    output     [DATA_WIDTH-1:0] dout_b
);

    reg addr_b_vld_d;
    reg addr_b_vld_dd;

    initial begin
        addr_b_vld_d  = 1'b0;
        addr_b_vld_dd = 1'b0;
        dout_b_vld    = 1'b0;
    end

    always @(posedge clk) begin
        addr_b_vld_d  <= addr_b_vld;
        addr_b_vld_dd <= addr_b_vld_d;
        dout_b_vld    <= addr_b_vld_dd;
    end

    dp_uram #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) dp_uram_i (
        .clk    (clk),
        .wr_en_a(wr_en_a),
        .addr_a (addr_a),
        .din_a  (din_a),
        .addr_b (addr_b),
        .dout_b (dout_b)
    );

endmodule
