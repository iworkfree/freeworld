
`timescale 1 ns / 10 ps  // time-unit = 1 ns, precision = 10 ps

module vld_sp_rom #(
    parameter integer DATA_WIDTH = 32,
    parameter integer ADDR_WIDTH = 12,
    parameter MEM_INIT = "mem_init.mem"  // verilog_lint: waive explicit-parameter-storage-type
) (
    input                       clk,
    input                       addr_vld,
    input      [ADDR_WIDTH-1:0] addr,
    output reg                  dout_vld,
    output     [DATA_WIDTH-1:0] dout
);

    initial begin
        dout_vld = 1'b0;
    end

    always @(posedge clk) begin
        dout_vld <= addr_vld;
    end

    sp_rom #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH),
        .MEM_INIT  (MEM_INIT)
    ) sp_rom_inst (
        .clk (clk),
        .addr(addr),
        .dout(dout)
    );

endmodule
