/*  VGA top level file */
module vga (
    input         wb_clk_i,     // 25 Mhz VDU clock
    input         wb_rst_i,     // Wishbone signals
    input  [15:0] wb_dat_i,
    output [15:0] wb_dat_o,
    input  [16:1] wb_adr_i,
    input         wb_we_i,
    input         wb_tga_i,
    input  [ 1:0] wb_sel_i,
    input         wb_stb_i,
    input         wb_cyc_i,
    output        wb_ack_o,

    output [ 3:0] vga_red_o,    // VGA pad signals
    output [ 3:0] vga_green_o,
    output [ 3:0] vga_blue_o,
    output        horiz_sync,
    output        vert_sync
  );

  // Registers and nets
  //
  // csr address
  reg  [17:1] csr_adr_i;
  reg         csr_stb_i;

  // Config wires
  wire [15:0] conf_wb_dat_o;
  wire        conf_wb_ack_o;

  // Mem wires
  wire [15:0] mem_wb_dat_o;
  wire        mem_wb_ack_o;

  // LCD wires
  wire [17:1] csr_adr_o;
  wire [15:0] csr_dat_i;
  wire        csr_stb_o;
  wire        v_retrace;
  wire        vh_retrace;

  // VGA configuration registers
  wire        shift_reg1;
  wire        graphics_alpha;
  wire        memory_mapping1;
  wire [ 1:0] write_mode;
  wire [ 1:0] raster_op;
  wire        read_mode;
  wire [ 7:0] bitmask;
  wire [ 3:0] set_reset;
  wire [ 3:0] enable_set_reset;
  wire [ 3:0] map_mask;
  wire        x_dotclockdiv2;
  wire        chain_four;
  wire [ 1:0] read_map_select;
  wire [ 3:0] color_compare;
  wire [ 3:0] color_dont_care;

  // Wishbone master to SRAM
  wire [17:1] wbm_adr_o;
  wire [ 1:0] wbm_sel_o;
  wire        wbm_we_o;
  wire [15:0] wbm_dat_o;
  wire [15:0] wbm_dat_i;
  wire        wbm_stb_o;
  wire        wbm_ack_i;

  // CSR master wires
  wire [17:1] csrm_adr_o;
  wire [ 1:0] csrm_sel_o;
  wire        csrm_we_o;
  wire [15:0] csrm_dat_o;
  wire [15:0] csrm_dat_i;

  wire        stb;

  // CRT wires
  wire [ 5:0] cur_start;
  wire [ 5:0] cur_end;
  wire [15:0] start_addr;
  wire [ 4:0] vcursor;
  wire [ 6:0] hcursor;
  wire [ 6:0] horiz_total;
  wire [ 6:0] end_horiz;
  wire [ 6:0] st_hor_retr;
  wire [ 4:0] end_hor_retr;
  wire [ 9:0] vert_total;
  wire [ 9:0] end_vert;
  wire [ 9:0] st_ver_retr;
  wire [ 3:0] end_ver_retr;

  // attribute_ctrl wires
  wire [3:0] pal_addr;
  wire       pal_we;
  wire [7:0] pal_read;
  wire [7:0] pal_write;

  // dac_regs wires
  wire       dac_we;
  wire [1:0] dac_read_data_cycle;
  wire [7:0] dac_read_data_register;
  wire [7:0] dac_read_data;
  wire [1:0] dac_write_data_cycle;
  wire [7:0] dac_write_data_register;
  wire [7:0] dac_write_data;

  // Module instances
  //
  config_iface config_if (
    .wb_clk_i (wb_clk_i),
    .wb_rst_i (wb_rst_i),
    .wb_dat_i (wb_dat_i),
    .wb_dat_o (conf_wb_dat_o),
    .wb_adr_i (wb_adr_i),
    .wb_we_i  (wb_we_i),
    .wb_sel_i (wb_sel_i),
    .wb_stb_i (stb & wb_tga_i),
    .wb_ack_o (conf_wb_ack_o),

    .shift_reg1       (shift_reg1),
    .graphics_alpha   (graphics_alpha),
    .memory_mapping1  (memory_mapping1),
    .write_mode       (write_mode),
    .raster_op        (raster_op),
    .read_mode        (read_mode),
    .bitmask          (bitmask),
    .set_reset        (set_reset),
    .enable_set_reset (enable_set_reset),
    .map_mask         (map_mask),
    .x_dotclockdiv2   (x_dotclockdiv2),
    .chain_four       (chain_four),
    .read_map_select  (read_map_select),
    .color_compare    (color_compare),
    .color_dont_care  (color_dont_care),

    .pal_addr  (pal_addr),
    .pal_we    (pal_we),
    .pal_read  (pal_read),
    .pal_write (pal_write),

    .dac_we                  (dac_we),
    .dac_read_data_cycle     (dac_read_data_cycle),
    .dac_read_data_register  (dac_read_data_register),
    .dac_read_data           (dac_read_data),
    .dac_write_data_cycle    (dac_write_data_cycle),
    .dac_write_data_register (dac_write_data_register),
    .dac_write_data          (dac_write_data),

    .cur_start  (cur_start),
    .cur_end    (cur_end),
    .start_addr (start_addr),
    .vcursor    (vcursor),
    .hcursor    (hcursor),

    .horiz_total  (horiz_total),
    .end_horiz    (end_horiz),
    .st_hor_retr  (st_hor_retr),
    .end_hor_retr (end_hor_retr),
    .vert_total   (vert_total),
    .end_vert     (end_vert),
    .st_ver_retr  (st_ver_retr),
    .end_ver_retr (end_ver_retr),

    .v_retrace  (v_retrace),
    .vh_retrace (vh_retrace)
  );

  lcd lcd0 (
    .clk (wb_clk_i),
    .rst (wb_rst_i),

    .shift_reg1     (shift_reg1),
    .graphics_alpha (graphics_alpha),

    .pal_addr  (pal_addr),
    .pal_we    (pal_we),
    .pal_read  (pal_read),
    .pal_write (pal_write),

    .dac_we                  (dac_we),
    .dac_read_data_cycle     (dac_read_data_cycle),
    .dac_read_data_register  (dac_read_data_register),
    .dac_read_data           (dac_read_data),
    .dac_write_data_cycle    (dac_write_data_cycle),
    .dac_write_data_register (dac_write_data_register),
    .dac_write_data          (dac_write_data),

    .csr_adr_o (csr_adr_o),
    .csr_dat_i (csr_dat_i),
    .csr_stb_o (csr_stb_o),

    .vga_red_o   (vga_red_o),
    .vga_green_o (vga_green_o),
    .vga_blue_o  (vga_blue_o),
    .horiz_sync  (horiz_sync),
    .vert_sync   (vert_sync),

    .cur_start  (cur_start),
    .cur_end    (cur_end),
    .vcursor    (vcursor),
    .hcursor    (hcursor),

    .horiz_total  (horiz_total),
    .end_horiz    (end_horiz),
    .st_hor_retr  (st_hor_retr),
    .end_hor_retr (end_hor_retr),
    .vert_total   (vert_total),
    .end_vert     (end_vert),
    .st_ver_retr  (st_ver_retr),
    .end_ver_retr (end_ver_retr),

    .x_dotclockdiv2 (x_dotclockdiv2),

    .v_retrace  (v_retrace),
    .vh_retrace (vh_retrace)
  );

  cpu_mem_iface cpu_mem_iface0 (
    .wb_clk_i (wb_clk_i),
    .wb_rst_i (wb_rst_i),

    .wbs_adr_i (wb_adr_i),
    .wbs_sel_i (wb_sel_i),
    .wbs_we_i  (wb_we_i),
    .wbs_dat_i (wb_dat_i),
    .wbs_dat_o (mem_wb_dat_o),
    .wbs_stb_i (stb & !wb_tga_i),
    .wbs_ack_o (mem_wb_ack_o),

    .wbm_adr_o (wbm_adr_o),
    .wbm_sel_o (wbm_sel_o),
    .wbm_we_o  (wbm_we_o),
    .wbm_dat_o (wbm_dat_o),
    .wbm_dat_i (wbm_dat_i),
    .wbm_stb_o (wbm_stb_o),
    .wbm_ack_i (wbm_ack_i),

    .chain_four       (chain_four),
    .memory_mapping1  (memory_mapping1),
    .write_mode       (write_mode),
    .raster_op        (raster_op),
    .read_mode        (read_mode),
    .bitmask          (bitmask),
    .set_reset        (set_reset),
    .enable_set_reset (enable_set_reset),
    .map_mask         (map_mask),
    .read_map_select  (read_map_select),
    .color_compare    (color_compare),
    .color_dont_care  (color_dont_care)
  );

  mem_arbitrer arbitrer (
    .clk_i (wb_clk_i),
    .rst_i (wb_rst_i),

    .wb_adr_i (wbm_adr_o),
    .wb_sel_i (wbm_sel_o),
    .wb_we_i  (wbm_we_o),
    .wb_dat_i (wbm_dat_o),
    .wb_dat_o (wbm_dat_i),
    .wb_stb_i (wbm_stb_o),
    .wb_ack_o (wbm_ack_i),

    .csr_adr_i (csr_adr_i),
    .csr_dat_o (csr_dat_i),
    .csr_stb_i (csr_stb_i),

    .csrm_adr_o (csrm_adr_o),
    .csrm_sel_o (csrm_sel_o),
    .csrm_we_o  (csrm_we_o),
    .csrm_dat_o (csrm_dat_o),
    .csrm_dat_i (csrm_dat_i)
  );


  // Continous assignments
  assign wb_dat_o = wb_tga_i ? conf_wb_dat_o : mem_wb_dat_o;
  assign wb_ack_o = wb_tga_i ? conf_wb_ack_o : mem_wb_ack_o;
  assign stb      = wb_stb_i & wb_cyc_i;

  // Behaviour
  // csr_adr_i
  always @(posedge wb_clk_i)
    csr_adr_i <= wb_rst_i ? 17'h0 : csr_adr_o + start_addr[15:1];

  // csr_stb_i
  always @(posedge wb_clk_i)
    csr_stb_i <= wb_rst_i ? 1'b0 : csr_stb_o;



