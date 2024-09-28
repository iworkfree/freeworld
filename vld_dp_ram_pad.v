
`timescale 1 ns / 10 ps  // time-unit = 1 ns, precision = 10 ps

module vld_dp_ram_pad #(
    parameter integer DATA_WIDTH     = 8,
    parameter integer FRAME_WIDTH    = 64,
    parameter integer FRAME_HEIGHT   = 52,
    parameter integer ROW_REAL_WIDTH = 6,
    parameter integer COL_REAL_WIDTH = 6,
    parameter integer ROW_PAD_WIDTH  = 6,
    parameter integer COL_PAD_WIDTH  = 7
) (
    input                          clk_a,
    input                          wr_en_a,
    input                          addr_a_vld,
    input      [ROW_PAD_WIDTH-1:0] row_pad_a,
    input      [COL_PAD_WIDTH-1:0] col_pad_a,
    input      [   DATA_WIDTH-1:0] din_a,
    output reg                     dout_a_vld,
    output reg [   DATA_WIDTH-1:0] dout_a,
    input                          clk_b,
    input                          wr_en_b,
    input                          addr_b_vld,
    input      [ROW_PAD_WIDTH-1:0] row_pad_b,
    input      [COL_PAD_WIDTH-1:0] col_pad_b,
    input      [   DATA_WIDTH-1:0] din_b,
    output reg                     dout_b_vld,
    output reg [   DATA_WIDTH-1:0] dout_b
);
    localparam integer ADDR_WIDTH = ROW_REAL_WIDTH + COL_REAL_WIDTH;
    localparam integer ROW_MAX = FRAME_HEIGHT - 1;
    localparam integer COL_MAX = FRAME_WIDTH - 1;

    localparam reg [7:0] PAD_VALUE = 8'd128;

    reg                   wr_en_a_d;
    reg  [DATA_WIDTH-1:0] din_a_d;
    reg                   addr_a_vld_d;
    reg  [ADDR_WIDTH-1:0] addr_a_d;
    reg                   zero_en_a;
    reg                   addr_a_vld_dd;
    reg                   zero_en_a_d;
    wire [DATA_WIDTH-1:0] dout_a_int;

    reg                   wr_en_b_d;
    reg  [DATA_WIDTH-1:0] din_b_d;
    reg                   addr_b_vld_d;
    reg  [ADDR_WIDTH-1:0] addr_b_d;
    reg                   zero_en_b;
    reg                   addr_b_vld_dd;
    reg                   zero_en_b_d;
    wire [DATA_WIDTH-1:0] dout_b_int;

    initial begin
        wr_en_a_d     = 1'b0;
        addr_a_vld_d  = 1'b0;
        addr_a_vld_dd = 1'b0;
        zero_en_a     = 1'b0;
        zero_en_a_d   = 1'b0;
        dout_a_vld    = 1'b0;
        wr_en_b_d     = 1'b0;
        addr_b_vld_d  = 1'b0;
        addr_b_vld_dd = 1'b0;
        zero_en_b     = 1'b0;
        zero_en_b_d   = 1'b0;
        dout_b_vld    = 1'b0;
    end

    always @(posedge clk_a) begin
        wr_en_a_d    <= wr_en_a;
        din_a_d      <= din_a;
        addr_a_vld_d <= addr_a_vld;
        addr_a_d     <= {row_pad_a[ROW_REAL_WIDTH-1:0], col_pad_a[COL_REAL_WIDTH-1:0]};
        zero_en_a    <= 1'b0;
        if ((row_pad_a > ROW_MAX[ROW_PAD_WIDTH-1:0]) || (col_pad_a > COL_MAX[COL_PAD_WIDTH-1:0])) zero_en_a <= 1'b1;

        zero_en_a_d   <= zero_en_a;
        addr_a_vld_dd <= addr_a_vld_d;

        dout_a_vld    <= 1'b0;
        if (addr_a_vld_dd) begin
            dout_a_vld <= 1'b1;
            if (zero_en_a_d) dout_a <= PAD_VALUE;
            else dout_a <= dout_a_int;
        end
    end

    always @(posedge clk_b) begin
        wr_en_b_d    <= wr_en_b;
        din_b_d      <= din_b;
        addr_b_vld_d <= addr_b_vld;
        addr_b_d     <= {row_pad_b[ROW_REAL_WIDTH-1:0], col_pad_b[COL_REAL_WIDTH-1:0]};
        zero_en_b    <= 1'b0;
        if ((row_pad_b > ROW_MAX[ROW_PAD_WIDTH-1:0]) || (col_pad_b > COL_MAX[COL_PAD_WIDTH-1:0])) zero_en_b <= 1'b1;

        zero_en_b_d   <= zero_en_b;
        addr_b_vld_dd <= addr_b_vld_d;

        dout_b_vld    <= 1'b0;
        if (addr_b_vld_dd) begin
            dout_b_vld <= 1'b1;
            if (zero_en_b_d) dout_b <= PAD_VALUE;
            else dout_b <= dout_b_int;
        end
    end

    dp_ram #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) dp_ram_inst (
        .clk_a  (clk_a),
        .wr_en_a(wr_en_a_d),
        .addr_a (addr_a_d),
        .din_a  (din_a_d),
        .dout_a (dout_a_int),
        .clk_b  (clk_b),
        .wr_en_b(wr_en_b_d),
        .addr_b (addr_b_d),
        .din_b  (din_b_d),
        .dout_b (dout_b_int)
    );

endmodule
