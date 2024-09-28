
timeunit 1ns; timeprecision 10ps; `default_nettype none

module dp_ram_pipe #(
    parameter integer ADDR_WIDTH = 10,
    parameter integer DATA_WIDTH = 32,
    parameter string MEM_INIT = "mem_init.mem"
) (
    input  wire                  clk_a,
    input  wire                  reset_a,
    input  wire                  wr_en_a,
    input  wire [ADDR_WIDTH-1:0] addr_a,
    input  wire [DATA_WIDTH-1:0] din_a,
    output reg  [DATA_WIDTH-1:0] dout_a,
    input  wire                  clk_b,
    input  wire                  reset_b,
    input  wire                  wr_en_b,
    input  wire [ADDR_WIDTH-1:0] addr_b,
    input  wire [DATA_WIDTH-1:0] din_b,
    output reg  [DATA_WIDTH-1:0] dout_b
);

    localparam integer MEM_SIZE = (2 ** ADDR_WIDTH);
    // Verilator lint_off MULTIDRIVEN
    logic [DATA_WIDTH-1:0] memory [0:MEM_SIZE-1];
    // Verilator lint_on MULTIDRIVEN

    logic [DATA_WIDTH-1:0] pipe_a;
    logic [DATA_WIDTH-1:0] pipe_b;

    initial begin
        $readmemh(MEM_INIT, memory);
        pipe_a = 0;
        dout_a = 0;
        pipe_b = 0;
        dout_b = 0;
    end

    // Port-A Operation
    always @(posedge clk_a) begin
        if (wr_en_a) memory[addr_a] <= din_a;
        pipe_a <= memory[addr_a];

        if (reset_a) dout_a <= 0;
        else dout_a <= pipe_a;
    end

    // Port-B Operation
    always @(posedge clk_b) begin
        if (wr_en_b) memory[addr_b] <= din_b;
        pipe_b <= memory[addr_b];

        if (reset_b) dout_b <= 0;
        else dout_b <= pipe_b;
    end

endmodule

`default_nettype wire
