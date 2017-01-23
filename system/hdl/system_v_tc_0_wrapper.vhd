-------------------------------------------------------------------------------
-- system_v_tc_0_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library v_tc_v5_01_a;
use v_tc_v5_01_a.all;

entity system_v_tc_0_wrapper is
  port (
    s_axi_aclk : in std_logic;
    s_axi_aresetn : in std_logic;
    s_axi_aclken : in std_logic;
    s_axi_awaddr : in std_logic_vector(8 downto 0);
    s_axi_awvalid : in std_logic;
    s_axi_awready : out std_logic;
    s_axi_wdata : in std_logic_vector(31 downto 0);
    s_axi_wstrb : in std_logic_vector(3 downto 0);
    s_axi_wvalid : in std_logic;
    s_axi_wready : out std_logic;
    s_axi_bresp : out std_logic_vector(1 downto 0);
    s_axi_bvalid : out std_logic;
    s_axi_bready : in std_logic;
    s_axi_araddr : in std_logic_vector(8 downto 0);
    s_axi_arvalid : in std_logic;
    s_axi_arready : out std_logic;
    s_axi_rdata : out std_logic_vector(31 downto 0);
    s_axi_rresp : out std_logic_vector(1 downto 0);
    s_axi_rvalid : out std_logic;
    s_axi_rready : in std_logic;
    irq : out std_logic;
    intc_if : out std_logic_vector(31 downto 0);
    clk : in std_logic;
    resetn : in std_logic;
    clken : in std_logic;
    det_clken : in std_logic;
    gen_clken : in std_logic;
    fsync_in : in std_logic;
    vblank_in : in std_logic;
    vsync_in : in std_logic;
    hblank_in : in std_logic;
    hsync_in : in std_logic;
    active_video_in : in std_logic;
    active_chroma_in : in std_logic;
    vblank_out : out std_logic;
    vsync_out : out std_logic;
    hblank_out : out std_logic;
    hsync_out : out std_logic;
    active_video_out : out std_logic;
    active_chroma_out : out std_logic;
    fsync_out : out std_logic_vector(0 to 0)
  );

  attribute x_core_info : STRING;
  attribute x_core_info of system_v_tc_0_wrapper : entity is "v_tc_v5_01_a";

end system_v_tc_0_wrapper;

