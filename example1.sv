// Generator : SpinalHDL v1.5.0    git head : 83a031922866b078c411ec5529e00f1b6e79f8e7
// Component : example1



module example1 (
  input               io_sigIn,
  input               io_clear,
  output     [31:0]   io_cnt,
  input               clk,
  input               reset
);
  wire       [31:0]   _zz_counter_cnt_valueNext;
  wire       [0:0]    _zz_counter_cnt_valueNext_1;
  reg                 io_sigIn_regNext;
  wire                when_Utils_l357;
  reg                 counter_cnt_willIncrement;
  wire                counter_cnt_willClear;
  reg        [31:0]   counter_cnt_valueNext;
  reg        [31:0]   counter_cnt_value;
  wire                counter_cnt_willOverflowIfInc;
  wire                counter_cnt_willOverflow;

  assign _zz_counter_cnt_valueNext_1 = counter_cnt_willIncrement;
  assign _zz_counter_cnt_valueNext = {31'd0, _zz_counter_cnt_valueNext_1};
  assign when_Utils_l357 = (io_sigIn && (! io_sigIn_regNext));
  always @(*) begin
    counter_cnt_willIncrement = 1'b0;
    if(when_Utils_l357) begin
      counter_cnt_willIncrement = 1'b1;
    end
  end

  assign counter_cnt_willClear = 1'b0;
  assign counter_cnt_willOverflowIfInc = (counter_cnt_value == 32'hffffffff);
  assign counter_cnt_willOverflow = (counter_cnt_willOverflowIfInc && counter_cnt_willIncrement);
  always @(*) begin
    counter_cnt_valueNext = (counter_cnt_value + _zz_counter_cnt_valueNext);
    if(counter_cnt_willClear) begin
      counter_cnt_valueNext = 32'h0;
    end
  end

  assign io_cnt = counter_cnt_value;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      io_sigIn_regNext <= 1'b0;
      counter_cnt_value <= 32'h0;
    end else begin
      io_sigIn_regNext <= io_sigIn;
      counter_cnt_value <= counter_cnt_valueNext;
      if(io_clear) begin
        counter_cnt_value <= 32'h0;
      end
    end
  end


endmodule
