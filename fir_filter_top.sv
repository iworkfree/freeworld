
timeunit 1ns; timeprecision 10ps; `default_nettype none

module fir_filter_top #(
    parameter integer X_N_WIDTH    = 20,
    parameter integer H_N_WIDTH    = 20,
    parameter integer FILTER_TAPS  = 7,
    parameter string  FILTER_COEFS = "fir_coefs.mem"
) (
    input  wire                           clk,
    input  wire                           reset_n,
    input  wire                           x_n_vld,
    input  wire [          X_N_WIDTH-1:0] x_n,
    output reg                            y_n_vld,
    output reg  [X_N_WIDTH+H_N_WIDTH-1:0] y_n
);

    localparam integer FILTER_TAPS_M1 = FILTER_TAPS - 1;
    localparam integer ADDR_WIDTH = $clog2(FILTER_TAPS);

    typedef enum logic [1:0] {
        RESET      = 2'd0,
        LOAD_COEFS = 2'd1,
        WAIT_DATA  = 2'd2
    } state_t;

    state_t                           state;

    logic                             rom_addr_vld;
    logic   [         ADDR_WIDTH-1:0] rom_addr;
    logic                             rom_dout_vld;
    logic   [          H_N_WIDTH-1:0] rom_dout;

    logic                             h_n_in_vld;
    logic   [          H_N_WIDTH-1:0] h_n_in;
    logic                             x_n_in_vld;
    logic   [          X_N_WIDTH-1:0] x_n_in;
    logic                             y_n_out_vld;

    logic   [          H_N_WIDTH-1:0] h_n_array    [FILTER_TAPS+1];
    logic   [          X_N_WIDTH-1:0] x_n_array    [FILTER_TAPS+1];
    logic   [X_N_WIDTH+H_N_WIDTH-1:0] y_n_array    [FILTER_TAPS+1];

    initial begin
        rom_addr_vld = 1'b0;
        h_n_in_vld   = 1'b0;
        x_n_in_vld   = 1'b0;
        y_n_vld      = 1'b0;
        rom_addr     = 0;
        h_n_in       = 0;
        x_n_in       = 0;
        y_n          = 0;
        state        = RESET;
    end

    always_ff @(posedge clk) begin
        if (!reset_n) begin
            rom_addr_vld <= 1'b0;
            rom_addr     <= 0;
            state        <= RESET;
        end else begin
            rom_addr_vld <= 1'b0;
            case (state)
                RESET: begin
                    rom_addr <= FILTER_TAPS_M1[ADDR_WIDTH-1:0];
                    state    <= LOAD_COEFS;
                end
                LOAD_COEFS: begin
                    rom_addr_vld <= 1'b1;
                    rom_addr     <= rom_addr - 1;
                    if (rom_addr <= 1) begin
                        rom_addr <= FILTER_TAPS_M1[ADDR_WIDTH-1:0];
                        state    <= WAIT_DATA;
                    end
                end
                WAIT_DATA: begin
                    state <= WAIT_DATA;
                end
                default: state <= RESET;
            endcase
        end
    end

    always_ff @(posedge clk) begin
        if (!reset_n) begin
            h_n_in_vld <= 1'b0;
            x_n_in_vld <= 1'b0;
            y_n_vld    <= 1'b0;
        end else begin
            h_n_in_vld <= rom_dout_vld;
            h_n_in     <= rom_dout;

            x_n_in_vld <= x_n_vld;
            x_n_in     <= x_n;

            y_n_vld    <= y_n_out_vld;
            y_n        <= y_n_array[FILTER_TAPS];
        end
    end

    assign h_n_array[0] = h_n_in;
    assign x_n_array[0] = x_n_in;
    assign y_n_array[0] = 0;

    vld_sp_rom #(
        .DATA_WIDTH(H_N_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH),
        .MEM_INIT  (FILTER_COEFS)
    ) vld_sp_rom_inst (
        .clk     (clk),
        .addr_vld(rom_addr_vld),
        .addr    (rom_addr),
        .dout_vld(rom_dout_vld),
        .dout    (rom_dout)
    );

    vld_srl #(
        .SRL_LENGTH(FILTER_TAPS + 4)
    ) fir_vld_srl_inst (
        .clk (clk),
        .en  (1'b1),
        .din (x_n_in_vld),
        .dout(y_n_out_vld)
    );

    genvar j;
    generate
        for (j = 0; j < FILTER_TAPS; j++) begin : gen_filter_taps
            fir_filter_tap #(
                .X_N_WIDTH(X_N_WIDTH),
                .H_N_WIDTH(H_N_WIDTH)
            ) fir_filter_tap_inst_n (
                .clk       (clk),
                .x_n_in    (x_n_array[j]),
                .h_n_in_vld(h_n_in_vld),
                .h_n_in    (h_n_array[j]),
                .y_n_in    (y_n_array[j]),
                .x_n_out   (x_n_array[j+1]),
                .h_n_out   (h_n_array[j+1]),
                .y_n_out   (y_n_array[j+1])
            );
        end
    endgenerate

endmodule

`default_nettype wire
