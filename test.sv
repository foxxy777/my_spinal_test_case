// Generator : SpinalHDL v1.5.0    git head : 83a031922866b078c411ec5529e00f1b6e79f8e7
// Component : test



module test (
  input               io_a,
  input      [7:0]    io_b,
  output              io_c,
  output              io_d,
  output              io_e,
  input               clk,
  input               reset
);
  reg                 _zz_io_c;
  wire                when_tutorial_l9;
  wire                when_tutorial_l10;
  reg                 io_a_regNextWhen;
  wire                when_tutorial_l11;
  reg                 io_a_regNextWhen_1;

  assign when_tutorial_l9 = (io_b == 8'h02);
  assign io_c = _zz_io_c;
  assign when_tutorial_l10 = (io_b != 8'h03);
  assign io_d = io_a_regNextWhen;
  assign when_tutorial_l11 = (io_b < 8'h05);
  assign io_e = io_a_regNextWhen_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_io_c <= 1'b0;
    end else begin
      if(when_tutorial_l9) begin
        _zz_io_c <= 1'b1;
      end
    end
  end

  always @(posedge clk) begin
    if(when_tutorial_l10) begin
      io_a_regNextWhen <= io_a;
    end
    if(when_tutorial_l11) begin
      io_a_regNextWhen_1 <= io_a;
    end
  end


endmodule
