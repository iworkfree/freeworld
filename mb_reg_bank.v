`timescale 1 ns / 1 ps

module mb_reg_bank #(
    parameter integer DATA_WIDTH = 32,
    parameter integer ADDR_WIDTH = 7
) (
    // axi-lite interface
    input wire                      s_axi_aclk,
    input wire                      s_axi_aresetn,
    input wire [ADDR_WIDTH-1:0]     s_axi_awaddr,
    input wire [2:0]                s_axi_awprot,
    input wire                      s_axi_awvalid,
    output wire                     s_axi_awready,
    input wire [DATA_WIDTH-1:0]     s_axi_wdata,
    input wire [(DATA_WIDTH/8)-1:0] s_axi_wstrb,
    input wire                      s_axi_wvalid,
    output wire                     s_axi_wready,
    output wire [1:0]               s_axi_bresp,
    output wire                     s_axi_bvalid,
    input wire                      s_axi_bready,
    input wire [ADDR_WIDTH-1:0]     s_axi_araddr,
    input wire [2:0]                s_axi_arprot,
    input wire                      s_axi_arvalid,
    output wire                     s_axi_arready,
    output wire [DATA_WIDTH-1 : 0]  s_axi_rdata,
    output wire [1:0]               s_axi_rresp,
    output wire                     s_axi_rvalid,
    input wire                      s_axi_rready,           

    input wire [DATA_WIDTH-1 : 0] slv_reg0_input  ,  // 0x00       
    output  wire [DATA_WIDTH-1 : 0] slv_reg1_output   ,  // 0x04       
    input wire [DATA_WIDTH-1 : 0] slv_reg2_input  ,  // 0x08       
    output  wire [DATA_WIDTH-1 : 0] slv_reg3_output   ,  // 0x0C       
    input wire [DATA_WIDTH-1 : 0] slv_reg4_input  ,  // 0x10       
    output  wire [DATA_WIDTH-1 : 0] slv_reg5_output   ,  // 0x14       
    input wire [DATA_WIDTH-1 : 0] slv_reg6_input  ,  // 0x18
    output  wire [DATA_WIDTH-1 : 0] slv_reg7_output   ,  // 0x1C
    input wire [DATA_WIDTH-1 : 0] slv_reg8_input  ,  // 0x20
    output  wire [DATA_WIDTH-1 : 0] slv_reg9_output   ,  // 0x24
    input wire [DATA_WIDTH-1 : 0] slv_reg10_input ,  // 0x28
    output  wire [DATA_WIDTH-1 : 0] slv_reg11_output  ,  // 0x2C
    input wire [DATA_WIDTH-1 : 0] slv_reg12_input ,  // 0x30
    output  wire [DATA_WIDTH-1 : 0] slv_reg13_output  ,  // 0x34
    input wire [DATA_WIDTH-1 : 0] slv_reg14_input ,  // 0x38
    output  wire [DATA_WIDTH-1 : 0] slv_reg15_output  ,  // 0x3C
    input wire [DATA_WIDTH-1 : 0] slv_reg16_input ,  // 0x40        
    output  wire [DATA_WIDTH-1 : 0] slv_reg17_output  ,  // 0x44        
    input wire [DATA_WIDTH-1 : 0] slv_reg18_input ,  // 0x48        
    output  wire [DATA_WIDTH-1 : 0] slv_reg19_output  ,  // 0x4C        
    input wire [DATA_WIDTH-1 : 0] slv_reg20_input ,  // 0x50        
    output  wire [DATA_WIDTH-1 : 0] slv_reg21_output  ,  // 0x54        
    input wire [DATA_WIDTH-1 : 0] slv_reg22_input ,  // 0x58 
    output  wire [DATA_WIDTH-1 : 0] slv_reg23_output  ,  // 0x5C 
    input wire [DATA_WIDTH-1 : 0] slv_reg24_input ,  // 0x60 
    output  wire [DATA_WIDTH-1 : 0] slv_reg25_output  ,  // 0x64 
    input wire [DATA_WIDTH-1 : 0] slv_reg26_input ,  // 0x68 
    output  wire [DATA_WIDTH-1 : 0] slv_reg27_output  ,  // 0x6C 
    input wire [DATA_WIDTH-1 : 0] slv_reg28_input ,  // 0x70 
    output  wire [DATA_WIDTH-1 : 0] slv_reg29_output  ,  // 0x74 
    input wire [DATA_WIDTH-1 : 0] slv_reg30_input ,  // 0x78 
    output  wire [DATA_WIDTH-1 : 0] slv_reg31_output  ,  // 0x7C 
    
    
    input wire  [DATA_WIDTH-1 : 0] default_out_reg1,    // 0x00   
    input wire  [DATA_WIDTH-1 : 0] default_out_reg3,    // 0x08    
    input wire  [DATA_WIDTH-1 : 0] default_out_reg5,    // 0x10    
    input wire  [DATA_WIDTH-1 : 0] default_out_reg7,    // 0x18    
    input wire  [DATA_WIDTH-1 : 0] default_out_reg9,    // 0x20   
    input wire  [DATA_WIDTH-1 : 0] default_out_reg11,   // 0x28   
    input wire  [DATA_WIDTH-1 : 0] default_out_reg13,   // 0x30    
    input wire  [DATA_WIDTH-1 : 0] default_out_reg15,   // 0x38    
    input wire  [DATA_WIDTH-1 : 0] default_out_reg17,   // 0x40    
    input wire  [DATA_WIDTH-1 : 0] default_out_reg19,   // 0x48    
    input wire  [DATA_WIDTH-1 : 0] default_out_reg21,   // 0x50       
                    
    output wire     dummy
    
);

// parameters for register bank
	// local parameter for addressing 32 bit / 64 bit DATA_WIDTH
	// ADDR_LSB is used for addressing 32/64 bit registers/memories
	// ADDR_LSB = 2 for 32 bits (n downto 2)
	// ADDR_LSB = 3 for 64 bits (n downto 3)
    localparam integer ADDR_LSB = $clog2(DATA_WIDTH)-3;
    localparam integer NUM_REGS = 2**(ADDR_WIDTH-ADDR_LSB);
    reg [DATA_WIDTH-1:0] reg_bank [0:NUM_REGS-1];
    reg [DATA_WIDTH-1:0] slv_reg [0:NUM_REGS-1];
	
	
	//-- Number of Slave Registers 31
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg0 ;       
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg2 ;       
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg4 ;       
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg6 ;       
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg8 ;       
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg10;      
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg12;      
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg14;      
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg16;      
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg18;      
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg20;      
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg22;      
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg24;      
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg26;      
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg28;      
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg30;      
	
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg0_q;     
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg2_q;     
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg4_q;     
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg6_q;     
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg8_q;     
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg10_q;    
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg12_q;    
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg14_q;    
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg16_q;    
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg18_q;    
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg20_q;    
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg22_q;    
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg24_q;    
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg26_q;    
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg28_q;    
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg30_q;    
	
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg0_qq;    
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg2_qq;    
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg4_qq;    
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg6_qq;    
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg8_qq;    
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg10_qq;   
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg12_qq;   
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg14_qq;   
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg16_qq;   
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg18_qq;   
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg20_qq;   
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg22_qq;   
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg24_qq;   
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg26_qq;   
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg28_qq;   
	(* ASYNC_REG = "TRUE" *)  reg [DATA_WIDTH-1:0]	slv_reg30_qq;   
	

// intermediary registerss
    reg		             axi_awready;
    reg		             axi_wready;
    reg		             axi_bvalid;
    reg		             axi_arready;
    reg [DATA_WIDTH-1:0] axi_rdata;
    reg		             axi_rvalid;

// i/o connections assignments
    assign s_axi_awready = axi_awready;
    assign s_axi_wready	 = axi_wready;
    assign s_axi_bresp	 = 2'b00; // The OKAY response
    assign s_axi_bvalid	 = axi_bvalid;
    assign s_axi_arready = axi_arready;
    assign s_axi_rdata	 = axi_rdata;
    assign s_axi_rresp	 = 2'b00; // The OKAY response
    assign s_axi_rvalid	 = axi_rvalid;

//
// read processing
//
    wire	             valid_read_request;
    wire                 read_response_stall;
    reg [ADDR_WIDTH-1:0] pre_raddr;
    reg [ADDR_WIDTH-1:0] rd_addr;

    assign	valid_read_request  = s_axi_arvalid || !s_axi_arready;
    assign	read_response_stall = s_axi_rvalid  && !s_axi_rready;

//
// read response channel valid signal
//
    initial	axi_rvalid = 1'b0;
    always @(posedge s_axi_aclk)
        if(!s_axi_aresetn)
            axi_rvalid <= 0;
        else if(read_response_stall)
            axi_rvalid <= 1'b1;
        else if(valid_read_request)
            axi_rvalid <= 1'b1;
        else
            axi_rvalid <= 1'b0;

//
// buffer the address
//
    always @(posedge s_axi_aclk)
    if(s_axi_arready)
        pre_raddr <= s_axi_araddr;

    always @(*)
    if(!axi_arready)
        rd_addr = pre_raddr;
    else
        rd_addr = s_axi_araddr;

//
// read the data
//
    always @(posedge s_axi_aclk)
       	if(!s_axi_aresetn)
       		axi_rdata <= 32'h0;
        else if((!read_response_stall)&&valid_read_request)
      	  axi_rdata <= reg_bank[rd_addr[ADDR_WIDTH-1:ADDR_LSB]];

    assign slv_reg1_output = reg_bank[1] ;
    assign slv_reg3_output = reg_bank[3] ; 
    assign slv_reg5_output = reg_bank[5] ; 
    assign slv_reg7_output = reg_bank[7] ; 
    assign slv_reg9_output = reg_bank[9] ;
    assign slv_reg11_output = reg_bank[11] ;
    assign slv_reg13_output = reg_bank[13] ; 
    assign slv_reg15_output = reg_bank[15] ; 
    assign slv_reg17_output = reg_bank[17] ; 
    assign slv_reg19_output = reg_bank[19] ;
    assign slv_reg21_output = reg_bank[21] ;
    assign slv_reg23_output = reg_bank[23] ; 
    assign slv_reg25_output = reg_bank[25] ; 
    assign slv_reg27_output = reg_bank[27] ;
    assign slv_reg29_output = reg_bank[29] ;
    assign slv_reg31_output = reg_bank[31] ;		
    
//
// The read address channel ready signal
//
    initial	axi_arready = 1'b0;
    always @(posedge s_axi_aclk)
        if(!s_axi_aresetn)
            axi_arready <= 1'b1;
        else if(read_response_stall)
            axi_arready <= !valid_read_request;
        else
            axi_arready <= 1'b1;

//
// write processing
//
    reg [ADDR_WIDTH-1:0]     pre_waddr;
    reg [ADDR_WIDTH-1:0]     waddr;
    reg [DATA_WIDTH-1:0]     pre_wdata;
    reg [DATA_WIDTH-1:0]     wdata;
    reg [(DATA_WIDTH/8)-1:0] pre_wstrb;
    reg [(DATA_WIDTH/8)-1:0] wstrb;

    wire valid_write_address;
    wire valid_write_data;
    wire write_response_stall;

    assign valid_write_address = s_axi_awvalid || !axi_awready;
    assign valid_write_data    = s_axi_wvalid  || !axi_wready;
    assign write_response_stall= s_axi_bvalid  && !s_axi_bready;

//
// write address channel ready signal
//
    initial	axi_awready = 1'b1;
    always @(posedge s_axi_aclk)
        if(!s_axi_aresetn)
            axi_awready <= 1'b1;
        else if(write_response_stall)
            axi_awready <= !valid_write_address;
        else if(valid_write_data)
            axi_awready <= 1'b1;
        else
            axi_awready <= ((axi_awready)&&(!s_axi_awvalid));

//
// write data channel ready signal
//
    initial	axi_wready = 1'b1;
    always @(posedge s_axi_aclk)
        if(!s_axi_aresetn)
            axi_wready <= 1'b1;
        else if(write_response_stall)
            axi_wready <= !valid_write_data;
        else if(valid_write_address)
            axi_wready <= 1'b1;
        else
            axi_wready <= (axi_wready)&&(!s_axi_wvalid);

// buffer the address
    always @(posedge s_axi_aclk)
    if(s_axi_awready)
        pre_waddr <= s_axi_awaddr;

// buffer the data
    always @(posedge s_axi_aclk)
        if(s_axi_wready)
        begin
            pre_wdata <= s_axi_wdata;
            pre_wstrb <= s_axi_wstrb;
        end

    always @(*)
        if(!axi_awready)
            waddr = pre_waddr;
        else
            waddr = s_axi_awaddr;

    always @(*)
        if(!axi_wready)
        begin
            wstrb = pre_wstrb;
            wdata = pre_wdata;
        end else begin
            wstrb = s_axi_wstrb;
            wdata = s_axi_wdata;
        end

//
// write the data
//
    always @(posedge s_axi_aclk)
    begin
        if(!s_axi_aresetn)
        begin
        reg_bank[1 ] <= default_out_reg1;
	      reg_bank[3 ] <= default_out_reg3;
	      reg_bank[5 ] <= default_out_reg5;
	      reg_bank[7 ] <= default_out_reg7;
	      reg_bank[9 ] <= default_out_reg9;
	      reg_bank[11] <= default_out_reg11;
	      reg_bank[13] <= default_out_reg13;
	      reg_bank[15] <= default_out_reg15;
	      reg_bank[17] <= default_out_reg17;
	      reg_bank[19] <= default_out_reg19;
	      reg_bank[21] <= default_out_reg21;
	      reg_bank[23] <= 0;
	      reg_bank[25] <= 0;
	      reg_bank[27] <= 0;
	      reg_bank[29] <= 0;
	      reg_bank[31] <= 0;      
	      
	       slv_reg0_q     <= 0;  
	       slv_reg2_q     <= 0;  
	       slv_reg4_q     <= 0;  
	       slv_reg6_q     <= 0;  
	       slv_reg8_q     <= 0;  
	       slv_reg10_q    <= 0;   
	       slv_reg12_q    <= 0;   
	       slv_reg14_q    <= 0;   
	       slv_reg16_q    <= 0;   
	       slv_reg18_q    <= 0;   
	       slv_reg20_q    <= 0;   
	       slv_reg22_q    <= 0;   
	       slv_reg24_q    <= 0;   
	       slv_reg26_q    <= 0;   
	       slv_reg28_q    <= 0;   
	       slv_reg30_q    <= 0;   
	  	
	       slv_reg0_qq     <= 0;  
	       slv_reg2_qq     <= 0;  
	       slv_reg4_qq     <= 0;  
	       slv_reg6_qq     <= 0;  
	       slv_reg8_qq     <= 0;  
	       slv_reg10_qq    <= 0;  
	       slv_reg12_qq    <= 0;  
	       slv_reg14_qq    <= 0;  
	       slv_reg16_qq    <= 0;  
	       slv_reg18_qq    <= 0;  
	       slv_reg20_qq    <= 0;  
	       slv_reg22_qq    <= 0;  
	       slv_reg24_qq    <= 0;  
	       slv_reg26_qq    <= 0;  
	       slv_reg28_qq    <= 0;  
	       slv_reg30_qq    <= 0;  
	      
	      
	      
        end

        else
        begin
        	
             slv_reg0_q    <= slv_reg0_input; 
             slv_reg2_q    <= slv_reg2_input; 
             slv_reg4_q    <= slv_reg4_input; 
             slv_reg6_q    <= slv_reg6_input; 
             slv_reg8_q    <= slv_reg8_input; 
             slv_reg10_q   <= slv_reg10_input; 
             slv_reg12_q   <= slv_reg12_input; 
             slv_reg14_q   <= slv_reg14_input; 
             slv_reg16_q   <= slv_reg16_input; 
             slv_reg18_q   <= slv_reg18_input; 
             slv_reg20_q   <= slv_reg20_input; 
             slv_reg22_q   <= slv_reg22_input; 
             slv_reg24_q   <= slv_reg24_input; 
             slv_reg26_q   <= slv_reg26_input; 
             slv_reg28_q   <= slv_reg28_input; 
             slv_reg30_q   <= slv_reg30_input; 
        	
             slv_reg0_qq    <= slv_reg0_q; 
             slv_reg2_qq    <= slv_reg2_q; 
             slv_reg4_qq    <= slv_reg4_q; 
             slv_reg6_qq    <= slv_reg6_q; 
             slv_reg8_qq    <= slv_reg8_q; 
             slv_reg10_qq   <= slv_reg10_q; 
             slv_reg12_qq   <= slv_reg12_q; 
             slv_reg14_qq   <= slv_reg14_q; 
             slv_reg16_qq   <= slv_reg16_q; 
             slv_reg18_qq   <= slv_reg18_q; 
             slv_reg20_qq   <= slv_reg20_q; 
             slv_reg22_qq   <= slv_reg22_q; 
             slv_reg24_qq   <= slv_reg24_q; 
             slv_reg26_qq   <= slv_reg26_q; 
             slv_reg28_qq   <= slv_reg28_q; 
             slv_reg30_qq   <= slv_reg30_q; 
            
            reg_bank[0]   <= slv_reg0_qq; 
            reg_bank[2]   <= slv_reg2_qq; 
            reg_bank[4]   <= slv_reg4_qq; 
            reg_bank[6]   <= slv_reg6_qq; 
            reg_bank[8]   <= slv_reg8_qq; 
            reg_bank[10]   <= slv_reg10_qq; 
            reg_bank[12]   <= slv_reg12_qq; 
            reg_bank[14]   <= slv_reg14_qq; 
            reg_bank[16]   <= slv_reg16_qq; 
            reg_bank[18]   <= slv_reg18_qq; 
            reg_bank[20]   <= slv_reg20_qq; 
            reg_bank[22]   <= slv_reg22_qq; 
            reg_bank[24]   <= slv_reg24_qq; 
            reg_bank[26]   <= slv_reg26_qq; 
            reg_bank[28]   <= slv_reg28_qq; 
            reg_bank[30]   <= slv_reg30_qq; 

            if(!write_response_stall && valid_write_address && valid_write_data)
            begin
                if(waddr[ADDR_WIDTH-1:ADDR_LSB]==1)
                begin
                    if(wstrb[0])
                        reg_bank[1][7:0]   <= wdata[7:0];
                    if(wstrb[1])
                        reg_bank[1][15:8]  <= wdata[15:8];
                    if(wstrb[2])
                        reg_bank[1][23:16] <= wdata[23:16];
                    if(wstrb[3])
                        reg_bank[1][31:24] <= wdata[31:24];
                end               
            end
            if(!write_response_stall && valid_write_address && valid_write_data)
            begin
                if(waddr[ADDR_WIDTH-1:ADDR_LSB]==3)
                begin
                    if(wstrb[0])
                        reg_bank[3][7:0]   <= wdata[7:0];
                    if(wstrb[1])
                        reg_bank[3][15:8]  <= wdata[15:8];
                    if(wstrb[2])
                        reg_bank[3][23:16] <= wdata[23:16];
                    if(wstrb[3])
                        reg_bank[3][31:24] <= wdata[31:24];
                end               
            end            
            if(!write_response_stall && valid_write_address && valid_write_data)
            begin
                if(waddr[ADDR_WIDTH-1:ADDR_LSB]==5)
                begin
                    if(wstrb[0])
                        reg_bank[5][7:0]   <= wdata[7:0];
                    if(wstrb[1])
                        reg_bank[5][15:8]  <= wdata[15:8];
                    if(wstrb[2])
                        reg_bank[5][23:16] <= wdata[23:16];
                    if(wstrb[3])
                        reg_bank[5][31:24] <= wdata[31:24];
                end               
            end
            if(!write_response_stall && valid_write_address && valid_write_data)
            begin
                if(waddr[ADDR_WIDTH-1:ADDR_LSB]==7)
                begin
                    if(wstrb[0])
                        reg_bank[7][7:0]   <= wdata[7:0];
                    if(wstrb[1])
                        reg_bank[7][15:8]  <= wdata[15:8];
                    if(wstrb[2])
                        reg_bank[7][23:16] <= wdata[23:16];
                    if(wstrb[3])
                        reg_bank[7][31:24] <= wdata[31:24];
                end               
            end        
            if(!write_response_stall && valid_write_address && valid_write_data)
            begin
                if(waddr[ADDR_WIDTH-1:ADDR_LSB]==9)
                begin
                    if(wstrb[0])
                        reg_bank[9][7:0]   <= wdata[7:0];
                    if(wstrb[1])
                        reg_bank[9][15:8]  <= wdata[15:8];
                    if(wstrb[2])
                        reg_bank[9][23:16] <= wdata[23:16];
                    if(wstrb[3])
                        reg_bank[9][31:24] <= wdata[31:24];
                end               
            end    
            if(!write_response_stall && valid_write_address && valid_write_data)
            begin
                if(waddr[ADDR_WIDTH-1:ADDR_LSB]==11)
                begin
                    if(wstrb[0])
                        reg_bank[11][7:0]   <= wdata[7:0];
                    if(wstrb[1])
                        reg_bank[11][15:8]  <= wdata[15:8];
                    if(wstrb[2])
                        reg_bank[11][23:16] <= wdata[23:16];
                    if(wstrb[3])
                        reg_bank[11][31:24] <= wdata[31:24];
                end               
            end    
            if(!write_response_stall && valid_write_address && valid_write_data)
            begin
                if(waddr[ADDR_WIDTH-1:ADDR_LSB]==13)
                begin
                    if(wstrb[0])
                        reg_bank[13][7:0]   <= wdata[7:0];
                    if(wstrb[1])
                        reg_bank[13][15:8]  <= wdata[15:8];
                    if(wstrb[2])
                        reg_bank[13][23:16] <= wdata[23:16];
                    if(wstrb[3])
                        reg_bank[13][31:24] <= wdata[31:24];
                end               
            end    
            if(!write_response_stall && valid_write_address && valid_write_data)
            begin
                if(waddr[ADDR_WIDTH-1:ADDR_LSB]==15)
                begin
                    if(wstrb[0])
                        reg_bank[15][7:0]   <= wdata[7:0];
                    if(wstrb[1])
                        reg_bank[15][15:8]  <= wdata[15:8];
                    if(wstrb[2])
                        reg_bank[15][23:16] <= wdata[23:16];
                    if(wstrb[3])
                        reg_bank[15][31:24] <= wdata[31:24];
                end               
            end    
            if(!write_response_stall && valid_write_address && valid_write_data)
            begin
                if(waddr[ADDR_WIDTH-1:ADDR_LSB]==17)
                begin
                    if(wstrb[0])
                        reg_bank[17][7:0]   <= wdata[7:0];
                    if(wstrb[1])
                        reg_bank[17][15:8]  <= wdata[15:8];
                    if(wstrb[2])
                        reg_bank[17][23:16] <= wdata[23:16];
                    if(wstrb[3])
                        reg_bank[17][31:24] <= wdata[31:24];
                end               
            end    
            if(!write_response_stall && valid_write_address && valid_write_data)
            begin
                if(waddr[ADDR_WIDTH-1:ADDR_LSB]==19)
                begin
                    if(wstrb[0])
                        reg_bank[19][7:0]   <= wdata[7:0];
                    if(wstrb[1])
                        reg_bank[19][15:8]  <= wdata[15:8];
                    if(wstrb[2])
                        reg_bank[19][23:16] <= wdata[23:16];
                    if(wstrb[3])
                        reg_bank[19][31:24] <= wdata[31:24];
                end               
            end    
            if(!write_response_stall && valid_write_address && valid_write_data)
            begin
                if(waddr[ADDR_WIDTH-1:ADDR_LSB]==21)
                begin
                    if(wstrb[0])
                        reg_bank[21][7:0]   <= wdata[7:0];
                    if(wstrb[1])
                        reg_bank[21][15:8]  <= wdata[15:8];
                    if(wstrb[2])
                        reg_bank[21][23:16] <= wdata[23:16];
                    if(wstrb[3])
                        reg_bank[21][31:24] <= wdata[31:24];
                end               
            end    
            if(!write_response_stall && valid_write_address && valid_write_data)
            begin
                if(waddr[ADDR_WIDTH-1:ADDR_LSB]==23)
                begin
                    if(wstrb[0])
                        reg_bank[23][7:0]   <= wdata[7:0];
                    if(wstrb[1])
                        reg_bank[23][15:8]  <= wdata[15:8];
                    if(wstrb[2])
                        reg_bank[23][23:16] <= wdata[23:16];
                    if(wstrb[3])
                        reg_bank[23][31:24] <= wdata[31:24];
                end               
            end    
            if(!write_response_stall && valid_write_address && valid_write_data)
            begin
                if(waddr[ADDR_WIDTH-1:ADDR_LSB]==25)
                begin
                    if(wstrb[0])
                        reg_bank[25][7:0]   <= wdata[7:0];
                    if(wstrb[1])
                        reg_bank[25][15:8]  <= wdata[15:8];
                    if(wstrb[2])
                        reg_bank[25][23:16] <= wdata[23:16];
                    if(wstrb[3])
                        reg_bank[25][31:24] <= wdata[31:24];
                end               
            end    
            if(!write_response_stall && valid_write_address && valid_write_data)
            begin
                if(waddr[ADDR_WIDTH-1:ADDR_LSB]==27)
                begin
                    if(wstrb[0])
                        reg_bank[27][7:0]   <= wdata[7:0];
                    if(wstrb[1])
                        reg_bank[27][15:8]  <= wdata[15:8];
                    if(wstrb[2])
                        reg_bank[27][23:16] <= wdata[23:16];
                    if(wstrb[3])
                        reg_bank[27][31:24] <= wdata[31:24];
                end               
            end    
            if(!write_response_stall && valid_write_address && valid_write_data)
            begin
                if(waddr[ADDR_WIDTH-1:ADDR_LSB]==29)
                begin
                    if(wstrb[0])
                        reg_bank[29][7:0]   <= wdata[7:0];
                    if(wstrb[1])
                        reg_bank[29][15:8]  <= wdata[15:8];
                    if(wstrb[2])
                        reg_bank[29][23:16] <= wdata[23:16];
                    if(wstrb[3])
                        reg_bank[29][31:24] <= wdata[31:24];
                end               
            end 
            if(!write_response_stall && valid_write_address && valid_write_data)
            begin
                if(waddr[ADDR_WIDTH-1:ADDR_LSB]==31)
                begin
                    if(wstrb[0])
                        reg_bank[31][7:0]   <= wdata[7:0];
                    if(wstrb[1])
                        reg_bank[31][15:8]  <= wdata[15:8];
                    if(wstrb[2])
                        reg_bank[31][23:16] <= wdata[23:16];
                    if(wstrb[3])
                        reg_bank[31][31:24] <= wdata[31:24];
                end               
            end
            
            
            
            
        end
    end

//
// write response channel valid signal
//
    initial	axi_bvalid = 1'b0;
    always @(posedge s_axi_aclk )
        if (!s_axi_aresetn)
            axi_bvalid <= 1'b0;
        else if(valid_write_address && valid_write_data)
            axi_bvalid <= 1'b1;
        else if (s_axi_bready)
            axi_bvalid <= 1'b0;

// make Verilator happy
// Verilator lint_off UNUSED
    wire	[4*ADDR_LSB+5:0]	unused;
    assign	unused = {s_axi_awprot, s_axi_arprot,
                s_axi_awaddr[ADDR_LSB-1:0],
                rd_addr[ADDR_LSB-1:0],
                waddr[ADDR_LSB-1:0],
                s_axi_araddr[ADDR_LSB-1:0]};
// Verilator lint_on UNUSED

endmodule