/*
wire [1:0] sram_dat_o;
assign sram_dat_o[1] = csrm_dat_o[15]|csrm_dat_o[14]|csrm_dat_o[13]|csrm_dat_o[12]|csrm_dat_o[11]|csrm_dat_o[10]|csrm_dat_o[9]|csrm_dat_o[8];
assign sram_dat_o[1] = csrm_dat_o[ 7]|csrm_dat_o[ 6]|csrm_dat_o[ 5]|csrm_dat_o[ 4]|csrm_dat_o[ 3]|csrm_dat_o[ 2]|csrm_dat_o[1]|csrm_dat_o[0];
wire [1:0] sram_dat_i;
assign csrm_dat_i[15:8] = {sram_dat_i[1],sram_dat_i[1],sram_dat_i[1],sram_dat_i[1],sram_dat_i[1],sram_dat_i[1],sram_dat_i[1],sram_dat_i[1]};
assign csrm_dat_i[ 7:0] = {sram_dat_i[0],sram_dat_i[0],sram_dat_i[0],sram_dat_i[0],sram_dat_i[0],sram_dat_i[0],sram_dat_i[0],sram_dat_i[0]};
*/

  SRAM4 SRAM4_inst(
       .clock (wb_clk_i),
       .address(csrm_adr_o[14:1]),
       .data(csrm_dat_o),
       .wren(csrm_we_o),
       .q(csrm_dat_i)
  ); 



endmodule
