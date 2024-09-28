
`timescale 1 ns / 10 ps  // time-unit = 1 ns, precision = 10 ps

module srl #(
    parameter integer SRL_WIDTH  = 18,
    parameter integer SRL_LENGTH = 32
) (
    input                  clk,
    input                  en,
    input  [SRL_WIDTH-1:0] din,
    output [SRL_WIDTH-1:0] dout
);

    integer                 i;
    reg     [SRL_WIDTH-1:0] srl_array[0:SRL_LENGTH-1];

    initial begin
        for (i = 0; i <= SRL_LENGTH - 1; i = i + 1) begin
            srl_array[i] = 0;
        end
    end

    always @(posedge clk) begin
        if (en) begin
            srl_array[0] <= din;
            for (i = 0; i < SRL_LENGTH - 1; i = i + 1) begin
                srl_array[i+1] <= srl_array[i];
            end
        end
    end

    assign dout = srl_array[SRL_LENGTH-1];

endmodule
