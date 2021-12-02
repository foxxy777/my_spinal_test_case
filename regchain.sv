// Generator : SpinalHDL v1.5.0    git head : 83a031922866b078c411ec5529e00f1b6e79f8e7
// Component : regchain



module regchain (
  input      [0:0]    dataIn,
  output     [0:0]    dataOut,
  input               clk,
  input               resetn,
  input               clk_1,
  input               reset,
  input               clk_2,
  input               resetn_1,
  input               clk_3,
  input               reset_1,
  input               clk_4,
  input               resetn_2,
  input               clk_5,
  input               reset_2,
  input               clk_6,
  input               resetn_3,
  input               clk_7,
  input               reset_3
);
  reg        [0:0]    _zz_dataOut;
  (* async_reg = "true" *) reg        [0:0]    _zz_dataOut_1;
  (* async_reg = "true" *) reg        [0:0]    _zz_dataOut_2;
  (* async_reg = "true" *) reg        [0:0]    _zz_dataOut_3;
  (* async_reg = "true" *) reg        [0:0]    _zz_dataOut_4;
  (* async_reg = "true" *) reg        [0:0]    _zz_dataOut_5;
  (* async_reg = "true" *) reg        [0:0]    _zz_dataOut_6;
  (* async_reg = "true" *) reg        [0:0]    _zz_dataOut_7;

  assign dataOut = _zz_dataOut_7;
  always @(negedge clk) begin
    if(!resetn) begin
      _zz_dataOut <= 1'b0;
    end else begin
      _zz_dataOut <= dataIn;
    end
  end

  always @(negedge clk_1) begin
    if(reset) begin
      _zz_dataOut_1 <= 1'b0;
    end else begin
      _zz_dataOut_1 <= _zz_dataOut;
    end
  end

  always @(posedge clk_2) begin
    if(!resetn_1) begin
      _zz_dataOut_2 <= 1'b0;
    end else begin
      _zz_dataOut_2 <= _zz_dataOut_1;
    end
  end

  always @(posedge clk_3) begin
    if(reset_1) begin
      _zz_dataOut_3 <= 1'b0;
    end else begin
      _zz_dataOut_3 <= _zz_dataOut_2;
    end
  end

  always @(negedge clk_4 or negedge resetn_2) begin
    if(!resetn_2) begin
      _zz_dataOut_4 <= 1'b0;
    end else begin
      _zz_dataOut_4 <= _zz_dataOut_3;
    end
  end

  always @(negedge clk_5 or posedge reset_2) begin
    if(reset_2) begin
      _zz_dataOut_5 <= 1'b0;
    end else begin
      _zz_dataOut_5 <= _zz_dataOut_4;
    end
  end

  always @(posedge clk_6 or negedge resetn_3) begin
    if(!resetn_3) begin
      _zz_dataOut_6 <= 1'b0;
    end else begin
      _zz_dataOut_6 <= _zz_dataOut_5;
    end
  end

  always @(posedge clk_7 or posedge reset_3) begin
    if(reset_3) begin
      _zz_dataOut_7 <= 1'b0;
    end else begin
      _zz_dataOut_7 <= _zz_dataOut_6;
    end
  end


endmodule
