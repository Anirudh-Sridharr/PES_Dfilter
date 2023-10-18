/* Generated by Yosys 0.9 (git sha1 1979e0b) */

module dfilter(clk, reset, s_axis_fir_tdata, s_axis_fir_tkeep, s_axis_fir_tlast, s_axis_fir_tvalid, m_axis_fir_tready, m_axis_fir_tvalid, s_axis_fir_tready, m_axis_fir_tlast, m_axis_fir_tkeep, m_axis_fir_tdata);
  reg [31:0] _000_;
  reg [31:0] _001_;
  reg [31:0] _002_;
  reg [31:0] _003_;
  reg [31:0] _004_;
  reg [31:0] _005_;
  reg [31:0] _006_;
  reg [31:0] _007_;
  reg [31:0] _008_;
  reg [31:0] _009_;
  reg [31:0] _010_;
  reg [31:0] _011_;
  reg [31:0] _012_;
  reg [31:0] _013_;
  reg [31:0] _014_;
  reg [15:0] _015_;
  reg [15:0] _016_;
  reg [15:0] _017_;
  reg [15:0] _018_;
  reg [15:0] _019_;
  reg [15:0] _020_;
  reg [15:0] _021_;
  reg [15:0] _022_;
  reg [15:0] _023_;
  reg [15:0] _024_;
  reg [15:0] _025_;
  reg [15:0] _026_;
  reg [15:0] _027_;
  reg [15:0] _028_;
  reg [15:0] _029_;
  reg [3:0] _030_;
  reg _031_;
  reg _032_;
  reg [15:0] _033_;
  reg [31:0] _034_;
  reg [3:0] _035_;
  reg _036_;
  reg _037_;
  reg _038_;
  wire [31:0] _039_;
  wire [31:0] _040_;
  wire [31:0] _041_;
  wire [31:0] _042_;
  wire [31:0] _043_;
  wire [31:0] _044_;
  wire [31:0] _045_;
  wire [31:0] _046_;
  wire [31:0] _047_;
  wire [31:0] _048_;
  wire [31:0] _049_;
  wire [31:0] _050_;
  wire [31:0] _051_;
  wire [31:0] _052_;
  wire [31:0] _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire [31:0] _068_;
  wire [31:0] _069_;
  wire [31:0] _070_;
  wire [31:0] _071_;
  wire [31:0] _072_;
  wire [31:0] _073_;
  wire [31:0] _074_;
  wire [31:0] _075_;
  wire [31:0] _076_;
  wire [31:0] _077_;
  wire [31:0] _078_;
  wire [31:0] _079_;
  wire [31:0] _080_;
  wire [31:0] _081_;
  wire [31:0] _082_;
  reg [31:0] acc0;
  reg [31:0] acc1;
  reg [31:0] acc10;
  reg [31:0] acc11;
  reg [31:0] acc12;
  reg [31:0] acc13;
  reg [31:0] acc14;
  reg [31:0] acc2;
  reg [31:0] acc3;
  reg [31:0] acc4;
  reg [31:0] acc5;
  reg [31:0] acc6;
  reg [31:0] acc7;
  reg [31:0] acc8;
  reg [31:0] acc9;
  reg [15:0] buff0;
  reg [15:0] buff1;
  reg [15:0] buff10;
  reg [15:0] buff11;
  reg [15:0] buff12;
  reg [15:0] buff13;
  reg [15:0] buff14;
  reg [15:0] buff2;
  reg [15:0] buff3;
  reg [15:0] buff4;
  reg [15:0] buff5;
  reg [15:0] buff6;
  reg [15:0] buff7;
  reg [15:0] buff8;
  reg [15:0] buff9;
  reg [3:0] buff_cnt;
  input clk;
  reg enable_buff;
  reg enable_fir;
  reg [15:0] in_sample;
  output [31:0] m_axis_fir_tdata;
  reg [31:0] m_axis_fir_tdata;
  output [3:0] m_axis_fir_tkeep;
  reg [3:0] m_axis_fir_tkeep;
  output m_axis_fir_tlast;
  reg m_axis_fir_tlast;
  input m_axis_fir_tready;
  output m_axis_fir_tvalid;
  reg m_axis_fir_tvalid;
  input reset;
  input [15:0] s_axis_fir_tdata;
  input [3:0] s_axis_fir_tkeep;
  input s_axis_fir_tlast;
  output s_axis_fir_tready;
  reg s_axis_fir_tready;
  input s_axis_fir_tvalid;
  wire [15:0] tap0;
  wire [15:0] tap1;
  wire [15:0] tap10;
  wire [15:0] tap11;
  wire [15:0] tap12;
  wire [15:0] tap13;
  wire [15:0] tap14;
  wire [15:0] tap2;
  wire [15:0] tap3;
  wire [15:0] tap4;
  wire [15:0] tap5;
  wire [15:0] tap6;
  wire [15:0] tap7;
  wire [15:0] tap8;
  wire [15:0] tap9;
  assign _039_ = $signed(acc0) + $signed(acc1);
  assign _040_ = $signed(_039_) + $signed(acc2);
  assign _041_ = $signed(_040_) + $signed(acc3);
  assign _042_ = $signed(_041_) + $signed(acc4);
  assign _043_ = $signed(_042_) + $signed(acc5);
  assign _044_ = $signed(_043_) + $signed(acc6);
  assign _045_ = $signed(_044_) + $signed(acc7);
  assign _046_ = $signed(_045_) + $signed(acc8);
  assign _047_ = $signed(_046_) + $signed(acc9);
  assign _048_ = $signed(_047_) + $signed(acc10);
  assign _049_ = $signed(_048_) + $signed(acc11);
  assign _050_ = $signed(_049_) + $signed(acc12);
  assign _051_ = $signed(_050_) + $signed(acc13);
  assign _052_ = $signed(_051_) + $signed(acc14);
  assign _053_ = buff_cnt + 32'd1;
  assign _054_ = enable_buff == 1'h1;
  assign _055_ = enable_fir == 1'h1;
  assign _056_ = enable_fir == 1'h1;
  assign _057_ = s_axis_fir_tlast == 1'h1;
  assign _058_ = reset == 1'h0;
  assign _059_ = m_axis_fir_tready == 1'h0;
  assign _060_ = s_axis_fir_tvalid == 1'h0;
  assign _061_ = buff_cnt == 4'hf;
  assign _062_ = reset == 1'h0;
  assign _063_ = m_axis_fir_tready == 1'h0;
  assign _064_ = s_axis_fir_tvalid == 1'h0;
  assign _065_ = _059_ || _060_;
  assign _066_ = _062_ || _063_;
  assign _067_ = _066_ || _064_;
  assign _068_ = $signed(tap0) * $signed(buff0);
  assign _069_ = $signed(tap1) * $signed(buff1);
  assign _070_ = $signed(tap2) * $signed(buff2);
  assign _071_ = $signed(tap3) * $signed(buff3);
  assign _072_ = $signed(tap4) * $signed(buff4);
  assign _073_ = $signed(tap5) * $signed(buff5);
  assign _074_ = $signed(tap6) * $signed(buff6);
  assign _075_ = $signed(tap7) * $signed(buff7);
  assign _076_ = $signed(tap8) * $signed(buff8);
  assign _077_ = $signed(tap9) * $signed(buff9);
  assign _078_ = $signed(tap10) * $signed(buff10);
  assign _079_ = $signed(tap11) * $signed(buff11);
  assign _080_ = $signed(tap12) * $signed(buff12);
  assign _081_ = $signed(tap13) * $signed(buff13);
  assign _082_ = $signed(tap14) * $signed(buff14);
  always @* begin
    _015_ = buff0;
    _021_ = buff1;
    _022_ = buff2;
    _023_ = buff3;
    _024_ = buff4;
    _025_ = buff5;
    _026_ = buff6;
    _027_ = buff7;
    _028_ = buff8;
    _029_ = buff9;
    _016_ = buff10;
    _017_ = buff11;
    _018_ = buff12;
    _019_ = buff13;
    _020_ = buff14;
    casez (_054_)
      1'h1:
        begin
          _015_ = in_sample;
          _021_ = buff0;
          _022_ = buff1;
          _023_ = buff2;
          _024_ = buff3;
          _025_ = buff4;
          _026_ = buff5;
          _027_ = buff6;
          _028_ = buff7;
          _029_ = buff8;
          _016_ = buff9;
          _017_ = buff10;
          _018_ = buff11;
          _019_ = buff12;
          _020_ = buff13;
        end
      default:
        begin
          _015_ = buff0;
          _021_ = buff1;
          _022_ = buff2;
          _023_ = buff3;
          _024_ = buff4;
          _025_ = buff5;
          _026_ = buff6;
          _027_ = buff7;
          _028_ = buff8;
          _029_ = buff9;
          _016_ = buff10;
          _017_ = buff11;
          _018_ = buff12;
          _019_ = buff13;
          _020_ = buff14;
        end
    endcase
  end
  always @(posedge clk) begin
      buff0 <= _015_;
      buff1 <= _021_;
      buff2 <= _022_;
      buff3 <= _023_;
      buff4 <= _024_;
      buff5 <= _025_;
      buff6 <= _026_;
      buff7 <= _027_;
      buff8 <= _028_;
      buff9 <= _029_;
      buff10 <= _016_;
      buff11 <= _017_;
      buff12 <= _018_;
      buff13 <= _019_;
      buff14 <= _020_;
  end
  always @* begin
    _000_ = acc0;
    _006_ = acc1;
    _007_ = acc2;
    _008_ = acc3;
    _009_ = acc4;
    _010_ = acc5;
    _011_ = acc6;
    _012_ = acc7;
    _013_ = acc8;
    _014_ = acc9;
    _001_ = acc10;
    _002_ = acc11;
    _003_ = acc12;
    _004_ = acc13;
    _005_ = acc14;
    casez (_055_)
      1'h1:
        begin
          _000_ = _068_;
          _006_ = _069_;
          _007_ = _070_;
          _008_ = _071_;
          _009_ = _072_;
          _010_ = _073_;
          _011_ = _074_;
          _012_ = _075_;
          _013_ = _076_;
          _014_ = _077_;
          _001_ = _078_;
          _002_ = _079_;
          _003_ = _080_;
          _004_ = _081_;
          _005_ = _082_;
        end
      default:
          /* empty */;
    endcase
  end
  always @(posedge clk) begin
      acc0 <= _000_;
      acc1 <= _006_;
      acc2 <= _007_;
      acc3 <= _008_;
      acc4 <= _009_;
      acc5 <= _010_;
      acc6 <= _011_;
      acc7 <= _012_;
      acc8 <= _013_;
      acc9 <= _014_;
      acc10 <= _001_;
      acc11 <= _002_;
      acc12 <= _003_;
      acc13 <= _004_;
      acc14 <= _005_;
  end
  always @* begin
    _034_ = m_axis_fir_tdata;
    casez (_056_)
      1'h1:
          _034_ = _052_;
      default:
          /* empty */;
    endcase
  end
  always @(posedge clk) begin
      m_axis_fir_tdata <= _034_;
  end
  always @* begin
    _035_ = 4'hf;
  end
  always @(posedge clk) begin
      m_axis_fir_tkeep <= _035_;
  end
  always @* begin
    _036_ = m_axis_fir_tlast;
    casez (_057_)
      1'h1:
          _036_ = 1'h1;
      default:
          _036_ = 1'h0;
    endcase
  end
  always @(posedge clk) begin
      m_axis_fir_tlast <= _036_;
  end
  always @* begin
    _032_ = enable_fir;
    _030_ = buff_cnt;
    _033_ = in_sample;
    casez (_058_)
      1'h1:
        begin
          _030_ = 4'h0;
          _032_ = 1'h0;
          _033_ = 16'h0000;
        end
      default:
          casez (_065_)
            1'h1:
              begin
                _032_ = 1'h0;
                _030_ = 4'hf;
                _033_ = in_sample;
              end
            default:
                casez (_061_)
                  1'h1:
                    begin
                      _030_ = 4'h0;
                      _032_ = 1'h1;
                      _033_ = s_axis_fir_tdata;
                    end
                  default:
                    begin
                      _030_ = _053_[3:0];
                      _033_ = s_axis_fir_tdata;
                    end
                endcase
          endcase
    endcase
  end
  always @(posedge clk) begin
      enable_fir <= _032_;
      buff_cnt <= _030_;
      in_sample <= _033_;
  end
  always @(negedge reset) begin
      enable_fir <= _032_;
      buff_cnt <= _030_;
      in_sample <= _033_;
  end
  always @* begin
    _037_ = m_axis_fir_tvalid;
    _038_ = s_axis_fir_tready;
    _031_ = enable_buff;
    casez (_067_)
      1'h1:
        begin
          _038_ = 1'h0;
          _037_ = 1'h0;
          _031_ = 1'h0;
        end
      default:
        begin
          _038_ = 1'h1;
          _037_ = 1'h1;
          _031_ = 1'h1;
        end
    endcase
  end
  always @(posedge clk) begin
      m_axis_fir_tvalid <= _037_;
      s_axis_fir_tready <= _038_;
      enable_buff <= _031_;
  end
  assign tap0 = 16'hfc9c;
  assign tap1 = 16'h0000;
  assign tap2 = 16'h05a5;
  assign tap3 = 16'h0000;
  assign tap4 = 16'hf40c;
  assign tap5 = 16'h0000;
  assign tap6 = 16'h282d;
  assign tap7 = 16'h4000;
  assign tap8 = 16'h282d;
  assign tap9 = 16'h0000;
  assign tap10 = 16'hf40c;
  assign tap11 = 16'h0000;
  assign tap12 = 16'h05a5;
  assign tap13 = 16'h0000;
  assign tap14 = 16'hfc9c;
endmodule