architecture STRUCTURE of system_v_tc_0_wrapper is

  component v_tc is
    generic (
      C_HAS_AXI4_LITE : INTEGER;
      C_HAS_INTC_IF : INTEGER;
      C_GEN_AUTO_SWITCH : integer;
      C_MAX_PIXELS : integer;
      C_MAX_LINES : integer;
      C_NUM_FSYNCS : integer;
      C_DETECT_EN : integer;
      C_GENERATE_EN : integer;
      C_DET_HSYNC_EN : integer;
      C_DET_VSYNC_EN : integer;
      C_DET_HBLANK_EN : integer;
      C_DET_VBLANK_EN : integer;
      C_DET_AVIDEO_EN : integer;
      C_DET_ACHROMA_EN : integer;
      C_GEN_HSYNC_EN : integer;
      C_GEN_VSYNC_EN : integer;
      C_GEN_HBLANK_EN : integer;
      C_GEN_VBLANK_EN : integer;
      C_GEN_AVIDEO_EN : integer;
      C_GEN_ACHROMA_EN : integer;
      C_GEN_VIDEO_FORMAT : INTEGER;
      C_GEN_CPARITY : integer;
      C_SYNC_EN : integer;
      C_GEN_VBLANK_POLARITY : integer;
      C_GEN_HBLANK_POLARITY : integer;
      C_GEN_VSYNC_POLARITY : integer;
      C_GEN_HSYNC_POLARITY : integer;
      C_GEN_AVIDEO_POLARITY : integer;
      C_GEN_ACHROMA_POLARITY : integer;
      C_GEN_VACTIVE_SIZE : integer;
      C_GEN_HACTIVE_SIZE : integer;
      C_GEN_HFRAME_SIZE : integer;
      C_GEN_F0_VFRAME_SIZE : integer;
      C_GEN_HSYNC_START : integer;
      C_GEN_HSYNC_END : integer;
      C_GEN_F0_VBLANK_HSTART : integer;
      C_GEN_F0_VBLANK_HEND : integer;
      C_GEN_F0_VSYNC_VSTART : integer;
      C_GEN_F0_VSYNC_VEND : integer;
      C_GEN_F0_VSYNC_HSTART : integer;
      C_GEN_F0_VSYNC_HEND : integer;
      C_FSYNC_HSTART0 : integer;
      C_FSYNC_VSTART0 : integer;
      C_FSYNC_HSTART1 : integer;
      C_FSYNC_VSTART1 : integer;
      C_FSYNC_HSTART2 : integer;
      C_FSYNC_VSTART2 : integer;
      C_FSYNC_HSTART3 : integer;
      C_FSYNC_VSTART3 : integer;
      C_FSYNC_HSTART4 : integer;
      C_FSYNC_VSTART4 : integer;
      C_FSYNC_HSTART5 : integer;
      C_FSYNC_VSTART5 : integer;
      C_FSYNC_HSTART6 : integer;
      C_FSYNC_VSTART6 : integer;
      C_FSYNC_HSTART7 : integer;
      C_FSYNC_VSTART7 : integer;
      C_FSYNC_HSTART8 : integer;
      C_FSYNC_VSTART8 : integer;
      C_FSYNC_HSTART9 : integer;
      C_FSYNC_VSTART9 : integer;
      C_FSYNC_HSTART10 : integer;
      C_FSYNC_VSTART10 : integer;
      C_FSYNC_HSTART11 : integer;
      C_FSYNC_VSTART11 : integer;
      C_FSYNC_HSTART12 : integer;
      C_FSYNC_VSTART12 : integer;
      C_FSYNC_HSTART13 : integer;
      C_FSYNC_VSTART13 : integer;
      C_FSYNC_HSTART14 : integer;
      C_FSYNC_VSTART14 : integer;
      C_FSYNC_HSTART15 : integer;
      C_FSYNC_VSTART15 : integer;
      C_S_AXI_ADDR_WIDTH : INTEGER;
      C_S_AXI_DATA_WIDTH : INTEGER;
      C_S_AXI_CLK_FREQ_HZ : INTEGER;
      C_FAMILY : STRING
    );
    port (
      s_axi_aclk : in std_logic;
      s_axi_aresetn : in std_logic;
      s_axi_aclken : in std_logic;
      s_axi_awaddr : in std_logic_vector((C_S_AXI_ADDR_WIDTH-1) downto 0);
      s_axi_awvalid : in std_logic;
      s_axi_awready : out std_logic;
      s_axi_wdata : in std_logic_vector((C_S_AXI_DATA_WIDTH-1) downto 0);
      s_axi_wstrb : in std_logic_vector(((C_S_AXI_DATA_WIDTH/8)-1) downto 0);
      s_axi_wvalid : in std_logic;
      s_axi_wready : out std_logic;
      s_axi_bresp : out std_logic_vector(1 downto 0);
      s_axi_bvalid : out std_logic;
      s_axi_bready : in std_logic;
      s_axi_araddr : in std_logic_vector((C_S_AXI_ADDR_WIDTH-1) downto 0);
      s_axi_arvalid : in std_logic;
      s_axi_arready : out std_logic;
      s_axi_rdata : out std_logic_vector((C_S_AXI_DATA_WIDTH-1) downto 0);
      s_axi_rresp : out std_logic_vector(1 downto 0);
      s_axi_rvalid : out std_logic;
      s_axi_rready : in std_logic;
      irq : out std_logic;
      intc_if : out std_logic_vector(31 downto 0);
      clk : in std_logic;
      resetn : in std_logic;
      clken : in std_logic;
      det_clken : in std_logic;
      gen_clken : in std_logic;
      fsync_in : in std_logic;
      vblank_in : in std_logic;
      vsync_in : in std_logic;
      hblank_in : in std_logic;
      hsync_in : in std_logic;
      active_video_in : in std_logic;
      active_chroma_in : in std_logic;
      vblank_out : out std_logic;
      vsync_out : out std_logic;
      hblank_out : out std_logic;
      hsync_out : out std_logic;
      active_video_out : out std_logic;
      active_chroma_out : out std_logic;
      fsync_out : out std_logic_vector(C_NUM_FSYNCS-1 to 0)
    );
  end component;

