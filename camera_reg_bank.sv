
`timescale 1 ns / 1 ps

module camera_reg_bank #(
		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 7,

		// Parameters of Axi Slave Bus Interface S01_AXI
		parameter integer C_S01_AXI_DATA_WIDTH	= 32,
		parameter integer C_S01_AXI_ADDR_WIDTH	= 7,

		// Parameters of Axi Slave Bus Interface S02_AXI
		parameter integer C_S02_AXI_DATA_WIDTH	= 32,
		parameter integer C_S02_AXI_ADDR_WIDTH	= 8,

		// Parameters of Axi Slave Bus Interface S03_AXI
		parameter integer C_S03_AXI_DATA_WIDTH	= 32,
		parameter integer C_S03_AXI_ADDR_WIDTH	= 7,
		
		// Parameters of Axi Slave Bus Interface S03_AXI
		parameter integer C_S04_AXI_DATA_WIDTH	= 32,
		parameter integer C_S04_AXI_ADDR_WIDTH	= 7,
		
		// Parameters of Axi Slave Bus Interface S03_AXI
		parameter integer C_S05_AXI_DATA_WIDTH	= 32,
		parameter integer C_S05_AXI_ADDR_WIDTH	= 7,
		
		// Parameters of Axi Slave Bus Interface S06_AXI
		parameter integer C_S06_AXI_DATA_WIDTH	= 32,
		parameter integer C_S06_AXI_ADDR_WIDTH	= 10
		
) (// AXI slave ports
    // Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready,

		// Ports of Axi Slave Bus Interface S01_AXI
		input wire  s01_axi_aclk,
		input wire  s01_axi_aresetn,
		input wire [C_S01_AXI_ADDR_WIDTH-1 : 0] s01_axi_awaddr,
		input wire [2 : 0] s01_axi_awprot,
		input wire  s01_axi_awvalid,
		output wire  s01_axi_awready,
		input wire [C_S01_AXI_DATA_WIDTH-1 : 0] s01_axi_wdata,
		input wire [(C_S01_AXI_DATA_WIDTH/8)-1 : 0] s01_axi_wstrb,
		input wire  s01_axi_wvalid,
		output wire  s01_axi_wready,
		output wire [1 : 0] s01_axi_bresp,
		output wire  s01_axi_bvalid,
		input wire  s01_axi_bready,
		input wire [C_S01_AXI_ADDR_WIDTH-1 : 0] s01_axi_araddr,
		input wire [2 : 0] s01_axi_arprot,
		input wire  s01_axi_arvalid,
		output wire  s01_axi_arready,
		output wire [C_S01_AXI_DATA_WIDTH-1 : 0] s01_axi_rdata,
		output wire [1 : 0] s01_axi_rresp,
		output wire  s01_axi_rvalid,
		input wire  s01_axi_rready,


		// Ports of Axi Slave Bus Interface s02_AXI
		input wire  s02_axi_aclk,
		input wire  s02_axi_aresetn,
		input wire [C_S02_AXI_ADDR_WIDTH-1 : 0] s02_axi_awaddr,
		input wire [2 : 0] s02_axi_awprot,
		input wire  s02_axi_awvalid,
		output wire  s02_axi_awready,
		input wire [C_S02_AXI_DATA_WIDTH-1 : 0] s02_axi_wdata,
		input wire [(C_S02_AXI_DATA_WIDTH/8)-1 : 0] s02_axi_wstrb,
		input wire  s02_axi_wvalid,
		output wire  s02_axi_wready,
		output wire [1 : 0] s02_axi_bresp,
		output wire  s02_axi_bvalid,
		input wire  s02_axi_bready,
		input wire [C_S02_AXI_ADDR_WIDTH-1 : 0] s02_axi_araddr,
		input wire [2 : 0] s02_axi_arprot,
		input wire  s02_axi_arvalid,
		output wire  s02_axi_arready,
		output wire [C_S02_AXI_DATA_WIDTH-1 : 0] s02_axi_rdata,
		output wire [1 : 0] s02_axi_rresp,
		output wire  s02_axi_rvalid,
		input wire  s02_axi_rready,

		
		// Ports of Axi Slave Bus Interface s03_AXI
		input wire  s03_axi_aclk,
		input wire  s03_axi_aresetn,
		input wire [C_S03_AXI_ADDR_WIDTH-1 : 0] s03_axi_awaddr,
		input wire [2 : 0] s03_axi_awprot,
		input wire  s03_axi_awvalid,
		output wire  s03_axi_awready,
		input wire [C_S03_AXI_DATA_WIDTH-1 : 0] s03_axi_wdata,
		input wire [(C_S03_AXI_DATA_WIDTH/8)-1 : 0] s03_axi_wstrb,
		input wire  s03_axi_wvalid,
		output wire  s03_axi_wready,
		output wire [1 : 0] s03_axi_bresp,
		output wire  s03_axi_bvalid,
		input wire  s03_axi_bready,
		input wire [C_S03_AXI_ADDR_WIDTH-1 : 0] s03_axi_araddr,
		input wire [2 : 0] s03_axi_arprot,
		input wire  s03_axi_arvalid,
		output wire  s03_axi_arready,
		output wire [C_S03_AXI_DATA_WIDTH-1 : 0] s03_axi_rdata,
		output wire [1 : 0] s03_axi_rresp,
		output wire  s03_axi_rvalid,
		input wire  s03_axi_rready,



		// Ports of Axi Slave Bus Interface s04_AXI
		input wire  s04_axi_aclk,
		input wire  s04_axi_aresetn,
		input wire [C_S04_AXI_ADDR_WIDTH-1 : 0] s04_axi_awaddr,
		input wire [2 : 0] s04_axi_awprot,
		input wire  s04_axi_awvalid,
		output wire  s04_axi_awready,
		input wire [C_S04_AXI_DATA_WIDTH-1 : 0] s04_axi_wdata,
		input wire [(C_S04_AXI_DATA_WIDTH/8)-1 : 0] s04_axi_wstrb,
		input wire  s04_axi_wvalid,
		output wire  s04_axi_wready,
		output wire [1 : 0] s04_axi_bresp,
		output wire  s04_axi_bvalid,
		input wire  s04_axi_bready,
		input wire [C_S04_AXI_ADDR_WIDTH-1 : 0] s04_axi_araddr,
		input wire [2 : 0] s04_axi_arprot,
		input wire  s04_axi_arvalid,
		output wire  s04_axi_arready,
		output wire [C_S04_AXI_DATA_WIDTH-1 : 0] s04_axi_rdata,
		output wire [1 : 0] s04_axi_rresp,
		output wire  s04_axi_rvalid,
		input wire  s04_axi_rready,

		
		// Ports of Axi Slave Bus Interface s05_AXI
		input wire  s05_axi_aclk,
		input wire  s05_axi_aresetn,
		input wire [C_S05_AXI_ADDR_WIDTH-1 : 0] s05_axi_awaddr,
		input wire [2 : 0] s05_axi_awprot,
		input wire  s05_axi_awvalid,
		output wire  s05_axi_awready,
		input wire [C_S05_AXI_DATA_WIDTH-1 : 0] s05_axi_wdata,
		input wire [(C_S05_AXI_DATA_WIDTH/8)-1 : 0] s05_axi_wstrb,
		input wire  s05_axi_wvalid,
		output wire  s05_axi_wready,
		output wire [1 : 0] s05_axi_bresp,
		output wire  s05_axi_bvalid,
		input wire  s05_axi_bready,
		input wire [C_S05_AXI_ADDR_WIDTH-1 : 0] s05_axi_araddr,
		input wire [2 : 0] s05_axi_arprot,
		input wire  s05_axi_arvalid,
		output wire  s05_axi_arready,
		output wire [C_S05_AXI_DATA_WIDTH-1 : 0] s05_axi_rdata,
		output wire [1 : 0] s05_axi_rresp,
		output wire  s05_axi_rvalid,
		input wire  s05_axi_rready,
		
		
		// Ports of Axi Slave Bus Interface s06_AXI
		input wire  s06_axi_aclk,
		input wire  s06_axi_aresetn,
		input wire [C_S06_AXI_ADDR_WIDTH-1 : 0] s06_axi_awaddr,
		input wire [2 : 0] s06_axi_awprot,
		input wire  s06_axi_awvalid,
		output wire  s06_axi_awready,
		input wire [C_S06_AXI_DATA_WIDTH-1 : 0] s06_axi_wdata,
		input wire [(C_S06_AXI_DATA_WIDTH/8)-1 : 0] s06_axi_wstrb,
		input wire  s06_axi_wvalid,
		output wire  s06_axi_wready,
		output wire [1 : 0] s06_axi_bresp,
		output wire  s06_axi_bvalid,
		input wire  s06_axi_bready,
		input wire [C_S06_AXI_ADDR_WIDTH-1 : 0] s06_axi_araddr,
		input wire [2 : 0] s06_axi_arprot,
		input wire  s06_axi_arvalid,
		output wire  s06_axi_arready,
		output wire [C_S06_AXI_DATA_WIDTH-1 : 0] s06_axi_rdata,
		output wire [1 : 0] s06_axi_rresp,
		output wire  s06_axi_rvalid,
		input wire  s06_axi_rready,
		

    // }}}    
    
    
    input wire [ C_S00_AXI_DATA_WIDTH-1:0]    pcie_card_id,
    input wire [ C_S00_AXI_DATA_WIDTH-1:0]    chan0_tlast_status,
    input wire [ C_S00_AXI_DATA_WIDTH-1:0]    chan1_tlast_status,
    input wire [ C_S00_AXI_DATA_WIDTH-1:0]    chan2_tlast_status,
    input wire [ C_S00_AXI_DATA_WIDTH-1:0]    byp_host_stat1,
    input wire [ C_S00_AXI_DATA_WIDTH-1:0]    byp_host_stat2,
    output wire [63:0]   					  byp_host_addr,
    
    
    input wire [ C_S00_AXI_DATA_WIDTH-1:0]   basis_hash_msb,
    input wire [ C_S00_AXI_DATA_WIDTH-1:0]   basis_hash_lsb,
    
    output reg [ C_S00_AXI_DATA_WIDTH-1:0]     process_id_reg,
    
    // Output
    output wire [1:0]                          video_stream_mode,
    output wire                                enable_timestamp,
    output wire                                ps_camera_trigger,
    output wire                                ps_ddr_trigger,
    output wire                                reset_microblaze,
    
    // Input for Status
    input wire                                 camera_is_linked, 
    input wire                                 camera_is_synced, 
    input wire                                 digi_camera_trigger,
    input wire [63:0]                          digibus_proc,
   
    
         
                                                             
    
    output wire  [ C_S00_AXI_DATA_WIDTH-1:0]    ps2pl_set_camera_width,    // 0x10 
    output wire  [ C_S00_AXI_DATA_WIDTH-1:0]    ps2pl_set_camera_height,   // 0x18
    output wire  [ C_S00_AXI_DATA_WIDTH-1:0]    ps2pl_set_framerate,       // 0x30
	output wire  [ C_S00_AXI_DATA_WIDTH-1:0]    ps2pl_set_width_crop,	     // 0x3C   		
    output wire  [ C_S00_AXI_DATA_WIDTH-1:0]    ps2pl_set_crop_offset,     // 0x48
                                                                
                                                                
    
    input wire  [ C_S00_AXI_DATA_WIDTH-1:0]    pl2ps_camera_trig_cnt,  // 0x74
    input wire  [ C_S00_AXI_DATA_WIDTH-1:0]    pl2ps_pcie_bar_addr,    // 0x7C
    
   // CLC reg bank
   
    input  wire                                ddr_axi_aclk,
    
    output wire [ C_S00_AXI_DATA_WIDTH-1:0]    ps2pl_kp      ,
    output wire [ C_S00_AXI_DATA_WIDTH-1:0]    ps2pl_ki      ,
    output wire [ C_S00_AXI_DATA_WIDTH-1:0]    ps2pl_plow    ,
    output wire [ C_S00_AXI_DATA_WIDTH-1:0]    ps2pl_phigh   ,
    output wire [ C_S00_AXI_DATA_WIDTH-1:0]    ps2pl_window_size,
    output wire [ C_S00_AXI_DATA_WIDTH-1:0]    ps2pl_ddr_base_addr     ,
    output wire                                ps2pl_ddr_base_addr_vld ,
    output wire [ 15:0]                        ps2pl_ddr_vector_length, 
    //output wire [ C_S00_AXI_DATA_WIDTH-1:0]    ps2pl_prange  ,
    output wire [ C_S00_AXI_DATA_WIDTH-1:0]    ps2pl_phi     ,
    output wire [ C_S00_AXI_DATA_WIDTH-1:0]    ps2pl_beta    ,
    output wire [ C_S00_AXI_DATA_WIDTH-1:0]    ps2pl_clc_ctrl_reg    ,
    
    
    output wire     dummy
    );


// Instantiation of Axi Bus Interface S03_AXI
	mb_reg_bank # ( 
		.DATA_WIDTH(32),
		.ADDR_WIDTH(7)
	) cam_host2mb_reg_bank (
		  
			 .s_axi_aclk(s03_axi_aclk),
			 .s_axi_aresetn(s03_axi_aresetn),
			 .s_axi_awaddr(s03_axi_awaddr),
			 .s_axi_awprot(s03_axi_awprot),
			 .s_axi_awvalid(s03_axi_awvalid),
			 .s_axi_awready(s03_axi_awready),
			 .s_axi_wdata(s03_axi_wdata),
			 .s_axi_wstrb(s03_axi_wstrb),
			 .s_axi_wvalid(s03_axi_wvalid),
			 .s_axi_wready(s03_axi_wready),
			 .s_axi_bresp(s03_axi_bresp),
			 .s_axi_bvalid(s03_axi_bvalid),
			 .s_axi_bready(s03_axi_bready),
			 .s_axi_araddr(s03_axi_araddr),
			 .s_axi_arprot(s03_axi_arprot),
			 .s_axi_arvalid(s03_axi_arvalid),
			 .s_axi_arready(s03_axi_arready),
			 .s_axi_rdata(s03_axi_rdata),
			 .s_axi_rresp(s03_axi_rresp),
			 .s_axi_rvalid(s03_axi_rvalid),
			 .s_axi_rready(s03_axi_rready),
		   .slv_reg0_input     ( 'b0 ),  // 0x00   
		   .slv_reg1_output    (  ),  // 0x04   
		   .slv_reg2_input     ( host2pl_camera_config ),  // 0x08   
		   .slv_reg3_output    (  ),  // 0x0C   
		   .slv_reg4_input     ( host2pl_set_camera_width ),  // 0x10   
		   .slv_reg5_output    ( pl2host_ro_camera_width  ),  // 0x14   
		   .slv_reg6_input     ( host2pl_set_camera_height ),  // 0x18   
		   .slv_reg7_output    ( pl2host_ro_camera_height  ),  // 0x1C   
		   .slv_reg8_input     ( host2pl_set_offsetx ),  // 0x20   
		   .slv_reg9_output    ( pl2host_ro_offsetx  ),  // 0x24   
		   .slv_reg10_input    ( host2pl_set_offsety ),  // 0x28   
		   .slv_reg11_output   ( pl2host_ro_offsety  ),  // 0x2C   
		   .slv_reg12_input    ( host2ps_set_framerate ),  // 0x30   
		   .slv_reg13_output   ( pl2host_ro_framerate  ),  // 0x34   
		   .slv_reg14_input    ( host2ps_set_exposure ),  // 0x38   
		   .slv_reg15_output   ( pl2host_ro_exposure  ),  // 0x3C   
		   .slv_reg16_input    ( 'b0 ),  // 0x40   
		   .slv_reg17_output   (  ),  // 0x44   
		   .slv_reg18_input    ( 'b0 ),  // 0x48   
		   .slv_reg19_output   (  ),  // 0x4C   
		   .slv_reg20_input    ( 'b0 ),  // 0x50   
		   .slv_reg21_output   (  ),  // 0x54   
		   .slv_reg22_input    ( 'b0 ),  // 0x58   
		   .slv_reg23_output   (  ),  // 0x5C   
		   .slv_reg24_input    ( 'b0 ),  // 0x60   
		   .slv_reg25_output   (  ),  // 0x64   
		   .slv_reg26_input    ( 'b0 ),  // 0x68   
		   .slv_reg27_output   (  ),  // 0x6C   
		   .slv_reg28_input    ( 'b0 ),  // 0x70   
		   .slv_reg29_output   (  ),  // 0x74   
	     .slv_reg30_input    ( 'b0 ),  // 0x78   
	     .slv_reg31_output   (  ),  // 0x7C   
	     
	     .default_out_reg1   ( 32'h00000000  ),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
	     .default_out_reg3   ( 32'h00000000  ),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
	     .default_out_reg5   ( 32'h00000000  ),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
	     .default_out_reg7   ( 32'h00000000  ),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
	     .default_out_reg9   ( 32'h00000004  ),                                                                                                                                                                                                                                                                                                                                              
	     .default_out_reg11  ( 32'h00000000  ),                                                                                                                                                                                                                                                                                                                                               
	     .default_out_reg13  ( 32'h00000000  ),                                                                                                                                                                                                                                                                                                                                              
	     .default_out_reg15  ( 32'h00000000  ),                                                                                                                                                                                                                                                                                                                                               
	     .default_out_reg17  ( 32'h00000000  ),                                                                                                                                                                                                                                                                                                                                           
	     .default_out_reg19  ( 32'h00000000  ),                                                                                                                                                                                                                                                                                                                                              
	     .default_out_reg21  ( 32'h00000000  ),                                                                                                                                                                                                                                                                                                                                              
	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
	     .dummy        ( )
		);




// Instantiation of Axi Bus Interface S01_AXI
	mb_reg_bank # ( 
		.DATA_WIDTH(32),
		.ADDR_WIDTH(7)
	) connection_test_zynq2mb_reg_bank (
		  
			 .s_axi_aclk(s05_axi_aclk),
			 .s_axi_aresetn(s05_axi_aresetn),
			 .s_axi_awaddr(s05_axi_awaddr),
			 .s_axi_awprot(s05_axi_awprot),
			 .s_axi_awvalid(s05_axi_awvalid),
			 .s_axi_awready(s05_axi_awready),
			 .s_axi_wdata(s05_axi_wdata),
			 .s_axi_wstrb(s05_axi_wstrb),
			 .s_axi_wvalid(s05_axi_wvalid),
			 .s_axi_wready(s05_axi_wready),
			 .s_axi_bresp(s05_axi_bresp),
			 .s_axi_bvalid(s05_axi_bvalid),
			 .s_axi_bready(s05_axi_bready),
			 .s_axi_araddr(s05_axi_araddr),
			 .s_axi_arprot(s05_axi_arprot),
			 .s_axi_arvalid(s05_axi_arvalid),
			 .s_axi_arready(s05_axi_arready),
			 .s_axi_rdata(s05_axi_rdata),
			 .s_axi_rresp(s05_axi_rresp),
			 .s_axi_rvalid(s05_axi_rvalid),
			 .s_axi_rready(s05_axi_rready),
		   .slv_reg0_input     ( 'b0 ),  // 0x00   
		   .slv_reg1_output    (  ),  // 0x04   
		   .slv_reg2_input     ( ps2pl_conn_test_test_duration ),  // 0x08   
		   .slv_reg3_output    (  ),  // 0x0C   
		   .slv_reg4_input     (  ),  // 0x10   
		   .slv_reg5_output    ( pl2ps_conn_test_downlink_pkg_sent  ),  // 0x14   
		   .slv_reg6_input     (  ),  // 0x18   
		   .slv_reg7_output    ( pl2ps_conn_test_uplink_pkg_sent  ),  // 0x1C   
		   .slv_reg8_input     (  ),  // 0x20   
		   .slv_reg9_output    ( pl2ps_conn_test_test_errors  ),  // 0x24   
		   .slv_reg10_input    (  ),  // 0x28   
		   .slv_reg11_output   ( pl2ps_conn_test_crc_errors  ),  // 0x2C   
		   .slv_reg12_input    (  ),  // 0x30   
		   .slv_reg13_output   ( pl2ps_conn_test_connection_loss  ),  // 0x34   
		   .slv_reg14_input    (  ),  // 0x38   
		   .slv_reg15_output   ( pl2ps_conn_test_phy_cerr_errors  ),  // 0x3C   
		   .slv_reg16_input    ( 'b0 ),  // 0x40   
		   .slv_reg17_output   ( pl2ps_conn_test_phy_perr_errors ),  // 0x44   
		   .slv_reg18_input    ( 'b0 ),  // 0x48   
		   .slv_reg19_output   (  ),  // 0x4C   
		   .slv_reg20_input    ( 'b0 ),  // 0x50   
		   .slv_reg21_output   (  ),  // 0x54   
		   .slv_reg22_input    ( 'b0 ),  // 0x58   
		   .slv_reg23_output   (  ),  // 0x5C   
		   .slv_reg24_input    ( 'b0 ),  // 0x60   
		   .slv_reg25_output   (  ),  // 0x64   
		   .slv_reg26_input    ( 'b0 ),  // 0x68   
		   .slv_reg27_output   (  ),  // 0x6C   
		   .slv_reg28_input    ( 'b0 ),  // 0x70   
		   .slv_reg29_output   (  ),  // 0x74   
	     .slv_reg30_input    ( 'b0 ),  // 0x78   
	     .slv_reg31_output   (  ),  // 0x7C   
	     
	     .default_out_reg1   ( 32'h00000000  ),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
	     .default_out_reg3   ( 32'h00000000  ),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
	     .default_out_reg5   ( 32'h00000000  ),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
	     .default_out_reg7   ( 32'h00000000  ),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
	     .default_out_reg9   ( 32'h00000000  ),                                                                                                                                                                                                                                                                                                                                              
	     .default_out_reg11  ( 32'h00000000  ),                                                                                                                                                                                                                                                                                                                                               
	     .default_out_reg13  ( 32'h00000000  ),                                                                                                                                                                                                                                                                                                                                              
	     .default_out_reg15  ( 32'h00000000  ),                                                                                                                                                                                                                                                                                                                                               
	     .default_out_reg17  ( 32'h00000000  ),                                                                                                                                                                                                                                                                                                                                           
	     .default_out_reg19  ( 32'h00000000  ),                                                                                                                                                                                                                                                                                                                                              
	     .default_out_reg21  ( 32'h00000000  ),                                                                                                                                                                                                                                                                                                                                              
	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
	     .dummy        ( )
		);


endmodule
