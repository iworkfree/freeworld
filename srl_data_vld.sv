
timeunit 1ns; timeprecision 10ps; `default_nettype none

module srl_data_vld #(
    parameter integer DATA_WIDTH = 18,
    parameter integer SRL_LENGTH = 32
) (
    input  wire                  clk,
    input  wire                  din_vld,
    input  wire [DATA_WIDTH-1:0] din,
    output wire                  dout_vld,
    output wire [DATA_WIDTH-1:0] dout
);

    integer                i;
    logic   [DATA_WIDTH:0] srl_array[0:SRL_LENGTH-1];

    initial begin
        for (i = 0; i <= SRL_LENGTH - 1; i = i + 1) begin
            srl_array[i] = 0;
        end
    end

    always_ff @(posedge clk) begin
        srl_array[0] <= {din_vld, din};
        for (i = 0; i < SRL_LENGTH - 1; i = i + 1) begin
            srl_array[i+1] <= srl_array[i];
        end
    end

    assign dout_vld = srl_array[SRL_LENGTH-1][DATA_WIDTH];
    assign dout     = srl_array[SRL_LENGTH-1][DATA_WIDTH-1:0];

endmodule

`default_nettype wire
