
timeunit 1ns; timeprecision 10ps; `default_nettype none

module srl_reg #(
    parameter integer SRL_WIDTH  = 18,
    parameter integer SRL_LENGTH = 32
) (
    input  wire                 clk,
    input  wire                 en,
    input  wire [SRL_WIDTH-1:0] din,
    output wire [SRL_WIDTH-1:0] dout
);

    integer                 i;
    logic   [SRL_WIDTH-1:0] srl_array [0:SRL_LENGTH-1];
    logic   [SRL_WIDTH-1:0] dout_reg1;
    logic   [SRL_WIDTH-1:0] dout_reg2;

    initial begin
        for (i = 0; i <= SRL_LENGTH - 1; i = i + 1) begin
            srl_array[i] = 0;
        end
        dout_reg1 = 0;
        dout_reg2 = 0;
    end

    always_ff @(posedge clk) begin
        if (en) begin
            srl_array[0] <= din;
            for (i = 0; i < SRL_LENGTH - 1; i = i + 1) begin
                srl_array[i+1] <= srl_array[i];
            end
        end
        dout_reg1 <= srl_array[SRL_LENGTH-1];
        dout_reg2 <= dout_reg1;
    end

    assign dout = dout_reg2;

endmodule

`default_nettype wire
