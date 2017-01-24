//-----------------------------------------------------------------------------
// system_v_axi4s_vid_out_0_wrapper.v
//-----------------------------------------------------------------------------

(* x_core_info = "v_axi4s_vid_out_v2_01_a" *)
module system_v_axi4s_vid_out_0_wrapper
  (
    aclk,
    rst,
    aresetn,
    aclken,
    s_axis_video_tdata,
    s_axis_video_tvalid,
    s_axis_video_tready,
    s_axis_video_tuser,
    s_axis_video_tlast,
    video_out_clk,
    video_de,
    video_vsync,
    video_hsync,
    video_vblank,
    video_hblank,
    video_data,
    vtg_vsync,
    vtg_hsync,
    vtg_vblank,
    vtg_hblank,
    vtg_act_vid,
    vtg_ce,
    vtg_fsync,
    locked,
    wr_error,
    empty
  );
  input aclk;
  input rst;
  input aresetn;
  input aclken;
  input [15:0] s_axis_video_tdata;
  input s_axis_video_tvalid;
  output s_axis_video_tready;
  input s_axis_video_tuser;
  input s_axis_video_tlast;
  input video_out_clk;
  output video_de;
  output video_vsync;
  output video_hsync;
  output video_vblank;
  output video_hblank;
  output [11:0] video_data;
  input vtg_vsync;
  input vtg_hsync;
  input vtg_vblank;
  input vtg_hblank;
  input vtg_act_vid;
  output vtg_ce;
  output vtg_fsync;
  output locked;
  output wr_error;
  output empty;

  v_axi4s_vid_out
    #(
      .C_S_AXIS_VIDEO_DATA_WIDTH ( 12 ),
      .C_S_AXIS_VIDEO_FORMAT ( 13 ),
      .VID_OUT_DATA_WIDTH ( 12 ),
      .C_S_AXIS_VIDEO_TDATA_WIDTH ( 16 ),
      .RAM_ADDR_BITS ( 10 ),
      .HYSTERESIS_LEVEL ( 12 ),
      .FILL_GUARDBAND ( 2 ),
      .VTG_MASTER_SLAVE ( 1 )
    )
    v_axi4s_vid_out_0 (
      .aclk ( aclk ),
      .rst ( rst ),
      .aresetn ( aresetn ),
      .aclken ( aclken ),
      .s_axis_video_tdata ( s_axis_video_tdata ),
      .s_axis_video_tvalid ( s_axis_video_tvalid ),
      .s_axis_video_tready ( s_axis_video_tready ),
      .s_axis_video_tuser ( s_axis_video_tuser ),
      .s_axis_video_tlast ( s_axis_video_tlast ),
      .video_out_clk ( video_out_clk ),
      .video_de ( video_de ),
      .video_vsync ( video_vsync ),
      .video_hsync ( video_hsync ),
      .video_vblank ( video_vblank ),
      .video_hblank ( video_hblank ),
      .video_data ( video_data ),
      .vtg_vsync ( vtg_vsync ),
      .vtg_hsync ( vtg_hsync ),
      .vtg_vblank ( vtg_vblank ),
      .vtg_hblank ( vtg_hblank ),
      .vtg_act_vid ( vtg_act_vid ),
      .vtg_ce ( vtg_ce ),
      .vtg_fsync ( vtg_fsync ),
      .locked ( locked ),
      .wr_error ( wr_error ),
      .empty ( empty )
    );

endmodule

