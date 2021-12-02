// Generator : SpinalHDL v1.5.0    git head : 83a031922866b078c411ec5529e00f1b6e79f8e7
// Component : DFFExample2



module DFFExample2 (
  input      [3:0]    io_dataIn,
  output     [3:0]    io_dataOut,
  input               io_set1,
  input               domain0_clk,
  input               domain0_resetn,
  input               domain0_clk_1,
  input               domain0_reset,
  input               domain0_clk_2,
  input               domain0_resetn_1,
  input               domain0_clk_3,
  input               domain0_reset_1,
  input               domain0_clk_4,
  input               domain0_resetn_2,
  input               domain0_clk_5,
  input               domain0_reset_2,
  input               domain0_clk_6,
  input               domain0_resetn_3,
  input               domain0_clk_7,
  input               domain0_reset_3
);
  reg        [3:0]    _zz_io_dataOut;
  (* async_reg = "true" *) reg        [3:0]    _zz_io_dataOut_1;
  (* async_reg = "true" *) reg        [3:0]    _zz_io_dataOut_2;
  (* async_reg = "true" *) reg        [3:0]    _zz_io_dataOut_3;
  (* async_reg = "true" *) reg        [3:0]    _zz_io_dataOut_4;
  (* async_reg = "true" *) reg        [3:0]    _zz_io_dataOut_5;
  (* async_reg = "true" *) reg        [3:0]    _zz_io_dataOut_6;
  (* async_reg = "true" *) reg        [3:0]    _zz_io_dataOut_7;

  assign io_dataOut = _zz_io_dataOut_7;
  always @(negedge domain0_clk) begin
    if(!domain0_resetn) begin
      _zz_io_dataOut <= 4'b0000;
    end else begin
      if(io_set1) begin
        _zz_io_dataOut <= 4'b0001;
      end
      _zz_io_dataOut <= io_dataIn;
    end
  end

  always @(negedge domain0_clk_1) begin
    if(domain0_reset) begin
      _zz_io_dataOut_1 <= 4'b0000;
    end else begin
      _zz_io_dataOut_1 <= _zz_io_dataOut;
    end
  end

  always @(posedge domain0_clk_2) begin
    if(!domain0_resetn_1) begin
      _zz_io_dataOut_2 <= 4'b0000;
    end else begin
      _zz_io_dataOut_2 <= _zz_io_dataOut_1;
    end
  end

  always @(posedge domain0_clk_3) begin
    if(domain0_reset_1) begin
      _zz_io_dataOut_3 <= 4'b0000;
    end else begin
      _zz_io_dataOut_3 <= _zz_io_dataOut_2;
    end
  end

  always @(negedge domain0_clk_4 or negedge domain0_resetn_2) begin
    if(!domain0_resetn_2) begin
      _zz_io_dataOut_4 <= 4'b0000;
    end else begin
      _zz_io_dataOut_4 <= _zz_io_dataOut_3;
    end
  end

  always @(negedge domain0_clk_5 or posedge domain0_reset_2) begin
    if(domain0_reset_2) begin
      _zz_io_dataOut_5 <= 4'b0000;
    end else begin
      _zz_io_dataOut_5 <= _zz_io_dataOut_4;
    end
  end

  always @(posedge domain0_clk_6 or negedge domain0_resetn_3) begin
    if(!domain0_resetn_3) begin
      _zz_io_dataOut_6 <= 4'b0000;
    end else begin
      _zz_io_dataOut_6 <= _zz_io_dataOut_5;
    end
  end

  always @(posedge domain0_clk_7 or posedge domain0_reset_3) begin
    if(domain0_reset_3) begin
      _zz_io_dataOut_7 <= 4'b0000;
    end else begin
      _zz_io_dataOut_7 <= _zz_io_dataOut_6;
    end
  end


endmodule
