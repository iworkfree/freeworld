
`timescale 1 ns / 10 ps  // time-unit = 1 ns, precision = 10 ps

    // xpm_fifo_async: Asynchronous FIFO
    // Xilinx Parameterized Macro, version 2021.1


// MEMORY PER LANE:
// localparam integer WR_WIDTH = 16*64;
// localparam integer WR_DEPTH = 16; // Depth 2 is per Sub-Array. Each Lane is 8*2= 16. Each LINE is 8*16 = 128.
// localparam integer PROG_FULL_THRESH = WR_DEPTH - 4;
// localparam integer PROG_EMPTY_THRESH = 4;
// localparam integer RD_WIDTH = 16*4;
// localparam integer WR_CNT_WIDTH = $clog2(WR_DEPTH) + 1;
// localparam integer RD_CNT_WIDTH = WR_CNT_WIDTH;
// .FIFO_MEMORY_TYPE   ("auto"),        // String
// +----------------------------------------------+----------------------------------+------------+------------+----------+----------+------------+-----------+----------+----------+------------+
// |                   Instance                   |              Module              | Total LUTs | Logic LUTs |  LUTRAMs |   SRLs   |     FFs    |   RAMB36  |  RAMB18  |   URAM   | DSP Blocks |
// +----------------------------------------------+----------------------------------+------------+------------+----------+----------+------------+-----------+----------+----------+------------+
// | asyncFIFO                                    |                            (top) | 117(0.01%) | 117(0.01%) | 0(0.00%) | 0(0.00%) | 171(0.01%) | 16(0.74%) | 0(0.00%) | 0(0.00%) |   0(0.00%) |

// MEMORY PER LINE:
// localparam integer WR_WIDTH = 16*64;
// localparam integer WR_DEPTH = 128;  // Depth 2 is per Sub-Array. Each Lane is 8*2= 16. Each LINE is 8*16 = 128.
// localparam integer PROG_FULL_THRESH = WR_DEPTH - 4;
// localparam integer PROG_EMPTY_THRESH = 4;
// localparam integer RD_WIDTH = 16*4;
// localparam integer WR_CNT_WIDTH = $clog2(WR_DEPTH) + 1;
// localparam integer RD_CNT_WIDTH = WR_CNT_WIDTH;
// .FIFO_MEMORY_TYPE   ("auto"),        // String
// +----------------------------------------------+----------------------------------+------------+------------+----------+----------+------------+-----------+----------+----------+------------+
// |                   Instance                   |              Module              | Total LUTs | Logic LUTs |  LUTRAMs |   SRLs   |     FFs    |   RAMB36  |  RAMB18  |   URAM   | DSP Blocks |
// +----------------------------------------------+----------------------------------+------------+------------+----------+----------+------------+-----------+----------+----------+------------+
// | asyncFIFO                                    |                            (top) | 175(0.01%) | 175(0.01%) | 0(0.00%) | 0(0.00%) | 246(0.01%) | 16(0.74%) | 0(0.00%) | 0(0.00%) |   0(0.00%) |

// MEMORY for WR_DEPTH = 1024
// localparam integer WR_WIDTH = 16*64;
// localparam integer WR_DEPTH = 1024 ;  //128 * 1024 * 2 =
// localparam integer PROG_FULL_THRESH = WR_DEPTH - 4;
// localparam integer PROG_EMPTY_THRESH = 4;
// localparam integer RD_WIDTH = 16*4;
// localparam integer WR_CNT_WIDTH = $clog2(WR_DEPTH) + 1;
// localparam integer RD_CNT_WIDTH = WR_CNT_WIDTH;
// .FIFO_MEMORY_TYPE   ("auto"),        // String
// .FIFO_READ_LATENCY  (1),             // DECIMAL
// +----------------------------------------------+----------------------------------+------------+------------+----------+----------+------------+-----------+----------+----------+------------+
// |                   Instance                   |              Module              | Total LUTs | Logic LUTs |  LUTRAMs |   SRLs   |     FFs    |   RAMB36  |  RAMB18  |   URAM   | DSP Blocks |
// +----------------------------------------------+----------------------------------+------------+------------+----------+----------+------------+-----------+----------+----------+------------+
// | asyncFIFO                                    |                            (top) | 226(0.02%) | 226(0.02%) | 0(0.00%) | 0(0.00%) | 321(0.01%) | 32(1.48%) | 0(0.00%) | 0(0.00%) |   0(0.00%) |

// Convert from BRAM to URAM Format:
// localparam integer WR_WIDTH = 16*64; // 16*64= 1024  // uram is 4k x 72 bits
// localparam integer WR_DEPTH = 128 ; // per LINE. 2 is per Sub-Array. Each Lane is 8*2= 16. Each LINE is 8*16 = 128.
// localparam integer PROG_FULL_THRESH = WR_DEPTH - 4;
// localparam integer PROG_EMPTY_THRESH = 4;
// localparam integer RD_WIDTH = 4096;
// localparam integer WR_CNT_WIDTH = $clog2(WR_DEPTH) + 1;
// localparam integer RD_CNT_WIDTH = WR_CNT_WIDTH;
// .FIFO_MEMORY_TYPE   ("auto"),        // String
// .FIFO_READ_LATENCY  (1),             // DECIMAL
// ERROR: [Synth 8-6058] Synth Error: [XPM_FIFO 15-7] Read Data Count is enabled, but RD_DATA_COUNT_WIDTH (8) value is outside of legal range. RD_DATA_COUNT_WIDTH value must be between 0 and 6.
// .RD_DATA_COUNT_WIDTH(6),  // DECIMAL
// +----------------------------------------------+----------------------------------+------------+------------+----------+----------+------------+-----------+----------+----------+------------+
// |                   Instance                   |              Module              | Total LUTs | Logic LUTs |  LUTRAMs |   SRLs   |     FFs    |   RAMB36  |  RAMB18  |   URAM   | DSP Blocks |
// +----------------------------------------------+----------------------------------+------------+------------+----------+----------+------------+-----------+----------+----------+------------+
// | asyncFIFO                                    |                            (top) | 126(0.01%) | 126(0.01%) | 0(0.00%) | 0(0.00%) | 182(0.01%) | 57(2.64%) | 0(0.00%) | 0(0.00%) |   0(0.00%) |

// MEMORY for HELF Frame
// localparam integer WR_WIDTH = 16*64;
// localparam integer WR_DEPTH = 262144 ;  //128 * 1024 * 2 = 262144
// localparam integer PROG_FULL_THRESH = WR_DEPTH - 4;
// localparam integer PROG_EMPTY_THRESH = 4;
// localparam integer RD_WIDTH = 16*4;
// localparam integer WR_CNT_WIDTH = $clog2(WR_DEPTH) + 1;
// localparam integer RD_CNT_WIDTH = WR_CNT_WIDTH;
// .FIFO_MEMORY_TYPE   ("auto"),        // String
// +----------------------------------------------+----------------------------------+-------------+-------------+----------+----------+------------+---------------+----------+----------+------------+
// |                   Instance                   |              Module              |  Total LUTs |  Logic LUTs |  LUTRAMs |   SRLs   |     FFs    |     RAMB36    |  RAMB18  |   URAM   | DSP Blocks |
// +----------------------------------------------+----------------------------------+-------------+-------------+----------+----------+------------+---------------+----------+----------+------------+
// | asyncFIFO                                    |                            (top) | 1444(0.12%) | 1444(0.12%) | 0(0.00%) | 0(0.00%) | 533(0.02%) | 8192(379.26%) | 0(0.00%) | 0(0.00%) |   0(0.00%) |

// MEMORY FOR Single URAM Block?
// localparam integer WR_WIDTH = 4096; // uram is 4k x 72 bits. 4096/16 = 256. 1024/256 = 4 depth per LANE. 4*4=16 half LINE. 16*2048                         1 Lane is 128*8*16 = 16384; 16384/4096 = 4. 4 clocks to read a line.
// localparam integer WR_DEPTH = 72 ; // per LINE. 2 is per Sub-Array. Each Lane is 8*2= 16. Each LINE is 8*16 = 128.
// localparam integer PROG_FULL_THRESH = WR_DEPTH - 4;
// localparam integer PROG_EMPTY_THRESH = 4;
// localparam integer RD_WIDTH = 4096;
// localparam integer WR_CNT_WIDTH = $clog2(WR_DEPTH) + 1;
// localparam integer RD_CNT_WIDTH = WR_CNT_WIDTH;
// .CDC_SYNC_STAGES    (2),             // DECIMAL
// .DOUT_RESET_VALUE   ("0"),           // String
// .ECC_MODE           ("no_ecc"),      // String
// .FIFO_MEMORY_TYPE   ("uram"),        // String
// .FIFO_READ_LATENCY  (5),             // DECIMAL
// .FIFO_WRITE_DEPTH   (WR_DEPTH),      // DECIMAL
// .FULL_RESET_VALUE   (0),             // DECIMAL
//
// NEED TO USE ANOTHER XPM:
// +---------------+--------+-------------+-------------+----------+----------+--------------+----------+----------+-------------+------------+
// |    Instance   | Module |  Total LUTs |  Logic LUTs |  LUTRAMs |   SRLs   |      FFs     |  RAMB36  |  RAMB18  |     URAM    | DSP Blocks |
// +---------------+--------+-------------+-------------+----------+----------+--------------+----------+----------+-------------+------------+
// | asyncFIFO     |  (top) | 4096(0.35%) | 4096(0.35%) | 0(0.00%) | 0(0.00%) | 20542(0.87%) | 0(0.00%) | 0(0.00%) | 912(95.00%) |   0(0.00%) |

// URAM address for HALF Image
//  uram is 4k x 72 bits. 4096/16 = 256. 1024/256 = 4 depth per LANE. 4*4=16 half LINE. 16*2048 =32768... Address width.     log2(32,768) = 15
//
// parameter AWIDTH = 15;
// parameter DWIDTH = 4096;
// +---------------+--------+------------+------------+----------+----------+-------------+----------+----------+-------------+------------+
// |    Instance   | Module | Total LUTs | Logic LUTs |  LUTRAMs |   SRLs   |     FFs     |  RAMB36  |  RAMB18  |     URAM    | DSP Blocks |
// +---------------+--------+------------+------------+----------+----------+-------------+----------+----------+-------------+------------+
// | asyncFIFO     |  (top) |   1(0.01%) |   0(0.00%) | 0(0.00%) | 1(0.01%) | 4097(0.17%) | 0(0.00%) | 0(0.00%) | 456(47.50%) |   0(0.00%) |


// Another URAM Instance, and it's 72 bits wide and 4096 deep.
//   xilinx_ultraram_single_port_write_first # (
// .AWIDTH (12 ),  // Address Width
// .DWIDTH (72 ),  // Data Width
// .NBPIPE (3  )   // Number of pipeline Registers
// +---------------------------------------------+-----------------------------------------+------------+------------+----------+----------+------------+----------+----------+----------+------------+
// |                   Instance                  |                  Module                 | Total LUTs | Logic LUTs |  LUTRAMs |   SRLs   |     FFs    |  RAMB36  |  RAMB18  |   URAM   | DSP Blocks |
// +---------------------------------------------+-----------------------------------------+------------+------------+----------+----------+------------+----------+----------+----------+------------+
// | asyncFIFO                                   |                                   (top) |   2(0.01%) |   1(0.01%) | 0(0.00%) | 1(0.01%) | 146(0.01%) | 0(0.00%) | 0(0.00%) | 1(0.10%) |   0(0.00%) |

// New Math.
// We have 16 * 64 for 2 cycles for EACH Sub-Array.
// 16 * 64 = 1024.
// Assume we use 64 bits... it's 4 Pixels each clock... That's perfect for the Kaya..
// then each Sub-Array is 32 Deep. (2*16).
// we have 8 Sub-Arrays and 4 TOP Lanes. 32 * 8 * 4 = 1024. is per line. we can fit 4 lines in a URAM.
// 288Kbits. 16 (ppc) * 4 (LANES) * 1024 (Pixels Per LANE) * 4 (Lines) = 262144.
//  4096/4 = 1024 URAMS... But the max is like 912 ish...
// 1024 DEEP per Line. We have 4096/2 = 2048 Lines. 1024 * 2048 = 2097152. 2Mbits.
//
//       xilinx_ultraram_single_port_write_first # (
        // .AWIDTH (21 ),  // Address Width
        // .DEPTH  (2097152 ),  // Depth
        // .DWIDTH (72 ),  // Data Width
        // .NBPIPE (3  )   // Number of pipeline Registers
// +---------------------------------------------+-----------------------------------------+-------------+-------------+----------+----------+-------------+----------+----------+-------------+------------+
// |                   Instance                  |                  Module                 |  Total LUTs |  Logic LUTs |  LUTRAMs |   SRLs   |     FFs     |  RAMB36  |  RAMB18  |     URAM    | DSP Blocks |
// +---------------------------------------------+-----------------------------------------+-------------+-------------+----------+----------+-------------+----------+----------+-------------+------------+
// | asyncFIFO                                   |                                   (top) | 2124(0.18%) | 2124(0.18%) | 0(0.00%) | 0(0.00%) | 1366(0.06%) | 0(0.00%) | 0(0.00%) | 512(53.33%) |   0(0.00%) |


// Now some MATH to figure out how many clock cycles to read out 2K lines.
// Assume we have 4 lines per URAM. 2K/4 = 512 URAMS. 512 * 4 = 2048 Lines.
// 4 LANES * 8 Sub-Arrays. Each Sub-Array has 128 Pixels. 128 * 8 * 4 = 4096.
// Each LANE: 1024/64 = 16 Cycles to read a line. 16 * 4 = 64 Cycles to read 1 line with 4 Lanes.
// We have 2048 Lines. 2048 * 64 = 131072 Cycles to read 2048 Lines.
// IF we had 160 MHz  With 4 Pixels per clock. which means period is 6.25 ns. 131072 * 6.25 = 819200 ns. 819200/1e9 = 0.8192 seconds.
// IF we had 160 MHz but read 8 pixels per clock, 1024/128 = 8.   8 * 4 = 32 Cycles to read a line. 32 * 2048 = 65536 Cycles. 65536 * 6.25 = 409600 ns. 409600/1e9 = 0.4096 seconds.
// IF we had 320 MHz and read 8 pixels per clock, 1024/128 = 8.   8 * 4 = 32 Cycles to read a line. 32 * 2048 = 65536 Cycles. 65536 * 3.125 = 204800 ns. 204800/1e9 = 0.2048 seconds.

// IF First Line Start to Second Line start is: 136ns + 6400ns = 6536ns. 6536/1e9 = 0.006536 seconds.
// 1024 Cycles per Line. 1024 * 6.25 = 6400 ns. 6400/1e9 = 0.0064 seconds.
// Then Reading 2048 Lines is 6536ns * 2048 = 13391872 ns. 13391872/1e9 = 13.391872 seconds.   FULL FRAME READOUT TIME
// Can we do 30 frames a second? 13.4seconds * 30 = 402 seconds. 402/60 = 6.7 minutes.






//- module uram (addr, din , dout, clk, ena, wen);
//- parameter AWIDTH = 7;
//- parameter DWIDTH = 4000;
//- parameter DEPTH = 72;

//- input [AWIDTH-1:0] addr;
//- input [DWIDTH-1:0] din;
//- output reg [DWIDTH-1:0] dout;

//- input clk, ena, wen;

//- (*ram_style="ultra"*) reg [DWIDTH-1:0] mem [DEPTH-1:0];
//- always @(posedge clk) begin
//- 	if (ena) begin
//- 		dout = mem[addr];

//- 		if (wen) begin
//- 			mem[addr] = din;
//- 		end
//- 	end
//- end

//- endmodule


//- module top (addr, din , dout, clk, ena, wen, rst);
//- parameter AWIDTH = 7;
//- parameter DWIDTH = 4000;
//- parameter DEPTH = 72;
//- parameter LATENCY = 6;
//- parameter NPIPES = LATENCY-2;

//- input [AWIDTH-1:0] addr;
//- input [DWIDTH-1:0] din;
//- output reg [DWIDTH-1:0] dout;
//- input clk, ena, wen, rst;

//- wire [DWIDTH -1 : 0] ramout;

//- uram ram1(.addr(addr), .din(din) , .dout(ramout), .clk(clk), .ena(ena), .wen(wen));

//- defparam ram1.AWIDTH =AWIDTH;
//- defparam ram1.DWIDTH = DWIDTH;
//- defparam ram1.DEPTH = DEPTH;

//- reg [DWIDTH-1: 0] data_pipes [NPIPES-1:0] ;   //- N Stage  Data Pipe line
//- reg               ena_pipes [NPIPES:0] ;      //- N+1  Stage enable pipe. +1 for the last stage (fabric)

//- generate
//- 	always @(posedge clk) begin
//- 		ena_pipes[0] <= ena;
//- 	end

//- 	if (NPIPES > 0) begin
//- 		//- First Stage of Pipeline
//- 		always @(posedge clk) begin
//- 			if (ena_pipes[0])
//- 				data_pipes[0] <= ramout;
//- 		end

//- 		//- Middle Stages of pipeline
//- 		if (NPIPES >= 1) begin
//- 			for (genvar i = 1 ; i <= NPIPES; i = i+1) begin
//- 				always @(posedge clk) begin
//- 					ena_pipes[i] <= ena_pipes[i-1];
//- 				end
//- 			end

//- 			for (genvar i = 1 ; i < NPIPES; i = i+1) begin
//- 				always @(posedge clk) begin
//- 					if (ena_pipes[i])
//- 						data_pipes[i] <= data_pipes[i-1];
//- 				end
//- 			end
//- 		end

//- 		//- Last stage (outside pipeline, in fabric register)
//- 		always @(posedge clk) begin
//- 			if (rst)
//- 				dout <= 0;
//- 			else if (ena_pipes[NPIPES]) begin
//- 				dout <= data_pipes[NPIPES-1];
//- 			end
//- 		end
//- 	end else if (NPIPES == 0) begin //- No PipeLine, Latency = 2
//- 		always @(posedge clk) begin
//- 			if (rst)
//- 				dout <= 0;
//- 			else if (ena_pipes[NPIPES] ) begin
//- 				dout <= ramout;
//- 			end
//- 		end
//- 	end else begin   //- No Pipeline, Latency=1
//- 		always @(*) begin
//- 			dout <= ramout;
//- 		end
//- 	end
//- endgenerate
//- endmodule

    module xilinx_ultraram_single_port_write_first #(
        parameter AWIDTH = 21,  // Address Width
        parameter DEPTH  = 2097152,  // Depth
        parameter DWIDTH = 72,  // Data Width
        parameter NBPIPE = 3    // Number of pipeline Registers
        ) (
            input clk,                    // Clock
            input rst,                    // Reset
            input we,                     // Write Enable
            input regce,                  // Output Register Enable
            input mem_en,                 // Memory Enable
            input [DWIDTH-1:0] din,       // Data Input
            input [AWIDTH-1:0] addr,      // Address Input
            output reg [DWIDTH-1:0] dout  // Data Output
        );

            (* ram_style = "ultra" *)
            reg [DWIDTH-1:0] mem[(1<<AWIDTH)-1:0];        // Memory Declaration
            reg [DWIDTH-1:0] memreg;
            reg [DWIDTH-1:0] mem_pipe_reg[NBPIPE-1:0];    // Pipelines for memory
            reg mem_en_pipe_reg[NBPIPE:0];                // Pipelines for memory enable

            integer          i;

            // RAM : Both READ and WRITE have a latency of one
            always @ (posedge clk)
            begin
            if(mem_en)
            begin
                if(we)
                begin
                mem[addr] <= din;
                memreg <= din;
            end
                else
                memreg <= mem[addr];
            end
            end

            // The enable of the RAM goes through a pipeline to produce a
            // series of pipelined enable signals required to control the data
            // pipeline.
            always @ (posedge clk)
            begin
            mem_en_pipe_reg[0] <= mem_en;
            for (i=0; i<NBPIPE; i=i+1)
            mem_en_pipe_reg[i+1] <= mem_en_pipe_reg[i];
            end

            // RAM output data goes through a pipeline.
            always @ (posedge clk)
            begin
            if (mem_en_pipe_reg[0])
            mem_pipe_reg[0] <= memreg;
            end

            always @ (posedge clk)
            begin
            for (i = 0; i < NBPIPE-1; i = i+1)
            if (mem_en_pipe_reg[i+1])
                mem_pipe_reg[i+1] <= mem_pipe_reg[i];
            end

            // Final output register gives user the option to add a reset and
            // an additional enable signal just for the data ouptut
            always @ (posedge clk)
            begin
            if (rst)
            dout <= 0;
            else if (mem_en_pipe_reg[NBPIPE] && regce)
            dout <= mem_pipe_reg[NBPIPE-1];
            end
    endmodule


    module asyncFIFO (
        input  wire almost_empty,
        input  wire almost_full,
        input  wire data_valid,
        input  wire dbiterr,
        output wire [63:0] dout,
        input  wire [20:0] addr,
        output wire empty,
        output wire full,
        output wire overflow,
        output wire prog_empty,
        output wire prog_full,
        // output wire [RD_CNT_WIDTH-1:0] rd_data_count,
        output wire rd_rst_busy,
        output wire sbiterr,
        output wire underflow,
        output wire wr_ack,
        // output wire [WR_CNT_WIDTH-1:0] wr_data_count,
        output wire wr_rst_busy,
        input  wire [63:0] din,
        input  wire injectdbiterr,
        input  wire injectsbiterr,
        input  wire rd_clk,
        input  wire rd_en,
        input  wire rst,
        input  wire sleep,
        input  wire wr_clk,
        input  wire wr_en,
        input  wire regce,
        input  wire mem_en
    );

    // localparam integer WR_WIDTH = 4000; // uram is 4k x 72 bits
    // localparam integer WR_DEPTH = 72 ; // per LINE. 2 is per Sub-Array. Each Lane is 8*2= 16. Each LINE is 8*16 = 128.
    // localparam integer WR_ADDR_WIDTH = $clog2(WR_DEPTH)+1;

        xilinx_ultraram_single_port_write_first # (
        .AWIDTH (21 ),  // Address Width
        .DEPTH  (2097152 ),  // Depth
        .DWIDTH (72 ),  // Data Width
        .NBPIPE (3  )   // Number of pipeline Registers
    ) u_xilinx_ultraram_single_port_write_first (
        .clk    (wr_clk    ),  // input, (wire), Clock
        .rst    (rst    ),  // input, (wire), Reset
        .we     (wr_en     ),  // input, (wire), Write Enable
        .regce  (regce     ),  // input, reg,
        .mem_en (mem_en ),  // input, (wire), Memory Enable
        .din    (din    ),  // input, (wire) [DWIDTH-1:0], Data Input
        .addr   (addr   ),  // input, (wire) [AWIDTH-1:0], Address Input
        .dout   (dout   )   // output, reg [DWIDTH-1:0], Data Output
    );

//- top  #(
//-     .AWIDTH(WR_ADDR_WIDTH),
//-     .DWIDTH(WR_WIDTH),
//-     .DEPTH(WR_DEPTH)
//- )  uramTop (
//-     .addr(addr),
//-     .din(din),
//-     .dout(dout),
//-     .clk(wr_clk),
//-     .ena(rd_en),
//-     .wen(wedata_validn),
//-     .rst(rst)
//- );


    // localparam integer WR_WIDTH = 4096; // uram is 4k x 72 bits
    // localparam integer WR_DEPTH = 72 ; // per LINE. 2 is per Sub-Array. Each Lane is 8*2= 16. Each LINE is 8*16 = 128.
    // localparam integer PROG_FULL_THRESH = WR_DEPTH - 4;
    // localparam integer PROG_EMPTY_THRESH = 4;
    // localparam integer RD_WIDTH = 4096;
    // localparam integer WR_CNT_WIDTH = $clog2(WR_DEPTH) + 1;
    // localparam integer RD_CNT_WIDTH = WR_CNT_WIDTH;
    //     xpm_fifo_async #(
    //         .CDC_SYNC_STAGES    (2),             // DECIMAL
    //         .DOUT_RESET_VALUE   ("0"),           // String
    //         .ECC_MODE           ("no_ecc"),      // String
    //         .FIFO_MEMORY_TYPE   ("uram"),        // String
    //         .FIFO_READ_LATENCY  (5),             // DECIMAL
    //         .FIFO_WRITE_DEPTH   (WR_DEPTH),      // DECIMAL
    //         .FULL_RESET_VALUE   (0),             // DECIMAL
    //         .PROG_EMPTY_THRESH  (PROG_EMPTY_THRESH),            // DECIMAL
    //         .PROG_FULL_THRESH   (PROG_FULL_THRESH),            // DECIMAL
    //         .RD_DATA_COUNT_WIDTH(6),  // DECIMAL
    //         .READ_DATA_WIDTH    (RD_WIDTH),            // DECIMAL
    //         .READ_MODE          ("std"),         // String
    //         .RELATED_CLOCKS     (0),             // DECIMAL
    //         .SIM_ASSERT_CHK     (0),             // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
    //         .USE_ADV_FEATURES   ("1707"),        // String
    //         .WAKEUP_TIME        (0),             // DECIMAL
    //         .WRITE_DATA_WIDTH   (WR_WIDTH),            // DECIMAL
    //         .WR_DATA_COUNT_WIDTH(WR_CNT_WIDTH)   // DECIMAL
    //     ) xpm_fifo_async_inst (

    //         .almost_empty (almost_empty),   // 1-bit output: Almost Empty : When asserted, this signal indicates that
    //         // only one more read can be performed before the FIFO goes to empty.
    //         .almost_full  (almost_full),    // 1-bit output: Almost Full: When asserted, this signal indicates that
    //         // only one more write can be performed before the FIFO is full.
    //         .data_valid   (data_valid),    // 1-bit output: Read Data Valid: When asserted, this signal indicates
    //         // that valid data is available on the output bus (dout).
    //         .dbiterr      (dbiterr),        // 1-bit output: Double Bit Error: Indicates that the ECC decoder detected
    //         // a double-bit error and data in the FIFO core is corrupted.
    //         .dout         (dout),   // READ_DATA_WIDTH-bit output: Read Data: The output data bus is driven
    //         // when reading the FIFO.
    //         .empty        (empty),          // 1-bit output: Empty Flag: When asserted, this signal indicates that the
    //         // FIFO is empty. Read requests are ignored when the FIFO is empty,
    //         // initiating a read while empty is not destructive to the FIFO.
    //         .full         (full),           // 1-bit output: Full Flag: When asserted, this signal indicates that the
    //         // FIFO is full. Write requests are ignored when the FIFO is full,
    //         // initiating a write when the FIFO is full is not destructive to the
    //         // contents of the FIFO.
    //         .overflow     (overflow),       // 1-bit output: Overflow: This signal indicates that a write request
    //         // (wren) during the prior clock cycle was rejected, because the FIFO is
    //         // full. Overflowing the FIFO is not destructive to the contents of the
    //         // FIFO.
    //         .prog_empty   (prog_empty),     // 1-bit output: Programmable Empty: This signal is asserted when the
    //         // number of words in the FIFO is less than or equal to the programmable
    //         // empty threshold value. It is de-asserted when the number of words in
    //         // the FIFO exceeds the programmable empty threshold value.
    //         .prog_full    (prog_full),      // 1-bit output: Programmable Full: This signal is asserted when the
    //         // number of words in the FIFO is greater than or equal to the
    //         // programmable full threshold value. It is de-asserted when the number of
    //         // words in the FIFO is less than the programmable full threshold value.
    //         .rd_data_count(rd_data_count),  // RD_DATA_COUNT_WIDTH-bit output: Read Data Count: This bus indicates the
    //         // number of words read from the FIFO.
    //         .rd_rst_busy  (rd_rst_busy),    // 1-bit output: Read Reset Busy: Active-High indicator that the FIFO read
    //         // domain is currently in a reset state.
    //         .sbiterr      (sbiterr),        // 1-bit output: Single Bit Error: Indicates that the ECC decoder detected
    //         // and fixed a single-bit error.
    //         .underflow    (underflow),      // 1-bit output: Underflow: Indicates that the read request (rd_en) during
    //         // the previous clock cycle was rejected because the FIFO is empty. Under
    //         // flowing the FIFO is not destructive to the FIFO.
    //         .wr_ack       (wr_ack),         // 1-bit output: Write Acknowledge: This signal indicates that a write
    //         // request (wr_en) during the prior clock cycle is succeeded.
    //         .wr_data_count(wr_data_count),  // WR_DATA_COUNT_WIDTH-bit output: Write Data Count: This bus indicates
    //         // the number of words written into the FIFO.
    //         .wr_rst_busy  (wr_rst_busy),    // 1-bit output: Write Reset Busy: Active-High indicator that the FIFO
    //         // write domain is currently in a reset state.
    //         .din          (din),   // WRITE_DATA_WIDTH-bit input: Write Data: The input data bus used when
    //         // writing the FIFO.
    //         .injectdbiterr(injectdbiterr),  // 1-bit input: Double Bit Error Injection: Injects a double bit error if
    //         // the ECC feature is used on block RAMs or UltraRAM macros.
    //         .injectsbiterr(injectsbiterr),  // 1-bit input: Single Bit Error Injection: Injects a single bit error if
    //         // the ECC feature is used on block RAMs or UltraRAM macros.
    //         .rd_clk       (rd_clk),   // 1-bit input: Read clock: Used for read operation. rd_clk must be a free
    //         // running clock.
    //         .rd_en        (rd_en),     // 1-bit input: Read Enable: If the FIFO is not empty, asserting this
    //         // signal causes data (on dout) to be read from the FIFO. Must be held
    //         // active-low when rd_rst_busy is active high.
    //         .rst          (rst),   // 1-bit input: Reset: Must be synchronous to wr_clk. The clock(s) can be
    //         // unstable at the time of applying reset, but reset must be released only
    //         // after the clock(s) is/are stable.
    //         .sleep        (sleep),          // 1-bit input: Dynamic power saving: If sleep is High, the memory/fifo
    //         // block is in power saving mode.
    //         .wr_clk       (wr_clk),        // 1-bit input: Write clock: Used for write operation. wr_clk must be a
    //         // free running clock.
    //         .wr_en        (wr_en)      // 1-bit input: Write Enable: If the FIFO is not full, asserting this
    //         // signal causes data (on din) to be written to the FIFO. Must be held
    //         // active-low when rst or wr_rst_busy is active high.
    //     );
        // End of xpm_fifo_async_inst instantiation

endmodule
