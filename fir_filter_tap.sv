
timeunit 1ns; timeprecision 10ps; `default_nettype none

module fir_filter_tap #(
    parameter integer X_N_WIDTH = 20,
    parameter integer H_N_WIDTH = 18
) (
    input  wire                                  clk,
    input  wire signed [          X_N_WIDTH-1:0] x_n_in,
    input  wire                                  h_n_in_vld,
    input  wire signed [          H_N_WIDTH-1:0] h_n_in,
    input  wire signed [X_N_WIDTH+H_N_WIDTH-1:0] y_n_in,
    output wire signed [          X_N_WIDTH-1:0] x_n_out,
    output wire signed [          H_N_WIDTH-1:0] h_n_out,
    output wire signed [X_N_WIDTH+H_N_WIDTH-1:0] y_n_out
);

    logic signed [          X_N_WIDTH-1:0] x_n_d;
    logic signed [          H_N_WIDTH-1:0] h_n_d;
    logic signed [          X_N_WIDTH-1:0] x_n_dd;

    logic signed [X_N_WIDTH+H_N_WIDTH-1:0] mult_res;
    logic signed [X_N_WIDTH+H_N_WIDTH-1:0] add_res;

    always_ff @(posedge clk) begin
        x_n_d <= x_n_in;
        if (h_n_in_vld) begin
            h_n_d <= h_n_in;
        end

        x_n_dd   <= x_n_d;

        mult_res <= x_n_dd * h_n_d;

        add_res  <= mult_res + y_n_in;
    end

    assign x_n_out = x_n_dd;
    assign h_n_out = h_n_d;
    assign y_n_out = add_res;

endmodule

`default_nettype wire