begin

  v_tc_0 : v_tc
    generic map (
      C_HAS_AXI4_LITE => 1,
      C_HAS_INTC_IF => 0,
      C_GEN_AUTO_SWITCH => 1,
      C_MAX_PIXELS => 4096,
      C_MAX_LINES => 4096,
      C_NUM_FSYNCS => 1,
      C_DETECT_EN => 0,
      C_GENERATE_EN => 1,
      C_DET_HSYNC_EN => 1,
      C_DET_VSYNC_EN => 1,
      C_DET_HBLANK_EN => 1,
      C_DET_VBLANK_EN => 1,
      C_DET_AVIDEO_EN => 1,
      C_DET_ACHROMA_EN => 0,
      C_GEN_HSYNC_EN => 1,
      C_GEN_VSYNC_EN => 1,
      C_GEN_HBLANK_EN => 1,
      C_GEN_VBLANK_EN => 1,
      C_GEN_AVIDEO_EN => 1,
      C_GEN_ACHROMA_EN => 0,
      C_GEN_VIDEO_FORMAT => 0,
      C_GEN_CPARITY => 0,
      C_SYNC_EN => 0,
      C_GEN_VBLANK_POLARITY => 1,
      C_GEN_HBLANK_POLARITY => 1,
      C_GEN_VSYNC_POLARITY => 1,
      C_GEN_HSYNC_POLARITY => 1,
      C_GEN_AVIDEO_POLARITY => 1,
      C_GEN_ACHROMA_POLARITY => 1,
      C_GEN_VACTIVE_SIZE => 720,
      C_GEN_HACTIVE_SIZE => 1280,
      C_GEN_HFRAME_SIZE => 1650,
      C_GEN_F0_VFRAME_SIZE => 750,
      C_GEN_HSYNC_START => 1390,
      C_GEN_HSYNC_END => 1430,
      C_GEN_F0_VBLANK_HSTART => 1280,
      C_GEN_F0_VBLANK_HEND => 1280,
      C_GEN_F0_VSYNC_VSTART => 724,
      C_GEN_F0_VSYNC_VEND => 729,
      C_GEN_F0_VSYNC_HSTART => 1280,
      C_GEN_F0_VSYNC_HEND => 1280,
      C_FSYNC_HSTART0 => 0,
      C_FSYNC_VSTART0 => 0,
      C_FSYNC_HSTART1 => 0,
      C_FSYNC_VSTART1 => 0,
      C_FSYNC_HSTART2 => 0,
      C_FSYNC_VSTART2 => 0,
      C_FSYNC_HSTART3 => 0,
      C_FSYNC_VSTART3 => 0,
      C_FSYNC_HSTART4 => 0,
      C_FSYNC_VSTART4 => 0,
      C_FSYNC_HSTART5 => 0,
      C_FSYNC_VSTART5 => 0,
      C_FSYNC_HSTART6 => 0,
      C_FSYNC_VSTART6 => 0,
      C_FSYNC_HSTART7 => 0,
      C_FSYNC_VSTART7 => 0,
      C_FSYNC_HSTART8 => 0,
      C_FSYNC_VSTART8 => 0,
      C_FSYNC_HSTART9 => 0,
      C_FSYNC_VSTART9 => 0,
      C_FSYNC_HSTART10 => 0,
      C_FSYNC_VSTART10 => 0,
      C_FSYNC_HSTART11 => 0,
      C_FSYNC_VSTART11 => 0,
      C_FSYNC_HSTART12 => 0,
      C_FSYNC_VSTART12 => 0,
      C_FSYNC_HSTART13 => 0,
      C_FSYNC_VSTART13 => 0,
      C_FSYNC_HSTART14 => 0,
      C_FSYNC_VSTART14 => 0,
      C_FSYNC_HSTART15 => 0,
      C_FSYNC_VSTART15 => 0,
      C_S_AXI_ADDR_WIDTH => 9,
      C_S_AXI_DATA_WIDTH => 32,
      C_S_AXI_CLK_FREQ_HZ => 100000000,
      C_FAMILY => "zynq"
    )
    port map (
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_aclken => s_axi_aclken,
      s_axi_awaddr => s_axi_awaddr,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_awready => s_axi_awready,
      s_axi_wdata => s_axi_wdata,
      s_axi_wstrb => s_axi_wstrb,
      s_axi_wvalid => s_axi_wvalid,
      s_axi_wready => s_axi_wready,
      s_axi_bresp => s_axi_bresp,
      s_axi_bvalid => s_axi_bvalid,
      s_axi_bready => s_axi_bready,
      s_axi_araddr => s_axi_araddr,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_arready => s_axi_arready,
      s_axi_rdata => s_axi_rdata,
      s_axi_rresp => s_axi_rresp,
      s_axi_rvalid => s_axi_rvalid,
      s_axi_rready => s_axi_rready,
      irq => irq,
      intc_if => intc_if,
      clk => clk,
      resetn => resetn,
      clken => clken,
      det_clken => det_clken,
      gen_clken => gen_clken,
      fsync_in => fsync_in,
      vblank_in => vblank_in,
      vsync_in => vsync_in,
      hblank_in => hblank_in,
      hsync_in => hsync_in,
      active_video_in => active_video_in,
      active_chroma_in => active_chroma_in,
      vblank_out => vblank_out,
      vsync_out => vsync_out,
      hblank_out => hblank_out,
      hsync_out => hsync_out,
      active_video_out => active_video_out,
      active_chroma_out => active_chroma_out,
      fsync_out => fsync_out
    );

end architecture STRUCTURE;

